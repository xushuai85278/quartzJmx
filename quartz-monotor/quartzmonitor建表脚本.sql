USE [quartzmonitor]
GO

/****** Object:  Table [dbo].[t_scheduler]    Script Date: 02/14/2014 15:00:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[t_scheduler](
	[schedulerId] [varchar](128) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[host] [varchar](128) NOT NULL,
	[port] [int] NOT NULL,
	[userName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[schedulerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'schedulerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'host'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˿�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'port'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'userName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_scheduler', @level2type=N'COLUMN',@level2name=N'password'
GO


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [quartzmonitor]
GO

/****** Object:  Table [dbo].[t_job]    Script Date: 02/14/2014 15:01:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[t_job](
	[jobId] [varchar](128) NOT NULL,
	[schedulerId] [varchar](128) NOT NULL,
	[jobName] [varchar](32) NOT NULL,
	[group] [varchar](32) NOT NULL,
	[jobClass] [varchar](256) NOT NULL,
	[jobDataMap] [nvarchar](1024) NULL,
	[description] [nvarchar](50) NULL,
	[durability] [int] NOT NULL,
	[shouldRecover] [int] NOT NULL,
	[triggerCount] [int] NOT NULL,
 CONSTRAINT [PK__t_job__164AA1A80BC6C43E] PRIMARY KEY CLUSTERED 
(
	[jobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'jobId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'schedulerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'jobName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'group'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'jobClass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'jobDataMap'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɳ־���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'durability'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɻָ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'shouldRecover'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������Ĵ�������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_job', @level2type=N'COLUMN',@level2name=N'triggerCount'
GO

ALTER TABLE [dbo].[t_job]  WITH CHECK ADD  CONSTRAINT [FK__t_job__schedulerId] FOREIGN KEY([schedulerId])
REFERENCES [dbo].[t_scheduler] ([schedulerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[t_job] CHECK CONSTRAINT [FK__t_job__schedulerId]
GO

ALTER TABLE [dbo].[t_job] ADD  DEFAULT ((0)) FOR [durability]
GO

ALTER TABLE [dbo].[t_job] ADD  DEFAULT ((0)) FOR [shouldRecover]
GO

ALTER TABLE [dbo].[t_job] ADD  DEFAULT ((0)) FOR [triggerCount]
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [quartzmonitor]
GO

/****** Object:  Table [dbo].[t_trigger]    Script Date: 02/14/2014 15:01:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[t_trigger](
	[triggerId] [varchar](128) NOT NULL,
	[jobId] [varchar](128) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [nvarchar](50) NULL,
	[group] [varchar](50) NOT NULL,
	[cronexpr] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[triggerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'triggerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Job��ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'jobId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'group'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cron���ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_trigger', @level2type=N'COLUMN',@level2name=N'cronexpr'
GO

ALTER TABLE [dbo].[t_trigger]  WITH CHECK ADD  CONSTRAINT [FK__t_trigge__jobId] FOREIGN KEY([jobId])
REFERENCES [dbo].[t_job] ([jobId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[t_trigger] CHECK CONSTRAINT [FK__t_trigge__jobId]
GO