Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  #config.action_mailer.raise_delivery_errors = false

  config.action_mailer.default_url_options = { :host => 'gamerz.wiki',
                                               #:from => 'noreply@gamerz.wiki', # not working
                                               #:reply_to => 'noreply@gamerz.wiki',# might not working

                                              }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :ses

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log



  Mongoid.logger.level = Logger::DEBUG
  Moped.logger.level = Logger::DEBUG

  #Mongoid.logger = Logger.new($stdout)
  #Moped.logger = Logger.new($stdout)
  Mongoid.logger = Logger.new("#{Rails.root}/log/mongoid_development.log")
  Moped.logger = Logger.new("#{Rails.root}/log/moped_development.log")

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  #config.assets.debug = false
  config.assets.debug = true
  
  # 静的ファイルを保持しないようにする
  config.serve_static_assets = false
  
  # Do not compress assets
  config.assets.compress = false


  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
