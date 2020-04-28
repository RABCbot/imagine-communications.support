### search records by house id
```
curl -X POST https://<content-service-ip>/contentservice/api/contents/search -H "Content-Type: application/json" --data '{"fieldName":"houseId","type":"equals","value":"your-id"}' 
```
