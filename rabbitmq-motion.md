### RabbitMQ Motion routing key examples
Routing keys you can subscribe to listen to specific messages\
Tips:\
\* (star) can substitute for exactly one word\
\# (hash) can substitute for zero or more words

File related
```
EVENT.Motion.Endpoint.<endpointId>.File.<FileId>.<Added|Deleted|Modified|Closed|Metadata>
```
Workflow instance related
```
EVENT.Motion.File.<ReconcileKey|{NONE}>.WorkflowInstance.<WorkflowInstanceId>.<Created|Started|Paused|Resumed|Aborted|Failed|Completed|Acknowledged|ActivityCreated|ActivityProgress|ActivityCompleted|TaskCreated|TaskUpdated|TaskCompleted>
```
Endpoint related
```
EVENT.Motion.Endpoint.<endpointId>.<Created|Updated|Deleted|StatusChanged>
```
Workflow definition related
```
EVENT.Motion.Workflow.<WorkflowId>.<Created|Updated|Deleted>
```
