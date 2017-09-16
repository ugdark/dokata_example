# frozen_string_literal: true

require_relative '../config'

module Yosenabe
  module Mixin

    module MixinConfig

      def config
        Yosenabe.config
      end
    end

    module DummyConfig

      def config
        {}
      end
    end

  end
end
