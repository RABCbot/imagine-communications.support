### search records by filter
```
curl -H "Content-Type: application/json" --data '{"fieldName":"houseId","type":"equals","value":"your-id"}' -X POST https://localhost/contentservice/api/contents/search
```
