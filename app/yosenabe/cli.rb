# frozen_string_literal: true

require 'thor'

require_relative 'batch'

module Yosenabe

  class CLI < Thor

    desc 'hello ruizu', 'say hello to NAME'
    option :name,
           :type => :string,
           :default => 'saito',
           :desc => 'あなたのお名前'

    def hello(name)
      Yosenabe::Batch::Ruizu.new.hello(name)
    end

  end
end