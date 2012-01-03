require 'rubygems'
require 'trollop'
require 'ostruct'

puts <<-EOS
Use --help to list options
Starting client...
EOS

@options = Trollop::options do

  opt :host, "Host for the amqp server", :default => "127.0.0.1"
  opt :user, "User for the amqp connection", :default => "guest"
  opt :password, "Password for the amqp connection", :default => "guest"
  opt :vhost, "VHost for the amqp connection", :default => "/"
  opt :exchange, "Exchange where publish the message", :default => ""
  opt :durable, "Exchange is durable", :default => true
  opt :routing_key, "Routing key for the message sended", :default => ""
  opt :message, "Message to send to exchange", :default => ""
  opt :queue, "Queue name", :default => "testqueue"
end

@options = OpenStruct.new(@options)

def self.cli
  @options
end

