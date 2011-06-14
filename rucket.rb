#!/bin/ruby
$: << '.'
require 'isaac/bot'
require 'json'
require 'logger'
require 'common'
require 'eventmachine'

include Rucket

LOG = Logger.new(STDOUT)



LOG.info("loading dictionary")

dict = {}

begin
    File.open("matches.json", 'w') do |f|
        dict = JSON.load(f.read)
    end
rescue IOError => e
    LOG.warn e
end

bot = Isaac::Bot.new do
    configure do |c|
      c.nick    = "Rucket"
      c.server  = "irc.freenode.net"
      c.port    = 6667
    end

    on :connect do
        LOG.info "Joining #bots"
        join "#bots"
    end

    on :channel, /\^(.+):(.+)/ do |key, target|
        add_match key, target, dict
        msg channel, "#{nick}: done"
    end

    on :channel do
        dict.each do |key, value|
            if message =~ /#{key}/
                msg channel, value.sample
            end
        end
    end
end

at_exit do
    save_dictionary dict
end

EventMachine.run {bot.start}

