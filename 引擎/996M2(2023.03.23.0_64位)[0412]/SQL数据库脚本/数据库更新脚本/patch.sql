SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--=======================20220210 变量表格中增加合区类型字段支持多种合区方式==================================
IF NOT EXISTS(SELECT * FROM syscolumns WHERE id = (SELECT id FROM sysobjects WHERE name = 'TBL_VAR') AND name = 'FLD_JOINTYPE')
  ALTER TABLE TBL_VAR ADD FLD_JOINTYPE smallint DEFAULT ((0)) NULL


-- =================202210311737宠物表格=================
IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_PET]') AND type IN ('U'))
  BEGIN
	CREATE TABLE [dbo].[TBL_PET] (
	  [FLD_ID] int IDENTITY(1,1) NOT NULL,
	  [FLD_MASTERUSERID] varchar(128) COLLATE Chinese_PRC_CI_AS NOT NULL,
	  [FLD_PETIDX] int DEFAULT ((0)) NULL,
	  [FLD_PETNAME] varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	  [FLD_USERID] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
	  [FLD_DELETED] tinyint DEFAULT ((0)) NOT NULL,
	  [FLD_UPDATEDATETIME] datetime NULL,
	  [FLD_RELEVEL] int DEFAULT ((0)) NOT NULL,
	  [FLD_LEVEL] int DEFAULT ((0)) NOT NULL,
	  [FLD_HP] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_MP] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_EXP] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_MAKEDATE] datetime NULL,
	  [FLD_StatusTimeArr] binary(24) DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_DC] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_MC] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_SC] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_AC] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_MAC] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_HP] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_MP] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_HIT] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_BONUS_SPEED] bigint DEFAULT ((0)) NOT NULL,
	  [FLD_FEATURE] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
	  [FLD_BODYITEM] varchar(200) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
	  [FLD_MASTERNAME] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
	  [FLD_BONUSPOINT] bigint DEFAULT ((0)) NULL,
	  [FLD_BONUS_X2] bigint DEFAULT ((0)) NULL,
	  [FLD_STATE] tinyint DEFAULT ((1)) NULL
	)
 

	ALTER TABLE [dbo].[TBL_PET] SET (LOCK_ESCALATION = TABLE)
 

	CREATE NONCLUSTERED INDEX [IX_TBL_PET_FLD_USERID]
	ON [dbo].[TBL_PET] (
	  [FLD_USERID] ASC
	)
 END
GO

-- =================202210311737存储过程=================
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[LoadItemVar]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[LoadItemVar]
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PET_INFO_UPDATE]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[PET_INFO_UPDATE]
GO

IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[PET_INFO_ADD]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[PET_INFO_ADD]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PET_INFO_ADD]
@MasterUserID VARCHAR(50),
@sPetName VARCHAR(50),
@nPetIdx INT,
@sUserID VARCHAR(50),
@sMasterName VARCHAR(50) = '',
@nReLevel INT = 0,
@nLevel INT = 1,
@nHP bigint = 15,
@nExp bigint = 0,
@sBodyItem varchar(200) = '',
@nBonusDC bigInt= 0,
@nBonusMC bigint = 0 ,
@nBonusSC bigint = 0,
@nBonusAC bigint = 0,
@nBonusMAC bigint = 0,
@nBounsHP bigint = 0,
@nBonusMP bigint = 0,
@nBonusHit bigint = 0,
@nBonusSpeed bigint = 0,
@nBonusX2 bigint = 0,
@nBounsPoint bigint = 0
AS
IF EXISTS(SELECT FLD_ID FROM TBL_Pet WHERE FLD_USERID=@sUserID)
BEGIN
UPDATE TBL_PET SET
		FLD_MASTERUSERID= @MasterUserID,
		FLD_DELETED= 0,
    FLD_UPDATEDATETIME = getdate()
  WHERE FLD_USERID=@sUserID
	
	Return(0)
END
ELSE 
BEGIN
	INSERT INTO TBL_PET
	(
	FLD_MASTERUSERID,
	FLD_USERID,
	FLD_PETNAME,
	FLD_PETIDX,
	FLD_RELEVEL,
	FLD_LEVEL,
	FLD_HP,
	FLD_EXP,
	FLD_BONUS_DC,
	FLD_BONUS_MC,
	FLD_BONUS_SC,
	FLD_BONUS_AC,
	FLD_BONUS_MAC,
	FLD_BONUS_HP,
	FLD_BONUS_MP,
	FLD_BONUS_HIT,
	FLD_BONUS_SPEED,
	FLD_BODYITEM,
	FLD_BONUS_X2,
	FLD_BONUSPOINT,
	FLD_UPDATEDATETIME,
	FLD_MAKEDATE, 
	FLD_MASTERNAME,
	FLD_STATE
	)
	VALUES
	(
	@MasterUserID,
	@sUserID,
	@sPetName,
	@nPetIdx,
	@nReLevel,
	@nLevel,
	@nHP,
	@nExp,
	@nBonusDC,
	@nBonusMC,
	@nBonusSC,
	@nBonusAC,
	@nBonusMAC,
	@nBounsHP,
	@nBonusMP,
	@nBonusHit,
	@nBonusSpeed,
	@sBodyItem,
	@nBonusX2,
	@nBounsPoint,	
	getdate(),
	getdate(),
	@sMasterName,
	0
	)

RETURN(0)

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PET_INFO_UPDATE]
@sUserID VARCHAR(50),
@sPetName VARCHAR(50),
@nPetIdx INT,
@Relevel INT,
@nLevel INT,

@Hp BIGINT,
@Mp BIGINT,
@Exp BIGINT,

@StatusTimeAr binary(24),
@Bonus_Dc INT,
@Bonus_Mc INT,
@Bonus_Sc INT,
@Bonus_Ac INT,
@Bonus_Mac INT,
@Bonus_Hp INT,
@Bonus_Mp INT,
@Bonus_Hit INT,
@Bonus_Speed INT,
@Bonus_X2 INT,
@BonusPoint INT,
@Feature VARCHAR(200),
@BodyItem VARCHAR(200),
@MasterName VARCHAR(50),
@State TINYINT,
@nDelete Tinyint
AS
IF EXISTS(SELECT FLD_ID FROM TBL_Pet WHERE FLD_USERID=@sUserID)
BEGIN
  UPDATE TBL_PET SET
    FLD_UPDATEDATETIME = getdate(),
		FLD_PETNAME = @sPetName,
		FLD_PETIDX = @nPetIdx,
		FLD_RELEVEL = @Relevel,
		FLD_LEVEL = @nLevel,
		FLD_HP = @Hp,
		FLD_MP = @Mp,
		FLD_EXP = @Exp,
		FLD_StatusTimeArr = @StatusTimeAr,
		FLD_BONUS_DC = @Bonus_Dc,
		FLD_BONUS_MC = @Bonus_Mc,
		FLD_BONUS_SC = @Bonus_Sc,
		FLD_BONUS_AC = @Bonus_Ac,
		FLD_BONUS_MAC = @Bonus_Mac,
		FLD_BONUS_HP = @Bonus_Hp,
		FLD_BONUS_MP = @Bonus_Mp,
		FLD_BONUS_HIT = @Bonus_Hit,
		FLD_BONUS_SPEED = @Bonus_Speed,
	  FLD_BONUS_X2 = @Bonus_X2,
	  FLD_BONUSPOINT = @BonusPoint,
		FLD_FEATURE = @Feature,
		FLD_Bodyitem	= @BodyItem,
	  FLD_MASTERNAME = @MasterName,
	  FLD_STATE =@State,
		FLD_DELETED= @nDelete
  WHERE FLD_USERID=@sUserID
	Return(0)
