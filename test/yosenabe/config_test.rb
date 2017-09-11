# frozen_string_literal: true

require_relative '../test_helper'

require 'yosenabe/config'


class TestConfigModule < Test::Unit::TestCase

  class << self
    def startup
      # testのためにdevelopmentに強制
      Yosenabe.instance_variable_set('@env', 'development')
    end
  end


  def test_config_変数を取得できる事を確認
    assert_nothing_raised do
      Yosenabe.env
      Yosenabe.root_dir
    end
  end

  def test_config_変数に再セットできない事を確認
    assert_raises(NoMethodError) do
      Yosenabe.env = 'test'
    end
    assert_raises(NoMethodError) do
      Yosenabe.root_dir = 'test'
    end
  end

  def test_config_内部変数にアクセスできない事を確認
    assert_raises(NoMethodError) do
      Yosenabe.config_path
    end
  end

end
