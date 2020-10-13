defmodule ExamplePublisher do
  @moduledoc """
  Example GenRMQ.Publisher implementation
  Sample usage:
  ```
  MIX_ENV=test iex -S mix
  iex(1)> ExamplePublisher.start_link()
  iex(2)> ExamplePublisher.publish_message("test", "routing_key")
  ```
  """

  @behaviour GenRMQ.Publisher

  require Logger

  def start_link() do
    GenRMQ.Publisher.start_link(__MODULE__, name: __MODULE__)
  end

  def publish_message(message, routing_key) do
    Logger.info("Publishing message #{inspect(message)}")
    GenRMQ.Publisher.publish(__MODULE__, message, routing_key)
  end

  def test(max \\ 25) do
    {:ok, _} = ExampleConsumer.start_link()
    {:ok, _} = start_link()

    0..max
    |> Enum.each(fn e ->
      IO.puts("pub: #{e}")

      publish_message("{\"count\": #{e}}", "routing_key.foo")
      |> IO.inspect(label: "publish result")
    end)
  end

  def init() do
    [
      exchange: "example_exchange",
      connection: "amqp://guest:guest@localhost:5672"
    ]
  end
end
