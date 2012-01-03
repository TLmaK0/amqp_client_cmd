#!/usr/bin/env ruby

require 'rubygems'
require 'amqp'
require_relative 'amqp.rb'

run do |connection, channel, exchange, options|
  exchange.publish(options.message, :routing_key => options.routing_key) do
    connection.disconnect { EventMachine.stop }
  end
end
