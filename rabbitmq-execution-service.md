### RabbitMQ routing execution service key examples
Routing keys you can subscribe to listen to specific messages\
Tips:\
\* (star) can substitute for exactly one word\
\# (hash) can substitute for zero or more words

All Schedule Execution Services (SES) ping 
```
EVENT.ExecutionService.*.Ping
```
One specific Schedule Execution Service ping 
```
EVENT.ExecutionService.<uuid>.Ping
```
Get channel requests
```
*.REQUEST.ExecutionService.Channels
```
Bind to Automation 
```
*.REQUEST.ExecutionService.*.Commands.AppendScheduleWithId
```
SES to SS
```
*.REQUEST.ScheduleService.Schedule.#
```
