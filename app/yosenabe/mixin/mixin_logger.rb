# frozen_string_literal: true

require 'dokata'

module Yosenabe
  module Mixin

    module MixinLogger
      def self.included(base)
        base.define_singleton_method :define_greeter do |method_name, output|
          define_method(method_name) { output }
        end
      end

      def logger
        Dokata::NotifierLogger.new(config)
      end
    end

    module DummyLogger

      # 何もしない
      def logger
        Dokata::NotifierLogger.new({})
      end
    end

  end
end
