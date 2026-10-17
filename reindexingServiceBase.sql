USE [master]
GO
/****** Object:  Database [ReindexingServiceBase]    Script Date: 17.10.2026 9:58:58 ******/
CREATE DATABASE [ReindexingServiceBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReindexingServiceBase', FILENAME = N'D:\MSSQLData\ReindexingServiceBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 8192KB )
 LOG ON 
( NAME = N'ReindexingServiceBase_log', FILENAME = N'D:\MSSQLData\ReindexingServiceBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 8192KB )
GO
ALTER DATABASE [ReindexingServiceBase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReindexingServiceBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReindexingServiceBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReindexingServiceBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReindexingServiceBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReindexingServiceBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReindexingServiceBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReindexingServiceBase] SET  MULTI_USER 
GO
ALTER DATABASE [ReindexingServiceBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReindexingServiceBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReindexingServiceBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReindexingServiceBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReindexingServiceBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReindexingServiceBase', N'ON'
GO
ALTER DATABASE [ReindexingServiceBase] SET QUERY_STORE = OFF
GO
USE [ReindexingServiceBase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ReindexingServiceBase]
GO
/****** Object:  Table [dbo].[DatabaseSettings]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[SettingName] [nvarchar](100) NOT NULL,
	[SettingValue] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalSettings]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [nvarchar](100) NOT NULL,
	[SettingValue] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexMaintenanceLog]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexMaintenanceLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[WeeklyIndexID] [int] NULL,
	[SchemaName] [nvarchar](128) NULL,
	[TableName] [nvarchar](128) NULL,
	[IndexName] [nvarchar](128) NULL,
	[ActionType] [nvarchar](20) NULL,
	[Command] [nvarchar](max) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[DurationMs] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[ErrorMessage] [nvarchar](4000) NULL,
	[LogDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceStatistics]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceStatistics](
	[StatID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[WeekStartDate] [date] NOT NULL,
	[TotalIndexes] [int] NOT NULL,
	[ProcessedIndexes] [int] NOT NULL,
	[TotalEstimatedMinutes] [int] NOT NULL,
	[ActualMinutes] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagedDatabases]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagedDatabases](
	[DatabaseID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [nvarchar](128) NOT NULL,
	[DatabaseGUID] [uniqueidentifier] NULL,
	[IsEnabled] [bit] NULL,
	[LastAnalyzed] [datetime] NULL,
	[LastMaintenanceStart] [datetime] NULL,
	[LastMaintenanceEnd] [datetime] NULL,
	[SettingsXML] [xml] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DatabaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferredIndexActions]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferredIndexActions](
	[PreferredActionID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[SchemaName] [nvarchar](128) NOT NULL,
	[TableName] [nvarchar](128) NOT NULL,
	[IndexName] [nvarchar](128) NOT NULL,
	[PreferredAction] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](500) NULL,
	[IsEnabled] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PreferredActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeeklyIndexMaintenance]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyIndexMaintenance](
	[WeeklyIndexID] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseID] [int] NOT NULL,
	[SchemaName] [nvarchar](128) NOT NULL,
	[TableName] [nvarchar](128) NOT NULL,
	[IndexName] [nvarchar](128) NOT NULL,
	[IndexType] [nvarchar](60) NULL,
	[FragmentationPercent] [float] NOT NULL,
	[PageCount] [bigint] NOT NULL,
	[RowsCount] [bigint] NULL,
	[IsProcessed] [bit] NULL,
	[ProcessedDate] [datetime] NULL,
	[ActionType] [nvarchar](20) NULL,
	[EstimatedTimeMinutes] [int] NULL,
	[ActualTimeMinutes] [int] NULL,
	[LastExecutionTime] [datetime] NULL,
	[Priority] [int] NULL,
	[WeekStartDate] [date] NOT NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WeeklyIndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DatabaseSettings] ON 

INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (1, 1, N'RebuildThreshold', N'23', N'Порог фрагментации для перестроения (в %)', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.797' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (2, 1, N'ReorganizeThreshold', N'17', N'Порог фрагментации для реорганизации (в %)', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.797' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (3, 1, N'MinPageCount', N'3000', N'Минимальное количество страниц для обслуживания', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.813' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (4, 1, N'DailyTimeLimit', N'40', N'Дневной лимит времени (в минутах)', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.797' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (5, 1, N'MaxDOP', N'1', N'Максимальная степень параллелизма', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.780' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (6, 1, N'FillFactor', N'90', N'Fill Factor для перестроения', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.780' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (7, 1, N'UseOnlineRebuild', N'1', N'Использовать ONLINE перестроение если доступно (0/1)', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-01-22T10:16:36.813' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (8, 1, N'CurrentWeekStart', N'2026-10-12', N'Дата начала текущей недели', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-10-16T20:17:10.727' AS DateTime))
INSERT [dbo].[DatabaseSettings] ([SettingID], [DatabaseID], [SettingName], [SettingValue], [Description], [CreatedDate], [ModifiedDate]) VALUES (9, 1, N'IsWeekInitialized', N'1', N'Флаг инициализации недели (0/1)', CAST(N'2026-01-22T10:16:36.780' AS DateTime), CAST(N'2026-10-16T20:17:10.727' AS DateTime))

SET IDENTITY_INSERT [dbo].[DatabaseSettings] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_DatabaseSetting]    Script Date: 17.10.2026 9:58:58 ******/
ALTER TABLE [dbo].[DatabaseSettings] ADD  CONSTRAINT [UQ_DatabaseSetting] UNIQUE NONCLUSTERED 
(
	[DatabaseID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GlobalSe__BCA5D46329FCAA97]    Script Date: 17.10.2026 9:58:58 ******/
ALTER TABLE [dbo].[GlobalSettings] ADD UNIQUE NONCLUSTERED 
(
	[SettingName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IndexMaintenanceLog_Date]    Script Date: 17.10.2026 9:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_IndexMaintenanceLog_Date] ON [dbo].[IndexMaintenanceLog]
(
	[LogDate] ASC,
	[DatabaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_IndexMaintenanceLog_Status]    Script Date: 17.10.2026 9:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_IndexMaintenanceLog_Status] ON [dbo].[IndexMaintenanceLog]
(
	[Status] ASC,
	[LogDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ManagedD__6F5131977AC01BED]    Script Date: 17.10.2026 9:58:58 ******/
ALTER TABLE [dbo].[ManagedDatabases] ADD UNIQUE NONCLUSTERED 
(
	[DatabaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PreferredIndex]    Script Date: 17.10.2026 9:58:58 ******/
ALTER TABLE [dbo].[PreferredIndexActions] ADD  CONSTRAINT [UQ_PreferredIndex] UNIQUE NONCLUSTERED 
(
	[DatabaseID] ASC,
	[SchemaName] ASC,
	[TableName] ASC,
	[IndexName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PreferredIndexActions_Lookup]    Script Date: 17.10.2026 9:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_PreferredIndexActions_Lookup] ON [dbo].[PreferredIndexActions]
(
	[DatabaseID] ASC,
	[SchemaName] ASC,
	[TableName] ASC,
	[IndexName] ASC,
	[IsEnabled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WeeklyIndexMaintenance_Processed]    Script Date: 17.10.2026 9:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_WeeklyIndexMaintenance_Processed] ON [dbo].[WeeklyIndexMaintenance]
(
	[DatabaseID] ASC,
	[IsProcessed] ASC,
	[Priority] DESC,
	[PageCount] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WeeklyIndexMaintenance_Week]    Script Date: 17.10.2026 9:58:58 ******/
CREATE NONCLUSTERED INDEX [IX_WeeklyIndexMaintenance_Week] ON [dbo].[WeeklyIndexMaintenance]
(
	[WeekStartDate] ASC,
	[DatabaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatabaseSettings] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DatabaseSettings] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[GlobalSettings] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[GlobalSettings] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[IndexMaintenanceLog] ADD  DEFAULT (getdate()) FOR [LogDate]
GO
ALTER TABLE [dbo].[MaintenanceStatistics] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ManagedDatabases] ADD  DEFAULT (newid()) FOR [DatabaseGUID]
GO
ALTER TABLE [dbo].[ManagedDatabases] ADD  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[ManagedDatabases] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ManagedDatabases] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[PreferredIndexActions] ADD  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[PreferredIndexActions] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PreferredIndexActions] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[PreferredIndexActions] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[WeeklyIndexMaintenance] ADD  DEFAULT ((0)) FOR [IsProcessed]
GO
ALTER TABLE [dbo].[WeeklyIndexMaintenance] ADD  DEFAULT ((0)) FOR [Priority]
GO
ALTER TABLE [dbo].[WeeklyIndexMaintenance] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DatabaseSettings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Database] FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[ManagedDatabases] ([DatabaseID])
GO
ALTER TABLE [dbo].[DatabaseSettings] CHECK CONSTRAINT [FK_Settings_Database]
GO
ALTER TABLE [dbo].[IndexMaintenanceLog]  WITH CHECK ADD  CONSTRAINT [FK_Log_Database] FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[ManagedDatabases] ([DatabaseID])
GO
ALTER TABLE [dbo].[IndexMaintenanceLog] CHECK CONSTRAINT [FK_Log_Database]
GO
ALTER TABLE [dbo].[MaintenanceStatistics]  WITH CHECK ADD  CONSTRAINT [FK_Statistics_Database] FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[ManagedDatabases] ([DatabaseID])
GO
ALTER TABLE [dbo].[MaintenanceStatistics] CHECK CONSTRAINT [FK_Statistics_Database]
GO
ALTER TABLE [dbo].[PreferredIndexActions]  WITH CHECK ADD  CONSTRAINT [FK_PreferredActions_Database] FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[ManagedDatabases] ([DatabaseID])
GO
ALTER TABLE [dbo].[PreferredIndexActions] CHECK CONSTRAINT [FK_PreferredActions_Database]
GO
ALTER TABLE [dbo].[WeeklyIndexMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_WeeklyIndex_Database] FOREIGN KEY([DatabaseID])
REFERENCES [dbo].[ManagedDatabases] ([DatabaseID])
GO
ALTER TABLE [dbo].[WeeklyIndexMaintenance] CHECK CONSTRAINT [FK_WeeklyIndex_Database]
GO
ALTER TABLE [dbo].[PreferredIndexActions]  WITH CHECK ADD CHECK  (([PreferredAction]='SKIP' OR [PreferredAction]='REORGANIZE' OR [PreferredAction]='REBUILD'))
GO
/****** Object:  StoredProcedure [dbo].[AddPreferredIndexAction]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Добавление предпочтительного действия
CREATE PROCEDURE [dbo].[AddPreferredIndexAction]
    @DatabaseName NVARCHAR(128),
    @SchemaName NVARCHAR(128),
    @TableName NVARCHAR(128),
    @IndexName NVARCHAR(128),
    @PreferredAction NVARCHAR(20),
    @Reason NVARCHAR(500) = NULL,
    @IsEnabled BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseID INT;
    
    -- Получаем ID базы данных
    SELECT @DatabaseID = DatabaseID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName;

    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не найдена', 16, 1, @DatabaseName);
        RETURN;
    END

    -- Проверяем корректность действия
    IF @PreferredAction NOT IN ('REBUILD', 'REORGANIZE', 'SKIP')
    BEGIN
        RAISERROR('Некорректное действие. Допустимые значения: REBUILD, REORGANIZE, SKIP', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION;

    -- Проверяем существование записи
    IF EXISTS(SELECT 1 FROM dbo.PreferredIndexActions 
              WHERE DatabaseID = @DatabaseID 
                AND SchemaName = @SchemaName 
                AND TableName = @TableName 
                AND IndexName = @IndexName)
    BEGIN
        -- Обновляем существующую запись
        UPDATE dbo.PreferredIndexActions 
        SET PreferredAction = @PreferredAction,
            Reason = @Reason,
            IsEnabled = @IsEnabled,
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID 
            AND SchemaName = @SchemaName 
            AND TableName = @TableName 
            AND IndexName = @IndexName;
        
        PRINT 'Обновлено предпочтительное действие для индекса: ' + 
              @SchemaName + '.' + @TableName + '.' + @IndexName;
    END
    ELSE
    BEGIN
        -- Добавляем новую запись
        INSERT INTO dbo.PreferredIndexActions 
            (DatabaseID, SchemaName, TableName, IndexName, PreferredAction, Reason, IsEnabled)
        VALUES 
            (@DatabaseID, @SchemaName, @TableName, @IndexName, @PreferredAction, @Reason, @IsEnabled);
        
        PRINT 'Добавлено предпочтительное действие для индекса: ' + 
              @SchemaName + '.' + @TableName + '.' + @IndexName;
    END

    COMMIT TRANSACTION;

    -- Возвращаем результат
    SELECT 
        PreferredActionID,
        DatabaseName = @DatabaseName,
        SchemaName,
        TableName,
        IndexName,
        PreferredAction,
        Reason,
        IsEnabled,
        CreatedDate,
        ModifiedDate
    FROM dbo.PreferredIndexActions 
    WHERE DatabaseID = @DatabaseID 
        AND SchemaName = @SchemaName 
        AND TableName = @TableName 
        AND IndexName = @IndexName;
END;
GO
/****** Object:  StoredProcedure [dbo].[AnalyzeEstimationAccuracy]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AnalyzeEstimationAccuracy]
    @DatabaseName NVARCHAR(128),
    @WeeksToAnalyze INT = 8
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseID INT;
    
    SELECT @DatabaseID = DatabaseID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName;

    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не найдена', 16, 1, @DatabaseName);
        RETURN;
    END

    -- Статистика по точности оценок
    SELECT 
        'Общая статистика точности оценок' as [Статистика],
        COUNT(*) as [Всего выполненных индексов],
        AVG(CAST(ActualTimeMinutes AS FLOAT)) as [Среднее фактическое время (мин)],
        AVG(CAST(EstimatedTimeMinutes AS FLOAT)) as [Среднее расчетное время (мин)],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes)) as [Средняя абсолютная ошибка (мин)],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes) / NULLIF(ActualTimeMinutes, 0)) * 100 as [Средняя относительная ошибка (%)]
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID
        AND IsProcessed = 1
        AND ActualTimeMinutes IS NOT NULL
        AND ActualTimeMinutes > 0
        AND WeekStartDate >= DATEADD(WEEK, -@WeeksToAnalyze, GETDATE());

    -- Статистика по типам действий
    SELECT 
        ActionType as [Тип действия],
        COUNT(*) as [Количество],
        AVG(CAST(ActualTimeMinutes AS FLOAT)) as [Среднее факт. время],
        AVG(CAST(EstimatedTimeMinutes AS FLOAT)) as [Среднее расч. время],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes)) as [Ср. абс. ошибка],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes) / NULLIF(ActualTimeMinutes, 0)) * 100 as [Ср. отн. ошибка %]
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID
        AND IsProcessed = 1
        AND ActualTimeMinutes IS NOT NULL
        AND ActualTimeMinutes > 0
        AND WeekStartDate >= DATEADD(WEEK, -@WeeksToAnalyze, GETDATE())
    GROUP BY ActionType
    ORDER BY [Количество] DESC;

    -- Самые проблемные индексы по точности оценки
    SELECT TOP 10
        SchemaName + '.' + TableName + '.' + IndexName as [Индекс],
        ActionType as [Действие],
        EstimatedTimeMinutes as [Расчетное время],
        ActualTimeMinutes as [Фактическое время],
        ABS(ActualTimeMinutes - EstimatedTimeMinutes) as [Абсолютная ошибка],
        CAST(ABS(ActualTimeMinutes - EstimatedTimeMinutes) / NULLIF(ActualTimeMinutes, 0) * 100 AS DECIMAL(5,2)) as [Относительная ошибка %],
        WeekStartDate as [Неделя]
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID
        AND IsProcessed = 1
        AND ActualTimeMinutes IS NOT NULL
        AND ActualTimeMinutes > 0
        AND WeekStartDate >= DATEADD(WEEK, -@WeeksToAnalyze, GETDATE())
    ORDER BY [Абсолютная ошибка] DESC;

    -- Эволюция точности оценок по неделям
    SELECT 
        WeekStartDate as [Неделя],
        COUNT(*) as [Количество индексов],
        AVG(CAST(ActualTimeMinutes AS FLOAT)) as [Ср. факт. время],
        AVG(CAST(EstimatedTimeMinutes AS FLOAT)) as [Ср. расч. время],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes)) as [Ср. абс. ошибка],
        AVG(ABS(ActualTimeMinutes - EstimatedTimeMinutes) / NULLIF(ActualTimeMinutes, 0)) * 100 as [Ср. отн. ошибка %]
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID
        AND IsProcessed = 1
        AND ActualTimeMinutes IS NOT NULL
        AND ActualTimeMinutes > 0
        AND WeekStartDate >= DATEADD(WEEK, -@WeeksToAnalyze, GETDATE())
    GROUP BY WeekStartDate
    ORDER BY WeekStartDate DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ExecuteDailyMaintenance]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------------------------------------------------
-- Шаг4: Процедура ежедневного обслуживания
------------------------------------------------------
CREATE   PROCEDURE [dbo].[ExecuteDailyMaintenance]
    @DatabaseName NVARCHAR(128),
    @DailyTimeLimitMinutes INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE 
        @DatabaseID INT,
        @DatabaseGUID UNIQUEIDENTIFIER,
        @CurrentWeekStart DATE,
        @IsWeekInitialized BIT,
        @MaxDOP INT,
        @FillFactor INT,
        @UseOnlineRebuild BIT,
        @Edition NVARCHAR(100),
        @Version NVARCHAR(100),
        @ActualTimeLimit INT,
        @StartTime DATETIME = GETDATE(),
        @EndTime DATETIME,
        @TimeRemainingMinutes INT;
        

    -- Получаем информацию о базе
    SELECT 
        @DatabaseID = DatabaseID,
        @DatabaseGUID = DatabaseGUID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName AND IsEnabled = 1;

    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не зарегистрирована или отключена', 16, 1, @DatabaseName);
        RETURN;
    END

    -- Получаем настройки
    IF @DailyTimeLimitMinutes IS NULL
        SELECT @ActualTimeLimit = CAST(SettingValue AS INT)
        FROM dbo.DatabaseSettings 
        WHERE DatabaseID = @DatabaseID AND SettingName = 'DailyTimeLimit';
    ELSE
        SET @ActualTimeLimit = @DailyTimeLimitMinutes;

    SELECT @CurrentWeekStart = CAST(SettingValue AS DATE)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'CurrentWeekStart';

    SELECT @IsWeekInitialized = CAST(SettingValue AS BIT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'IsWeekInitialized';

    SELECT @MaxDOP = CAST(SettingValue AS INT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'MaxDOP';

    SELECT @FillFactor = CAST(SettingValue AS INT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'FillFactor';

    SELECT @UseOnlineRebuild = CAST(SettingValue AS BIT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'UseOnlineRebuild';

    -- Проверяем инициализацию недели
    IF @IsWeekInitialized = 0 OR @CurrentWeekStart IS NULL OR DATEDIFF(DAY, @CurrentWeekStart, GETDATE()) >= 7
    BEGIN
        PRINT 'Неделя не инициализирована или прошла. Начинаем новую неделю...';
        EXEC dbo.InitializeWeeklyIndexPlan @DatabaseName = @DatabaseName;
        
        SELECT @CurrentWeekStart = CAST(SettingValue AS DATE)
        FROM dbo.DatabaseSettings 
        WHERE DatabaseID = @DatabaseID AND SettingName = 'CurrentWeekStart';
    END

    -- Проверяем возможность онлайн-перестроения
    DECLARE @OnlineCheckSQL NVARCHAR(MAX) = N'
    SELECT 
        @Edition = CAST(SERVERPROPERTY(''Edition'') AS NVARCHAR(100)),
        @Version = CAST(SERVERPROPERTY(''ProductVersion'') AS NVARCHAR(100));
    ';

    EXEC sp_executesql @OnlineCheckSQL, 
        N'@Edition NVARCHAR(100) OUTPUT, @Version NVARCHAR(100) OUTPUT',
        @Edition = @Edition OUTPUT, @Version = @Version OUTPUT;

    -- Для SQL Server 2016: ONLINE = ON доступен только в Enterprise/Developer
    DECLARE @IsOnlineAvailable BIT = 0;
    
    IF @UseOnlineRebuild = 1 
       AND (@Edition LIKE '%Enterprise%' OR @Edition LIKE '%Developer%')
       AND CAST(LEFT(@Version, 2) AS INT) >= 13  -- SQL Server 2016
        SET @IsOnlineAvailable = 1;

    -- Обновляем время начала обслуживания
    UPDATE dbo.ManagedDatabases 
    SET LastMaintenanceStart = @StartTime,
        ModifiedDate = GETDATE()
    WHERE DatabaseID = @DatabaseID;

    SET @EndTime = DATEADD(MINUTE, @ActualTimeLimit, @StartTime);

    PRINT '===============================================';
    PRINT 'Обслуживание базы: ' + @DatabaseName;
    PRINT 'Неделя: ' + CONVERT(VARCHAR(10), @CurrentWeekStart);
    PRINT 'Время начала: ' + CONVERT(VARCHAR(30), @StartTime, 120);
    PRINT 'Лимит времени: ' + CAST(@ActualTimeLimit AS VARCHAR) + ' минут';
    PRINT '===============================================';

    -- Создаем курсор для обработки индексов
    DECLARE IndexCursor CURSOR LOCAL FAST_FORWARD FOR
        -- Используем скорректированные оценки на основе исторических данных
    SELECT --TOP 100
        WeeklyIndexID,
        SchemaName,
        TableName,
        IndexName,
        ActionType,
        FragmentationPercent,
        PageCount,
        -- Используем исторические данные, если они есть
        CASE 
            WHEN ActualTimeMinutes IS NOT NULL 
                THEN CAST(CEILING(ActualTimeMinutes * 1.2) AS INT)  -- 20% запас на изменения
            ELSE EstimatedTimeMinutes 
        END as EstimatedTimeMinutes
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID
        AND WeekStartDate = @CurrentWeekStart
        AND IsProcessed = 0
        AND ActionType IS NOT NULL
        -- Фильтр по времени: не берем индексы, которые по оценке не вкладываются в окно выполнения
        AND (
            CASE 
                WHEN ActualTimeMinutes IS NOT NULL 
                    THEN CAST(CEILING(ActualTimeMinutes * 1.2) AS INT)
                ELSE EstimatedTimeMinutes 
            END
        ) <= CAST(DATEDIFF(MINUTE, GETDATE(), @EndTime) AS INT)  -- нвс, оценка условная
    ORDER BY 
        Priority DESC, 
        PageCount DESC;

    DECLARE 
        @WeeklyIndexID INT,
        @SchemaName NVARCHAR(128),
        @TableName NVARCHAR(128),
        @IndexName NVARCHAR(128),
        @ActionType NVARCHAR(20),
        @FragmentationPercent FLOAT,
        @PageCount BIGINT,
        @EstimatedTimeMinutes INT,
        @SQLCommand NVARCHAR(MAX),
        @OnlineOption NVARCHAR(200),
        @ErrorMessage NVARCHAR(4000),
        @CommandStartTime DATETIME,
        @CommandEndTime DATETIME,
        @DurationMs INT,
        @ProcessedCount INT = 0,
        @SkippedDueToTime INT = 0;

    OPEN IndexCursor;
    FETCH NEXT FROM IndexCursor INTO 
        @WeeklyIndexID, @SchemaName, @TableName, @IndexName, 
        @ActionType, @FragmentationPercent, @PageCount, @EstimatedTimeMinutes;

    WHILE @@FETCH_STATUS = 0 AND GETDATE() < @EndTime
    BEGIN
        -- Пересчитываем оставшееся время
        SET @TimeRemainingMinutes = CAST(DATEDIFF(MINUTE, GETDATE(), @EndTime) * 1.5 AS INT);
        
        -- Проверяем, успеем ли выполнить этот индекс с учетом буфера
        IF @EstimatedTimeMinutes > @TimeRemainingMinutes
        BEGIN
            PRINT '[' + CONVERT(VARCHAR(30), GETDATE(), 108) + '] ' +
                  'ПРОПУСК: ' + @SchemaName + '.' + @TableName + '.' + @IndexName + 
                  ' (Оценка: ' + CAST(@EstimatedTimeMinutes AS VARCHAR) + 
                  ' мин, Осталось: ' + CAST(@TimeRemainingMinutes AS VARCHAR) + ' мин)';
            
            SET @SkippedDueToTime = @SkippedDueToTime + 1;
            
            -- Пропускаем этот индекс, переходим к следующему
            FETCH NEXT FROM IndexCursor INTO 
                @WeeklyIndexID, @SchemaName, @TableName, @IndexName, 
                @ActionType, @FragmentationPercent, @PageCount, @EstimatedTimeMinutes;
            CONTINUE;
        END


        SET @CommandStartTime = GETDATE();
        SET @SQLCommand = '';
        SET @OnlineOption = '';

        -- Определяем параметры для команды
        IF @ActionType = 'REBUILD' 
        BEGIN
            
            IF @IsOnlineAvailable = 1
                SET @OnlineOption = ' WITH (ONLINE = ON (WAIT_AT_LOW_PRIORITY (MAX_DURATION = 1 MINUTES, ABORT_AFTER_WAIT = SELF))' +
				                   ', MAXDOP = ' + CAST(@MaxDOP AS NVARCHAR) + 
                                   ', FILLFACTOR = ' + CAST(@FillFactor AS NVARCHAR) + ', SORT_IN_TEMPDB = ON)';
            ELSE
                SET @OnlineOption = ' WITH (MAXDOP = ' + CAST(@MaxDOP AS NVARCHAR) + 
                                   ', FILLFACTOR = ' + CAST(@FillFactor AS NVARCHAR) + ', SORT_IN_TEMPDB = ON)';
            
            SET @SQLCommand = 'USE [' + @DatabaseName + ']; ' +
                             'ALTER INDEX [' + @IndexName + '] ON [' + @SchemaName + '].[' + @TableName + '] REBUILD' + @OnlineOption;
        END
        ELSE IF @ActionType = 'REORGANIZE'
        BEGIN
            SET @OnlineOption = ' WITH (LOB_COMPACTION = ON)';
            SET @SQLCommand = 'USE [' + @DatabaseName + ']; ' +
                             'ALTER INDEX [' + @IndexName + '] ON [' + @SchemaName + '].[' + @TableName + '] REORGANIZE' + @OnlineOption;
        END

        BEGIN TRY
            PRINT '[' + CONVERT(VARCHAR(30), @CommandStartTime, 108) + '] ' + 
                  @ActionType + ': ' + @SchemaName + '.' + @TableName + '.' + @IndexName + 
                  ' (Фрагментация: ' + CAST(CAST(@FragmentationPercent AS DECIMAL(10,2)) AS VARCHAR(15)) + 
                  '%, Страниц: ' + CAST(@PageCount AS VARCHAR(10)) + 
                  ', Оценка: ' + CAST(@EstimatedTimeMinutes AS VARCHAR(10)) + ' мин)';

            -- Выполняем команду
            EXEC sp_executesql @SQLCommand;

            SET @CommandEndTime = GETDATE();
            SET @DurationMs = DATEDIFF(MILLISECOND, @CommandStartTime, @CommandEndTime);
            DECLARE @ActualMinutes DECIMAL(10,2) = @DurationMs / 60000.0;   -- минуты
            

            -- Помечаем как обработанный
            UPDATE dbo.WeeklyIndexMaintenance 
            SET IsProcessed = 1,
                ProcessedDate = GETDATE(),
                ActualTimeMinutes = CEILING(@ActualMinutes),
                LastExecutionTime = GETDATE()
            WHERE WeeklyIndexID = @WeeklyIndexID;

            -- Логируем успех
            INSERT INTO dbo.IndexMaintenanceLog 
                (DatabaseID, WeeklyIndexID, SchemaName, TableName, IndexName, ActionType, 
                 Command, StartTime, EndTime, DurationMs, Status)
            VALUES
                (@DatabaseID, @WeeklyIndexID, @SchemaName, @TableName, @IndexName, @ActionType,
                 @SQLCommand, @CommandStartTime, @CommandEndTime, @DurationMs, 'SUCCESS');

            SET @ProcessedCount = @ProcessedCount + 1;

            PRINT '    Успешно за ' + CAST(CAST(@DurationMs/1000.0 AS DECIMAL(10,2)) AS VARCHAR(10)) + ' сек';
            PRINT '    Оценка/Факт: ' + CAST(@EstimatedTimeMinutes AS VARCHAR(10)) + ' мин / ' + 
                  CAST(@ActualMinutes AS VARCHAR(15)) + ' мин';

        END TRY
        BEGIN CATCH
            SET @CommandEndTime = GETDATE();
            SET @DurationMs = DATEDIFF(MILLISECOND, @CommandStartTime, @CommandEndTime);
            SET @ErrorMessage = ERROR_MESSAGE();

            -- Логируем ошибку
            INSERT INTO dbo.IndexMaintenanceLog 
                (DatabaseID, WeeklyIndexID, SchemaName, TableName, IndexName, ActionType, 
                 Command, StartTime, EndTime, DurationMs, Status, ErrorMessage)
            VALUES
                (@DatabaseID, @WeeklyIndexID, @SchemaName, @TableName, @IndexName, @ActionType,
                 @SQLCommand, @CommandStartTime, @CommandEndTime, @DurationMs, 'ERROR', @ErrorMessage);

            -- Помечаем как обработанный с ошибкой
            UPDATE dbo.WeeklyIndexMaintenance 
            SET IsProcessed = 1,
                ProcessedDate = GETDATE()
            WHERE WeeklyIndexID = @WeeklyIndexID;

            SET @ProcessedCount = @ProcessedCount + 1;

            PRINT '    ОШИБКА: ' + @ErrorMessage;
        END CATCH

        -- Проверяем не истекло ли время
        IF GETDATE() >= @EndTime
        BEGIN
            PRINT 'Достигнут лимит времени (' + CAST(@ActualTimeLimit AS VARCHAR) + ' минут)';
            BREAK;
        END

        FETCH NEXT FROM IndexCursor INTO 
            @WeeklyIndexID, @SchemaName, @TableName, @IndexName, 
            @ActionType, @FragmentationPercent, @PageCount, @EstimatedTimeMinutes;
    END

    CLOSE IndexCursor;
    DEALLOCATE IndexCursor;

    -- Обновляем время окончания обслуживания
    UPDATE dbo.ManagedDatabases 
    SET LastMaintenanceEnd = GETDATE(),
        ModifiedDate = GETDATE()
    WHERE DatabaseID = @DatabaseID;

    -- Обновляем статистику
    DECLARE @TotalTimeMinutes INT = DATEDIFF(MINUTE, @StartTime, GETDATE());
    DECLARE @RemainingCount INT;
    DECLARE @TotalEstimated INT;

    SELECT @RemainingCount = COUNT(*)
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID 
        AND WeekStartDate = @CurrentWeekStart 
        AND IsProcessed = 0;

    SELECT @TotalEstimated = ISNULL(SUM(EstimatedTimeMinutes), 0)
    FROM dbo.WeeklyIndexMaintenance 
    WHERE DatabaseID = @DatabaseID 
        AND WeekStartDate = @CurrentWeekStart 
        AND IsProcessed = 0;

    UPDATE dbo.MaintenanceStatistics 
    SET ProcessedIndexes = ProcessedIndexes + @ProcessedCount,
        ActualMinutes = ActualMinutes + @TotalTimeMinutes,
        EndDate = GETDATE(),
        Status = CASE WHEN @RemainingCount = 0 THEN 'COMPLETED' ELSE 'IN_PROGRESS' END
    WHERE DatabaseID = @DatabaseID 
        AND WeekStartDate = @CurrentWeekStart
        AND Status != 'COMPLETED';

    PRINT '===============================================';
    PRINT 'Отчет за ' + CONVERT(VARCHAR(30), GETDATE(), 104);
    PRINT 'База данных: ' + @DatabaseName;
    PRINT 'Обработано индексов: ' + CAST(@ProcessedCount AS VARCHAR);
    PRINT 'Пропущено из-за нехватки времени: ' + CAST(@SkippedDueToTime AS VARCHAR);
    PRINT 'Осталось на неделе: ' + CAST(@RemainingCount AS VARCHAR);
    PRINT 'Оставшееся расчетное время: ' + CAST(@TotalEstimated AS VARCHAR) + ' минут';
    PRINT 'Фактическое время выполнения: ' + CAST(@TotalTimeMinutes AS VARCHAR) + ' минут';
    PRINT '===============================================';

    -- Если все индексы обработаны, отмечаем неделю завершенной
    IF @RemainingCount = 0
    BEGIN
        UPDATE dbo.DatabaseSettings 
        SET SettingValue = '0',
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID AND SettingName = 'IsWeekInitialized';

        PRINT 'ВСЕ ИНДЕКСЫ НА НЕДЕЛЮ ОБРАБОТАНЫ!';
    END

	/*
    -- Логируем сводку
    INSERT INTO dbo.IndexMaintenanceLog 
        (DatabaseID, SchemaName, ActionType, StartTime, EndTime, Status)
    VALUES
        (@DatabaseID, 'SYSTEM', 'DAILY_SUMMARY', @StartTime, GETDATE(), 'SUMMARY');
	*/
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMaintenanceStatus]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------
-- Шаг5-1: Процедура ежедневного обслуживания
------------------------------------------------------
-- Получение статуса обслуживания
CREATE PROCEDURE [dbo].[GetMaintenanceStatus]
    @DatabaseName NVARCHAR(128) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @DatabaseName IS NULL
    BEGIN
        -- Общий статус по всем базам
        SELECT 
            md.DatabaseName,
            ds_current.SettingValue as CurrentWeek,
            wim_total.TotalIndexes,
            wim_processed.ProcessedIndexes,
            wim_remaining.RemainingIndexes,
            wim_remaining.RemainingMinutes,
            md.LastMaintenanceStart,
            md.LastMaintenanceEnd,
            md.IsEnabled
        FROM dbo.ManagedDatabases md
        LEFT JOIN dbo.DatabaseSettings ds_current 
            ON md.DatabaseID = ds_current.DatabaseID 
            AND ds_current.SettingName = 'CurrentWeekStart'
        OUTER APPLY (
            SELECT COUNT(*) as TotalIndexes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
        ) wim_total
        OUTER APPLY (
            SELECT COUNT(*) as ProcessedIndexes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
                AND wim.IsProcessed = 1
        ) wim_processed
        OUTER APPLY (
            SELECT COUNT(*) as RemainingIndexes,
                   SUM(EstimatedTimeMinutes) as RemainingMinutes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
                AND wim.IsProcessed = 0
        ) wim_remaining
        WHERE md.IsEnabled = 1
        ORDER BY md.DatabaseName;
    END
    ELSE
    BEGIN
        -- Детальный статус по конкретной базе
        DECLARE @DatabaseID INT;
        
        SELECT @DatabaseID = DatabaseID
        FROM dbo.ManagedDatabases 
        WHERE DatabaseName = @DatabaseName;
        
        -- Общая информация
        SELECT 
            'Детальный статус: ' + @DatabaseName as [Статус],
            ds_current.SettingValue as [Текущая неделя],
            wim_total.TotalIndexes as [Всего индексов],
            wim_processed.ProcessedIndexes as [Обработано],
            wim_remaining.RemainingIndexes as [Осталось],
            wim_remaining.RemainingMinutes as [Осталось минут],
            md.LastMaintenanceStart as [Последний запуск],
            md.LastMaintenanceEnd as [Последнее завершение]
        FROM dbo.ManagedDatabases md
        LEFT JOIN dbo.DatabaseSettings ds_current 
            ON md.DatabaseID = ds_current.DatabaseID 
            AND ds_current.SettingName = 'CurrentWeekStart'
        OUTER APPLY (
            SELECT COUNT(*) as TotalIndexes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
        ) wim_total
        OUTER APPLY (
            SELECT COUNT(*) as ProcessedIndexes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
                AND wim.IsProcessed = 1
        ) wim_processed
        OUTER APPLY (
            SELECT COUNT(*) as RemainingIndexes,
                   SUM(EstimatedTimeMinutes) as RemainingMinutes
            FROM dbo.WeeklyIndexMaintenance wim
            WHERE wim.DatabaseID = md.DatabaseID
                AND wim.WeekStartDate = CAST(ds_current.SettingValue AS DATE)
                AND wim.IsProcessed = 0
        ) wim_remaining
        WHERE md.DatabaseID = @DatabaseID;
        
        -- Следующие индексы в очереди
        SELECT TOP 10
            SchemaName as [Схема],
            TableName as [Таблица],
            IndexName as [Индекс],
            ActionType as [Действие],
            CAST(FragmentationPercent as DECIMAL(5,2)) as [Фрагментация %],
            PageCount as [Страниц],
            EstimatedTimeMinutes as [Время (мин)],
            Priority as [Приоритет]
        FROM dbo.WeeklyIndexMaintenance 
        WHERE DatabaseID = @DatabaseID
            AND IsProcessed = 0
        ORDER BY Priority DESC, PageCount DESC;
        
        -- Последние операции
        SELECT TOP 10
            CONVERT(VARCHAR(20), StartTime, 120) as [Время],
            SchemaName + '.' + TableName + '.' + IndexName as [Объект],
            ActionType as [Действие],
            CAST(DurationMs/1000.0 as DECIMAL(10,2)) as [Время (сек)],
            Status as [Статус]
        FROM dbo.IndexMaintenanceLog 
        WHERE DatabaseID = @DatabaseID
            AND SchemaName != 'SYSTEM'
        ORDER BY StartTime DESC;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPreferredIndexActions]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Просмотр предпочтительных действий
