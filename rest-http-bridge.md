### HTTP Bridge sample REST commands

## Configuration
Edit HttpBridgeSettings.json file under ProgramData folder
pathWhitelist: ["#"]
exchangeWhitelist: ["automation","Automation","Content"]

## Sample calls:

Retrieve channel schedule
```
curl -X POST http://<core-service-ip>:51634/bridge/rabbit/request/GET/Automation/ExecutionService/<channel-guid>/Schedule -H "Content-Type: application/json" 
```

Retrieve channel errors
```
curl -X POST http://<core-service-ip>:51634/bridge/rabbit/request/GET/Automation/ExecutionService/<channel-guid>/Commands/GetChannelStatus -H "Content-Type: application/json" 
```
