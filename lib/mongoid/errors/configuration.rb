# encoding: utf-8
module Mongoid
  module Errors
    class Configuration < MongoidError

      attr_reader :name

      def initialize(name)
        @name = name
        super(translate("configuration", { :name => name }))
      end
    end
  end
end
