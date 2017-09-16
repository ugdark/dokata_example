# frozen_string_literal: true

require_relative 'mixin_config'
require 'dokata/notifier_logger'

require 'active_support'
require 'active_support/core_ext'

module Yosenabe
  module Mixin

    module MixinLogger
      include Yosenabe::Mixin::MixinConfig

      def logger
        if @_logger_instance.nil?
          new_config = {
              loggers: config[:loggers]
          }
          @_logger_instance = Dokata::NotifierLogger.new(new_config).freeze
        end
        @_logger_instance
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
