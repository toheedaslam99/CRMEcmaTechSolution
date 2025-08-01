USE [master]
GO
/****** Object:  Database [CustomerRelationShipManagement]    Script Date: 7/19/2025 5:49:17 PM ******/
CREATE DATABASE [CustomerRelationShipManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerRelationShipManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BARTENDER\MSSQL\DATA\CustomerRelationShipManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CustomerRelationShipManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BARTENDER\MSSQL\DATA\CustomerRelationShipManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CustomerRelationShipManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerRelationShipManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerRelationShipManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CustomerRelationShipManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CustomerRelationShipManagement]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChartOfAccounts]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[OtherPhone] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[SSN] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SecondaryEmail] [nvarchar](50) NULL,
	[CountryId] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[MailingCountryId] [int] NOT NULL,
	[MailingCity] [nvarchar](max) NULL,
	[MailingAddress] [nvarchar](max) NULL,
	[MailingZipCode] [nvarchar](50) NULL,
	[Medicare] [nvarchar](50) NULL,
	[DOB] [nvarchar](50) NULL,
	[AgentId] [int] NULL,
	[CloserId] [int] NULL,
	[FirstCardNumber] [nvarchar](50) NULL,
	[FirstCardHolder] [nvarchar](50) NULL,
	[FirstCVC] [nvarchar](50) NULL,
	[FirstExpireDate] [nvarchar](50) NULL,
	[FirstATMPIN] [nvarchar](50) NULL,
	[FirstCharge] [nvarchar](50) NULL,
	[FirstAvail] [nvarchar](50) NULL,
	[FirstDescription] [nvarchar](max) NULL,
	[SecondCardNumber] [nvarchar](50) NULL,
	[SecondCardHolder] [nvarchar](50) NULL,
	[SecondCVC] [nvarchar](50) NULL,
	[SecondExpireDate] [nvarchar](50) NULL,
	[SecondATMPIN] [nvarchar](50) NULL,
	[SecondDescription] [nvarchar](max) NULL,
	[SecondCharge] [nvarchar](50) NULL,
	[SecondAvail] [nvarchar](50) NULL,
	[ThirdCardNumber] [nvarchar](50) NULL,
	[ThirdCardHolder] [nvarchar](50) NULL,
	[ThirdCVC] [nvarchar](50) NULL,
	[ThirdExpireDate] [nvarchar](50) NULL,
	[ThirdATMPIN] [nvarchar](50) NULL,
	[ThirdDescription] [nvarchar](max) NULL,
	[ThirdCharge] [nvarchar](50) NULL,
	[ThirdAvail] [nvarchar](50) NULL,
	[FourthCardNumber] [nvarchar](50) NULL,
	[FourthCardHolder] [nvarchar](50) NULL,
	[FourthCVC] [nvarchar](50) NULL,
	[FourthExpireDate] [nvarchar](50) NULL,
	[FourthATMPIN] [nvarchar](50) NULL,
	[FourthDescription] [nvarchar](max) NULL,
	[FourthCharge] [nvarchar](50) NULL,
	[FourthAvail] [nvarchar](50) NULL,
	[FifthCardNumber] [nvarchar](50) NULL,
	[FifthCardHolder] [nvarchar](50) NULL,
	[FifthCVC] [nvarchar](50) NULL,
	[FifthExpireDate] [nvarchar](50) NULL,
	[FifthATMPIN] [nvarchar](50) NULL,
	[FifthDescription] [nvarchar](max) NULL,
	[FifthCharge] [nvarchar](50) NULL,
	[FifthAvail] [nvarchar](50) NULL,
	[FirstAccountNumber] [nvarchar](50) NULL,
	[FirstRoutingNumber] [nvarchar](50) NULL,
	[FirstCheckingNumber] [nvarchar](50) NULL,
	[FirstCheckingAvail] [nvarchar](50) NULL,
	[FirstCheckingCharge] [nvarchar](50) NULL,
	[FirstCheckingDescription] [nvarchar](max) NULL,
	[SecondAccountNumber] [nvarchar](50) NULL,
	[SecondRoutingNumber] [nvarchar](50) NULL,
	[SecondCheckingNumber] [nvarchar](50) NULL,
	[SecondCheckingAvail] [nvarchar](50) NULL,
	[SecondCheckingCharge] [nvarchar](50) NULL,
	[SecondCheckingDescription] [nvarchar](max) NULL,
	[ThirdAccountNumber] [nvarchar](50) NULL,
	[ThirdRoutingNumber] [nvarchar](50) NULL,
	[ThirdCheckingNumber] [nvarchar](50) NULL,
	[ThirdCheckingAvail] [nvarchar](50) NULL,
	[ThirdCheckingCharge] [nvarchar](50) NULL,
	[ThirdCheckingDescription] [nvarchar](max) NULL,
	[FourthAccountNumber] [nvarchar](50) NULL,
	[FourthRoutingNumber] [nvarchar](50) NULL,
	[FourthCheckingNumber] [nvarchar](50) NULL,
	[FourthCheckingAvail] [nvarchar](50) NULL,
	[FourthCheckingCharge] [nvarchar](50) NULL,
	[FourthCheckingDescription] [nvarchar](max) NULL,
	[FifthAccountNumber] [nvarchar](50) NULL,
	[FifthRoutingNumber] [nvarchar](50) NULL,
	[FifthCheckingNumber] [nvarchar](50) NULL,
	[FifthCheckingAvail] [nvarchar](50) NULL,
	[FifthCheckingCharge] [nvarchar](50) NULL,
	[FifthCheckingDescription] [nvarchar](max) NULL,
	[LeadStatus] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[CompanyId] [int] NULL,
	[StateId] [nvarchar](100) NULL,
	[MailingStateId] [nvarchar](100) NULL,
	[FirstBank] [nvarchar](200) NULL,
	[SecondBank] [nvarchar](200) NULL,
	[ThirdBank] [nvarchar](200) NULL,
	[FourthBank] [nvarchar](200) NULL,
	[FifthBank] [nvarchar](200) NULL,
	[FirstCheckingBank] [nvarchar](200) NULL,
	[SecondCheckingBank] [nvarchar](200) NULL,
	[ThirdCheckingBank] [nvarchar](200) NULL,
	[FourthCheckingBank] [nvarchar](200) NULL,
	[FifthCheckingBank] [nvarchar](200) NULL,
	[FirstCard] [nvarchar](20) NULL,
	[SecondCard] [nvarchar](20) NULL,
	[ThirdCard] [nvarchar](20) NULL,
	[FourthCard] [nvarchar](20) NULL,
	[FifthCard] [nvarchar](20) NULL,
	[FirstCardType] [nvarchar](20) NULL,
	[SecondCardType] [nvarchar](20) NULL,
	[ThirdCardType] [nvarchar](20) NULL,
	[FourthCardType] [nvarchar](20) NULL,
	[FifthCardType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leads]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeadOwnerId] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[OtherPhone] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SecondaryEmail] [nvarchar](50) NULL,
	[SSN] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[Bank] [nvarchar](max) NULL,
	[Medicare] [nvarchar](50) NULL,
	[DOB] [nvarchar](50) NULL,
	[LeadStatus] [nvarchar](50) NULL,
	[CountryId] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[StateId] [nvarchar](200) NULL,
 CONSTRAINT [PK_Leads] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuPermissions]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[Settings]    Script Date: 7/19/2025 5:49:18 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 7/19/2025 5:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[DeletedDateTime] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[DeletedBy] [int] NULL,
	[Status] [nvarchar](10) NOT NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/19/2025 5:49:18 PM ******/
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
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (1, N'JPMorgan Chase Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (3, N'Bank of America', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (4, N'Citi bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (5, N'Wells Fargo Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (6, N'U.S. Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (7, N'PNC Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (8, N'Goldman Sachs Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (9, N'Truist Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (10, N'Capital One Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (11, N'TD Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (12, N'BMO USA', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (13, N'Charles Schwab', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (14, N'The Bank of New York Mellon', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (15, N'State Street Corporation', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (16, N'First Citizens BancShares', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (17, N'Citizens Financial Group', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (18, N'Fifth Third Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (19, N'M&T Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (20, N'Huntington Bancshares', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (21, N'Ally Financial (online-only)', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (22, N'HSBC Bank USA', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (23, N'KeyCorp', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (24, N'American Express National Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (25, N'Northern Trust', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (26, N'Discover Financial', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (27, N'Synchrony Financial', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (28, N'UBS', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (29, N'Deutsche Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (30, N'New York Community Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (31, N'Raymond James Financial', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (32, N'Western Alliance', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (33, N'Comerica', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (34, N'Webster Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (35, N'CIBC Bank USA', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
INSERT [dbo].[Bank] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (36, N'East West Bank', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
SET IDENTITY_INSERT [dbo].[Bank] OFF
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
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name], [Logo], [IsDeleted], [Status]) VALUES (1, N'VoxSolutions', NULL, 0, N'Enable')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status]) VALUES (1, N'United State Of America', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Leads] ON 

INSERT [dbo].[Leads] ([Id], [LeadOwnerId], [FirstName], [LastName], [HomePhone], [OtherPhone], [MobileNo], [Email], [SecondaryEmail], [SSN], [BIN], [Bank], [Medicare], [DOB], [LeadStatus], [CountryId], [City], [Address], [ZipCode], [Description], [CompanyId], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [StateId]) VALUES (1, 1, N'Dan ', N'Morries', N'1545286424', N'5645456', N'1238645423', N'121@gmail.com', N'52665@gmail.com', N'545645642454', N'45424', N'JPMorgan Chase Bank', N'Hello', N'16/24/1474', N'Call Back', 1, N'New Jersey', N'Brooklyn', N'45451', N'Card Still In Position', 1, 0, CAST(N'2025-07-17T13:37:27.250' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Alabama')
SET IDENTITY_INSERT [dbo].[Leads] OFF
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
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1036, 1009, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-06T17:23:03.380' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1037, 1009, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-06T17:23:03.417' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1038, 1009, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-06T17:23:03.420' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1039, 1009, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-06T17:23:03.427' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1040, 1009, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-06T17:23:03.460' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1041, 1009, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-06T17:23:03.460' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1042, 1010, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-06T17:23:19.200' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1043, 1010, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-06T17:23:19.200' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1044, 1010, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-06T17:23:19.203' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1045, 1010, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-06T17:23:19.203' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1046, 1010, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-06T17:23:19.207' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1047, 1010, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-06T17:23:19.210' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1048, 1012, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-08T13:13:09.827' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1049, 1012, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-08T13:13:09.847' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1050, 1012, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-08T13:13:09.847' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1051, 1012, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-08T13:13:09.850' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1052, 1012, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-08T13:13:09.850' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1053, 1012, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-08T13:13:09.850' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1054, 1013, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-08T13:28:22.477' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1055, 1013, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-08T13:28:22.503' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1056, 1013, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-08T13:28:22.507' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1057, 1013, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-08T13:28:22.507' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1058, 1013, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-08T13:28:22.507' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1059, 1013, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-08T13:28:22.510' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1066, 1014, N'Both', N'None', N'R', 0, 0, CAST(N'2025-01-10T12:19:50.327' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1067, 1014, N'Both', N'All', N'R', 1, 0, CAST(N'2025-01-10T12:19:50.330' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1068, 1014, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-01-10T12:19:50.330' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1069, 1014, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-01-10T12:19:50.333' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1070, 1014, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-01-10T12:19:50.333' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1071, 1014, N'Both', N'View', N'C', 5, 0, CAST(N'2025-01-10T12:19:50.337' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1072, 1015, N'Both', N'None', N'R', 0, 0, CAST(N'2025-07-16T18:46:01.623' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1073, 1015, N'Both', N'All', N'R', 1, 0, CAST(N'2025-07-16T18:46:01.670' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1074, 1015, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-07-16T18:46:01.680' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1075, 1015, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-07-16T18:46:01.680' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1076, 1015, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-07-16T18:46:01.683' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1077, 1015, N'Both', N'View', N'C', 5, 0, CAST(N'2025-07-16T18:46:01.687' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1078, 1016, N'Both', N'None', N'R', 0, 0, CAST(N'2025-07-18T13:04:25.767' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1079, 1016, N'Both', N'All', N'R', 1, 0, CAST(N'2025-07-18T13:04:25.913' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1080, 1016, N'Both', N'Add', N'C', 2, 0, CAST(N'2025-07-18T13:04:25.923' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1081, 1016, N'Both', N'Edit', N'C', 3, 0, CAST(N'2025-07-18T13:04:25.933' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1082, 1016, N'Both', N'Delete', N'C', 4, 0, CAST(N'2025-07-18T13:04:25.943' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[MenuPermissions] ([ID], [MenuID], [PType], [Name], [Type], [SequenceOrder], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1083, 1016, N'Both', N'View', N'C', 5, 0, CAST(N'2025-07-18T13:04:25.950' AS DateTime), NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MenuPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1, N'Both', NULL, N'Core Module', N'fa fa-cog', N'#', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2025-01-06T17:22:45.033' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (2, N'Both', 1, N'Roles', N'fa fa-users', N'roles', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (3, N'Both', 1, N'Menus', N'fa fa-building', N'menus', 1, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (4, N'Both', NULL, N'Finance', N'fa fa-money', N'#', 1, CAST(N'2025-01-02T18:47:53.860' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (5, N'Both', 4, N'Chart Of Account', NULL, N'chartofaccounts', 1, CAST(N'2025-01-02T18:48:28.073' AS DateTime), CAST(N'2025-01-02T18:52:36.597' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (6, N'Both', 4, N'Account Opening Balance', NULL, N'accountopening', 1, CAST(N'2025-01-03T12:24:47.073' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (7, N'Both', 4, N'Expense Type', NULL, N'expensetype', 2, CAST(N'2025-01-03T12:58:51.663' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (8, N'Both', 4, N'Expenses', NULL, N'expenses', 3, CAST(N'2025-01-03T14:23:57.597' AS DateTime), CAST(N'2025-01-03T14:24:30.253' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1008, N'Both', NULL, N'HR Management', N'fa fa-users', N'#', 2, CAST(N'2025-01-06T17:22:35.870' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1009, N'Both', 1008, N'Department', NULL, N'department', 0, CAST(N'2025-01-06T17:23:03.373' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1010, N'Both', 1008, N'Employee', NULL, N'employee', 1, CAST(N'2025-01-06T17:23:19.193' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1011, N'Both', NULL, N'Inventory', N'fa fa-home', N'#', 3, CAST(N'2025-01-08T13:12:54.097' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1012, N'Both', 1011, N'Unit', NULL, N'unit', 0, CAST(N'2025-01-08T13:13:09.817' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1013, N'Both', 1011, N'Product', NULL, N'product', 1, CAST(N'2025-01-08T13:28:22.323' AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1014, N'Both', 1011, N'Stock Adjustment', NULL, N'stockadjustment', 2, CAST(N'2025-01-10T12:19:13.563' AS DateTime), CAST(N'2025-01-10T12:19:50.280' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1015, N'Both', 1, N'Leads', NULL, N'leads', 0, CAST(N'2025-07-16T18:45:30.333' AS DateTime), CAST(N'2025-07-16T18:46:01.570' AS DateTime), 1, 1, NULL, NULL)
INSERT [dbo].[Menus] ([ID], [Type], [ParentID], [Name], [Icon], [AccessURL], [SequenceOrder], [CreatedDateTime], [UpdatedDateTime], [CreatedBy], [UpdatedBy], [MobileRoute], [MobileLabel]) VALUES (1016, N'Both', 1, N'Customer', NULL, N'customer', 0, CAST(N'2025-07-17T17:17:17.507' AS DateTime), CAST(N'2025-07-18T13:04:25.543' AS DateTime), 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[RolePermissions] ON 

INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1091, 1, 2, N'All', 0, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1092, 1, 1015, N'All', 1, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1093, 1, 1016, N'All', 2, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1094, 1, 3, N'All', 3, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1095, 1, 5, N'All', 4, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1096, 1, 6, N'All', 5, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1097, 1, 7, N'All', 6, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1098, 1, 8, N'All', 7, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1099, 1, 1009, N'All', 8, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1100, 1, 1010, N'All', 9, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1101, 1, 1012, N'All', 10, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1102, 1, 1013, N'All', 11, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1103, 1, 1014, N'All', 12, N'C')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1104, 1, 1, N'All', 0, N'P')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1105, 1, 4, N'All', 1, N'P')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1106, 1, 1008, N'All', 2, N'P')
INSERT [dbo].[RolePermissions] ([ID], [RoleID], [MenuID], [Permissions], [SequenceOrder], [Type]) VALUES (1107, 1, 1011, N'All', 3, N'P')
SET IDENTITY_INSERT [dbo].[RolePermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [IsEditable], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy]) VALUES (1, N'Super Administrator', 0, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2025-07-18T13:04:40.350' AS DateTime), NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([ID], [Name], [Content]) VALUES (1, N'Website URL', N'https://localhost:44322/')
INSERT [dbo].[Settings] ([ID], [Name], [Content]) VALUES (2, N'Website Name', N'ElectriCore')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (2, N'Alabama', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (3, N'Alaska', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (4, N'Arizona', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (5, N'Arkansas', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (6, N'California', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (7, N'Colorado', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (8, N'Connecticut', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (9, N'Delaware', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (10, N'District of Columbia', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (11, N'Florida', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (12, N'Georgia', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (13, N'Hawaii', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (14, N'Idaho', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (15, N'Illinois', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (16, N'Indiana', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (17, N'Iowa', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (18, N'Kansas', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (19, N'Kentucky', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (20, N'Louisiana', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (21, N'Maine', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (22, N'Maryland', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (23, N'Massachusetts', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (24, N'Michigan', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (25, N'Minnesota', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (26, N'Mississippi', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (27, N'Missouri', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (28, N'Montana', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (29, N'Nebraska', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (30, N'Nevada', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (31, N'New Hampshire', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (32, N'New Jersey', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (33, N'New Mexico', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (34, N'New York', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (35, N'North Carolina', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (36, N'North Dakota', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (37, N'Ohio', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (38, N'Oklahoma', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (39, N'Oregon', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (40, N'Pennsylvania', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (41, N'Rhode Island', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (42, N'South Carolina', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (43, N'South Dakota', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (44, N'Tennessee', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (45, N'Texas', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (46, N'Utah', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (47, N'Vermont', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (48, N'Virginia', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (49, N'Washington', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (50, N'West Virginia', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (51, N'Wisconsin', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
INSERT [dbo].[State] ([Id], [Name], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [Status], [CountryId]) VALUES (52, N'Wyoming', 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL, N'Enable', 1)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [RoleID], [Name], [Username], [Password], [EmailAddress], [Status], [ProfileImage], [IsDeleted], [CreatedDateTime], [UpdatedDateTime], [DeletedDateTime], [CreatedBy], [UpdatedBy], [DeletedBy], [CompanyId]) VALUES (1, 1, N'Super Admin', N'SuperAdmin', N'aSpsB5Aza7TJsnYXq+g6JA==', N'admin@gmail.com', N'Enable', NULL, 0, CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2023-05-08T00:00:00.000' AS DateTime), CAST(N'2023-05-08T00:00:00.000' AS DateTime), 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bank] ADD  CONSTRAINT [DF_Bank_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ChartOfAccounts] ADD  CONSTRAINT [DF_ChartOfAccounts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF_RolePermissions_Type]  DEFAULT (N'C') FOR [Type]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsEditable]  DEFAULT ((0)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsDeleted_1]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ChartOfAccounts]  WITH CHECK ADD  CONSTRAINT [FK_ChartOfAccounts_Parent] FOREIGN KEY([ParentID])
REFERENCES [dbo].[ChartOfAccounts] ([ID])
GO
ALTER TABLE [dbo].[ChartOfAccounts] CHECK CONSTRAINT [FK_ChartOfAccounts_Parent]
GO
ALTER TABLE [dbo].[Leads]  WITH CHECK ADD  CONSTRAINT [FK_Leads_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Leads] CHECK CONSTRAINT [FK_Leads_Country]
GO
ALTER TABLE [dbo].[Leads]  WITH CHECK ADD  CONSTRAINT [FK_Leads_Users] FOREIGN KEY([LeadOwnerId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Leads] CHECK CONSTRAINT [FK_Leads_Users]
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
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [CustomerRelationShipManagement] SET  READ_WRITE 
GO
