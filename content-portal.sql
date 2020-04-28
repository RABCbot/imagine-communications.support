-- show individual record by house id
select data from public.content where data->>'houseId' = 'your-id'

-- show number of records per registration status
select data->'registrationStatus', count(data) from public.content group by data->'registrationStatus'

-- count records in a specific endpoint
select count(data) from public.content where data->>'endpoints' like '%062ae5af-63c9-4052-b469-84f1f6d94c94%'

