module Mongoid
  module Configuration
    module Connections
      class Single
        extend Options::Macros
        include Options::Instance

        option :connect_timeout, :default => 10
        option :host, :default => "localhost"
        option :op_timeout, :default => 30
        option :pool_size, :default => 1
        option :pool_timeout, :default => 5.0
        option :port, :default => 27017
        option :safe, :default => false
        option :slave_ok, :default => false
        option :ssl, :default => false

        def initialize(options = nil)
          (options || {}).each_pair do |name, value|
            raise Errors::Configuration.new(name) unless respond_to?("#{name}=")
            send("#{name}=", value)
          end
        end
      end
    end
  end
end
