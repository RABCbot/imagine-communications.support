### RabbitMQ Content Portal routing key samples
Routing keys you can suscribe to listen to specific messages\
Tips:\
\* (star) can substitute for exactly one word\
\# (hash) can substitute for zero or more words

Exchange: Automation

Ingest listens the event update request with this:
```
EVENT.ExecutionService.*.EventChanged.*
```
Versio Ingest Service listens the secondary event request with this queue:
```
EVENT.ExecutionService.*.REQUEST.IngestService.SecondaryRecordEventChanged
```
Create/update event
```
EVENT.IngestService.*.REQUEST.ExecutionService.#
```
Create event
```
EVENT.IngestService.*.REQUEST.ExecutionService.*.CreateEvent
```
