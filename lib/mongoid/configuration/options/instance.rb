# encoding: utf-8
module Mongoid #:nodoc
  module Configuration
    module Options
      module Instance

        def settings
          self.class.settings
        end

        def defaults
          self.class.defaults
        end
      end
    end
  end
end
