### HTTP Bridge sample REST commands

Retrieve channel schedule
```
curl -X POST http://<core-service-ip>:51634/bridge/rabbit/request/GET/Automation/ExecutionService/<channel-guid>/Schedule -H "Content-Type: application/json" 
```

Retrieve channel errors
```
curl -X POST http://<core-service-ip>:51634/bridge/rabbit/request/GET/Automation/ExecutionService/<channel-guid>/Commands/GetChannelStatus -H "Content-Type: application/json" 
```