CREATE PROCEDURE [dbo].[GetPreferredIndexActions]
    @DatabaseName NVARCHAR(128) = NULL,
    @SchemaName NVARCHAR(128) = NULL,
    @TableName NVARCHAR(128) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        pia.PreferredActionID,
        md.DatabaseName,
        pia.SchemaName,
        pia.TableName,
        pia.IndexName,
        pia.PreferredAction,
        pia.Reason,
        pia.IsEnabled,
        pia.CreatedDate,
        pia.ModifiedDate,
        pia.CreatedBy,
        -- Статистика использования
        (SELECT COUNT(*) FROM dbo.WeeklyIndexMaintenance wim 
         WHERE wim.DatabaseID = pia.DatabaseID 
           AND wim.SchemaName = pia.SchemaName 
           AND wim.TableName = pia.TableName 
           AND wim.IndexName = pia.IndexName) as UsageCount,
        -- Последнее применение
        (SELECT MAX(ProcessedDate) FROM dbo.WeeklyIndexMaintenance wim 
         WHERE wim.DatabaseID = pia.DatabaseID 
           AND wim.SchemaName = pia.SchemaName 
           AND wim.TableName = pia.TableName 
           AND wim.IndexName = pia.IndexName) as LastAppliedDate
    FROM dbo.PreferredIndexActions pia
    INNER JOIN dbo.ManagedDatabases md ON pia.DatabaseID = md.DatabaseID
    WHERE (@DatabaseName IS NULL OR md.DatabaseName = @DatabaseName)
        AND (@SchemaName IS NULL OR pia.SchemaName = @SchemaName)
        AND (@TableName IS NULL OR pia.TableName = @TableName)
        AND pia.IsEnabled = 1
    ORDER BY md.DatabaseName, pia.SchemaName, pia.TableName, pia.IndexName;
