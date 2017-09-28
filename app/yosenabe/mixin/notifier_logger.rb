# frozen_string_literal: true

require 'yosenabe/mixin/logger'
require 'yosenabe/mixin/notifier'

module Yosenabe
  module Mixin
    # loggerとnotifierを束ねるmixin
    module NotifierLogger
      include Yosenabe::Mixin::Logger
      include Yosenabe::Mixin::Notifier
    end

    # dummy
    module DummyNotifierLogger
      include Yosenabe::Mixin::DummyLogger
      include Yosenabe::Mixin::DummyNotifier
    end
  end
end
