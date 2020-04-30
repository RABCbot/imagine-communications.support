-- select one id from the main table
select * from ASDB.dbo.ASDB where Identifier = 'your-id'
-- same as above, but search if trailing spaces
select * from ASDB.dbo.ASDB where Identifier like 'your-id%'
-- select one id from the segments table 
select * from ASDB.dbo.ASSEG where Identifier = 'your-id'
-- select one id from the more info table 
select * from ASDB.dbo.ASEXT where Identifier = 'your-id'
-- show DUR/SOM properly from main table
select Type, Identifier, Cast(Duration as varbinary(4)), Cast(StartOfMessage as varbinary(4)) from ASDB.dbo.ASDB where Identifier = 'your-id'
-- show DUR/SOM properly from segmentsn table
select Type, SegType, SegNumber, Identifier, Cast(Duration as varbinary(4)), Cast(StartOfMessage as varbinary(4)) from ASDB.dbo.ASDB where Identifier = 'your-id'
-- insert a record with SOM 01:02:03:04 and DUR 00:00:30:00
insert [ASDB].[dbo].[ASDB] (Type, Identifier, StartOfMessage, Duration)
values ('s', 'your-id', 0x01020304, 0x00003000); 

-- Danger zone, delete a specific record
DELETE FROM [ASDB].[dbo].[ASDB] where Identifier = 'your-id' 
GO
DELETE FROM [ASDB].[dbo].[ASEXT] where Identifier = 'your-id'

