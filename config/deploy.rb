require "bundler/capistrano"

ssh_options[:port]          = 22
ssh_options[:forward_agent] = true
ssh_options[:keys]          = ["#{ENV['HOME']}/.ssh/id_rsa"]
default_run_options[:pty] = true

set :copy_exclude,  [".svn", ".DS_Store", 'cache']
set :keep_releases, 5
set :application,   "ideacards"
set :user,          'karol'
set :repository,    "git@github.com:karol-zygmunt-blaszczyk/ideacards.git"
set :scm,           'git'
set :branch,        'master'
set :scm_verbose,   true
set :rake,          '/usr/local/bin/rake'
set :domain,        'ideacards.contentplate.pl'
set :deploy_via,    :remote_cache
set :deploy_to,     "/var/www/rails/ideacards.pl"
set :rails_env,     "production"
set :use_sudo,      false

role :web, domain, primary: true
role :app, domain, primary: true
role :db,  domain, primary: true

namespace :apache do
  desc 'Restarts the current project Passenger'
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :application do
  desc 'Removes all unnecessary directories and files'
  task :cleanup do
    ['.rvmrc', 'test', 'doc', 'db/seeds.rb', 'config/deploy.rb', 'tmp/cache/assets'].each do |path|
      run "rm -rf #{latest_release}/#{path}"
    end
  end

  desc 'Creates symlinks to shared directories'
  task :symlinks do
    ['public/files', 'public/images', 'public/assets','.bundle'].each do |path|
      run "rm -rf #{latest_release}/#{path}"
      run "ln -s #{shared_path}/#{path} #{latest_release}/#{path}"
    end

    # run "rm -rf #{latest_release}/public/uploads"
    # run "ln -s #{shared_path}/public/files #{latest_release}/public/uploads"
  end

  desc 'Copies all the settings files that are required to run application'
  task :settings do
    ['config/database.yml'].each do |path|
      run "rm -rf #{latest_release}/#{path}"
      run "cp -r #{shared_path}/#{path} #{latest_release}/#{path}"
    end
  end

  desc 'Installs all necessary gems and libs'
  task :bundle do
    run "rm -rf #{latest_release}/.bundle"
    run "cd #{latest_release} && bundle install --path ./.bundle --without test development"
  end

  desc 'Clean all assets under tmp/cache and precompiles all the assets'
  task :assets do
    #run "rm -rf #{latest_release}/public/assets"
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake visualform:assets"
  end

  desc 'Migrates the database'
  task :migrate do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake db:migrate"
  end
end

# Before performing update stop God server
before 'deploy:update' do
 # god.stop
  #apache.lock
end

# After we update code, we need to do a code cleanup, create symlinks and
# copy configuration files that are necessary
after 'deploy:update_code' do
  application.cleanup
  application.symlinks
  application.settings
  application.bundle
end

# After full update we need to do a cleanup of old realeses, migrate the db,
# start god queue and unlock apache
after 'deploy:update' do
  deploy.cleanup
  application.migrate
  application.assets
  apache.restart
end