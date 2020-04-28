-- show individual record by house id
select data from public.content where data->>'houseId' = 'your-id'

-- count records per registration status
select data->'registrationStatus', count(data) from public.content group by data->'registrationStatus'

-- count records in a specific endpoint
select count(data) from public.content where data->>'endpoints' like '%062ae5af-63c9-4052-b469-84f1f6d94c94%'

-- list all records in a specific endpoint
select data->>'houseId', data->>'createdOn', data->'registrationStatus' from public.content where data->>'endpoints' like '%062ae5af-63c9-4052-b469-84f1f6d94c94%'

-- list all records with no custom attributes
select data->>'houseId' from public.content where data->'customAttributes' = '{}'

-- danger zone use with caution: update json data directly
update public.content set data = data - 'isRegistrationWorkflowCompleted' - 'motionWorkflows' || '{"isRegistrationWorkflowCompleted": true}' where data->>'houseId' = 'your-id'


