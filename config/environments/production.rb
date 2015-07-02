# Rails.application.configure do
#   # Settings specified here will take precedence over those in config/application.rb.

#   # Code is not reloaded between requests.
#   config.cache_classes = true

#   # Eager load code on boot. This eager loads most of Rails and
#   # your application in memory, allowing both threaded web servers
#   # and those relying on copy on write to perform better.
#   # Rake tasks automatically ignore this option for performance.
#   config.eager_load = true

#   # Full error reports are disabled and caching is turned on.
#   config.consider_all_requests_local       = false
#   config.action_controller.perform_caching = true

#   # Enable Rack::Cache to put a simple HTTP cache in front of your application
#   # Add `rack-cache` to your Gemfile before enabling this.
#   # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
#   # config.action_dispatch.rack_cache = true

#   # Disable Rails's static asset server (Apache or nginx will already do this).
#   # config.serve_static_assets = false
#   config.serve_static_files = true # production時も、public以下の静的ファイルをアプリケーションサーバで提供。nginxで提供すべきではある

#   # Compress JavaScripts and CSS.
#   config.assets.js_compressor = :uglifier
#   # config.assets.css_compressor = :sass

#   # Do not fallback to assets pipeline if a precompiled asset is missed.
#   config.assets.compile = true

#   # Generate digests for assets URLs.
#   config.assets.digest = true

#   # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

#   # Specifies the header that your server uses for sending files.
#   # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
#   # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

#   # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
#   # config.force_ssl = true

#   # Set to :debug to see everything in the log.
#   config.log_level = :info

#   # Prepend all log lines with the following tags.
#   # config.log_tags = [ :subdomain, :uuid ]

#   # Use a different logger for distributed setups.
#   # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

#   # Use a different cache store in production.
#   # config.cache_store = :mem_cache_store

#   # Enable serving of images, stylesheets, and JavaScripts from an asset server.
#   # config.action_controller.asset_host = "http://assets.example.com"

#   # Ignore bad email addresses and do not raise email delivery errors.
#   # Set this to true and configure the email server for immediate delivery to raise delivery errors.
#   # config.action_mailer.raise_delivery_errors = false


#   #config.action_mailer.default_url_options = { :host => 'gamerz.wiki',
#   ##                                             #:from => 'noreply@gamerz.wiki', # not working
#   #                                              #:reply_to => 'noreply@gamerz.wiki', # might not working
#   #                                              }
#   # config.action_mailer.raise_delivery_errors = true
#   # config.action_mailer.delivery_method = :ses


#   # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
#   # the I18n.default_locale when a translation cannot be found).
#   config.i18n.fallbacks = true

#   # Send deprecation notices to registered listeners.
#   config.active_support.deprecation = :notify

#   # Disable automatic flushing of the log to improve performance.
#   # config.autoflush_log = false

#   # Use default logging formatter so that PID and timestamp are not suppressed.
#   config.log_formatter = ::Logger::Formatter.new

#   config.i18n.default_locale = :ja

# end
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
