# frozen_string_literal: true

require_relative 'mixin_config'
require 'dokata/notifier_logger'

module Yosenabe
  module Mixin

    # 通知目的, loggerにも出力しておく
    module MixinNotifier
      include Yosenabe::Mixin::MixinConfig

      def notifier
        @notifiers_instance ||= Dokata::NotifierLogger.new(config)
      end
    end

    module DummyNotifier
      # 何もしない
      def notifier
        Dokata::NotifierLogger.new({})
      end
    end

  end
end
