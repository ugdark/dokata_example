
module Yosenabe
  module Mixin
    module Site

      # retry処理
      def retry3
        3.times do
          begin
            yield
            break
          end
        end
      end

      def get_driver
        caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {
            args: %w(--headless --disable-gpu window-size=1280x800),
        })

        driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
        driver.manage.timeouts.implicit_wait = 30
        driver.manage.window.size = Selenium::WebDriver::Dimension.new(1280, 800)

        driver
      end

      def browsing
        begin
          driver = get_driver
          yield driver
        ensure
          driver.try(:quit)
        end
      end

    end

    # 認証があるサイト
    module AuthSite
      include Site

      # login実装
      def login(driver)
        raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
      end

      # logout実装
      def logout(driver)
        raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
      end

      # noinspection RubySuperCallWithoutSuperclassInspection
      def browsing
        super do |driver|
          login(driver)
          yield
          logout(driver)
        end
      end
    end

  end

end