END;
GO
/****** Object:  StoredProcedure [dbo].[InitializeWeeklyIndexPlan]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InitializeWeeklyIndexPlan]
    @DatabaseName NVARCHAR(128),
    @WeekStartDate DATE = NULL,
    @SkipPreferredActions BIT = 0  -- Новый параметр: игнорировать предпочтения
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE 
        @DatabaseID INT,
        @DatabaseGUID UNIQUEIDENTIFIER,
        @RebuildThreshold FLOAT,
        @ReorganizeThreshold FLOAT,
        @MinPageCount BIGINT,
        @CurrentWeekStart DATE,
        @SQL NVARCHAR(MAX),
        @Params NVARCHAR(500),
        @HistoryWeeks INT = 12;

    -- Получаем информацию о базе
    SELECT 
        @DatabaseID = DatabaseID,
        @DatabaseGUID = DatabaseGUID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName AND IsEnabled = 1;

    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не зарегистрирована или отключена', 16, 1, @DatabaseName);
        RETURN;
    END

    -- Получаем настройки
    SELECT @RebuildThreshold = CAST(SettingValue AS FLOAT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'RebuildThreshold';

    SELECT @ReorganizeThreshold = CAST(SettingValue AS FLOAT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'ReorganizeThreshold';

    SELECT @MinPageCount = CAST(SettingValue AS BIGINT)
    FROM dbo.DatabaseSettings 
    WHERE DatabaseID = @DatabaseID AND SettingName = 'MinPageCount';

    -- Определяем дату начала недели
    IF @WeekStartDate IS NULL
        SET @WeekStartDate = DATEADD(DAY, 1 - DATEPART(WEEKDAY, GETDATE()), GETDATE());

    SET @CurrentWeekStart = @WeekStartDate;

    -- Проверяем, не инициализирована ли уже эта неделя
    -- Условие на IsProcessed - запускаем на повторный круг если уже все таблицы отработали 
    IF EXISTS(SELECT 1 FROM dbo.WeeklyIndexMaintenance 
              WHERE DatabaseID = @DatabaseID AND WeekStartDate = @CurrentWeekStart AND IsProcessed = 0)
    BEGIN
        PRINT 'План на неделю ' + CONVERT(VARCHAR(10), @CurrentWeekStart) + 
              ' для базы "' + @DatabaseName + '" уже инициализирован';
        RETURN;
    END

    PRINT 'Начало инициализации плана на неделю ' + CONVERT(VARCHAR(10), @CurrentWeekStart) + 
          ' для базы "' + @DatabaseName + '"';

    -- Получаем исторические данные о времени выполнения
    CREATE TABLE #HistoricalData
    (
        SchemaName NVARCHAR(128),
        TableName NVARCHAR(128),
        IndexName NVARCHAR(128),
        ActionType NVARCHAR(20),
        AvgActualTimeMinutes DECIMAL(10,2),
        ExecutionCount INT,
        LastExecutionDate DATETIME
    );

    INSERT INTO #HistoricalData (SchemaName, TableName, IndexName, ActionType, 
                                 AvgActualTimeMinutes, ExecutionCount, LastExecutionDate)
    SELECT 
        wim.SchemaName,
        wim.TableName,
        wim.IndexName,
        wim.ActionType,
        AVG(CAST(wim.ActualTimeMinutes AS DECIMAL(10,2))) as AvgActualTimeMinutes,
        COUNT(*) as ExecutionCount,
        MAX(wim.ProcessedDate) as LastExecutionDate
    FROM dbo.WeeklyIndexMaintenance wim
    WHERE wim.DatabaseID = @DatabaseID
        AND wim.WeekStartDate >= DATEADD(WEEK, -@HistoryWeeks, @CurrentWeekStart)
        AND wim.WeekStartDate < @CurrentWeekStart
        AND wim.IsProcessed = 1
        AND wim.ActualTimeMinutes IS NOT NULL
        AND wim.ActualTimeMinutes > 0
    GROUP BY wim.SchemaName, wim.TableName, wim.IndexName, wim.ActionType;

    PRINT 'Найдено исторических записей: ' + CAST(@@ROWCOUNT AS VARCHAR);

    -- Получаем предпочтительные действия
    CREATE TABLE #PreferredActions
    (
        SchemaName NVARCHAR(128),
        TableName NVARCHAR(128),
        IndexName NVARCHAR(128),
        PreferredAction NVARCHAR(20),
        Reason NVARCHAR(500)
    );

    INSERT INTO #PreferredActions (SchemaName, TableName, IndexName, PreferredAction, Reason)
    SELECT 
        SchemaName,
        TableName,
        IndexName,
        PreferredAction,
        Reason
    FROM dbo.PreferredIndexActions 
    WHERE DatabaseID = @DatabaseID 
        AND IsEnabled = 1;

    PRINT 'Найдено предпочтительных действий: ' + CAST(@@ROWCOUNT AS VARCHAR);

    -- Динамический SQL для сбора информации об индексах из целевой базы
    SET @SQL = N'
    USE [' + @DatabaseName + N'];

    DECLARE @IndexInfo TABLE
    (
        SchemaName NVARCHAR(128),
        TableName NVARCHAR(128),
        IndexName NVARCHAR(128),
        IndexType NVARCHAR(60),
        FragmentationPercent FLOAT,
        PageCount BIGINT,
        RowsCount BIGINT,
        ActionType NVARCHAR(20), -- Действие по алгоритму
        Priority INT
    );

    INSERT INTO @IndexInfo (SchemaName, TableName, IndexName, IndexType, 
                           FragmentationPercent, PageCount, RowsCount, ActionType)
    SELECT 
        SCHEMA_NAME(t.schema_id),
        t.name,
        i.name,
        ips.index_type_desc,
        ips.avg_fragmentation_in_percent,
        ips.page_count,
        p.row_count,
        CASE 
            -- WHEN ips.avg_fragmentation_in_percent >= @RebuildThreshold 
            --        AND ips.page_count < 4000000 THEN ''REBUILD''
            WHEN ips.page_count < 4000000 THEN ''REBUILD''
            ELSE ''REORGANIZE''
        END
    FROM sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
    CROSS APPLY sys.dm_db_index_physical_stats(DB_ID(), t.object_id, i.index_id, NULL, ''SAMPLED'') ips
    CROSS APPLY (
        SELECT SUM(rows) as row_count 
        FROM sys.partitions p 
        WHERE p.object_id = t.object_id AND p.index_id = i.index_id
    ) p
    WHERE 
        t.is_ms_shipped = 0
        AND i.name IS NOT NULL
        AND ips.avg_fragmentation_in_percent >= @ReorganizeThreshold
        AND ips.page_count >= @MinPageCount
        AND ips.index_type_desc IN (''CLUSTERED INDEX'', ''NONCLUSTERED INDEX'');

    -- Возвращаем результат
    SELECT * FROM @IndexInfo ORDER BY PageCount DESC;
    ';

    SET @Params = N'@RebuildThreshold FLOAT, @ReorganizeThreshold FLOAT, @MinPageCount BIGINT';

    BEGIN TRY
        -- Создаем временную таблицу для результатов
        CREATE TABLE #IndexInfo
        (
            SchemaName NVARCHAR(128),
            TableName NVARCHAR(128),
            IndexName NVARCHAR(128),
            IndexType NVARCHAR(60),
            FragmentationPercent FLOAT,
            PageCount BIGINT,
            RowsCount BIGINT,
            ActionType NVARCHAR(20),
            Priority INT
        );

        -- Выполняем динамический SQL в контексте целевой базы
        INSERT INTO #IndexInfo
        EXEC sp_executesql @SQL, @Params, 
            @RebuildThreshold = @RebuildThreshold, 
            @ReorganizeThreshold = @ReorganizeThreshold, 
            @MinPageCount = @MinPageCount;

        -- Объединяем с предпочтительными действиями
        CREATE TABLE #CombinedActions
        (
            SchemaName NVARCHAR(128),
            TableName NVARCHAR(128),
            IndexName NVARCHAR(128),
            IndexType NVARCHAR(60),
            FragmentationPercent FLOAT,
            PageCount BIGINT,
            RowsCount BIGINT,
            ActionType NVARCHAR(20),
            PreferredAction NVARCHAR(20),
            FinalAction NVARCHAR(20),
            ActionSource NVARCHAR(50),
            Reason NVARCHAR(500),
            Priority INT
        );

        INSERT INTO #CombinedActions
        SELECT 
            i.SchemaName,
            i.TableName,
            i.IndexName,
            i.IndexType,
            i.FragmentationPercent,
            i.PageCount,
            i.RowsCount,
            i.ActionType,
            p.PreferredAction,
            -- Определяем итоговое действие
            CASE 
                WHEN @SkipPreferredActions = 1 THEN i.ActionType
                WHEN p.PreferredAction = 'SKIP' THEN NULL  -- Пропускаем индекс
                WHEN p.PreferredAction IS NOT NULL THEN p.PreferredAction
                ELSE i.ActionType
            END as FinalAction,
            -- Источник действия
            CASE 
                WHEN @SkipPreferredActions = 1 THEN 'Алгоритм (принудительно)'
                WHEN p.PreferredAction = 'SKIP' THEN 'Пропуск (предпочтение)'
                WHEN p.PreferredAction IS NOT NULL THEN 'Предпочтение'
                ELSE 'Алгоритм'
            END as ActionSource,
            p.Reason,
            -- Расчет приоритета с учетом предпочтений
            CASE 
                WHEN i.ActionType = 'REBUILD' THEN 
                    CAST((i.FragmentationPercent * 0.7 + LOG10(i.PageCount) * 30) AS INT)
                ELSE 
                    CAST((i.FragmentationPercent * 0.5 + LOG10(i.PageCount) * 20) AS INT)
            END + 
            CASE 
                WHEN i.PageCount > 1000000 THEN 1000
                WHEN i.PageCount > 100000 THEN 500
                WHEN i.PageCount > 10000 THEN 100
                ELSE 0
            END as Priority
        FROM #IndexInfo i
        LEFT JOIN #PreferredActions p 
            ON i.SchemaName = p.SchemaName 
            AND i.TableName = p.TableName 
            AND i.IndexName = p.IndexName;

        -- Рассчитываем оценку времени
        CREATE TABLE #CalculatedEstimates
        (
            SchemaName NVARCHAR(128),
            TableName NVARCHAR(128),
            IndexName NVARCHAR(128),
            IndexType NVARCHAR(60),
            FragmentationPercent FLOAT,
            PageCount BIGINT,
            RowsCount BIGINT,
            ActionType NVARCHAR(20),
            Priority INT,
            EstimatedTimeMinutes INT,
            EstimationMethod NVARCHAR(50),
            ActionSource NVARCHAR(50),
            Reason NVARCHAR(500)
        );

        INSERT INTO #CalculatedEstimates
        SELECT 
            ca.SchemaName,
            ca.TableName,
            ca.IndexName,
            ca.IndexType,
            ca.FragmentationPercent,
            ca.PageCount,
            ca.RowsCount,
            ca.FinalAction as ActionType,
            ca.Priority,
            -- Расчет времени (только для не NULL действий)
            CASE 
                WHEN ca.FinalAction IS NOT NULL THEN
                    CASE 
                        -- Если есть исторические данные, используем среднее с запасом
                        WHEN h.AvgActualTimeMinutes IS NOT NULL AND h.ExecutionCount >= 2 THEN
                            CAST(CEILING(h.AvgActualTimeMinutes * 1.2) AS INT)
                        WHEN h.AvgActualTimeMinutes IS NOT NULL THEN
                            CAST(CEILING(h.AvgActualTimeMinutes * 1.3) AS INT)
                        -- Нет исторических данных - эмпирическая формула
                        ELSE
                            CASE 
                                WHEN ca.FinalAction = 'REBUILD' THEN 
                                    CAST(CEILING(ca.PageCount / 2000000) AS INT) + 1
                                ELSE -- REORGANIZE
                                    CAST(CEILING(ca.PageCount / 200000) AS INT) + 1
                            END                     
                    END
                ELSE 0
            END as EstimatedTimeMinutes,
            CASE 
                WHEN h.AvgActualTimeMinutes IS NOT NULL AND h.ExecutionCount >= 2 THEN
                    'Исторические данные (много)'
                WHEN h.AvgActualTimeMinutes IS NOT NULL THEN
                    'Исторические данные (мало)'
                ELSE 'Эмпирическая оценка'
            END as EstimationMethod,
            ca.ActionSource,
            ca.Reason
        FROM #CombinedActions ca
        LEFT JOIN #HistoricalData h 
            ON ca.SchemaName = h.SchemaName 
            AND ca.TableName = h.TableName 
            AND ca.IndexName = h.IndexName 
            AND ca.FinalAction = h.ActionType
        WHERE ca.FinalAction IS NOT NULL  -- Исключаем пропущенные индексы
        ORDER BY ca.Priority DESC;

        -- Вставляем в основную таблицу
        INSERT INTO dbo.WeeklyIndexMaintenance 
            (DatabaseID, SchemaName, TableName, IndexName, IndexType, FragmentationPercent, 
             PageCount, RowsCount, ActionType, Priority, WeekStartDate, EstimatedTimeMinutes)
        SELECT 
            @DatabaseID, SchemaName, TableName, IndexName, IndexType, FragmentationPercent,
            PageCount, RowsCount, ActionType, Priority, @CurrentWeekStart, EstimatedTimeMinutes
        FROM #CalculatedEstimates
        ORDER BY Priority DESC;

        -- Статистика по действиям
        DECLARE @Stats TABLE
        (
            ActionSource NVARCHAR(50),
            ActionType NVARCHAR(20),
            IndexCount INT,
            TotalEstimatedMinutes INT
        );

        INSERT INTO @Stats (ActionSource, ActionType, IndexCount, TotalEstimatedMinutes)
        SELECT 
            ActionSource,
            ActionType,
            COUNT(*) as IndexCount,
            SUM(EstimatedTimeMinutes) as TotalEstimatedMinutes
        FROM #CalculatedEstimates
        GROUP BY ActionSource, ActionType
        UNION ALL
        SELECT 
            'Пропущено' as ActionSource,
            NULL as ActionType,
            COUNT(*) as IndexCount,
            0 as TotalEstimatedMinutes
        FROM #CombinedActions
        WHERE FinalAction IS NULL;

        -- Статистика по методам оценки
        DECLARE @EstimationStats TABLE
        (
            EstimationMethod NVARCHAR(50),
            IndexCount INT,
            TotalEstimatedMinutes INT
        );

        INSERT INTO @EstimationStats (EstimationMethod, IndexCount, TotalEstimatedMinutes)
        SELECT 
            EstimationMethod,
            COUNT(*) as IndexCount,
            SUM(EstimatedTimeMinutes) as TotalEstimatedMinutes
        FROM #CalculatedEstimates
        GROUP BY EstimationMethod;

        -- Очистка временных таблиц
        DROP TABLE #IndexInfo;
        DROP TABLE #HistoricalData;
        DROP TABLE #PreferredActions;
        DROP TABLE #CombinedActions;
        DROP TABLE #CalculatedEstimates;

        -- Обновляем настройки базы
        UPDATE dbo.DatabaseSettings 
        SET SettingValue = CONVERT(VARCHAR(10), @CurrentWeekStart),
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID AND SettingName = 'CurrentWeekStart';

        UPDATE dbo.DatabaseSettings 
        SET SettingValue = '1',
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID AND SettingName = 'IsWeekInitialized';

        -- Обновляем запись базы
        UPDATE dbo.ManagedDatabases 
        SET LastAnalyzed = GETDATE(),
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID;

        -- Создаем запись статистики
        DECLARE @TotalIndexes INT = @@ROWCOUNT;
        DECLARE @TotalMinutes INT;

        SELECT @TotalMinutes = SUM(EstimatedTimeMinutes)
        FROM dbo.WeeklyIndexMaintenance 
        WHERE DatabaseID = @DatabaseID AND WeekStartDate = @CurrentWeekStart;

        INSERT INTO dbo.MaintenanceStatistics
            (DatabaseID, WeekStartDate, TotalIndexes, ProcessedIndexes, 
             TotalEstimatedMinutes, ActualMinutes, StartDate, Status)
        VALUES
            (@DatabaseID, @CurrentWeekStart, @TotalIndexes, 0, 
             ISNULL(@TotalMinutes, 0), 0, GETDATE(), 'PLANNED');

        PRINT 'Инициализация завершена. Добавлено индексов: ' + CAST(@TotalIndexes AS VARCHAR);
        PRINT 'Общее расчетное время: ' + CAST(ISNULL(@TotalMinutes, 0) AS VARCHAR) + ' минут';
        
        PRINT '=== Распределение по источникам действий ===';
        SELECT 
            ActionSource as [Источник],
            ISNULL(ActionType, 'N/A') as [Действие],
            IndexCount as [Количество],
            TotalEstimatedMinutes as [Время (мин)]
        FROM @Stats
        ORDER BY 
            CASE ActionSource 
                WHEN 'Предпочтение' THEN 1
                WHEN 'Алгоритм' THEN 2
                WHEN 'Пропущено' THEN 3
                WHEN 'Алгоритм (принудительно)' THEN 4
                ELSE 5
            END,
            IndexCount DESC;

        PRINT '=== Распределение по методам оценки ===';
        SELECT 
            EstimationMethod as [Метод оценки],
            IndexCount as [Количество],
            TotalEstimatedMinutes as [Время (мин)]
        FROM @EstimationStats
        ORDER BY IndexCount DESC;

    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        
        -- Очищаем временные таблицы при ошибке
        IF OBJECT_ID('tempdb..#IndexInfo') IS NOT NULL DROP TABLE #IndexInfo;
        IF OBJECT_ID('tempdb..#HistoricalData') IS NOT NULL DROP TABLE #HistoricalData;
        IF OBJECT_ID('tempdb..#PreferredActions') IS NOT NULL DROP TABLE #PreferredActions;
        IF OBJECT_ID('tempdb..#CombinedActions') IS NOT NULL DROP TABLE #CombinedActions;
        IF OBJECT_ID('tempdb..#CalculatedEstimates') IS NOT NULL DROP TABLE #CalculatedEstimates;
        
        RAISERROR('Ошибка при инициализации плана: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[MaintainAllDatabases]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------
-- Шаг7: Процедура обслуживания всех баз
------------------------------------------------------
CREATE PROCEDURE [dbo].[MaintainAllDatabases]
    @DailyTimeLimitMinutes INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseNameCurrent NVARCHAR(128);
    DECLARE @TotalTimeLimit INT = @DailyTimeLimitMinutes;
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @CurrentTime DATETIME;
    DECLARE @TimeSpent INT = 0;

    PRINT 'Начало обслуживания всех баз данных. Общий лимит: ' + 
          CAST(@TotalTimeLimit AS VARCHAR) + ' минут';

    DECLARE db_cursor CURSOR LOCAL FORWARD_ONLY FOR
    SELECT DatabaseName 
    FROM dbo.ManagedDatabases 
    WHERE IsEnabled = 1
    ORDER BY 
        CASE WHEN LastMaintenanceStart IS NULL THEN 0 ELSE 1 END,
        LastMaintenanceStart;

    OPEN db_cursor;
    FETCH NEXT FROM db_cursor INTO @DatabaseNameCurrent;

    WHILE @@FETCH_STATUS = 0 AND @TimeSpent < @TotalTimeLimit
    BEGIN
        SET @CurrentTime = GETDATE();
        DECLARE @TimeLeft INT = @TotalTimeLimit - @TimeSpent;
        
        IF @TimeLeft <= 0
            BREAK;
        
        PRINT '--------------------------------------------------';
        PRINT 'Обслуживание базы: ' + @DatabaseNameCurrent;
        PRINT 'Осталось времени: ' + CAST(@TimeLeft AS VARCHAR) + ' минут';
        PRINT '--------------------------------------------------';
        
        BEGIN TRY
            EXEC dbo.ExecuteDailyMaintenance 
                @DatabaseName = @DatabaseNameCurrent,
                @DailyTimeLimitMinutes = @TimeLeft;
        END TRY
        BEGIN CATCH
            PRINT 'Ошибка при обслуживании базы ' + @DatabaseNameCurrent + ': ' + ERROR_MESSAGE();
        END CATCH
        
        SET @TimeSpent = DATEDIFF(MINUTE, @StartTime, GETDATE());
        
        FETCH NEXT FROM db_cursor INTO @DatabaseNameCurrent;
    END

    CLOSE db_cursor;
    DEALLOCATE db_cursor;

    PRINT '==================================================';
    PRINT 'Обслуживание всех баз завершено';
    PRINT 'Общее время: ' + CAST(@TimeSpent AS VARCHAR) + ' минут';
    PRINT '==================================================';
END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterDatabaseForMaintenance]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------
-- Шаг2: Процедура регистрации рабочей базы
------------------------------------------------------
CREATE PROCEDURE [dbo].[RegisterDatabaseForMaintenance]
    @DatabaseName NVARCHAR(128),
    @IsEnabled BIT = 1
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @DatabaseID INT;

    -- Проверяем существование базы
    IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name = @DatabaseName AND state = 0)
    BEGIN
        RAISERROR('База данных "%s" не существует или недоступна', 16, 1, @DatabaseName);
        RETURN;
    END

    BEGIN TRANSACTION;

    -- Добавляем или обновляем запись
    IF EXISTS(SELECT 1 FROM dbo.ManagedDatabases WHERE DatabaseName = @DatabaseName)
    BEGIN
        UPDATE dbo.ManagedDatabases 
        SET IsEnabled = @IsEnabled,
            ModifiedDate = GETDATE()
        WHERE DatabaseName = @DatabaseName;
        
        SELECT @DatabaseID = DatabaseID 
        FROM dbo.ManagedDatabases 
        WHERE DatabaseName = @DatabaseName;
        
        PRINT 'База данных "' + @DatabaseName + '" обновлена';
    END
    ELSE
    BEGIN
        INSERT INTO dbo.ManagedDatabases (DatabaseName, IsEnabled)
        VALUES (@DatabaseName, @IsEnabled);
        
        SET @DatabaseID = SCOPE_IDENTITY();
        
        PRINT 'База данных "' + @DatabaseName + '" зарегистрирована';
    END

    -- Добавляем настройки по умолчанию
    IF NOT EXISTS(SELECT 1 FROM dbo.DatabaseSettings WHERE DatabaseID = @DatabaseID)
    BEGIN
        INSERT INTO dbo.DatabaseSettings (DatabaseID, SettingName, SettingValue, Description)
        VALUES 
            (@DatabaseID, 'RebuildThreshold', '30', 'Порог фрагментации для перестроения (в %)'),
            (@DatabaseID, 'ReorganizeThreshold', '10', 'Порог фрагментации для реорганизации (в %)'),
            (@DatabaseID, 'MinPageCount', '4000', 'Минимальное количество страниц для обслуживания'),
            (@DatabaseID, 'DailyTimeLimit', '30', 'Дневной лимит времени (в минутах)'),
            (@DatabaseID, 'MaxDOP', '2', 'Максимальная степень параллелизма'),
            (@DatabaseID, 'FillFactor', '90', 'Fill Factor для перестроения'),
            (@DatabaseID, 'UseOnlineRebuild', '0', 'Использовать ONLINE перестроение если доступно (0/1)'),
            (@DatabaseID, 'CurrentWeekStart', NULL, 'Дата начала текущей недели'),
            (@DatabaseID, 'IsWeekInitialized', '0', 'Флаг инициализации недели (0/1)');
    END

    COMMIT TRANSACTION;
    
    SELECT 
        DatabaseID,
        DatabaseName,
        IsEnabled,
        CreatedDate
    FROM dbo.ManagedDatabases 
    WHERE DatabaseID = @DatabaseID;
END;

GO
/****** Object:  StoredProcedure [dbo].[RemovePreferredIndexAction]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Удаление предпочтительного действия
CREATE PROCEDURE [dbo].[RemovePreferredIndexAction]
    @DatabaseName NVARCHAR(128),
    @SchemaName NVARCHAR(128),
    @TableName NVARCHAR(128),
    @IndexName NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseID INT;
    
    SELECT @DatabaseID = DatabaseID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName;

    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не найдена', 16, 1, @DatabaseName);
        RETURN;
    END

    DELETE FROM dbo.PreferredIndexActions 
    WHERE DatabaseID = @DatabaseID 
        AND SchemaName = @SchemaName 
        AND TableName = @TableName 
        AND IndexName = @IndexName;

    PRINT 'Удалено предпочтительное действие для индекса: ' + 
          @SchemaName + '.' + @TableName + '.' + @IndexName;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDatabaseSettings]    Script Date: 17.10.2026 9:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------
-- Шаг5-2: Процедура ежедневного обслуживания
------------------------------------------------------
-- Настройка параметров базы
CREATE PROCEDURE [dbo].[UpdateDatabaseSettings]
    @DatabaseName NVARCHAR(128),
    @SettingName NVARCHAR(100),
    @SettingValue NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseID INT;
    
    SELECT @DatabaseID = DatabaseID
    FROM dbo.ManagedDatabases 
    WHERE DatabaseName = @DatabaseName;
    
    IF @DatabaseID IS NULL
    BEGIN
        RAISERROR('База данных "%s" не найдена', 16, 1, @DatabaseName);
        RETURN;
    END
    
    IF EXISTS(SELECT 1 FROM dbo.DatabaseSettings 
              WHERE DatabaseID = @DatabaseID AND SettingName = @SettingName)
    BEGIN
        UPDATE dbo.DatabaseSettings 
        SET SettingValue = @SettingValue,
            ModifiedDate = GETDATE()
        WHERE DatabaseID = @DatabaseID AND SettingName = @SettingName;
    END
    ELSE
    BEGIN
        INSERT INTO dbo.DatabaseSettings (DatabaseID, SettingName, SettingValue)
        VALUES (@DatabaseID, @SettingName, @SettingValue);
    END
    
    PRINT 'Настройка "' + @SettingName + '" для базы "' + @DatabaseName + 
          '" установлена в "' + @SettingValue + '"';
END;
GO
USE [master]
GO
ALTER DATABASE [ReindexingServiceBase] SET  READ_WRITE 
GO
