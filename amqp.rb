require 'rubygems'
require 'amqp'
require_relative 'cli.rb'

def self.run
  EventMachine.run do
    connection = AMQP.connect(:host => cli.host, :user => cli.user, :password => cli.password, :vhost => cli.vhost) 
    channel = AMQP::Channel.new(connection)
    exchange = channel.topic(cli.exchange, :durable => cli.durable)
    yield connection, channel, exchange, cli
  end
end
