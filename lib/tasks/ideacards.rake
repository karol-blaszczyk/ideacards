namespace :ideacards do
  desc 'Creates a non-digest version of all the digest assets'
  task assets: :environment do
    require 'fileutils'
    regexp = /(-{1}[a-z0-9]{32}*\.{1}){1}/

    assets = File.join(Rails.root, 'public', Ideacards::Application.config.assets.prefix, "**/*")
    Dir.glob(assets).each do |file|
      next if File.directory?(file)
      next unless file =~ regexp

      source = file.split('/')
      source[source.length-1] = source.last.gsub(regexp, '.')

      non_digest = File.join(source)
      File.delete(non_digest) if File.file?(non_digest)

      FileUtils.cp(file, non_digest)
    end
  end

end