END
ELSE 
  RETURN(1)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoadItemVar]
@sUserID VARCHAR(50),
@iType int= 0
AS
BEGIN
	IF @iType=0 
	BEGIN
		SELECT FLD_VAR_NAME, FLD_VAR_VALUE, FLD_TYPE FROM TBL_VAR
		WHERE LEN(FLD_USERID)<11 and ISNUMERIC(FLD_USERID)=1 and CONVERT(INT, FLD_USERID) IN (
		SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_BAG A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_BODY A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_JISHOU A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_STORAGE A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_PAIMAI A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_HERO_BODY A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_HERO_BAG A1 WHERE A1.FLD_USERID=@sUserID)
	END
	ELSE IF @iType=1 
	BEGIN
		SELECT FLD_VAR_NAME, FLD_VAR_VALUE, FLD_TYPE FROM TBL_VAR
		WHERE LEN(FLD_USERID)<11 and ISNUMERIC(FLD_USERID)=1 and CONVERT(INT, FLD_USERID) IN (
		SELECT FLD_MAKEINDEX FROM DBO.TBL_HERO_BODY A1 WHERE A1.FLD_USERID=@sUserID
		UNION SELECT FLD_MAKEINDEX FROM DBO.TBL_HERO_BAG A1 WHERE A1.FLD_USERID=@sUserID)
	END
	ELSE IF @iType=2
	BEGIN
		SELECT FLD_VAR_NAME, FLD_VAR_VALUE, FLD_TYPE FROM TBL_VAR
		WHERE LEN(FLD_USERID)<11 and ISNUMERIC(FLD_USERID)=1 and CONVERT(INT, FLD_USERID) IN (
		SELECT FLD_MAKEINDEX FROM DBO.TBL_ITEM_GUILD_STORAGE A1 WHERE A1.FLD_GUILDID=@sUserID)
	END	
END
GO

-- =================202302091517增加FLD_JYHCannelID FLD_TTSQCannelID=================
IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='FLD_JYHCannelID')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD FLD_JYHCannelID varchar(8000) default ''
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='FLD_TTSQCannelID')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD FLD_TTSQCannelID varchar(8000) default ''
 END
GO

-- =================202209061657增加showtime=================
IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='sshowtime')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD sshowtime [datetime]  NULL
 END
GO


-- =========202207071112=====国家====================
IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_NATION_INFO]') AND type IN ('U'))
BEGIN

	CREATE TABLE [dbo].[TBL_NATION_INFO] (
	  [nIdx] int DEFAULT ((0)) NOT NULL,
	  [sNationUID] varchar(50)  NOT NULL,
	  [sNationName] varchar(128)  NULL,
	  [nLevel] smallint DEFAULT ((0)) NULL,
	  [nGold] int DEFAULT ((0)) NULL,
	  [nExp] int DEFAULT ((0)) NULL,
	  [dCreateTime] datetime  NULL,
	  [btDeleted] smallint DEFAULT ((0)) NULL,
	  [nMemberCount] int DEFAULT ((0)) NULL,
	  [nAdvValue] int DEFAULT ((0)) NULL,
	  [sRanks] varchar(500) DEFAULT '' NULL,
	  [nServerID] int DEFAULT ((0)) NULL
	)
 

	ALTER TABLE [dbo].[TBL_NATION_INFO] SET (LOCK_ESCALATION = TABLE)
 


-- ----------------------------
-- Primary Key structure for table TBL_NATION_INFO
-- ----------------------------
	ALTER TABLE [dbo].[TBL_NATION_INFO] ADD CONSTRAINT [PK__TBL_NATI__2AD156350D5A9384] PRIMARY KEY CLUSTERED ([sNationUID])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
	ON [PRIMARY]
 

	CREATE TABLE [dbo].[TBL_NATION_MEMBER] (
	  [nIdx] varchar(50)  DEFAULT ((0)) NULL,
	  [sUserID] varchar(50)  DEFAULT ((0)) NULL,
	  [btRank] smallint DEFAULT ((0)) NULL,
	  [btJob] smallint DEFAULT ((0)) NULL,
	  [btJoin] smallint DEFAULT ((0)) NULL,
	  [nLevel] int DEFAULT ((0)) NULL,
	  [nAdvValue] int DEFAULT ((0)) NULL
	)
 

	ALTER TABLE [dbo].[TBL_NATION_MEMBER] SET (LOCK_ESCALATION = TABLE)
 
END
-- =========202207071112=====国家====================

-- =========202201281056=====跨服====================
IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='kuafuip')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD kuafuip varchar(50) default ''
 END
GO

-- =================202202241548充值增加记录字段=================
IF NOT EXISTS (select name from syscolumns where id=object_id(N'pay') AND NAME='OldGold')
 BEGIN
 ALTER TABLE [dbo].pay ADD OldGold [money]  NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='kuafuport')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD kuafuport  [int] NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='kuafustate')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD kuafustate [int] NULL
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='kuafuinfo')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD kuafuinfo varchar(200) default ''
 END
GO
-- ==================================

-- =================202105221358通区=================
IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='TongServerIP')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD TongServerIP varchar(30) default ''
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='TongServerPort')
 BEGIN
 ALTER TABLE [dbo].TBL_CONFIG ADD TongServerPort [int] NULL
 END
GO
-- ===================================================

-- =================交易行=================
IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_BOX_SELL]') AND type IN ('U'))
BEGIN
	CREATE TABLE [dbo].[TBL_BOX_SELL] (
	  [FLD_ID] int  IDENTITY(1,1) NOT NULL,
	  [FLD_USERID] varchar(50)  NOT NULL,
	  [FLD_BUYUSERID] varchar(50)   NOT NULL,
	  [FLD_MONEYID] smallint DEFAULT 0 NULL,
	  [FLD_MONEY] int DEFAULT 0 NULL,
	  [FLD_ORDER] varchar(50)   NULL,
	  [FLD_CREATEDATE] datetime  NULL,
	  [FLD_UPDATEEDATE] datetime  NULL,
	  [FLD_STATE] smallint DEFAULT 0 NULL,
	  [FLD_DECSTATE] smallint DEFAULT 0 NULL,
	  [FLD_GETSTATE] smallint DEFAULT 0 NULL,
	  [FLD_PAYORDER] varchar(128) DEFAULT '' NOT NULL,
	  [FLD_STATUS] tinyint DEFAULT 0 NOT NULL
	)

	ALTER TABLE [dbo].[TBL_BOX_SELL] SET (LOCK_ESCALATION = TABLE)

	CREATE UNIQUE NONCLUSTERED INDEX [FLD_ID_IDX]
	ON [dbo].[TBL_BOX_SELL] (
	  [FLD_ID] ASC
	)
	ALTER TABLE [dbo].[TBL_BOX_SELL] ADD CONSTRAINT [PK__TBL_BOX___84774207A5B56D0B] PRIMARY KEY CLUSTERED ([FLD_ID])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
END

