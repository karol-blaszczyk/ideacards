Ideacards::Application.configure do
  # Settings specified here will take precedence over those 
  # in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false


  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false


  #how long an item should stay cached by setting the Cache-Control headers
  config.static_cache_control = "public, max-age=2592000"


  config.assets.paths << "#{Rails.root}/app/assets/fonts"
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  config.eager_load = false
  config.active_record.migration_error = :page_load



  # Expands the lines which load the assets
  config.assets.debug = true

end
