class Messenger
  include Singleton
  cattr_accessor :transport

  def method_missing *args
    client.send *args
  end

  def client
    @client ||= Marples::Client.new self.class.transport, "need-o-tron", Rails.logger
  end
end