IF Not EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TLOG_BOX_SELL]') AND type IN ('U'))
begin
	CREATE TABLE [dbo].[TLOG_BOX_SELL] (
		[FLD_ID] int  IDENTITY(1,1) NOT NULL,
		[FLD_USERID] varchar(50) NOT NULL,
		[FLD_BUYUSERID] varchar(50)   NOT NULL,
		[FLD_MONEYID] smallint DEFAULT 0 NULL,
		[FLD_MONEY] int DEFAULT 0 NULL,
		[FLD_ORDER] varchar(50)   NULL,
		[FLD_CREATEDATE] datetime  NULL,
		[FLD_UPDATEEDATE] datetime  NULL,
		[FLD_STATE] smallint DEFAULT 0 NULL,
		[FLD_DECSTATE] smallint DEFAULT 0 NULL,
		[FLD_GETSTATE] smallint DEFAULT 0 NULL,
		[FLD_PAYORDER] varchar(128)  DEFAULT '' NOT NULL,
		[FLD_STATUS] tinyint DEFAULT 0 NOT NULL
	)

	ALTER TABLE [dbo].[TLOG_BOX_SELL] SET (LOCK_ESCALATION = TABLE)

	CREATE UNIQUE NONCLUSTERED INDEX [FLD_ID_IDX]
	ON [dbo].[TLOG_BOX_SELL] (
		[FLD_ID] ASC
	)

	ALTER TABLE [dbo].[TLOG_BOX_SELL] ADD CONSTRAINT [PK__TLOG_BOX_SELL] PRIMARY KEY CLUSTERED ([FLD_ID])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
	ON [PRIMARY]

end

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_LOCKHUM')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_LOCKHUM   Tinyint default 0 NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_ISBUYCHAR')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_ISBUYCHAR   Tinyint default 0 NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_REALACCOUNT')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_REALACCOUNT   varchar(128) default '' NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_LOCKDATE')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_LOCKDATE   Datetime default null;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_PAYORDER')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_PAYORDER   varchar(128) default '' NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_STATUS')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_STATUS   Tinyint default 0 NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_JVAR')
 BEGIN
  ALTER TABLE TBL_CHARACTER ADD FLD_JVAR  BINARY(2000) default 0x;
  EXEC('UPDATE TBL_CHARACTER SET FLD_JVAR=0x')
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_BVAR')
 BEGIN
  ALTER TABLE TBL_CHARACTER ADD FLD_BVAR  BINARY(800) default 0x;
  EXEC('UPDATE TBL_CHARACTER SET FLD_BVAR=0x')
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_VARCLEARTIME')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_VARCLEARTIME  DATETIME;
 END
GO


-- =================交易行END=================

