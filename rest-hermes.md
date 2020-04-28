### Hermes sample rest commands

Get version (useful to confirm is running)
```
curl <hermes-ip>:9872/version
```
Check  running schedules
```
curl <hermes-ip>:9872/api/hermes/tables/onyx-schedules/items
```
Check redundancy config
```
curl <hermes-ip>:9872/api/redundancy_onyx/tables/redundantchannel/items
```
