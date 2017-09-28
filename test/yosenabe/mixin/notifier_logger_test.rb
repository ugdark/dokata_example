# frozen_string_literal: true

require_relative '../../test_helper'

require 'yosenabe/mixin/notifier_logger'


class TestNotifierLogger < Test::Unit::TestCase


  sub_test_case '基本' do

    class Dummy
      include Yosenabe::Mixin::NotifierLogger
      include Yosenabe::Mixin::DummyConfig

      def initialize(config)
        @dummy_config = config
      end

      attr_accessor :dummy_config

      def config
        @dummy_config
      end

      def prefix
        'test'
      end

      # インスタンス作成
      def exe
        logger.info('info')
        notifier.info('info')
      end
    end

    setup do
      @tmp_dir = Dir.mktmpdir
      @check_file_path = "#{@tmp_dir}/unexpected.test.log"
      dummy_config = {
          loggers: {
              basic: {
                  logdev: "#{@tmp_dir}/batch.test.log",
                  shift_age: 'daily',
                  level: 'info',
                  max_history: 7,
              },
              unexpected: {
                  logdev: @check_file_path,
                  shift_age: 'daily',
                  level: 'error',
                  max_history: 90,
              },
          },
          slacks: {},
      }

      @dummy = Dummy.new(dummy_config)
    end

    teardown do
      FileUtils.remove_entry_secure @tmp_dir
    end

    test 'インスタンス生成タイミングの確認無い事' do
      is_file = FileTest.exist?(@check_file_path)
      assert_equal false, is_file
    end

    test 'インスタンス作成されログが作られてる事の確認' do
      @dummy.exe
      is_file = FileTest.exist?(@check_file_path)
      assert_equal true, is_file
    end

  end

  # sub_test_case 'サンプル' do
  #
  #   class Dummy2
  #     include Yosenabe::Mixin::NotifierLogger
  #
  #     def prefix
  #       'test'
  #     end
  #
  #     # インスタンス作成
  #     def exe
  #       logger.info('info')
  #       logger.debug('debug')
  #       logger.error('error')
  #       notifier.info('info')
  #       notifier.debug('debug')
  #       notifier.error('error')
  #     end
  #   end
  #
  #   test '実際のconfigの確認と動作も' do
  #     Dummy2.new.exe
  #     assert 'ok'
  #   end
  # end


end