-- =================DIY充值=================
IF Not EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[diypay]') AND type IN ('U'))
begin
CREATE TABLE [dbo].[diypay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PayId] [varchar](128) NOT NULL,
	[sGameOrder] [varchar](128) NOT NULL,
	[sRoleId] [varchar](128) NOT NULL,
	[ExtData] [varchar](512) NULL,
	[Account] [varchar](128) NOT NULL,
	[SdkId] [varchar](50) NOT NULL,
	[SecSdkId] [varchar](50) NULL,
	[ServerId] [varchar](50) NOT NULL,
	[ProductId] [varchar](50) NOT NULL,
	[Gold] [money] NOT NULL,
	[DrawOut] [int] NULL,
	[DrawLevel] [int] NULL,
	[DrawTime] [datetime] NULL,
	[sChrName] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[nExtid] [int] NULL,
	[nExt1] [int] NULL,
 CONSTRAINT [PK__diypay__3214EC07A0A8F97B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end
-- =================================================

-- =================4.6+UPdate=================
ALTER TABLE [dbo].[TBL_ITEM_BODY] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
ALTER TABLE [dbo].[TBL_ITEM_BAG] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
ALTER TABLE [dbo].[TBL_ITEM_STORAGE] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
ALTER TABLE [dbo].[TBL_ITEM_GUILD_STORAGE] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
ALTER TABLE [dbo].[TBL_ITEM_JISHOU] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
ALTER TABLE [dbo].[TBL_ITEM_PAIMAI] ALTER COLUMN [FLD_BTVALUE] BINARY(200);
-- ==================================

-- =================人物表增加英雄字段=================

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_HEROUSERID')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_HEROUSERID   varchar(50) default '' NOT NULL;
 END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_HERONAME')
 BEGIN
 ALTER TABLE TBL_CHARACTER ADD FLD_HERONAME   varchar(50) default '' NOT NULL;
 END
GO

-- ===================================================

-- =================索引=================
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_PAIMAI') and name='IX_TBL_ITEM_PAIMAI_MAKEINDEX')
	CREATE NONCLUSTERED INDEX [IX_TBL_ITEM_PAIMAI_MAKEINDEX] ON [dbo].[TBL_ITEM_PAIMAI]
	([FLD_MAKEINDEX] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_BAG') and name='IX_TBL_ITEM_BAG_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_BAG_FLD_MAKEINDEX ON dbo.TBL_ITEM_BAG (FLD_MAKEINDEX ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_BODY') and name='IX_TBL_ITEM_BODY_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_BODY_FLD_MAKEINDEX ON dbo.TBL_ITEM_BODY (FLD_MAKEINDEX ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_GUILD_STORAGE') and name='IX_TBL_ITEM_GUILD_STORAGE_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_GUILD_STORAGE_FLD_MAKEINDEX ON dbo.TBL_ITEM_GUILD_STORAGE (FLD_MAKEINDEX ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_JISHOU') and name='IX_TBL_ITEM_JISHOU_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_JISHOU_FLD_MAKEINDEX ON dbo.TBL_ITEM_JISHOU (FLD_MAKEINDEX ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_STORAGE') and name='IX_TBL_ITEM_STORAGE_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_STORAGE_FLD_MAKEINDEX ON dbo.TBL_ITEM_STORAGE (FLD_MAKEINDEX ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_STORAGE') and name='IX_TBL_ITEM_STORAGE_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_STORAGE_FLD_MAKEINDEX ON dbo.TBL_ITEM_STORAGE (FLD_MAKEINDEX ASC)
GO

if not exists(select TOP 1 1 from dbo.sysobjects where xtype='PK' and parent_obj=object_id('TBL_MAIL'))
ALTER TABLE dbo.TBL_MAIL ADD CONSTRAINT
	PK_TBL_MAIL PRIMARY KEY CLUSTERED 
	(	ID	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_MAIL') and name='IX_TBL_MAIL_UserID')
	CREATE NONCLUSTERED INDEX IX_TBL_MAIL_UserID ON dbo.TBL_MAIL (UserID ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_MAIL') and name='IX_TBL_MAIL_dCreateTime')
	CREATE NONCLUSTERED INDEX IX_TBL_MAIL_dCreateTime ON dbo.TBL_MAIL (dCreateTime ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_CHARACTER') and name='IX_TBL_CHARACTER_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_CHARACTER_FLD_USERID ON dbo.TBL_CHARACTER (FLD_USERID ASC)
GO
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_CHARACTER') and name='IX_TBL_CHARACTER_FLD_REALACCOUNT')
	CREATE NONCLUSTERED INDEX IX_TBL_CHARACTER_FLD_REALACCOUNT ON dbo.TBL_CHARACTER (FLD_REALACCOUNT ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_CHARACTER') and name='IX_TBL_CHARACTER_FLD_ACCOUNT')
	CREATE NONCLUSTERED INDEX IX_TBL_CHARACTER_FLD_ACCOUNT ON dbo.TBL_CHARACTER (FLD_ACCOUNT ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_CHARACTER') and name='IX_TBL_CHARACTER_FLD_CHARACTER')
	CREATE NONCLUSTERED INDEX IX_TBL_CHARACTER_FLD_CHARACTER ON dbo.TBL_CHARACTER (FLD_CHARACTER ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_CHARACTER') and name='IX_TBL_CHARACTER_FLD_UPDATEDATETIME')
	CREATE NONCLUSTERED INDEX IX_TBL_CHARACTER_FLD_UPDATEDATETIME ON dbo.TBL_CHARACTER (FLD_UPDATEDATETIME ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_BAG') and name='IX_TBL_ITEM_BAG_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_BAG_FLD_USERID ON [dbo].[TBL_ITEM_BAG] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_BODY') and name='IX_TBL_ITEM_BODY_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_BODY_FLD_USERID ON [dbo].[TBL_ITEM_BODY] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_STORAGE') and name='IX_TBL_ITEM_STORAGE_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_STORAGE_FLD_USERID ON [dbo].[TBL_ITEM_STORAGE] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_MAGIC') and name='IX_TBL_MAGIC_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_MAGIC_FLD_USERID ON [dbo].[TBL_MAGIC] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_ITEM_EX_ABIL') and name='IX_TBL_ITEM_EX_ABIL_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_ITEM_EX_ABIL_FLD_MAKEINDEX ON [dbo].[TBL_ITEM_EX_ABIL] ([FLD_MAKEINDEX])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_BOX_SELL') and name='IX_TBL_BOX_SELL_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_BOX_SELL_FLD_USERID ON [dbo].[TBL_BOX_SELL] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_BOX_SELL') and name='IX_TBL_BOX_SELL_FLD_ORDER')
	CREATE NONCLUSTERED INDEX IX_TBL_BOX_SELL_FLD_ORDER ON [dbo].[TBL_BOX_SELL] ([FLD_ORDER])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_BOX_SELL') and name='IX_TBL_BOX_SELL_FLD_STATE')
	CREATE NONCLUSTERED INDEX IX_TBL_BOX_SELL_FLD_STATE ON [dbo].[TBL_BOX_SELL] ([FLD_STATE])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TLOG_BOX_SELL') and name='IX_TLOG_BOX_SELL_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TLOG_BOX_SELL_FLD_USERID ON [dbo].[TLOG_BOX_SELL] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TLOG_BOX_SELL') and name='IX_TLOG_BOX_SELL_FLD_ORDER')
	CREATE NONCLUSTERED INDEX IX_TLOG_BOX_SELL_FLD_ORDER ON [dbo].[TLOG_BOX_SELL] ([FLD_ORDER])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TLOG_BOX_SELL') and name='IX_TLOG_BOX_SELL_FLD_STATE')
	CREATE NONCLUSTERED INDEX IX_TLOG_BOX_SELL_FLD_STATE ON [dbo].[TLOG_BOX_SELL] ([FLD_STATE])
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_ITEM_PAIMAI') AND NAME='FLD_EXTENDINFO')
 BEGIN
 ALTER TABLE [dbo].TBL_ITEM_PAIMAI ADD FLD_EXTENDINFO varchar(500) default ''
 END
GO

-- ==================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'TBL_LINE') and xtype = 'U')
CREATE TABLE [dbo].[TBL_LINE](
	[nId] [INT] IDENTITY(1,1) NOT NULL,
	[Time] [INT] NULL,
	[Num] [INT] NULL
) ON [PRIMARY]
GO

IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'TBL_ITEM_LEVELVALUE') and xtype = 'U')
CREATE TABLE [dbo].[TBL_ITEM_LEVELVALUE] (
  [nIdx] int  NULL,
  [ItemValue] smallint  NOT NULL,
  [MakeDate] datetime  NOT NULL,
  [wIndex] int  NOT NULL,
  [sChrName] varchar(50) COLLATE Chinese_PRC_CI_AI  NOT NULL,
  [sMap] varchar(16) COLLATE Chinese_PRC_CI_AI  NOT NULL,
  [sMonName] varchar(50) COLLATE Chinese_PRC_CI_AI  NOT NULL,
  [sUserID] varchar(30) COLLATE Chinese_PRC_CI_AI  NULL
)
GO

IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'TBL_BLACK') and xtype = 'U')
CREATE TABLE [dbo].[TBL_BLACK](
	[FLD_USERID] [varchar](50) NOT NULL,
	[FLD_BUSERID] [varchar](50) NOT NULL,
	[FLD_JOB] [varchar](10) NULL
) ON [PRIMARY]
GO


IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'Mir_Disble_List') and xtype = 'U')
CREATE TABLE [dbo].[Mir_Disble_List](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[sAccount] [VARCHAR](128) NULL,
	[sUserId] [VARCHAR](50) NULL,
	[sIpAddr] [VARCHAR](20) NULL,
	[nVerify] [INT] NULL,
	[sTab] [VARCHAR](100) NULL,
	[dCreateTime] [DATETIME] NULL  DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'Mir_Disble_Chat') and xtype = 'U')
CREATE TABLE [dbo].[Mir_Disble_Chat](
	[Id] [INT] IDENTITY(1,1) NOT NULL,
	[sUserId] [VARCHAR](50) NOT NULL,
	[nChannel] [INT] NULL,
	[nTime] [INT] NULL,
	[sTab] [VARCHAR](100) NULL,
	[dCreateTime] [DATETIME] NULL DEFAULT (GETDATE()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


IF NOT exists(select top 1 1 from sysObjects where id = object_id(N'Game_Config') and xtype = 'U')
CREATE TABLE [dbo].[Game_Config](
        [open_time] [varchar](50) NULL,
        [merge_time] [varchar](50) NULL,
        [merge_num] [int] NULL,
        [kuafu_ip] [varchar](50) NULL,
        [kuafu_port] [int] NULL,
        [kuafu_state]  [int] NULL,
        [cs3v3_ip] [varchar](50) NULL,
        [cs3v3_port2] [int] NULL,
        [kuafu_date] [varchar](50) NULL,
        [cs3v3_port] [int] NULL,
        [createchr_day] [int] null,
		hefu_flag INT
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='Regis')
BEGIN
	ALTER TABLE TBL_CONFIG ADD Regis INT NOT NULL DEFAULT 0
end
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='HfCount')
BEGIN
	ALTER TABLE TBL_CONFIG ADD HfCount INT DEFAULT 0
end
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='HfTime')
BEGIN
	ALTER TABLE TBL_CONFIG ADD HfTime DATETIME
end
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='iRegCount')
BEGIN
	ALTER TABLE TBL_CONFIG ADD iRegCount INT DEFAULT 0
end
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CONFIG') AND NAME='sRegionServerName')
BEGIN
	ALTER TABLE TBL_CONFIG ADD sRegionServerName VARCHAR(50)
end
GO

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_ACCOUNT varchar(128)
go

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_CHARACTER varchar(50)
go

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_MASTERNAME varchar(50)
go

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_DEARNAME varchar(50)
go

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_MAPNAME varchar(50)
go

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_DC')
ALTER TABLE dbo.TBL_CHARACTER ADD FLD_DC BIGINT NULL DEFAULT ((0)) 
go

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_TOTAL_RECHARGE')
BEGIN
	ALTER TABLE TBL_CHARACTER ADD FLD_TOTAL_RECHARGE int default 0,FLD_CHARACTER_OLD varchar(100) default ''
	
	EXEC('UPDATE TBL_CHARACTER SET  FLD_TOTAL_RECHARGE=0,FLD_CHARACTER_OLD=0x')
end
go

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_GUILD_INFO') AND NAME='sGuildName_old')
BEGIN
	ALTER TABLE TBL_GUILD_INFO ADD sGuildName_old varchar(128) default ''
	EXEC('UPDATE TBL_GUILD_INFO SET sGuildName_old=0x')
END
go

IF NOT EXISTS (select name from syscolumns where id=object_id(N'Game_Config') AND NAME='hefu_flag')
BEGIN
	ALTER TABLE Game_Config ADD hefu_flag int default 0
	EXEC('UPDATE Game_Config SET hefu_flag=0')
END
go

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SUCKDAMAGECOUNT')
BEGIN
	ALTER TABLE dbo.TBL_CHARACTER ADD FLD_SUCKDAMAGECOUNT INT DEFAULT NULL
END
go
IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SUCKDAMAGERATE')
BEGIN
	ALTER TABLE dbo.TBL_CHARACTER ADD FLD_SUCKDAMAGERATE tinyint DEFAULT NULL
END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SUCKDAMAGEBILI')
BEGIN
	ALTER TABLE dbo.TBL_CHARACTER ADD FLD_SUCKDAMAGEBILI INT DEFAULT NULL
END
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SNDAITEMBOXOPENED')
BEGIN
	ALTER TABLE dbo.TBL_CHARACTER ADD FLD_SNDAITEMBOXOPENED tinyint DEFAULT NULL
END
go

ALTER TABLE dbo.TBL_ITEM_EX_ABIL ALTER COLUMN FLD_EX_ABIL VARCHAR(8000)
GO

ALTER TABLE dbo.TBL_CHARACTER ALTER COLUMN FLD_MONEY BINARY(400)
GO

IF NOT EXISTS (select name from syscolumns where id=object_id(N'TBL_CHARACTER') AND NAME='FLD_SDKID')
ALTER TABLE dbo.TBL_CHARACTER ADD FLD_SDKID VARCHAR(50)
GO


-- =================更新存储过程=================
-- map size 50
-- ==================================
if exists(select * from sys.procedures where name='HUM_INFO_ADD')
 DROP PROCEDURE HUM_INFO_ADD
go

/****** Object:  StoredProcedure [dbo].[HUM_INFO_ADD]    Script Date: 05/24/2021 20:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HUM_INFO_ADD]
@sAccount VARCHAR(128),
@sChrName VARCHAR(50),
@btSex SMALLINT,
@btJob SMALLINT,
@sUserID VARCHAR(50),
@sSdkId VARCHAR(50) = '',
@sServerID VARCHAR(50) = '',
@sHeroName VARCHAR(50) = '',
@sHeroID VARCHAR(50) = ''
AS
BEGIN
IF EXISTS (SELECT FLD_ID FROM TBL_CHARACTER WHERE (FLD_CHARACTER like @sChrName+'%') or (FLD_CHARACTER like 'S'+@sServerID+'_'+@sChrName+'%') )
   RETURN(1)

  DECLARE @nNum INT
  DECLARE @IsFirstChar INT
  DECLARE @iRegCount INT
  DECLARE @iRegis INT
  DECLARE @tStartTime DATETIME
  
	SELECT TOP 1 @iRegCount = iRegCount,@iRegis=Regis,@tStartTime=StartTime
	FROM dbo.TBL_CONFIG WITH(NOLOCK)
	SET @iRegCount= ISNULL(@iRegCount, 0)
	SET @iRegis= ISNULL(@iRegis, 0)

	IF (@iRegis > 0) AND (@tStartTime IS NOT NULL)
	BEGIN
		IF DATEDIFF(DAY,@tStartTime,GETDATE()) > @iRegis
			RETURN(7)
	END

	IF (@iRegCount <> 0) 
	BEGIN
		DECLARE @nTotal INT
		SELECT @nTotal = COUNT(DISTINCT FLD_ACCOUNT) FROM TBL_CHARACTER WHERE FLD_DELETED = 0;
		IF (@nTotal >= @iRegCount)
			RETURN(7)
	END
	
	 SELECT @nNum = COUNT(*) FROM TBL_CHARACTER WHERE FLD_ACCOUNT=@sAccount AND (FLD_DELETED=0) AND FLD_SERVERID=@sServerID
	 
	IF @nNum >= 2
		RETURN(3)
		
	IF @nNum >= 1
		SET @IsFirstChar = 0
	ELSE
		SET @IsFirstChar = 1 

	INSERT INTO TBL_CHARACTER
	(
  FLD_USERID,
	FLD_CHARACTER,
	FLD_ACCOUNT,
	FLD_SEX,
	FLD_JOB,
	FLD_UPDATEDATETIME,
	FLD_MAKEDATE, 
	FLD_ISFIRSTCHAR, 
	FLD_MAPNAME,
	FLD_HOMEMAP,
	FLD_SDKID,
	FLD_SERVERID,
	FLD_HEROUSERID,
	FLD_HERONAME
	)

	VALUES
	(
  @sUserID,
	@sChrName,
	@sAccount,
	@btSex,
	@btJob,
	getdate(),
	getdate(),
	@IsFirstChar,
	'',
	'',
	@sSdkId,
	@sServerID,
	@sHeroID,
	@sHeroName
	)

  declare @new_sn varchar(30)
	declare @new_id int
	set @new_id=@@identity

	set @new_sn=Left(@sServerID+'0000000000',10)+convert(varchar,DATEDIFF(s, '1970-01-01 00:00:00', GETUTCDATE()))
		+ right('000000'+cast(@new_id as varchar),6)
		+ substring(convert(varchar,rand()),3,3)
		
	update TBL_CHARACTER set FLD_USERID=@new_sn where FLD_ID=@new_id
	set @sUserId = @new_sn

  RETURN(0)
	
END
GO

if exists(select * from sys.procedures where name='HUM_INFO_UPDATE')
 DROP PROCEDURE HUM_INFO_UPDATE
go
/****** Object:  StoredProcedure [dbo].[HUM_INFO_UPDATE]    Script Date: 05/24/2021 20:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HUM_INFO_UPDATE]
@sUserID VARCHAR(50),
@sChrName VARCHAR(50),
@MapName VARCHAR(50),
@Cx SMALLINT,
@Cy SMALLINT,
@Dir SMALLINT,
@Hair SMALLINT,
@Sex SMALLINT,
@Job SMALLINT,
@nLevel INT,
@Hp BIGINT,
@Mp BIGINT,
@Exp BIGINT,
@Gold INT,
@sHomeMap VARCHAR(50),
@Hx SMALLINT,
@Hy SMALLINT,
@PkPoint INT,
@AllowGroup tinyint,
@btF9 INT,
@AttackMode tinyint,
@FightZoneDie tinyint,
@BodyLuck FLOAT,
@InChealth INT,
@IncSpell INT,
@IncHealing INT,
@BonusPoint INT,
@HungerStatus INT,
@StatusTimeAr binary(24),
@Relevel tinyint,
@GameGold INT,
@CreditPoint INT,
@MasterName VARCHAR(50),
@Master tinyint,
@DearName VARCHAR(50),
@StoragePwd VARCHAR(10),
@GamePoint INT,
@PayMentPoint INT,
@LockLogon tinyint,
@Contribution INT,
@AllowGuildRecall tinyint,
@GroupRecallTime INT,
@AllowGroupRecall tinyint,
@QuestUnitOpen binary(128),
@QuestUnit binary(128),
@QuestFlag binary(128),
@Money binary(400),
@MarryCount INT,
@Bonus_Dc INT,
@Bonus_Mc INT,
@Bonus_Sc INT,
@Bonus_Ac INT,
@Bonus_Mac INT,
@Bonus_Hp INT,
@Bonus_Mp INT,
@Bonus_Hit INT,
@Bonus_Speed INT,
@Bonus_X2 INT,
@Ee tinyint,
@Sysvar binary(400),
@uvar binary(1020),
@Feathure VARCHAR(200),
@SuckDamageCount INT,
@SuckDamageBiLi INT,
@SuckDamageRate tinyint,
@SndaItemBoxOpened TINYINT,
@Dc BIGINT,
@sHeroName VARCHAR(50),
@sHeroUid VARCHAR(50),
@tClearVarTime datetime,
@jVar binary(2000),
@bVar binary(800)
AS
IF EXISTS(SELECT FLD_ID FROM TBL_CHARACTER WHERE FLD_USERID=@sUserID)
BEGIN
  UPDATE TBL_CHARACTER SET
  FLD_UPDATEDATETIME = getdate(),
  FLD_CHARACTER = @sChrName,
  FLD_MAPNAME = @MapName,
  FLD_CX = @Cx,
  FLD_CY = @Cy,
	FLD_DIR = @Dir,
  FLD_HAIR = @Hair,
	FLD_SEX = @Sex,
  FLD_JOB = @Job,
  FLD_LEVEL = @nLevel,
	FLD_HP = @Hp,
	FLD_MP = @Mp,
	FLD_EXP = @Exp,
  FLD_GOLD = @Gold,
	FLD_HOMEMAP = @sHomeMap,
  FLD_HOMEX = @Hx,
	FLD_HOMEY	= @Hy,
  FLD_PKPOINT = @PkPoint,
	FLD_ALLOWGROUP = @AllowGroup,
  FLD_BTF9 = @btF9,
	FLD_ATTACKMODE = @AttackMode,
	FLD_FIGHTZONEDIE = @FightZoneDie,
	FLD_BODYLUCK = @BodyLuck,
	FLD_INCHEALTH = @InChealth,
	FLD_INCSPELL = @IncSpell,
	FLD_INCHEALING = @IncHealing,
	FLD_BONUSPOINT = @BonusPoint,
	FLD_HUNGRYSTATE	= @HungerStatus,
	FLD_StatusTimeArr = @StatusTimeAr,
	FLD_RELEVEL = @Relevel,
	FLD_GAMEGOLD = @GameGold,
	FLD_CREDITPOINT = @CreditPoint,
	FLD_MASTERNAME = @MasterName,
	FLD_MASTER = @Master,
	FLD_DEARNAME = @DearName,
	FLD_STORAGEPWD = @StoragePwd,
	FLD_GAMEPOINT	= @GamePoint,
	FLD_PAYMENTPOINT = @PayMentPoint,
	FLD_LOCKLOGON = @LockLogon,
	FLD_CONTRIBUTION = @Contribution,
	FLD_ALLOWGUILDRECALL = @AllowGroupRecall,
	FLD_GROUPRECALLTIME = @GroupRecallTime,
	FLD_ALLOWGROUPRECALL = @AllowGroupRecall,
	FLD_QUESTUNITOPEN = @QuestUnitOpen,
	FLD_QUESTUNIT = @QuestUnit,
	FLD_QUESTFLAG = @QuestFlag,
  FLD_MONEY = @Money,
	FLD_MARRYCOUNT = @MarryCount,
	FLD_BONUS_DC = @Bonus_Dc,
	FLD_BONUS_MC = @Bonus_Mc,
	FLD_BONUS_SC = @Bonus_Sc,
	FLD_BONUS_AC = @Bonus_Ac,
	FLD_BONUS_MAC = @Bonus_Mac,
	FLD_BONUS_HP = @Bonus_Hp,
	FLD_BONUS_MP = @Bonus_Mp,
	FLD_BONUS_HIT = @Bonus_Hit,
	FLD_BONUS_SPEED = @Bonus_Speed,
	FLD_BONUS_X2 = @Bonus_X2,
	FLD_EE = @Ee,
  FLD_SYSVAR = @Sysvar,
  FLD_UVAR = @uvar,
  FLD_FEATURE = @Feathure,
	FLD_SUCKDAMAGECOUNT = @SuckDamageCount,
	FLD_SUCKDAMAGERATE = @SuckDamageRate,
	FLD_SUCKDAMAGEBILI = @SuckDamageBiLi,
	FLD_SNDAITEMBOXOPENED = @SndaItemBoxOpened,
	FLD_DC = @Dc,
	FLD_HERONAME = @sHeroName,
	FLD_HEROUSERID = @sHeroUid,
	FLD_JVAR = @jVar,
	FLD_BVAR = @bVar,
	FLD_VARCLEARTIME = @tClearVarTime
	
  WHERE FLD_USERID=@sUserID
	Return(0)
END
ELSE 
  RETURN(1)
GO

--====================英雄相关====================

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_HERO_MAGIC]') AND type IN ('U'))
BEGIN
CREATE TABLE [dbo].[TBL_HERO_MAGIC](
	[FLD_USERID] [varchar](50) NULL,
	[FLD_MAGICID] [int] NOT NULL,
	[FLD_LEVEL] [tinyint] NULL,
	[FLD_KEY] [tinyint] NULL,
	[FLD_CURTRAIN] [int] NULL,
	[FLD_LEVEL_UP] [int] NULL
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_HERO_BODY]') AND type IN ('U'))
BEGIN
CREATE TABLE [dbo].[TBL_HERO_BODY](
	[FLD_USERID] [varchar](50) NULL,
	[FLD_MAKEINDEX] [int] NOT NULL,
	[FLD_INDEX] [int] NULL,
	[FLD_DURA] [int] NULL,
	[FLD_DURAMAX] [int] NULL,
	[FLD_BTVALUE] [binary](200) NULL,
	[FLD_WHERE] [int] NULL,
	[FLD_OVERLAP] [int] NULL,
	[FLD_AddVale] [binary](80) NULL,
	[FLD_EXTEND] [varchar](500) NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_HERO_BAG]') AND type IN ('U'))
BEGIN
CREATE TABLE [dbo].[TBL_HERO_BAG](
	[FLD_USERID] [varchar](50) NULL,
	[FLD_MAKEINDEX] [int] NOT NULL,
	[FLD_INDEX] [int] NULL,
	[FLD_DURA] [int] NULL,
	[FLD_DURAMAX] [int] NULL,
	[FLD_BTVALUE] [binary](200) NULL,
	[FLD_WHERE] [int] NULL,
	[FLD_OVERLAP] [int] NULL,
	[FLD_AddVale] [binary](80) NULL,
	[FLD_EXTEND] [varchar](500) NULL
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_HERO]') AND type IN ('U'))
BEGIN
CREATE TABLE [dbo].[TBL_HERO](
	[FLD_ID] [int] IDENTITY(1,1) NOT NULL,
	[FLD_HEROMASTERUSERID] [varchar](128) NULL,
	[FLD_CHARACTER] [varchar](50) NULL,
	[FLD_USERID] [varchar](50) NULL,
	[FLD_DELETED] [tinyint] NULL,
	[FLD_UPDATEDATETIME] [datetime] NULL,
	[FLD_MAPNAME] [varchar](50) NULL,
	[FLD_CX] [smallint] NULL,
	[FLD_CY] [smallint] NULL,
	[FLD_DIR] [tinyint] NULL,
	[FLD_HAIR] [tinyint] NULL,
	[FLD_SEX] [tinyint] NULL,
	[FLD_JOB] [tinyint] NULL,
	[FLD_LEVEL] [int] NULL,
	[FLD_HP] [BIGINT] NULL,
	[FLD_MP] [BIGINT] NULL,
	[FLD_EXP] [bigint] NULL,
	[FLD_PKPOINT] [int] NULL,
	[FLD_BODYLUCK] [float] NULL,
	[FLD_INCHEALTH] [int] NULL,
	[FLD_INCSPELL] [int] NULL,
	[FLD_INCHEALING] [int] NULL,
	[FLD_BONUSPOINT] [int] NULL,
	[FLD_HUNGRYSTATE] [tinyint] NULL,
	[FLD_MAKEDATE] [datetime] NULL,
	[FLD_StatusTimeArr] [binary](24) NULL,
	[FLD_RELEVEL] [tinyint] NULL,
	[FLD_MASTERNAME] [varchar](50) NULL,
	[FLD_QUESTUNITOPEN] [binary](128) NULL,
	[FLD_QUESTUNIT] [binary](128) NULL,
	[FLD_QUESTFLAG] [binary](128) NULL,
	[FLD_BONUS_DC] [int] NULL,
	[FLD_BONUS_MC] [int] NULL,
	[FLD_BONUS_SC] [int] NULL,
	[FLD_BONUS_AC] [int] NULL,
	[FLD_BONUS_MAC] [int] NULL,
	[FLD_BONUS_HP] [int] NULL,
	[FLD_BONUS_MP] [int] NULL,
	[FLD_BONUS_HIT] [int] NULL,
	[FLD_BONUS_SPEED] [int] NULL,
	[FLD_BONUS_X2] [int] NULL,
	[FLD_SELECTID] [tinyint] NULL,
	[FLD_BTF9] [int] NULL,
	[FLD_SYSVAR] [binary](400) NULL,
	[FLD_EE] [tinyint] NULL,
	[FLD_UVAR] [binary](1020) NULL,
	[FLD_FEATURE] [varchar](200) NULL,
	[FLD_SUCKDAMAGECOUNT] [int] NULL,
	[FLD_SUCKDAMAGERATE] [tinyint] NULL,
	[FLD_SUCKDAMAGEBILI] [int] NULL,
	[FLD_SNDAITEMBOXOPENED] [tinyint] NULL,
	[FLD_SDKID] [varchar](50) NULL,
	[FLD_SERVERID] [int] NULL,
	[FLD_DC] [BIGINT] NULL
) 
END
GO

--========================英雄索引===================================
if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO_BAG') and name='IX_TBL_HERO_BAG_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_BAG_FLD_MAKEINDEX ON dbo.TBL_HERO_BAG (FLD_MAKEINDEX ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO_BAG') and name='IX_TBL_HERO_BAG_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_BAG_FLD_USERID ON [dbo].[TBL_HERO_BAG] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO_BODY') and name='IX_TBL_HERO_BODY_FLD_MAKEINDEX')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_BODY_FLD_MAKEINDEX ON dbo.TBL_HERO_BODY (FLD_MAKEINDEX ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO_BODY') and name='IX_TBL_HERO_BODY_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_BODY_FLD_USERID ON [dbo].[TBL_HERO_BODY] ([FLD_USERID])
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO') and name='IX_TBL_HERO_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_FLD_USERID ON dbo.TBL_HERO (FLD_USERID ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO') and name='IX_TBL_HERO_FLD_CHARACTER')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_FLD_CHARACTER ON dbo.TBL_HERO (FLD_CHARACTER ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO') and name='IX_TBL_HERO_FLD_UPDATEDATETIME')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_FLD_UPDATEDATETIME ON dbo.TBL_HERO (FLD_UPDATEDATETIME ASC)
GO

if not exists(select TOP 1 1 from sysindexes where id=object_id('TBL_HERO_MAGIC') and name='IX_TBL_HERO_MAGIC_FLD_USERID')
	CREATE NONCLUSTERED INDEX IX_TBL_HERO_MAGIC_FLD_USERID ON [dbo].[TBL_HERO_MAGIC] ([FLD_USERID])
GO

--===========================================================
if exists(select * from sys.procedures where name='HERO_INFO_UPDATE')
 DROP PROCEDURE HERO_INFO_UPDATE
go

/****** Object:  StoredProcedure [dbo].[HERO_INFO_UPDATE]    Script Date: 05/24/2021 20:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HERO_INFO_UPDATE]
@sUserID VARCHAR(50),
@sChrName VARCHAR(50),
@MapName VARCHAR(50),
@Cx SMALLINT,
@Cy SMALLINT,
@Dir SMALLINT,
@Hair SMALLINT,
@Sex SMALLINT,
@Job SMALLINT,
@nLevel INT,

@Hp BIGINT,
@Mp BIGINT,
@Exp BIGINT,

@PkPoint INT,
@btF9 INT,
@BodyLuck FLOAT,
@InChealth INT,
@IncSpell INT,
@IncHealing INT,
@BonusPoint INT,
@HungerStatus INT,
@StatusTimeAr binary(24),
@Relevel tinyint,
@MasterName VARCHAR(50),
@QuestUnitOpen binary(128),
@QuestUnit binary(128),
@QuestFlag binary(128),
@Bonus_Dc INT,
@Bonus_Mc INT,
@Bonus_Sc INT,
@Bonus_Ac INT,
@Bonus_Mac INT,
@Bonus_Hp INT,
@Bonus_Mp INT,
@Bonus_Hit INT,
@Bonus_Speed INT,
@Bonus_X2 INT,
@Ee tinyint,
@Sysvar binary(400),
@uvar binary(1020),
@Feathure VARCHAR(200),
@SuckDamageCount INT,
@SuckDamageBiLi INT,
@SuckDamageRate tinyint,
@SndaItemBoxOpened TINYINT,
@Dc BIGINT

AS
IF EXISTS(SELECT FLD_ID FROM TBL_HERO WHERE FLD_USERID=@sUserID)
BEGIN
  UPDATE TBL_HERO SET
    FLD_UPDATEDATETIME = getdate(),
	FLD_CHARACTER = @sChrName,
	FLD_MAPNAME = @MapName,
	FLD_CX = @Cx,
	FLD_CY = @Cy,
	FLD_DIR = @Dir,
	FLD_HAIR = @Hair,
	FLD_SEX = @Sex,
	FLD_JOB = @Job,
	FLD_LEVEL = @nLevel,
	FLD_HP = @Hp,
	FLD_MP = @Mp,
	FLD_EXP = @Exp,
	FLD_PKPOINT = @PkPoint,
	FLD_BTF9 = @btF9,
	FLD_BODYLUCK = @BodyLuck,
	FLD_INCHEALTH = @InChealth,
	FLD_INCSPELL = @IncSpell,
	FLD_INCHEALING = @IncHealing,
	FLD_BONUSPOINT = @BonusPoint,
	FLD_HUNGRYSTATE	= @HungerStatus,
	FLD_StatusTimeArr = @StatusTimeAr,
	FLD_RELEVEL = @Relevel,
	FLD_MASTERNAME = @MasterName,
	FLD_QUESTUNITOPEN = @QuestUnitOpen,
	FLD_QUESTUNIT = @QuestUnit,
	FLD_QUESTFLAG = @QuestFlag,
	FLD_BONUS_DC = @Bonus_Dc,
	FLD_BONUS_MC = @Bonus_Mc,
	FLD_BONUS_SC = @Bonus_Sc,
	FLD_BONUS_AC = @Bonus_Ac,
	FLD_BONUS_MAC = @Bonus_Mac,
	FLD_BONUS_HP = @Bonus_Hp,
	FLD_BONUS_MP = @Bonus_Mp,
	FLD_BONUS_HIT = @Bonus_Hit,
	FLD_BONUS_SPEED = @Bonus_Speed,
	FLD_BONUS_X2 = @Bonus_X2,
	FLD_EE = @Ee,
	FLD_SYSVAR = @Sysvar,
	FLD_UVAR = @uvar,
	FLD_FEATURE = @Feathure,
	FLD_SUCKDAMAGECOUNT = @SuckDamageCount,
	FLD_SUCKDAMAGERATE = @SuckDamageRate,
	FLD_SUCKDAMAGEBILI = @SuckDamageBiLi,
	FLD_SNDAITEMBOXOPENED = @SndaItemBoxOpened,
	FLD_DC = @Dc


  WHERE FLD_USERID=@sUserID
	Return(0)
END
ELSE 
  RETURN(1)
GO

if exists(select * from sys.procedures where name='HERO_INFO_ADD')
 DROP PROCEDURE HERO_INFO_ADD
go

/****** Object:  StoredProcedure [dbo].[HERO_INFO_ADD]    Script Date: 05/24/2021 20:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HERO_INFO_ADD]
@MasterUserID VARCHAR(50),
@sChrName VARCHAR(50),
@btSex SMALLINT,
@btJob SMALLINT,
@sUserID VARCHAR(50),
@sSdkId VARCHAR(50) = '',
@sServerID VARCHAR(50) = '',
@sMasterName VARCHAR(50) = ''
AS
BEGIN
IF EXISTS (SELECT FLD_ID FROM TBL_HERO WHERE (FLD_CHARACTER like @sChrName+'%') or (FLD_CHARACTER like 'S'+@sServerID+'_'+@sChrName+'%') )
   RETURN(1)

  DECLARE @nNum INT
  DECLARE @IsFirstChar INT
  DECLARE @iRegCount INT
  
	SELECT TOP 1 @iRegCount = iRegCount
	FROM dbo.TBL_CONFIG WITH(NOLOCK)
	SET @iRegCount= ISNULL(@iRegCount, 0)

	IF (@iRegCount <> 0) 
	BEGIN
		DECLARE @nTotal INT
		SELECT @nTotal = COUNT(DISTINCT FLD_HEROMASTERUSERID) FROM TBL_HERO WHERE FLD_DELETED = 0;
		IF (@nTotal >= @iRegCount)
			RETURN(7)
	END
	
	 SELECT @nNum = COUNT(*) FROM TBL_HERO WHERE FLD_HEROMASTERUSERID=@MasterUserID AND (FLD_DELETED=0) AND FLD_SERVERID=@sServerID;

	IF @nNum >= 1
		RETURN(3)
		
	IF @nNum >= 1
		SET @IsFirstChar = 0
	ELSE
		SET @IsFirstChar = 1 

	INSERT INTO TBL_HERO
	(
	FLD_HEROMASTERUSERID,
  FLD_USERID,
	FLD_CHARACTER,
	FLD_SEX,
	FLD_JOB,
	FLD_UPDATEDATETIME,
	FLD_MAKEDATE, 
	FLD_MAPNAME,
	FLD_SDKID,
	FLD_SERVERID,
	FLD_MASTERNAME
	)

	VALUES
	(
	@MasterUserID,
  @sUserID,
	@sChrName,
	@btSex,
	@btJob,
	getdate(),
	getdate(),
	'',
	@sSdkId,
	@sServerID,
	@sMasterName
	)

  declare @new_sn varchar(30)
	declare @new_id int
	set @new_id=@@identity

	set @new_sn=convert(varchar,DATEDIFF(s, '1970-01-01 00:00:00', GETUTCDATE()))
		+ right('000000'+cast(@new_id as varchar),6)
		+ substring(convert(varchar,rand()),3,3)
		
	update TBL_HERO set FLD_USERID=@new_sn where FLD_ID=@new_id
	set @sUserId = @new_sn

  RETURN(0)
	
END
GO


if exists(select * from sys.procedures where name='LoadExAbil')
 DROP PROCEDURE LoadExAbil
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoadExAbil]
as 
BEGIN
SELECT * FROM TBL_ITEM_EX_ABIL A 
	WHERE EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_BAG A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_BODY A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_GUILD_STORAGE A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_JISHOU A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_STORAGE A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_ITEM_PAIMAI A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)	

	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_HERO_BODY A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
	OR EXISTS(SELECT TOP 1 1 FROM DBO.TBL_HERO_BAG A1 WHERE A1.FLD_MAKEINDEX=A.FLD_MAKEINDEX)
end
GO














IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_DELETED' 
	) ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_DELETED]
	
	GO

IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_MAPNAME' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ('') FOR [FLD_MAPNAME]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_CX' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_CX]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_CY' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_CY]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_DIR' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_DIR]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_HAIR' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((1)) FOR [FLD_HAIR]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SEX' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SEX]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_JOB' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_JOB]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_LEVEL' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_LEVEL]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_HP' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_HP]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_MP' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_MP]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_EXP' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_EXP]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_PKPOINT' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_PKPOINT]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BODYLUCK' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BODYLUCK]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_INCHEALTH' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_INCHEALTH]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_INCSPELL' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_INCSPELL]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_INCHEALING' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_INCHEALING]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUSPOINT' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUSPOINT]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_HUNGRYSTATE' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_HUNGRYSTATE]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_StatusTimeArr' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_StatusTimeArr]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_RELEVEL' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_RELEVEL]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_MASTERNAME' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ('') FOR [FLD_MASTERNAME]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_QUESTUNITOPEN' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_QUESTUNITOPEN]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_QUESTUNIT' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_QUESTUNIT]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_QUESTFLAG' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_QUESTFLAG]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_DC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_DC]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_MC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_MC]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_SC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_SC]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_AC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_AC]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_MAC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_MAC]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_HP' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_HP]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_MP' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_MP]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_HIT' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_HIT]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_SPEED' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_SPEED]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BONUS_X2' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BONUS_X2]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SELECTID' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SELECTID]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_BTF9' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_BTF9]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SYSVAR' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SYSVAR]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_EE' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_EE]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_UVAR' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_UVAR]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_FEATURE' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ('') FOR [FLD_FEATURE]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SUCKDAMAGECOUNT' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SUCKDAMAGECOUNT]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SUCKDAMAGERATE' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SUCKDAMAGERATE]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SUCKDAMAGEBILI' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SUCKDAMAGEBILI]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SNDAITEMBOXOPENED' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SNDAITEMBOXOPENED]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SDKID' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ('') FOR [FLD_SDKID]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_SERVERID' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_SERVERID]
GO
IF not EXISTS ( SELECT 1 FROM sys.tables t INNER JOIN sys.columns c ON t.object_id = c.object_id
		INNER JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id 
	WHERE
		t.name = 'TBL_HERO' 
	AND c.name = 'FLD_DC' 
	)
ALTER TABLE [dbo].[TBL_HERO] ADD  DEFAULT ((0)) FOR [FLD_DC]
GO