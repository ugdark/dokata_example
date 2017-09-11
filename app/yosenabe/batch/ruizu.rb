# frozen_string_literal: true

require_relative '../config'
require_relative '../mixin'

module Yosenabe
  module Batch
    class Ruizu
      #include Yosenabe::Mixin::DummyLogger
      include Yosenabe::Mixin::MixinLogger
      define_greeter :config, Yosenabe.config

      def say
        logger.info('test')
      end
    end
  end
end


Yosenabe::Batch::Ruizu.new.say
