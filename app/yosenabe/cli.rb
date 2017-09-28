# frozen_string_literal: true

require 'thor'

require 'yosenabe/batch'

module Yosenabe
  # CLIを表す
  # 各batch毎に追加してほしい
  class CLI < Thor
    desc 'ruizu [command]', 'exec. [command] 出勤, 退勤'
    def ruizu(command)
      case command

      when '出勤'
        Yosenabe::Batch::Ruizu.new.entry
      when '退勤'
        Yosenabe::Batch::Ruizu.new.leave
      else
        Yosenabe::Batch::Ruizu.new.hello('hello')
      end
    end
  end
end
