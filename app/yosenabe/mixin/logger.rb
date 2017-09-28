# frozen_string_literal: true

require 'dokata/notifier_logger'
require 'yosenabe/mixin/config'
require 'yosenabe/mixin/prefix'

module Yosenabe
  module Mixin
    # 基本のlogger用(slackへの通知はない。)
    # slack通知を含む場合はnotifierへ
    module Logger
      include Yosenabe::Mixin::Config
      include Yosenabe::Mixin::Prefix

      # loggerのFactory
      class Factory
        # インスタンスを作成する
        def create(config, prefix)
          new_config = {
            loggers: get_loggers(config[:loggers], prefix)
          }
          Dokata::NotifierLogger.new(new_config)
        end

        private

        def get_loggers(config_loggers, prefix)
          config_loggers.map do |key, value|
            new_value = value.dup
            new_value[:logdev] = value[:logdev].gsub('.sub.', ".#{prefix}.")
            [key, new_value]
          end.to_h
        end
      end

      # ロギング
      # @return [Dokata::NotifierLogger] logger
      def logger
        @loggers_instance ||= Factory.new.create(config, prefix)
      end
    end

    # dummy
    module DummyLogger
      # @return [Dokata::NotifierLogger] logger dummy
      def logger
        Dokata::NotifierLogger.new({})
      end
    end
  end
end
