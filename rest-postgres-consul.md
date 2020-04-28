### Postgres Consul sample REST command
Get configuration
```
curl <postgres-ip>:8008/config | jq
```
Danger zone: Update configuration
```
curl -XPATCH <postgres-ip>:8008/config -d '{"postgresql":{"parameters":{"wal_keep_segments":"180","max_wal_size":"3GB"}}}'
```
