# frozen_string_literal: true

require 'config'

require 'ice_nine'

# Application基底クラス
# Configを持つ
module Yosenabe

  class << self

    def init
      @root_dir = File.expand_path('../../../', __FILE__)
      config_path = "#{@root_dir}/config"
      @env = File.open("#{config_path}/env").gets
      # TODO: requireで configを別名にできないのかな。
      @config = Object::Config.load_files(Object::Config.setting_files(config_path, @env))
      remake_config_path!(@config)
      IceNine.deep_freeze(@config)
    end

    attr_reader :root_dir, :env, :config

    private

    # configで相対パス対策 (再帰処理)
    # #{root_dir}を絶対pathに置き換える
    # @param [Config::Options] options
    # @return [Config::Options] 加工済み
    def remake_config_path!(options)
      options.map do |key, value|
        if value.class.name == 'Config::Options'
          remake_config_path!(value)
        elsif value.instance_of?(String)
          options[key].gsub!('#{root_dir}', @root_dir)
        else
          options[key]
        end
      end
    end
  end

  Yosenabe::init
end
