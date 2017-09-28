# frozen_string_literal: true

require 'yosenabe/config'

module Yosenabe
  module Mixin
    # 基本のconfig load用
    # mixin内でのconfigを読み込む事を想定して実装
    module Config
      # configを返す
      # @return [Hash]
      def config
        Yosenabe.config
      end
    end

    # dummy
    module DummyConfig
      # テストでは拡張してconfigを追加してください
      def config
        {}
      end
    end
  end
end
