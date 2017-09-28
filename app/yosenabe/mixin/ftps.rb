# frozen_string_literal: true

require 'double_bag_ftps'

module Yosenabe
  module Mixin
    # FTPSのクラス定義を渡す
    module FTPS
      # クラス定義追加
      # ※クラス定義を渡してるので注意
      def ftps
        DoubleBagFTPS
      end
    end

    # dummy
    module DummyFTPS
      # DoubleBagFTPSのdummy
      class DummyFTPS < DoubleBagFTPS
        def initialize(*args); end

        def self.open(*args)
          if block_given?
            ftps = new(*args)
            begin
              yield ftps
            ensure
              ftps.close
            end
          else
            new(*args)
          end
        end

        def get(*args); end
      end
      # dummy
      def ftps
        Yosenabe::Mixin::DummyFTPS::DummyFTPS
      end
    end
  end
end
