# frozen_string_literal: true

require_relative '../config'
require_relative '../mixin'

require 'selenium-webdriver'

require 'active_support'
require 'active_support/core_ext/object/try'

module Yosenabe
  module Batch

    class Ruizu
      include Yosenabe::Mixin::MixinNotifierLogger
      include Yosenabe::Mixin::AuthSite

      def hello(name)
        puts "hello. #{name}"
      end

      def login(driver)
        setting = Yosenabe::config[:ruizu][:kintai]
        driver.navigate.to setting[:url]

        driver.find_element(:id, 'loginKigyoCode').send_keys(setting[:company_code])
        driver.find_element(:id, 'shainBangoDisp',).send_keys(setting[:employee_code])
        driver.find_element(:id, '#password').send_keys(setting[:password])
        driver.find_element(:id, 'btnLogin').click
      end

      def logout(driver)
      end

      # 出勤
      def entry
        browsing { |driver|
          driver.find_element(:id, 'btnDakoku1').click
        }
        puts '今日も１日がんばるぞい!'
      end

      # 退勤
      def leave
        browsing do |driver|
          driver.find_element(:id, 'btnDakoku4').click
        end
        puts 'お疲れ様'
      end
    end

  end
end


