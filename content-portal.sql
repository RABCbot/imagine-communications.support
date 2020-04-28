-- show individual record by house id
select data from public.content where data->>'houseId' = 'your-id'

-- show number of records per registration status
select data->'registrationStatus', count(data) from public.content group by data->'registrationStatus'
