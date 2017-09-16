# frozen_string_literal: true

require_relative 'mixin_config'
require_relative 'mixin_logger'
require_relative 'mixin_notifier'

module Yosenabe
  module Mixin

    # 基本のlogger用
    module MixinNotifierLogger
      include Yosenabe::Mixin::MixinLogger
      include Yosenabe::Mixin::MixinNotifier

    end

    module DummyNotifierLogger
      include Yosenabe::Mixin::DummyLogger
      include Yosenabe::Mixin::DummyNotifier
    end

  end
end
