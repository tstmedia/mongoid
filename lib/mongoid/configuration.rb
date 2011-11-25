# encoding: utf-8
require "mongoid/configuration/environment"
require "mongoid/configuration/options"
require "mongoid/configuration/connections"

module Mongoid
  module Configuration
    extend self
    extend Options::Macros
    include ActiveModel::Observing

    option :allow_dynamic_fields, :default => true
    option :identity_map_enabled, :default => false
    option :include_root_in_json, :default => false
    option :max_retries_on_connection_failure, :default => 0
    option :persist_in_safe_mode, :default => false
    option :preload_models, :default => false
    option :raise_not_found_error, :default => true
    option :skip_version_check, :default => false
    option :time_zone, :default => nil
    option :use_utc, :default => false

    def connections
      @connections ||= {}
    end

    def connections=(settings)
      settings.each_pair do |name, options|
        connections[name] = Connections.create(options)
      end
    end

    def load!(path)
      Environment.load_yaml(path).tap do |settings|
        settings.each_pair do |name, value|
          raise Errors::Configuration.new(name) unless respond_to?("#{name}=")
          send("#{name}=", value)
        end
      end and self
    end
  end
end
