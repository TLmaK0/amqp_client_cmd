#!/usr/bin/env ruby

require 'rubygems'
require 'amqp'
require_relative 'amqp.rb'

run do |connection, channel, exchange, options|
  exchange.publish(options.message, :routing_key => options.routing_key, :timestamp => Time.now.to_i, :headers => options.headers) do
    puts "message sended: #{options.message}"
    connection.disconnect { EventMachine.stop }
  end
end
