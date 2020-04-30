-- correct store procedures permissions
use [master]
GO
GRANT EXECUTE ON [dbo].[xp_update_as] TO [HarrisDB]
GO
use [master]
GO
GRANT EXECUTE ON [dbo].[xp_update_asseg] TO [HarrisDB]
GO
use [master]
GO
GRANT EXECUTE ON [dbo].[xp_update_as] TO [LouthDB]
GO
use [master]
GO
GRANT EXECUTE ON [dbo].[xp_update_asseg] TO [LouthDB]
GO

-- test NAcore
DECLARE
	@Type char,
	@Identifier varchar(32),
	@Title varchar(32),
	@BoxIdentifier varchar(8),
	@AltIdentifier varchar(10),
	@OrgIdentifier varchar(16),
	@UserString varchar(16),
	@UserData1 varchar(30),
	@UserData2 varchar(30),
	@Operator varchar(3),
	@StartOfMessage int,
	@Duration int,
	@PlayNumber smallint,
	@LabelType tinyint,
	@VideoFormat tinyint,
	@VideoQuality tinyint,
	@AudioFormat tinyint,
	@MadeDateTime datetime,
	@PlayDateTime datetime,
	@AirDateTime datetime,
	@PurgeDateTime datetime,
	@NoteDateTime datetime,
	@NoteContent varchar(250)

DECLARE
	@Action int,
	@AffectedMask int

SET @AffectedMask = 0x7FFFFF;
SET @Action = 0x01

SET @Type = 's'
SET @Identifier = 'TEST1'

EXEC master..xp_update_as
	@Action,
	@AffectedMask, 
	@Type,
	@Identifier,
	@Title,
	@BoxIdentifier,
	@AltIdentifier,
	@OrgIdentifier,
	@UserString,
	@UserData1,
	@UserData2,
	@Operator,
	@StartOfMessage,
	@Duration,
	@PlayNumber,
	@LabelType,
	@VideoFormat,
	@VideoQuality,
	@AudioFormat,
	@MadeDateTime,
	@PlayDateTime,
	@AirDateTime,
	@PurgeDateTime,
	@NoteDateTime,
	@NoteContent,
		
	--Repeat the same info for "deleted"
	--It will be omitted in the DLL.
	@Type,
	@Identifier,
	@Title,
	@BoxIdentifier,
	@AltIdentifier,
	@OrgIdentifier,
	@UserString,
	@UserData1,
	@UserData2,
	@Operator,
	@StartOfMessage,
	@Duration,
	@PlayNumber,
	@LabelType,
	@VideoFormat,
	@VideoQuality,
	@AudioFormat,
	@MadeDateTime,
	@PlayDateTime,
	@AirDateTime,
	@PurgeDateTime,
	@NoteDateTime,
	@NoteContent
