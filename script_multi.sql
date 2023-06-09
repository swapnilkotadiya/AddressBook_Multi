USE [master]
GO
/****** Object:  Database [AddressBook_Multi_MD]    Script Date: 19-03-2023 14:55:44 ******/
CREATE DATABASE [AddressBook_Multi_MD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AddressBook_Multi_MD', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\AddressBook_Multi_MD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AddressBook_Multi_MD_log', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\AddressBook_Multi_MD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AddressBook_Multi_MD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AddressBook_Multi_MD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ARITHABORT OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET  MULTI_USER 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AddressBook_Multi_MD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AddressBook_Multi_MD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AddressBook_Multi_MD', N'ON'
GO
ALTER DATABASE [AddressBook_Multi_MD] SET QUERY_STORE = OFF
GO
USE [AddressBook_Multi_MD]
GO
/****** Object:  Table [dbo].[CON_Contact]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CON_Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[Profession] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[ContactCategoryID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_CON_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CON_ContactCategory]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CON_ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactCategoryName] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_CON_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_City]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[CityCode] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_Country]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_LOC_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_State]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[StateCode] [nvarchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_LOC_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEC_User]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEC_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nchar](50) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_SEC_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CON_Contact] ON 

INSERT [dbo].[CON_Contact] ([ContactID], [PhotoPath], [Name], [Email], [Address], [MobileNo], [CountryID], [StateID], [CityID], [Profession], [CompanyName], [Designation], [ContactCategoryID], [CreationDate], [ModifiedDate], [UserID]) VALUES (5, N'/Upload/swapnil.jpg', N'Swapnil', N'swapnilkotad@gmail.com', N'207,Sunflower Appartment', N'5637329239', 3, 5, 1, N'Student', N'Tech-Valley', N'Studying', 1, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CON_Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[CON_ContactCategory] ON 

INSERT [dbo].[CON_ContactCategory] ([ContactCategoryID], [ContactCategoryName], [CreationDate], [ModifiedDate], [UserID]) VALUES (1, N'Brother', CAST(N'2023-02-17T00:00:00.000' AS DateTime), CAST(N'2023-02-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[CON_ContactCategory] ([ContactCategoryID], [ContactCategoryName], [CreationDate], [ModifiedDate], [UserID]) VALUES (2, N'Friend', CAST(N'2023-03-19T00:00:00.000' AS DateTime), CAST(N'2023-03-19T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CON_ContactCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_City] ON 

INSERT [dbo].[LOC_City] ([CityID], [CountryID], [StateID], [CityName], [CityCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (1, 3, 5, N'Los Angeles', N'LA', CAST(N'2023-02-17T00:00:00.000' AS DateTime), CAST(N'2023-02-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[LOC_City] ([CityID], [CountryID], [StateID], [CityName], [CityCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (2, 1, 1, N'Ahemdabad', N'AHM', CAST(N'2023-03-19T00:00:00.000' AS DateTime), CAST(N'2023-03-19T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LOC_City] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_Country] ON 

INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (1, N'India', N'IN', CAST(N'2023-02-17T16:54:55.613' AS DateTime), CAST(N'2023-02-17T16:54:55.613' AS DateTime), 1)
INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (2, N'Canada', N'CA', CAST(N'2023-02-17T16:55:06.657' AS DateTime), CAST(N'2023-02-17T16:55:06.657' AS DateTime), 1)
INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (3, N'America', N'US', CAST(N'2023-02-17T16:55:14.633' AS DateTime), CAST(N'2023-02-17T16:55:14.633' AS DateTime), 1)
INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (4, N'Spain', N'SP', CAST(N'2023-02-17T16:55:24.337' AS DateTime), CAST(N'2023-02-17T16:55:24.337' AS DateTime), 2)
INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (5, N'United Kingdom', N'UK', CAST(N'2023-02-17T16:55:44.190' AS DateTime), CAST(N'2023-02-17T16:55:44.190' AS DateTime), 2)
INSERT [dbo].[LOC_Country] ([CountryID], [CountryName], [CountryCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (15, N'Sweden', N'SE', CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LOC_Country] OFF
GO
SET IDENTITY_INSERT [dbo].[LOC_State] ON 

INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (1, 1, N'Gujarat', N'GJ', CAST(N'2023-02-17T16:56:56.030' AS DateTime), CAST(N'2023-02-17T16:56:56.030' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (2, 1, N'Maharastra', N'MH', CAST(N'2023-02-17T16:57:05.617' AS DateTime), CAST(N'2023-02-17T16:57:05.617' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (3, 1, N'Himachal Pradesh', N'HP', CAST(N'2023-02-17T16:57:29.467' AS DateTime), CAST(N'2023-02-17T16:57:29.467' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (4, 2, N'Ontario', N'ON', CAST(N'2023-02-17T16:57:44.023' AS DateTime), CAST(N'2023-02-17T16:57:44.023' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (5, 3, N'California', N'CA', CAST(N'2023-02-17T16:58:01.033' AS DateTime), CAST(N'2023-02-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (6, 3, N'Newyork', N'NY', CAST(N'2023-02-17T16:58:42.823' AS DateTime), CAST(N'2023-02-17T16:58:42.823' AS DateTime), 1)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (7, 4, N'Barcelona', N'BA', CAST(N'2023-02-17T16:59:23.117' AS DateTime), CAST(N'2023-02-17T16:59:23.117' AS DateTime), 2)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (8, 5, N'Wales', N'WA', CAST(N'2023-02-17T17:00:02.750' AS DateTime), CAST(N'2023-02-17T17:00:02.750' AS DateTime), 2)
INSERT [dbo].[LOC_State] ([StateID], [CountryID], [StateName], [StateCode], [CreationDate], [ModifiedDate], [UserID]) VALUES (11, 1, N'Delhi', N'DL', CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-03-10T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LOC_State] OFF
GO
SET IDENTITY_INSERT [dbo].[SEC_User] ON 

INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [PhotoPath], [Created], [Modified]) VALUES (1, N'Admin', N'Admin', N'Mitesh', N'Rabadiya', N'admin@gmail.com                                   ', N'yash.jpeg', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[SEC_User] ([UserID], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [PhotoPath], [Created], [Modified]) VALUES (2, N'Mr', N'Mr', N'', N'', N'                                                  ', N'', CAST(N'2023-03-06T00:12:05.230' AS DateTime), CAST(N'2023-03-06T00:12:05.230' AS DateTime))
SET IDENTITY_INSERT [dbo].[SEC_User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Master] ON 

INSERT [dbo].[User_Master] ([UserID], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [PhotoPath], [CreationDate], [ModifiedDate]) VALUES (1, N'Admin', N'admin', NULL, NULL, NULL, NULL, CAST(N'2023-02-21T16:10:53.970' AS DateTime), CAST(N'2023-02-21T16:10:53.970' AS DateTime))
INSERT [dbo].[User_Master] ([UserID], [UserName], [Password], [FirstName], [LastName], [EmailAddress], [PhotoPath], [CreationDate], [ModifiedDate]) VALUES (2, N'User', N'User', NULL, NULL, NULL, NULL, CAST(N'2023-03-08T11:51:38.280' AS DateTime), CAST(N'2023-03-08T11:51:38.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[User_Master] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LOC_City]    Script Date: 19-03-2023 14:55:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LOC_City] ON [dbo].[LOC_City]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LOC_Country]    Script Date: 19-03-2023 14:55:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LOC_Country] ON [dbo].[LOC_Country]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LOC_State]    Script Date: 19-03-2023 14:55:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LOC_State] ON [dbo].[LOC_State]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CON_Contact] ADD  CONSTRAINT [DF_CON_Contact_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CON_Contact] ADD  CONSTRAINT [DF_CON_Contact_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CON_ContactCategory] ADD  CONSTRAINT [DF_CON_ContactCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CON_ContactCategory] ADD  CONSTRAINT [DF_CON_ContactCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[LOC_Country] ADD  CONSTRAINT [DF_LOC_Country_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LOC_Country] ADD  CONSTRAINT [DF_LOC_Country_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[LOC_State] ADD  CONSTRAINT [DF_LOC_State_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LOC_State] ADD  CONSTRAINT [DF_LOC_State_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Master_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_CON_ContactCategory] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[CON_ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_CON_ContactCategory]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_LOC_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[LOC_City] ([CityID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_LOC_City]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_LOC_Country]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_LOC_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_LOC_State]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_SEC_User]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_CON_Contact_User_Master] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Master] ([UserID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_CON_Contact_User_Master]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[LOC_City] ([CityID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_Contact_City]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_Contact_Country]
GO
ALTER TABLE [dbo].[CON_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[CON_Contact] CHECK CONSTRAINT [FK_Contact_State]
GO
ALTER TABLE [dbo].[CON_ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_CON_ContactCategory_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[CON_ContactCategory] CHECK CONSTRAINT [FK_CON_ContactCategory_SEC_User]
GO
ALTER TABLE [dbo].[CON_ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_CON_ContactCategory_User_Master] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Master] ([UserID])
GO
ALTER TABLE [dbo].[CON_ContactCategory] CHECK CONSTRAINT [FK_CON_ContactCategory_User_Master]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_Country]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[LOC_State] ([StateID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_State]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_SEC_User]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_User_Master] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Master] ([UserID])
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_User_Master]
GO
ALTER TABLE [dbo].[LOC_Country]  WITH CHECK ADD  CONSTRAINT [FK_LOC_Country_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_Country] CHECK CONSTRAINT [FK_LOC_Country_SEC_User]
GO
ALTER TABLE [dbo].[LOC_Country]  WITH CHECK ADD  CONSTRAINT [FK_LOC_Country_User_Master] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Master] ([UserID])
GO
ALTER TABLE [dbo].[LOC_Country] CHECK CONSTRAINT [FK_LOC_Country_User_Master]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_LOC_Country1] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_LOC_Country1]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_SEC_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_SEC_User]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_User_Master] FOREIGN KEY([UserID])
REFERENCES [dbo].[User_Master] ([UserID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_User_Master]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_State_Country]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_Contact_DeleteByPK]
	@ContactID int 
AS
Delete 
from [dbo].[CON_Contact]
Where [dbo].[CON_Contact].[ContactID] = @ContactID
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_Contact_Insert]

@PhotoPath as nvarchar(500),
@Name as nvarchar(50),
@Email as nvarchar(50),
@Address as nvarchar(50),
@MobileNo as nvarchar(50),
@CountryID as int,
@StateID as int,
@CityID as int,
@Profession as nvarchar(50),
@CompanyName as nvarchar(50),
@Designation as nvarchar(50),
@ContactCategoryID as nvarchar(50),
@CreationDate as datetime,
@ModifiedDate as datetime,
@UserID as int

AS

Insert Into [dbo].[CON_Contact]
(
	
	PhotoPath,
	Name,
	Email,
	Address,
	MobileNo,
	CountryID,
	StateID,
	CityID,
	Profession,
	CompanyName,
	Designation,
	ContactCategoryID,
	CreationDate,
	ModifiedDate,
	UserID
)

Values
(
	@PhotoPath,
	@Name,
	@Email,
	@Address,
	@MobileNo,
	@CountryID,
	@StateID,
	@CityID,
	@Profession,
	@CompanyName,
	@Designation,
	@ContactCategoryID,
	@CreationDate,
	@ModifiedDate,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_CON_Contact_SelectAll]
	@UserID int
AS

Select
[dbo].[CON_Contact].[ContactID],
[dbo].[CON_Contact].[PhotoPath],
[dbo].[CON_Contact].[Name],
[dbo].[CON_Contact].[Email],
[dbo].[CON_Contact].[Address],
[dbo].[CON_Contact].[MobileNo],
[dbo].[LOC_Country].[CountryName],
[dbo].[LOC_State].[StateName],
[dbo].[LOC_City].[CityName],
[dbo].[CON_Contact].[Profession],
[dbo].[CON_Contact].[CompanyName],
[dbo].[CON_Contact].[Designation],
[dbo].[CON_Contact].[ContactCategoryID],
[dbo].[CON_Contact].[CreationDate],
[dbo].[CON_Contact].[ModifiedDate],
[dbo].[User_Master].[UserName]

from [dbo].[CON_Contact]
Inner Join [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID]=[CON_Contact].[CountryID]

Inner Join [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID]=[CON_Contact].[StateID]

Inner Join [dbo].[LOC_City]
ON [dbo].[LOC_City].[CityID]=[CON_Contact].[CityID]

Inner Join [dbo].[User_Master]
ON [dbo].[User_Master].[UserID]=[CON_Contact].[UserID]

Where [dbo].[CON_Contact].[UserID]=@UserID

Order by [dbo].[CON_Contact].[Name]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_CON_Contact_SelectByPK]
	@ContactID int
	
AS

Select
[dbo].[CON_Contact].[ContactID],
[dbo].[CON_Contact].[PhotoPath],
[dbo].[CON_Contact].[Name],
[dbo].[CON_Contact].[Email],
[dbo].[CON_Contact].[Address],
[dbo].[CON_Contact].[MobileNo],
[dbo].[CON_Contact].[CountryID],
[dbo].[CON_Contact].[StateID],
[dbo].[CON_Contact].[CityID],
[dbo].[CON_Contact].[Profession],
[dbo].[CON_Contact].[CompanyName],
[dbo].[CON_Contact].[Designation],
[dbo].[CON_Contact].[ContactCategoryID],
[dbo].[CON_Contact].[CreationDate],
[dbo].[CON_Contact].[ModifiedDate],
[dbo].[CON_Contact].[UserID]

from [dbo].[CON_Contact]
where [dbo].[CON_Contact].[ContactID] = @ContactID 

Order by [dbo].[CON_Contact].[Name]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_SelectPage]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CON_Contact_SelectPage]
		@CountryName		nvarchar(50)
		,@StateName			nvarchar(50)
		,@CityName			nvarchar(50)
		,@Name				nvarchar(50)
		,@ContactCategory	nvarchar(50)
		,@Email				nvarchar(50)
		,@Mobile			nvarchar(50)
		,@UserID			int
AS
SELECT 
		[dbo].[CON_Contact].[ContactID]
		,[dbo].[CON_Contact].[Name]
		,[dbo].[CON_Contact].[MobileNo]
		,[dbo].[CON_Contact].[Address]
		,[dbo].[CON_Contact].[Email]      
,[dbo].[CON_Contact].[CompanyName]
,[dbo].[CON_Contact].[Designation]
        ,[dbo].[CON_Contact].[Profession]
		,[dbo].[LOC_Country].[CountryName]
		,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]
		,[dbo].[CON_ContactCategory].[ContactCategoryName]
		,[dbo].[CON_Contact].[CreationDate]
		,[dbo].[CON_Contact].[ModifiedDate]
		,[dbo].[CON_Contact].[PhotoPath]
		,[dbo].[CON_Contact].[UserID]
FROM
		[dbo].[CON_Contact]
INNER JOIN 
		[dbo].[LOC_Country]
ON	
		[dbo].[CON_Contact].[CountryID] = [dbo].[LOC_Country].[CountryID]
INNER JOIN		
		[dbo].[LOC_State]
ON 
		[dbo].[CON_Contact].[StateID] = [dbo].[LOC_State].[StateID]
INNER JOIN
		[dbo].[LOC_City]
ON	
		[dbo].[CON_Contact].[CityID] = [dbo].[LOC_City].[CityID]
INNER JOIN
		[dbo].[CON_ContactCategory]
ON 
		[dbo].[CON_Contact].[ContactCategoryID] = [dbo].[CON_ContactCategory].[ContactCategoryID]
WHERE
		[dbo].[CON_Contact].[UserID] = @UserID
AND		( @CountryName is null or [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND		( @StateName is null or [dbo].[LOC_State].[StateName] like '%'+@StateName+'%')
AND		( @CityName is null or [dbo].[LOC_City].[CityName] like '%'+@CityName+'%')
AND		( @Name is null or [dbo].[CON_Contact].[Name] like '%'+@Name+'%')
AND		( @ContactCategory is null or [dbo].[CON_ContactCategory].[ContactCategoryName] like '%'+@ContactCategory+'%')
AND		( @Email is null or [dbo].[CON_Contact].[Email] like '%'+@Email+'%')
AND		( @Mobile is null or [dbo].[CON_Contact].[MobileNo] like '%'+@Mobile+'%')
ORDER BY
		[dbo].[LOC_Country].[CountryName]
		,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]
		,[dbo].[CON_Contact].[Name]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_SelectPhotoPathByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CON_Contact_SelectPhotoPathByPK]
			@ContactID			int
			,@UserID			int
AS
SELECT 
			[dbo].[CON_Contact].[ContactID]
			,[dbo].[CON_Contact].[PhotoPath]
FROM	
			[dbo].[CON_Contact]
WHERE
			[dbo].[CON_Contact].[ContactID] = @ContactID
	AND		[dbo].[CON_Contact].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_Contact_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_Contact_UpdateByPK] 
	@ContactID int,
	@PhotoPath nvarchar(500),
	@Name nvarchar(50),
	@Email nvarchar(50),
	@Address nvarchar(50),
	@MobileNo nvarchar(50),
	@CountryID int,
	@StateID int,
	@CityID int,
	@Profession nvarchar(50),
	@CompanyName nvarchar(50),
	@Designation nvarchar(50),
	@ContactCategoryID int,
	@ModifiedDate datetime,
	@UserID int
	
AS

Update [dbo].[CON_Contact]
Set [dbo].[CON_Contact].[PhotoPath]=@PhotoPath,
	[dbo].[CON_Contact].[Name] = @Name,
	[dbo].[CON_Contact].[Email] = @Email,
	[dbo].[CON_Contact].[Address] = @Address,
	[dbo].[CON_Contact].[MobileNo] = @MobileNo,
	[dbo].[CON_Contact].[CountryID] = @CountryID,
	[dbo].[CON_Contact].[StateID] = @StateID,
	[dbo].[CON_Contact].[CityID] = @CityID,
	[dbo].[CON_Contact].[Profession] = @Profession,
	[dbo].[CON_Contact].[CompanyName] = @CompanyName,
	[dbo].[CON_Contact].[Designation] = @Designation,
	[dbo].[CON_Contact].[ContactCategoryID] = @ContactCategoryID,
	[dbo].[CON_Contact].[ModifiedDate]= @ModifiedDate,
	[dbo].[CON_Contact].[UserID]=@UserID
	
Where [dbo].[CON_Contact].[ContactID]=@ContactID And 
		
		[dbo].[CON_Contact].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_ContactCategory_DeleteByPK]
	@ContactCategoryID int 
AS
Delete 
from [dbo].[CON_ContactCategory]
Where [dbo].[CON_ContactCategory].[ContactCategoryID] = @ContactCategoryID
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_Dropdown]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CON_ContactCategory_Dropdown]

AS
SELECT [dbo].[CON_ContactCategory].[ContactCategoryID],
		[dbo].[CON_ContactCategory].[ContactCategoryName]
From [dbo].[CON_ContactCategory]
Order By [dbo].[CON_ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_ContactCategory_Insert]


@ContactCategoryName as nvarchar(50),
@CreationDate as datetime,
@ModifiedDate as datetime,
@UserID as int

AS

Insert Into [dbo].[CON_ContactCategory]
(
	
	
	ContactCategoryName,
	CreationDate,
	ModifiedDate,
	UserID
)

Values
(
	
	
	@ContactCategoryName,
	@CreationDate,
	@ModifiedDate,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_CON_ContactCategory_SelectAll]
	@UserID as int
AS

Select
[dbo].[CON_ContactCategory].[ContactCategoryID],
[dbo].[CON_ContactCategory].[ContactCategoryName],
[dbo].[CON_ContactCategory].[CreationDate],
[dbo].[CON_ContactCategory].[ModifiedDate],
[dbo].[CON_ContactCategory].[UserID]
from [dbo].[CON_ContactCategory]
where [dbo].[CON_ContactCategory].[UserID]=@UserID

Order by [dbo].[CON_ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_CON_ContactCategory_SelectByPK]
	@ContactCategoryID int
	
AS

Select
[dbo].[CON_ContactCategory].[ContactCategoryID],
[dbo].[CON_ContactCategory].[ContactCategoryName],
[dbo].[CON_ContactCategory].[CreationDate],
[dbo].[CON_ContactCategory].[ModifiedDate],
[dbo].[CON_ContactCategory].[UserID]

from [dbo].[CON_ContactCategory]
where [dbo].[CON_ContactCategory].[ContactCategoryID] = @ContactCategoryID 
		
Order by [dbo].[CON_ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_SelectPage]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_CON_ContactCategory_SelectPage]
		@ContactCategory		nvarchar(50)
		,@UserID				int
AS
SELECT 
		[dbo].[CON_ContactCategory].[ContactCategoryID]
		,[dbo].[CON_ContactCategory].[ContactCategoryName]
		,[dbo].[CON_ContactCategory].[CreationDate]
		,[dbo].[CON_ContactCategory].[ModifiedDate]
		,[dbo].[CON_ContactCategory].[UserID]
FROM
		[dbo].[CON_ContactCategory]
WHERE
		[dbo].[CON_ContactCategory].[UserID] = @UserID
AND		
		(@ContactCategory is null 
	OR	[dbo].[CON_ContactCategory].[ContactCategoryName] like '%'+@ContactCategory+'%')
ORDER BY
		[dbo].[CON_ContactCategory].[ContactCategoryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CON_ContactCategory_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_CON_ContactCategory_UpdateByPK]
	@ContactCategoryID int,
	@ContactCategoryName nvarchar(50),	
	@ModifiedDate datetime,
	@UserID int
AS

Update [dbo].[CON_ContactCategory]
Set [dbo].[CON_ContactCategory].[ContactCategoryName] = @ContactCategoryName,	
	[dbo].[CON_ContactCategory].[ModifiedDate]= @ModifiedDate,
	[dbo].[CON_ContactCategory].[UserID]= @UserID
Where [dbo].[CON_ContactCategory].[ContactCategoryID]=@ContactCategoryID AND
		[dbo].[CON_ContactCategory].[UserID]= @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_DeleteByPK]
	@CityID int 
AS
Delete 
from [dbo].[LOC_City]
Where [dbo].[LOC_City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_DropdownByStateID]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_DropdownByStateID]
@StateID int
AS
SELECT [dbo].[LOC_City].[CityID],
	[dbo].[LOC_City].[CityName]
	FROM [dbo].[LOC_City]
	WHERE CAST([dbo].[LOC_City].[StateID] as Int) = CAST(@StateID as Int)
	ORDER BY [dbo].[LOC_City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_Insert]

@CountryID as int,
@StateID  as int,
@CityName as nvarchar(50),
@CityCode as nvarchar(50),
@CreationDate as datetime,
@ModifiedDate as datetime,
@UserID as int

AS

Insert Into [dbo].[LOC_City]
(
	
	CountryID,
	StateID,
	CityName,
	CityCode,
	CreationDate,
	ModifiedDate,
	UserID
)

Values
(
	
	@CountryID,
	@StateID,
	@CityName,
	@CityCode,
	@CreationDate,
	@ModifiedDate,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_City_SelectAll]
	@UserID int
AS

Select
[dbo].LOC_City.[CityID],
[dbo].LOC_Country.[CountryName],
[dbo].LOC_State.[StateName],
[dbo].LOC_City.[CityName],
[dbo].LOC_City.[CityCode],
[dbo].LOC_City.[CreationDate],
[dbo].LOC_City.[ModifiedDate],
[dbo].[User_Master].[UserName]

from [dbo].LOC_City
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_City].[CountryID]

INNER Join [dbo].[LOC_State]
ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

INNER JOIN [dbo].[User_Master]
ON [dbo].[User_Master].[UserID] = [dbo].[LOC_City].[UserID]
WHERE [dbo].[LOC_City].[UserID]=@UserID

Order by [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_City_SelectByPK]
	@CityID int

AS

Select
[dbo].LOC_City.[CityID],
[dbo].LOC_City.[CountryID],
[dbo].[LOC_City].[StateID],
[dbo].LOC_City.[CityName],
[dbo].LOC_City.[CityCode],
[dbo].LOC_City.[CreationDate],
[dbo].LOC_City.[ModifiedDate],
[dbo].LOC_City.[UserID]

from [dbo].LOC_City
where [dbo].LOC_City.[CityID] = @CityID 

Order by [dbo].LOC_City.[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectComboBox]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[PR_LOC_City_SelectComboBox]

CREATE PROCEDURE [dbo].[PR_LOC_City_SelectComboBox]
		@UserID			int
AS
SELECT 
		[dbo].[LOC_City].[CityID]
		,[dbo].[LOC_City].[CityName]
FROM
		[dbo].[LOC_City]
WHERE
		[dbo].[LOC_City].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectComboBoxByStateID]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[PR_LOC_City_SelectComboBoxByStateID] @StateID=1

CREATE PROCEDURE [dbo].[PR_LOC_City_SelectComboBoxByStateID]
			@StateID			int
			,@UserID			int
AS
SELECT 
			[dbo].[LOC_City].[CityID]
			,[dbo].[LOC_City].[CityName]
FROM
			[dbo].[LOC_City]
WHERE	
			[dbo].[LOC_City].[StateID] = @StateID
	AND		[dbo].[LOC_City].[UserID] = @UserID
ORDER BY	
			[dbo].[LOC_City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectPage]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_City_SelectPage]
		@CountryName		nvarchar(50)
		,@StateName			nvarchar(50)
		,@CityName			nvarchar(50)
		,@UserID			int
AS
SELECT 
		[dbo].[LOC_City].[CityID]
		,[dbo].[LOC_Country].[CountryName]
		,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]
        ,[dbo].[LOC_City].[CityCode]
		,[dbo].[LOC_City].[CreationDate]
		,[dbo].[LOC_City].[ModifiedDate]
		,[dbo].[LOC_City].[UserID]
FROM
		[dbo].[LOC_City]
INNER JOIN 
		[dbo].[LOC_Country]
ON	
		[dbo].[LOC_City].[CountryID] = [dbo].[LOC_Country].[CountryID]
INNER JOIN		
		[dbo].[LOC_State]
ON 
		[dbo].[LOC_City].[StateID] = [dbo].[LOC_State].[StateID]
WHERE
		[dbo].[LOC_City].[UserID] = @UserID
AND		( @CountryName is null or [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND		( @StateName is null or [dbo].[LOC_State].[StateName] like '%'+@StateName+'%')
AND		( @CityName is null or [dbo].[LOC_City].[CityName] like '%'+@CityName+'%')
ORDER BY
		[dbo].[LOC_Country].[CountryName]
		,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_City].[CityName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_City_UpdateByPK]
	@CityID int,
	@CountryID int,
	@StateID int,
	@CityName nvarchar(50),
	@CityCode nvarchar(50),
	@ModifiedDate datetime,
	@UserID int
AS

Update [dbo].[LOC_City]
Set [dbo].[LOC_City].[CountryID] = @CountryID,
	[dbo].[LOC_City].[StateID] = @StateID,
	[dbo].[LOC_City].[CityName] = @CityName,
	[dbo].[LOC_City].[CityCode] = @CityCode,
	[dbo].[LOC_City].[ModifiedDate]= @ModifiedDate,
	[dbo].LOC_City.[UserID]=@UserID
Where [dbo].[LOC_City].[CityID]=@CityID AND
[dbo].LOC_City.[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_DeleteByPK]
	@CountryID int 
AS

Delete 
from [dbo].[LOC_Country]
Where [dbo].[LOC_Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Dropdown]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_Country_Dropdown]

AS
SELECT [dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName]
From [dbo].[LOC_Country]
Order By [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_LOC_Country_Insert]

@CountryName as nvarchar(50),
@CountryCode as nvarchar(50),
@CreationDate as datetime,
@ModifiedDate as datetime,
@UserID as int

AS

Insert Into [dbo].[LOC_Country]
(
	
	CountryName,
	CountryCode,
	CreationDate,
	ModifiedDate,
	UserID
)

Values
(
	
	@CountryName,
	
	@CountryCode,
	@CreationDate, 
	@ModifiedDate,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_Country_SelectAll]
	@UserID int
AS

Select
[dbo].[LOC_Country].[CountryID],
[dbo].[LOC_Country].[CountryName],
[dbo].[LOC_Country].[CountryCode],
[dbo].[LOC_Country].[CreationDate],
[dbo].[LOC_Country].[ModifiedDate],
[dbo].[User_Master].[UserName]

from [dbo].[LOC_Country]
INNER JOIN [dbo].[User_Master]
ON		   [dbo].[User_Master].[UserId]=[LOC_Country].[UserID]


Where [dbo].[LOC_Country].[UserID]=@UserID

Order by [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_Country_SelectByPK]
	@CountryID int
	
AS

Select
[dbo].[LOC_Country].[CountryID],
[dbo].[LOC_Country].[CountryName],
[dbo].[LOC_Country].[CountryCode],
[dbo].[LOC_Country].[CreationDate],
[dbo].[LOC_Country].[ModifiedDate],
[dbo].[LOC_Country].[UserID]

from [dbo].[LOC_Country]
where [dbo].[LOC_Country].[CountryID] = @CountryID 

Order by [dbo].[Loc_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectComboBox]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[PR_LOC_Country_SelectComboBox]

CREATE PROCEDURE [dbo].[PR_LOC_Country_SelectComboBox]
		@UserID		int
AS
SELECT 
		[dbo].[LOC_Country].[CountryID]
		,[dbo].[LOC_Country].[CountryName]
FROM
		[dbo].[LOC_Country]
WHERE
		[dbo].[LOC_Country].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_SelectPage]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_LOC_Country_SelectPage]
		@CountryName	nvarchar(50)
		,@CountryCode	nvarchar(50)
		,@UserID		int
AS
SELECT 
		[dbo].[LOC_Country].[CountryID]
		,[dbo].[LOC_Country].[CountryName]
		,[dbo].[LOC_Country].[CountryCode]
		,[dbo].[LOC_Country].[CreationDate]
		,[dbo].[LOC_Country].[ModifiedDate]
		,[dbo].[LOC_Country].[UserID]
FROM
		[dbo].[LOC_Country]
WHERE
		[dbo].[LOC_Country].[UserID] = @UserID
AND		( @CountryName is null or [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND		( @CountryCode is null or [dbo].[LOC_Country].[CountryCode] like '%'+@CountryCode+'%')
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_Country_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_Country_UpdateByPK]
	@CountryID int,
	@CountryName nvarchar(50),
	@CountryCode nvarchar(50),
	@ModifiedDate datetime,
	@UserID int
AS

Update [dbo].[LOC_Country]
Set [dbo].[LOC_Country].[CountryName] = @CountryName,
	[dbo].[LOC_Country].[CountryCode] = @CountryCode,
	[dbo].[LOC_Country].[ModifiedDate]= @ModifiedDate,
	[dbo].[LOC_Country].[UserID]=@UserID
Where [dbo].[LOC_Country].[CountryID]=@CountryID AND
[dbo].[LOC_Country].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_DeleteByPK]
	@StateID int 
AS
Delete 
from [dbo].[LOC_State]
Where [dbo].[LOC_State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_DropdownByCountryID]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_DropdownByCountryID]
@CountryID int
AS
SELECT [dbo].[LOC_State].[StateID],
	[dbo].[LOC_State].[StateName]
	FROM [dbo].[LOC_State]
	WHERE CAST([dbo].[LOC_State].[CountryID] as Int) = CAST(@CountryID as Int)
	ORDER BY [dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[PR_LOC_State_Insert]

@CountryID as int,
@StateName as nvarchar(50),
@StateCode as nvarchar(50),
@CreationDate as datetime,
@ModifiedDate as datetime,
@UserID as int

AS

Insert Into [dbo].[LOC_State]
(
	
	CountryID,
	StateName,
	StateCode,
	CreationDate,
	ModifiedDate,
	UserID
)

Values
(
	
	@CountryID,
	@StateName,
	@StateCode,
	@CreationDate,
	@ModifiedDate,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_State_SelectAll]
	@UserID as int
AS

Select
[dbo].[LOC_State].[StateID],
[dbo].[LOC_Country].[CountryName],
[dbo].[LOC_State].[StateName],
[dbo].[LOC_State].[StateCode],
[dbo].[LOC_State].[CreationDate],
[dbo].[LOC_State].[ModifiedDate],
[dbo].[User_Master].[UserName]

from [dbo].[LOC_State]
INNER JOIN [dbo].[LOC_Country]
ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

INNER JOIN [dbo].[User_Master]
ON [dbo].[User_Master].[UserID] = [dbo].[LOC_State].[UserID]

Where  [dbo].[LOC_State].[UserID]=@UserID
Order by [dbo].[LOC_Country].[CountryName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_LOC_State_SelectByPK]
	@StateID int
	
AS

Select
[dbo].[LOC_State].[StateID],
[dbo].[LOC_State].[CountryID],
[dbo].[LOC_State].[StateName],
[dbo].[LOC_State].[StateCode],
[dbo].[LOC_State].[CreationDate],
[dbo].[LOC_State].[ModifiedDate],
[dbo].[LOC_State].[UserID]

from [dbo].[LOC_State]
where [dbo].[LOC_State].[StateID] = @StateID 

Order by [dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectComboBox]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[PR_LOC_State_SelectComboBox]

CREATE PROCEDURE [dbo].[PR_LOC_State_SelectComboBox]
		@UserID		int
AS
SELECT 
		[dbo].[LOC_State].[StateID]
		,[dbo].[LOC_State].[StateName]
FROM
		[dbo].[LOC_State]
WHERE
		[dbo].[LOC_State].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectComboBoxByCountryID]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [dbo].[PR_LOC_State_SelectComboBoxByCountryID] @CountryID=1

CREATE PROCEDURE [dbo].[PR_LOC_State_SelectComboBoxByCountryID]
		@CountryID			int
		,@UserID			int
AS
SELECT 
		[dbo].[LOC_State].[StateID]
		,[dbo].[LOC_State].[StateName]
FROM
		[dbo].[LOC_State]
WHERE	
		[dbo].[LOC_State].[CountryID] = @CountryID
AND		[dbo].[LOC_State].[UserID]	  = @UserID
ORDER BY	
		[dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_SelectPage]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_LOC_State_SelectPage]
		@CountryName		nvarchar(50)
		,@StateName			nvarchar(50)
		,@UserID			int
AS
SELECT 
		[dbo].[LOC_State].[StateID]
		,[dbo].[LOC_Country].[CountryName]
        ,[dbo].[LOC_State].[StateCode]
		,[dbo].[LOC_State].[StateName]
		,[dbo].[LOC_State].[CreationDate]
		,[dbo].[LOC_State].[ModifiedDate]
		,[dbo].[LOC_State].[UserID]
FROM
		[dbo].[LOC_State]
INNER JOIN 
		[dbo].[LOC_Country]
ON	
		[dbo].[LOC_State].[CountryID] = [dbo].[LOC_Country].[CountryID]
WHERE
		[dbo].[LOC_State].[UserID] = @UserID
AND		( @CountryName is null or [dbo].[LOC_Country].[CountryName] like '%'+@CountryName+'%')
AND		( @StateName is null or [dbo].[LOC_State].[StateName] like '%'+@StateName+'%')
ORDER BY
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_State_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[PR_LOC_State_UpdateByPK]
	@StateID int,
	@CountryID int,
	@StateName nvarchar(50),
	@StateCode nvarchar(50),
	@ModifiedDate datetime,
	@UserID int
AS

Update [dbo].[LOC_State]
Set [dbo].[LOC_State].[StateName] = @StateName,
	[dbo].[LOC_State].[CountryID]=@CountryID,
	[dbo].[LOC_State].[StateCode] = @StateCode,
	[dbo].[LOC_State].[ModifiedDate]= @ModifiedDate,
	[dbo].[LOC_State].[UserID]=@UserID
Where [dbo].[LOC_State].[StateID]=@StateID AND
[dbo].[LOC_State].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Insert]
		@UserName		nvarchar(50)
		,@Password		nvarchar(50)
		,@FirstName		nvarchar(50)
		,@LastName		nvarchar(50)
		,@EmailAddress  nvarchar(50)
		,@PhotoPath		nvarchar(max)
		,@Created		datetime
		,@Modified		datetime
AS
INSERT INTO [dbo].[SEC_User]
(
	[dbo].[SEC_User].[UserName]
	,[dbo].[SEC_User].[Password]
	,[dbo].[SEC_User].[FirstName]
	,[dbo].[SEC_User].[LastName]
	,[dbo].[SEC_User].[EmailAddress]
	,[dbo].[SEC_User].[PhotoPath]
	,[dbo].[SEC_User].[Created]
	,[dbo].[SEC_User].[Modified]
)
VALUES
(
	@UserName
	,@Password
	,ISNULL('', @FirstName)
	,ISNULL('', @LastName)
	,ISNULL('', @EmailAddress)
	,ISNULL('', @PhotoPath)
	,ISNULL(GETDATE(), @Created)
	,ISNULL(GETDATE(), @Modified)
)
GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_SelectAll]
AS
SELECT 
	[dbo].[SEC_User].[UserID]
	,[dbo].[SEC_User].[UserName]
	,[dbo].[SEC_User].[Password]
	,[dbo].[SEC_User].[FirstName]
	,[dbo].[SEC_User].[LastName]
	,[dbo].[SEC_User].[EmailAddress]
	,[dbo].[SEC_User].[PhotoPath]
	,[dbo].[SEC_User].[Created]
	,[dbo].[SEC_User].[Modified]
 FROM 
	[dbo].[SEC_User]
GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectByUserNamePassword]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_SelectByUserNamePassword]
	@UserName nvarchar(50)
	,@Password nvarchar(50)
AS 
SELECT
		[dbo].[SEC_User].[UserID]
		,[dbo].[SEC_User].[UserName]
		,[dbo].[SEC_User].[Password]
		,[dbo].[SEC_User].[FirstName]
		,[dbo].[SEC_User].[LastName]
		,[dbo].[SEC_User].[EmailAddress]
		,[dbo].[SEC_User].[PhotoPath]
		,[dbo].[SEC_User].[Created]
		,[dbo].[SEC_User].[Modified]
FROM	
		[dbo].[SEC_User]
WHERE	
		[dbo].[SEC_User].[UserName] = @UserName
AND		[dbo].[SEC_User].[Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_SelectPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_SelectPK]

	@UserID		int
AS 

SELECT
		[dbo].[SEC_User].[UserID]
		,[dbo].[SEC_User].[UserName]
		,[dbo].[SEC_User].[Password]
		,[dbo].[SEC_User].[FirstName]
		,[dbo].[SEC_User].[LastName]
		,[dbo].[SEC_User].[EmailAddress]
		,[dbo].[SEC_User].[PhotoPath]
		,[dbo].[SEC_User].[Created]
		,[dbo].[SEC_User].[Modified]
FROM	
		[dbo].[SEC_User]
WHERE	
		[dbo].[SEC_User].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_SEC_User_Update]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_SEC_User_Update]

	@UserID				int
	,@UserName			nvarchar(50)
	,@Password			nvarchar(50)
	,@FirstName			nvarchar(50)
	,@LastName			nvarchar(50)
	,@EmailAddress		nvarchar(50)
	,@PhotoPath			nvarchar(500)
	,@Modified			datetime

AS 

UPDATE [dbo].[SEC_User]

SET	
		[UserName] = @UserName
		,[Password] = @Password
		,[FirstName] = @FirstName
		,[LastName] = @LastName
		,[EmailAddress] = @EmailAddress
		,[PhotoPath] = @PhotoPath
		,[Modified] = ISNULL(@Modified,Getdate())

WHERE	[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_DeleteByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[PR_User_Master_DeleteByPK]
	@UserID int 
AS
Delete 
from [dbo].[User_Master]
Where [dbo].[User_Master].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_Insert]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_User_Master_Insert]

@UserName			nvarchar(50)
			,@Password			nvarchar(50)
			,@FirstName			nvarchar(50)
			,@LastName			nvarchar(50)
			,@EmailAddress		nvarchar(50)
			,@PhotoPath			nvarchar(500)
			,@CreationDate			datetime
			,@ModifiedDate		datetime
As

Insert Into [dbo].[User_Master]
(
	UserName,
	Password,
	FirstName,
	LastName,
	EmailAddress,
	PhotoPath,
	CreationDate,
	ModifiedDate

)
values
(
	
	@UserName,			
	@Password,		
	@FirstName,			
	@LastName,
	@EmailAddress,		
	@PhotoPath,					
	@CreationDate,
	@ModifiedDate

)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_SelectAll]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_User_Master_SelectAll]
As	
SELECT 
	 [dbo].[User_master].[UserID]
	, [dbo].[User_master].[UserName]
	, [dbo].[User_master].[Password]
	, [dbo].[User_master].[FirstName]
	, [dbo].[User_master].[LastName]
	, [dbo].[User_master].[EmailAddress]
	, [dbo].[User_master].[PhotoPath]
	, [dbo].[User_master].[CreationDate]
	, [dbo].[User_master].[ModifiedDate]
 FROM [dbo].[User_master]
Order by [dbo].[User_Master].[UserName]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_SelectByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_User_Master_SelectByPK]
 @UserID int
As
SELECT

		[dbo].[User_master].[UserID]
		,[dbo].[User_master].[UserName]
		,[dbo].[User_master].[Password]
		,[dbo].[User_master].[FirstName]
		,[dbo].[User_master].[LastName]
		,[dbo].[User_master].[EmailAddress]
		,[dbo].[User_master].[PhotoPath]
		,[dbo].[User_master].[CreationDate]
		,[dbo].[User_master].[ModifiedDate]
FROM	[dbo].[User_master]
Where [dbo].[User_master].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_SelectByUserNamePassword]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Master_SelectByUserNamePassword]

			@UserName			nvarchar(50),
			@Password			nvarchar(50)
AS 

SELECT

		[dbo].[User_Master].[UserID]
		,[dbo].[User_Master].[UserName]
		,[dbo].[User_Master].[Password]
		,[dbo].[User_Master].[FirstName]
		,[dbo].[User_Master].[LastName]
		,[dbo].[User_Master].[EmailAddress]
		,[dbo].[User_Master].[PhotoPath]
		,[dbo].[User_Master].[CreationDate]
		,[dbo].[User_Master].[ModifiedDate]
FROM	[dbo].[User_Master]
WHERE	[dbo].[User_Master].[UserName] = @UserName
AND		[dbo].[User_Master].[Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Master_UpdateByPK]    Script Date: 19-03-2023 14:55:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_User_Master_UpdateByPK]
	@UserID int,
	@UserName nvarchar(50),
	@Password nvarchar(50),
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@EmailAddress nvarchar(50),
	@PhotoPath nvarchar(500),
	@ModifiedDate datetime
As

Update [dbo].[User_Master]
Set [dbo].[User_Master].[Username]=@UserName,
    [dbo].[User_Master].[Password]=@Password,
	[dbo].[User_Master].[FirstName]=@FirstName,
	[dbo].[User_Master].[LastName]=@LastName,
	[dbo].[User_Master].[EmailAddress]=@EmailAddress,
	[dbo].[User_Master].[PhotoPath]=@PhotoPath,
	[dbo].[User_Master].[ModifiedDate]=@ModifiedDate

Where [dbo].[User_Master].[UserID]=@UserID
GO
USE [master]
GO
ALTER DATABASE [AddressBook_Multi_MD] SET  READ_WRITE 
GO
