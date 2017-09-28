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

  sub_test_case '基本' do

    test '変数を取得できる事を確認' do
      assert_nothing_raised do
        Yosenabe.env
        Yosenabe.root_dir
      end
    end

    test '変数に再セットできない事を確認' do
      assert_raises(NoMethodError) do
        Yosenabe.env = 'test'
      end
      assert_raises(NoMethodError) do
        Yosenabe.root_dir = 'test'
      end
    end

    test '内部変数にアクセスできない事を確認' do
      assert_raises(NoMethodError) do
        Yosenabe.config_path
      end
    end

    test 'root_configを確認' do
      is_root_dir = Yosenabe::config[:loggers][:basic][:logdev].include?('root_dir')
      assert_equal is_root_dir, false
    end

    test 'config変更するとエラー' do
      assert_raises(RuntimeError) do
        Yosenabe::config[:loggers][:basic][:logdev] = 'test'
      end
    end

    test 'config integer' do
      max_history = Yosenabe::config[:loggers][:basic][:max_history]
      assert_equal max_history, 7
    end

    test 'config string' do
      shift_age = Yosenabe::config[:loggers][:basic][:shift_age]
      assert_equal shift_age, 'daily'
    end

  end
end
