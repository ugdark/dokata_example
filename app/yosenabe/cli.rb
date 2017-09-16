# frozen_string_literal: true

require 'thor'

require_relative 'batch'

module Yosenabe

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