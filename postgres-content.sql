-- show individual record by house id
select data from public.content where data->>'houseId' = 'your-id'

-- number of records per registration status
select data->'registrationStatus', count(data) from public.content group by data->'registrationStatus'

-- number of records on a specific endpoint
select count(data) from public.content where data->>'endpoints' like '%062ae5af-63c9-4052-b469-84f1f6d94c94%'

-- number of records per endpoint
select jsonb_object_keys(data->'endpoints'), count(data) from content group by jsonb_object_keys(data->'endpoints')

-- same as above but showing endpoint alias
select 
case jsonb_object_keys(data->'endpoints')
  when '062ae5af-63c9-4052-b469-84f1f6d94c94' then 'Nexio-MBS-BX'
  when 'e608edbd-de13-460e-ab92-b22d0ca9621f' then 'Nexio-MBS-CT'
  when 'f50c2649-64bc-4c6e-ae6b-e11095316a08' then 'Nexio-MBS-LI'
  when 'c3e134be-22bc-4091-a112-1a4e3e33470a' then 'Nexio-MBS-NJ'
  when 'a31415a9-d4cd-4e2e-8612-91929328a8b6' then 'Nexio-MBS-WC'
end,
count(data) from content group by jsonb_object_keys(data->'endpoints')

-- number of records duplciated in one or more endpoints
select array_length(array(select jsonb_object_keys(data->'endpoints')), 1), count(1) from content group by array_length(array(select jsonb_object_keys(data->'endpoints')), 1)

-- list all records in a specific endpoint
select data->>'houseId', data->>'createdOn', data->'registrationStatus' from public.content where data->>'endpoints' like '%062ae5af-63c9-4052-b469-84f1f6d94c94%'

-- list all records with no custom attributes
select data->>'houseId' from public.content where data->'customAttributes' = '{}'

-- danger zone use with caution: update json data directly
update public.content set data = data - 'isRegistrationWorkflowCompleted' - 'motionWorkflows' || '{"isRegistrationWorkflowCompleted": true}' where data->>'houseId' = 'your-id'

-- danger zone: set expiredon date to null
update public.content set data = data || '{"expiredOn":null}'
                                                                                                                              
-- remove a nested jsonb
update public.content set data = data #- '{customAttributes, 7167fc550af14b338247291eea7c471f}' where data->>'houseId' = '<your-id>'


