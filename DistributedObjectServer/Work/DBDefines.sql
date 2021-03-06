SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_ACCOUNT_INFO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_ACCOUNT_INFO](
	[AccountID] [bigint] NOT NULL,
	[AccountName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_T_ACCOUNT_INFO_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_T_ACCOUNT_INFO] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_ACCOUNT_INFO]') AND name = N'IDX_ACCOUNT_NAME')
CREATE UNIQUE NONCLUSTERED INDEX [IDX_ACCOUNT_NAME] ON [dbo].[T_ACCOUNT_INFO] 
(
	[AccountName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_ACCOUNT_INFO]') AND name = N'IDX_PASSWORD')
CREATE NONCLUSTERED INDEX [IDX_PASSWORD] ON [dbo].[T_ACCOUNT_INFO] 
(
	[Password] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_PLAYER_CHAR_INFO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_PLAYER_CHAR_INFO](
	[CharID] [bigint] NOT NULL,
	[AccountID] [bigint] NOT NULL,
	[CharName] [varchar](50) NOT NULL,
	[CreateTime] [datetime] NOT NULL CONSTRAINT [DF_T_PLAYER_CHAR_INFO_CreateTime]  DEFAULT (getdate()),
	[IsDel] [tinyint] NOT NULL CONSTRAINT [DF_T_PLAYER_CHAR_INFO_IsDel]  DEFAULT ((0)),
	[Race] [tinyint] NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[SkinColor] [tinyint] NOT NULL,
	[HairColor] [tinyint] NOT NULL,
	[FaceType] [tinyint] NOT NULL,
	[HairType] [tinyint] NOT NULL,
	[BeardType] [tinyint] NOT NULL,
	[IsCharBald] [tinyint] NOT NULL,
	[MapID] [bigint] NOT NULL,
	[PosX] [float] NOT NULL,
	[PosY] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Direction] [float] NOT NULL,
 CONSTRAINT [PK_T_PLAYER_CHAR_INFO] PRIMARY KEY CLUSTERED 
(
	[CharID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_PLAYER_CHAR_INFO]') AND name = N'IDX_ACCOUNT_ID')
CREATE NONCLUSTERED INDEX [IDX_ACCOUNT_ID] ON [dbo].[T_PLAYER_CHAR_INFO] 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_PLAYER_CHAR_INFO]') AND name = N'IDX_CHAR_NAME')
CREATE UNIQUE NONCLUSTERED INDEX [IDX_CHAR_NAME] ON [dbo].[T_PLAYER_CHAR_INFO] 
(
	[CharName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_PLAYER_CHAR_INFO]') AND name = N'IDX_IS_DEL')
CREATE NONCLUSTERED INDEX [IDX_IS_DEL] ON [dbo].[T_PLAYER_CHAR_INFO] 
(
	[IsDel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
