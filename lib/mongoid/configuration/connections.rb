# encoding: utf-8
require "mongoid/configuration/connections/single"
# require "mongoid/configuration/connections/replica_set"

module Mongoid
  module Configuration
    module Connections
      extend self

      def create(options)
        if options.has_key?("hosts")
          # ReplicaSet.new(options)
        else
          Single.new(options)
        end
      end
    end
  end
end
