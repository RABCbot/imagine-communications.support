### RabbitMQ Content Portal routing key examples
Routing keys you can subscribe to listen to specific messages\
Tips:\
\* (star) can substitute for exactly one word\
\# (hash) can substitute for zero or more words

Exchange: Automation

Creating segment requests
```
EVENT.Integration.*.REQUEST.Content.Segment.Inserted
```
Ingest make changes to the event (e.g. title, description)
```
EVENT.VersioIngestService.RecordEvent.*.Updated
```
