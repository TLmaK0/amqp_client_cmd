#!/usr/bin/env ruby

require 'rubygems'
require 'amqp'
require_relative 'amqp.rb'

run do |connection, channel, exchange, options|
  exchange.publish(options.message, :routing_key => options.routing_key, :timestamp => (options.timestamp.to_f*1000).to_i) do
    puts "message sended: #{options.message}"
    connection.disconnect { EventMachine.stop }
  end
end
