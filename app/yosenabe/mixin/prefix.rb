# frozen_string_literal: true

require 'yosenabe/config'

module Yosenabe
  module Mixin
    # アプリのsub nameを扱う
    module Prefix
      def prefix
        raise NotImplementedError,
              "You must implement #{self.class}##{__method__}"
      end
    end

    # dummy
    module DummyPrefix
      def prefix
        ''
      end
    end
  end
end
