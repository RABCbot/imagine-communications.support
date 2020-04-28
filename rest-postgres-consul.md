### Postgres Consul sample REST command
Commands are shown using curl, but can be easily ran using Fiddler or even a browser

Get configuration
```
curl <postgres-ip>:8008/config | jq
```
Danger zone: Update configuration
```
curl -XPATCH <postgres-ip>:8008/config -d '{"postgresql":{"parameters":{"wal_keep_segments":"180","max_wal_size":"3GB"}}}'
```
