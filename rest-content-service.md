### Sample REST commands using curl, or fiddler

Get a record by house id
```
curl https://<content-service-ip>/contentservice/api/contents?houseID=<your-id>
```

Search for records using filter with house id
```
curl -X POST https://<content-service-ip>/contentservice/api/contents/search -H "Content-Type: application/json" -d '{"fieldName":"houseId","type":"equals","value":"your-id"}' 
```

Search for records using filter where custom attributes contains AIR
```
curl -X POST https://<content-service-ip>/contentservice/api/contents/search -H "Content-Type: application/json" 
-d '{"type":"contains", "fieldName":"customAttributes.<custom uuid>", "value":"*AIR*"}' 
```
Search for records using filter with two conditions and'ed (expired date less than and a custom attribute true
```
curl -X POST https://<content-service-ip>/contentservice/api/contents/search -H "Content-Type: application/json" 
-d '{"type":"and","filters":[{"type":"lessEqual","fieldName":"expiredOn","value":"2020-01-01T23:59:59.999Z"},{"fieldName":"customAttributes.<custom-uuid>","type":"equals","value":true}]}' 
```
