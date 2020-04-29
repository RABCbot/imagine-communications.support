-- select one id from the main table
select * from ASDB.dbo.ASDB where Identifier = 'your-id'
-- select one id from the segments table 
select * from ASDB.dbo.ASSEG where Identifier = 'your-id'
-- select one id from the more info table 
select * from ASDB.dbo.ASEXT where Identifier = 'your-id'
-- show DUR/SOM properly from main table
select Type, Identifier, Cast(Duration as varbinary(4)), Cast(StartOfMessage as varbinary(4)) from ASDB.dbo.ASDB where Identifier = 'your-id'
-- show DUR/SOM properly from segmentsn table
select Type, SegType, SegNumber, Identifier, Cast(Duration as varbinary(4)), Cast(StartOfMessage as varbinary(4)) from ASDB.dbo.ASDB where Identifier = 'your-id'

DELETE FROM [ASDB].[dbo].[ASDB] where Identifier = 'T018005 ' 
GO
DELETE FROM [ASDB].[dbo].[ASEXT] where Identifier = 'T018005 '

INSERT INTO [ASDB].[dbo].[ASEXT] (Identifier, PlayStart, PlayDuration, ClipStart, ClipDuration, "Type")
VALUES ('DE_TEST003','00:00:00:00','00:00:40:00','00:00:00:00','00:00:40:00', 's'); 

INSERT INTO [ASDB].[dbo].[ASDB] (Identifier, StartOfMessage, Duration, "Type")
VALUES ('DE_TEST003','0','1200', 's'); 
