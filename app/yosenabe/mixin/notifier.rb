# frozen_string_literal: true

require 'dokata/notifier_logger'
require 'yosenabe/mixin/config'
require 'yosenabe/mixin/prefix'

module Yosenabe
  module Mixin
    # 通知目的, loggerにも出力しておく
    module Notifier
      include Yosenabe::Mixin::Config
      include Yosenabe::Mixin::Prefix

      # loggerのFactory
      class Factory
        # インスタンスを作成する
        def create(config, prefix)
          new_config = {
            loggers: get_loggers(config[:loggers], prefix),
            slacks: get_slacks(config[:slacks], prefix)
          }
          Dokata::NotifierLogger.new(new_config)
        end

        private

        def get_loggers(config_loggers, prefix)
          config_loggers.map  do |key, value|
            new_value = value.dup
            new_value[:logdev] = value[:logdev].gsub('.sub.', ".#{prefix}.")
            [key, new_value]
          end.to_h
        end

        def get_slacks(config_slacks, prefix)
          config_slacks.map do |key, value|
            new_value = value.dup
            new_value[:username] = prefix
            [key, new_value]
          end.to_h
        end
      end

      # 通知
      # 通知はlogも同時に出す事が多いのでそのように振る舞う
      # @return [Dokata::NotifierLogger] notifier
      def notifier
        @notifiers_instance ||= Factory.new.create(config, prefix)
      end
    end

    # dummy
    module DummyNotifier
      # @return [Dokata::NotifierLogger] notifier dummy
      def notifier
        Dokata::NotifierLogger.new({})
      end
    end
  end
end
