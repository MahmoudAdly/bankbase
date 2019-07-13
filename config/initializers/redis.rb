Rails.application.config.autoload_paths += Dir[File.join(Rails.root, "lib", "redis.rb")].each {|l| require l }
