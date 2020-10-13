# GenRmq214

Reproduce https://github.com/meltwater/gen_rmq/issues/214

Instructions:

```bash
docker-compose up -d
MIX_ENV=test iex -S mix
iex(3)> ExamplePublisher.test()
```

This will start the example consumer, producer, and then publish
25 messages.