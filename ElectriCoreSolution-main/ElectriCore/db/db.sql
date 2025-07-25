USE [ElectriCore]
GO
/****** Object:  Table [dbo].[AccountOpeningBalance]    Script Date: 1/4/2025 1:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountOpeningBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AccountNo] [decimal](18, 0) NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[OpeningBalance] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Type] [nvarchar](20) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountOpeningBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChartOfAccounts]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChartOfAccounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Code] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_ChartOfAccounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeId] [int] NULL,
	[AccountOpeningId] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseType]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ChartOfAccountId] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Balance] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ExpenseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuPermissions]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuPermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[PType] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](5) NOT NULL,
	[SequenceOrder] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_MenuPermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Icon] [nvarchar](255) NULL,
	[AccessURL] [nvarchar](255) NOT NULL,
	[SequenceOrder] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[MobileRoute] [nvarchar](255) NULL,
	[MobileLabel] [nvarchar](255) NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[Permissions] [nvarchar](500) NOT NULL,
	[SequenceOrder] [int] NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsEditable] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/4/2025 1:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](500) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[ProfileImage] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountOpeningBalance] ON 

INSERT [dbo].[AccountOpeningBalance] ([Id], [Name], [AccountNo], [ChartOfAccountId], [OpeningBalance], [Description], [Image], [Type], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [IsDeleted], [Status]) VALUES (1, N'Office Petty Cash Zia Ledger 2025 January', NULL, 7, CAST(10325.00 AS Decimal(18, 2)), N'This Account Use For Daily Expenses', NULL, N'Debit', CAST(N'2025-01-03T12:28:53.190' AS DateTime), CAST(N'2025-01-03T12:43:25.233' AS DateTime), 1, 1, 0, N'Enable')
INSERT [dbo].[AccountOpeningBalance] ([Id], [Name], [AccountNo], [ChartOfAccountId], [OpeningBalance], [Description], [Image], [Type], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [IsDeleted], [Status]) VALUES (2, N'Project', NULL, 8, CAST(1000.00 AS Decimal(18, 2)), NULL, NULL, N'Credit', CAST(N'2025-01-03T12:43:41.263' AS DateTime), NULL, 1, NULL, 0, N'Enable')
SET IDENTITY_INSERT [dbo].[AccountOpeningBalance] OFF
GO
SET IDENTITY_INSERT [dbo].[ChartOfAccounts] ON 

INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1, NULL, N'AS000001', N'Assets', NULL, N'Enable', 0, CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (2, NULL, N'LI000001', N'Liabilities', NULL, N'Enable', 0, CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (3, NULL, N'EX000001', N'Expenses', NULL, N'Enable', 0, CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (4, NULL, N'RE000001', N'Revenue', NULL, N'Enable', 0, CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (5, NULL, N'EQ000001', N'Equity', NULL, N'Enable', 0, CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), CAST(N'2023-05-14T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (6, 1, N'AS0000011', N'Current Asset', NULL, N'Enable', 0, CAST(N'2025-01-02T18:53:11.170' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (7, 3, N'EX0000011', N'Indirect Expense', NULL, N'Enable', 0, CAST(N'2025-01-03T12:27:53.360' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[ChartOfAccounts] ([ID], [ParentID], [Code], [Name], [Description], [Status], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (8, 3, N'IN0000011', N'Direct Expense', NULL, N'Enable', 0, CAST(N'2025-01-03T12:28:05.173' AS DateTime), NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChartOfAccounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([Id], [ExpenseTypeId], [AccountOpeningId], [Date], [Description], [Amount], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [IsDeleted], [Status], [ParentId]) VALUES (1, 1, 1, CAST(N'2025-01-01T12:59:38.533' AS DateTime), N'January', NULL, CAST(N'2025-01-03T12:59:38.533' AS DateTime), NULL, 1, NULL, 0, N'Enable', NULL)
SET IDENTITY_INSERT [dbo].[Expenses] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpenseType] ON 

INSERT [dbo].[ExpenseType] ([Id], [Name], [ChartOfAccountId], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [IsDeleted], [Status], [Balance]) VALUES (1, N'Daily Office Expenses', 7, CAST(N'2025-01-03T12:59:38.533' AS DateTime), NULL, 1, NULL, 0, N'Enable', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ExpenseType] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuPermissions] ON 

INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1, 2, N'Both', N'None', N'R', 0, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (2, 2, N'Both', N'All', N'R', 1, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (3, 2, N'Both', N'Add', N'C', 2, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (4, 2, N'Both', N'Edit', N'C', 3, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (5, 2, N'Both', N'Delete', N'C', 4, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (6, 2, N'Both', N'View', N'C', 5, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (7, 3, N'Both', N'None', N'R', 0, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (8, 3, N'Both', N'All', N'R', 1, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (9, 3, N'Both', N'Add', N'C', 2, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (10, 3, N'Both', N'Edit', N'C', 3, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (11, 3, N'Both', N'Delete', N'C', 4, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (12, 3, N'Both', N'View', N'C', 5, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (13, 7, N'Both', N'None', N'R', 0, 0, CAST(N'2023-05-10T23:50:33.190' AS DateTime), NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (18, 5, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-02T18:52:36.610' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (19, 5, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-02T18:52:36.653' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (20, 5, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-02T18:52:36.677' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (21, 5, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-02T18:52:36.693' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (22, 5, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-02T18:52:36.717' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (23, 5, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-02T18:52:36.720' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (24, 6, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-03T12:24:47.327' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (25, 6, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-03T12:24:47.357' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (26, 6, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-03T12:24:47.360' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (27, 6, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-03T12:24:47.360' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (28, 6, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-03T12:24:47.363' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (29, 6, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-03T12:24:47.363' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (30, 7, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-03T12:58:51.837' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (31, 7, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-03T12:58:51.863' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (32, 7, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-03T12:58:51.867' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (33, 7, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-03T12:58:51.870' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (34, 7, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-03T12:58:51.870' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (35, 7, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-03T12:58:51.873' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (42, 8, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-03T14:24:30.270' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (43, 8, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-03T14:24:30.273' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (44, 8, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-03T14:24:30.273' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (45, 8, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-03T14:24:30.273' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (46, 8, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-03T14:24:30.277' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (47, 8, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-03T14:24:30.277' AS DateTime), NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MenuPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1, N'Both', NULL, N'Core Module', N'fa fa-users', N'#', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (2, N'Both', 1, N'Roles', N'fa fa-users', N'roles', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (3, N'Both', 1, N'Menus', N'fa fa-building', N'menus', 1, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (4, N'Both', NULL, N'Finance', N'fa fa-money', N'#', 1, CAST(N'2025-01-02T18:47:53.860' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (5, N'Both', 4, N'Chart Of Account', NULL, N'chartofaccounts', 1, CAST(N'2025-01-02T18:48:28.073' AS DateTime), CAST(N'2025-01-02T18:52:36.597' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (6, N'Both', 4, N'Account Opening Balance', NULL, N'accountopening', 1, CAST(N'2025-01-03T12:24:47.073' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (7, N'Both', 4, N'Expense Type', NULL, N'expensetype', 2, CAST(N'2025-01-03T12:58:51.663' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (8, N'Both', 4, N'Expenses', NULL, N'expenses', 3, CAST(N'2025-01-03T14:23:57.597' AS DateTime), CAST(N'2025-01-03T14:24:30.253' AS DateTime), 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (22, 1, 2, N'All', 0, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (23, 1, 3, N'All', 1, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (24, 1, 5, N'All', 2, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (25, 1, 6, N'All', 3, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (26, 1, 7, N'All', 4, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (27, 1, 8, N'All', 5, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (28, 1, 1, N'All', 0, N'P')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (29, 1, 4, N'All', 1, N'P')
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [IsEditable], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1, N'Super Administrator', 0, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2025-01-03T14:24:09.480' AS DateTime), NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([ID], [Name], [Content]) VALUES (1, N'Website URL', N'https://localhost:44322/')
INSERT [dbo].[Settings] ([ID], [Name], [Content]) VALUES (2, N'Website Name', N'ElectriCore')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [Name], [Username], [Password], [EmailAddress], [Status], [ProfileImage], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1, 1, N'Super Admin', N'SuperAdmin', N'aSpsB5Aza7TJsnYXq+g6JA==', N'admin@gmail.com', N'Enable', NULL, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2023-05-08T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ChartOfAccounts] ADD  CONSTRAINT [DF_ChartOfAccounts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF_RolePermissions_Type]  DEFAULT (N'C') FOR [Type]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsEditable]  DEFAULT ((0)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsDeleted_1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [FK_AccountOpeningBalance_ChartOfAccounts] FOREIGN KEY([ChartOfAccountId])
REFERENCES [dbo].[ChartOfAccounts] ([ID])
GO
ALTER TABLE [dbo].[AccountOpeningBalance] CHECK CONSTRAINT [FK_AccountOpeningBalance_ChartOfAccounts]
GO
ALTER TABLE [dbo].[ChartOfAccounts]  WITH CHECK ADD  CONSTRAINT [FK_ChartOfAccounts_Parent] FOREIGN KEY([ParentID])
REFERENCES [dbo].[ChartOfAccounts] ([ID])
GO
ALTER TABLE [dbo].[ChartOfAccounts] CHECK CONSTRAINT [FK_ChartOfAccounts_Parent]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_AccountOpeningBalance] FOREIGN KEY([AccountOpeningId])
REFERENCES [dbo].[AccountOpeningBalance] ([Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_AccountOpeningBalance]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_ExpenseType] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseType] ([Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_ExpenseType]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Expenses] ([Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Parent]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Menus] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Menus]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Menus] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menus] ([ID])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Menus]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [ElectriCore] SET  READ_WRITE 
GO
