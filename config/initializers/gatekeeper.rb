if defined?(Gatekeeper) && Gatekeeper.respond_to?(:configure)
  Gatekeeper.configure do |config|
    config.client_id =  ENV['GATEKEEPER_CLIENT_ID']
    config.client_secret = ENV['GATEKEEPER_CLIENT_SECRET']
    config.oauth_scope = ENV['GATEKEEPER_OAUTH_SCOPE']

    # Set this to the same path you mounted the engine under
    config.mounted_path = '/auth'

    # Define the routes you want the permissions to be confined to. Leaving this empty enables
    # permissions for all routes in the application.
    # Note: these are converted to regular expressions.
    config.confine_authentication_paths_to = ['auth/admin', 'admin', '']
  end
else
  puts "CORRECT GATEKEEPER GEM NOT LOADED"
  puts "gatekeeper dependency in gemspec loads the incorrect gatekeeper gem"
  puts "because github gem versions are not supported in gemspecs"
end
