# frozen_string_literal: true

require_relative '../../test_helper'

require 'yosenabe/mixin/config'


class TestConfig < Test::Unit::TestCase

  class DummyConfig
    include Yosenabe::Mixin::Config

    def test
      # アクセスできる
      config
      # したくないけどアクセスできる。
      @config
    end
  end

  sub_test_case '基本' do

    test '使い方の確認' do
      clazz = Class.new { include Yosenabe::Mixin::Config }.new
      assert_not_nil clazz
    end

    # TODO: 本当は防ぎたいけどできちゃう事を確認
    test 'configのpublicアクセスを確認' do
      clazz = Class.new { include Yosenabe::Mixin::Config }.new
      assert_not_nil clazz.config
    end

    test 'configのinnerアクセスを確認' do
      DummyConfig.new.test
      assert('ok')
    end

  end
end
