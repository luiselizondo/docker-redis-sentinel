# Redis Sentinel

A test running Redis Sentinel

Do not use in production

```docker run -d -e ANNOUNCED_IP=some_ip -e ANNOUNCED_PORT=6379 -e GROUP_NAME=master -e QUORUM=1 luis/redis-sentinel
``` 
