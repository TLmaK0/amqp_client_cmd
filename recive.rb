#!/usr/bin/env ruby

require 'rubygems'
require 'amqp'
require_relative 'amqp.rb'

puts "Waiting for messages..."
run do |connection, channel, exchange, options|
  queue = channel.queue(options.queue, :auto_delete => true)
  queue.bind(exchange, :routing_key => options.routing_key).subscribe do |payload|
    puts "message recived: #{payload}"
  end
end

