-- select one id from the main table
select * from ASDB.dbo.ASDB where Identifier = 'your-id'

-- same as above, but search if trailing spaces
select * from ASDB.dbo.ASDB where Identifier like 'your-id%'

-- select one id from the segments table 
select * from ASDB.dbo.ASSEG where Identifier = 'your-id'

-- select one id from the more info table 
select * from ASDB.dbo.ASEXT where Identifier = 'your-id'

-- show DUR/SOM properly from main table
select Identifier, 
Title, 
Format((StartOfMessage & 0xFF000000)/0xFF0000, 'X2') + ':' +
Format((StartOfMessage & 0x00FF0000)/0x00FF00, 'X2') + ':' +
Format((StartOfMessage & 0x0000FF00)/0x0000FF, 'X2') + ';' +
Format((StartOfMessage & 0x000000FF)/0x000001, 'X2'),
Format((Duration & 0xFF000000)/0xFF0000, 'X2') + ':' +
Format((Duration & 0x00FF0000)/0x00FF00, 'X2') + ':' +
Format((Duration & 0x0000FF00)/0x0000FF, 'X2') + ';' +
Format((Duration & 0x000000FF)/0x000001, 'X2'),
MadeDateTime
from ASDB..ASDB

-- show DUR/SOM properly from segmentsn table
select Type, SegType, SegNumber, Identifier, 
Format((StartOfMessage & 0xFF000000)/0xFF0000, 'X2') + ':' +
Format((StartOfMessage & 0x00FF0000)/0x00FF00, 'X2') + ':' +
Format((StartOfMessage & 0x0000FF00)/0x0000FF, 'X2') + ';' +
Format((StartOfMessage & 0x000000FF)/0x000001, 'X2'),
Format((Duration & 0xFF000000)/0xFF0000, 'X2') + ':' +
Format((Duration & 0x00FF0000)/0x00FF00, 'X2') + ':' +
Format((Duration & 0x0000FF00)/0x0000FF, 'X2') + ';' +
Format((Duration & 0x000000FF)/0x000001, 'X2'),
ASDB.dbo.ASSEG

-- find NDF records
select Type, Identifier, Title,
Format(Duration, 'X8')
from ASDB2..ASDB
where Duration & 0xF0000 > 0x10000
and (Duration & 0xFFFF = 0 or Duration & 0xFFFF = 1)

-- insert a record with SOM 01:02:03:04 and DUR 00:00:30:00
insert [ASDB].[dbo].[ASDB] (Type, Identifier, StartOfMessage, Duration)
values ('s', 'your-id', 0x01020304, 0x00003000); 

-- Danger zone, delete a specific record
DELETE FROM [ASDB].[dbo].[ASDB] where Identifier = 'your-id' 
GO
DELETE FROM [ASDB].[dbo].[ASEXT] where Identifier = 'your-id'

