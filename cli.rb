require 'rubygems'
require 'trollop'
require 'ostruct'

puts <<-EOS
Starting pub/sub ... Use --help to list all options
EOS

@options = Trollop::options do

  opt :host, "Host for the amqp server", :default => "127.0.0.1"
  opt :user, "User for the amqp connection", :default => "guest"
  opt :password, "Password for the amqp connection", :default => "guest"
  opt :vhost, "VHost for the amqp connection", :default => "/"
  opt :exchange, "Exchange where publish the message", :default => "testexchange"
  opt :durable, "Exchange is durable", :default => true
  opt :routing_key, "Routing key for the message sended", :default => "testroutingkey"
  opt :message, "Message to send to exchange", :default => "test message"
  opt :queue, "Queue name", :default => "testqueue"
  opt :timestamp, "Timestamp", :default => ((Time.now.to_f)*1000).truncate
end

@options = OpenStruct.new(@options)

def self.cli
  @options
end

