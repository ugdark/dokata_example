# frozen_string_literal: true

require 'thor'

require_relative 'batch'

module Yosenabe

  class CLI < Thor

    desc 'ruizu [NAME]', 'say hello to NAME'
    def ruizu(name)
      Yosenabe::Batch::Ruizu.new.hello(name)
    end

  end
end