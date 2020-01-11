require "kafka"

class KafkaClient
  def self.client
    # @client = Kafka.new(seed_brokers: ['docker.for.mac.localhost:9092'], logger: Rails.logger)
    # @client_producer = @client.async_producer(
    #   delivery_interval: 10,
    # )
  end

  def self.produce(data)
    @client = Kafka.new(seed_brokers: ['localhost:9092'], logger: Rails.logger)
    @client_producer = @client.async_producer(
      delivery_interval: 10,
    )
    @client_producer.produce(data.to_json, topic: "message", partition_key: 0)
  end
end

