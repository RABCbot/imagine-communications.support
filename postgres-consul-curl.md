### postgres consul config

```
curl <postgres-ip>:8008/config | jq
```

You can do a curl -s -XPATCH  to change the running conf;

```
curl -s -XPATCH <postgres-ip>:8008/config -d '{"postgresql":{"parameters":{"wal_keep_segments":"180","max_wal_size":"3GB"}}}'
```
