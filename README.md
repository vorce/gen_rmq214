# GenRmq214

Reproduce https://github.com/meltwater/gen_rmq/issues/214

Instructions:

```bash
docker-compose up -d
MIX_ENV=test iex -S mix
iex(1)> ExamplePublisher.start_link()
iex(2)> ExampleConsumer.start_link()
iex(3)> ExamplePublisher.test()
```
