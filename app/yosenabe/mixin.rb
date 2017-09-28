# frozen_string_literal: true

require 'yosenabe/mixin/config'
require 'yosenabe/mixin/logger'
require 'yosenabe/mixin/notifier'
require 'yosenabe/mixin/notifier_logger'

module Yosenabe
  # @abstract DIを提供する
  # 参考URL: [ドワンゴDI](https://qiita.com/pab_tech/items/1c0bdbc8a61949891f1f)
  # - module内クラス変数
  # これはDIコンテナを作成してそちらにインスタンスまとめればいいかなって解決できそうだと昨日思った。
  # DIコンテナって簡単にいえばsingletonのhashと思ってもらえればいいです。
  # - DummyConfigはtestに移行は可能。
  # ただそうするとbatchを作成する時にpathをtestに通す事になるので辞めた。
  # 開発のしやすさを優先してdummyを同じ所に入れてます。
  module Mixin
  end
end
