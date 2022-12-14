USE [master]
GO
/****** Object:  Database [online_test_db]    Script Date: 11/30/2022 9:36:33 PM ******/
CREATE DATABASE [online_test_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'online_test_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\online_test_db.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'online_test_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\online_test_db_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [online_test_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [online_test_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [online_test_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [online_test_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [online_test_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [online_test_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [online_test_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [online_test_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [online_test_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [online_test_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [online_test_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [online_test_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [online_test_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [online_test_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [online_test_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [online_test_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [online_test_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [online_test_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [online_test_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [online_test_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [online_test_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [online_test_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [online_test_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [online_test_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [online_test_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [online_test_db] SET  MULTI_USER 
GO
ALTER DATABASE [online_test_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [online_test_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [online_test_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [online_test_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [online_test_db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [online_test_db]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[Status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attempt_Questions]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attempt_Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Test_Id] [int] NULL,
	[QuestionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttemptQuestion]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttemptQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [varchar](50) NULL,
	[QuestionId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[IsActive] [tinyint] NULL,
	[CreateOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](200) NULL,
	[Option_A] [varchar](100) NULL,
	[Option_B] [varchar](100) NULL,
	[Option_C] [varchar](100) NULL,
	[Option_D] [varchar](100) NULL,
	[CurrectAnser] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[QuestionType] [tinyint] NULL,
	[Category_Id] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [varchar](50) NULL,
	[TotalQuestion] [int] NULL,
	[AttemptQuestion] [int] NULL,
	[CorrectAns] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [varchar](50) NOT NULL,
	[TestConductedDateTime] [datetime] NULL,
	[UserId] [int] NULL,
	[Total_Question] [int] NULL,
	[IsCompleted] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Last_Qualification] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[IsActive] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

GO
INSERT [dbo].[Admin] ([Id], [Name], [Email], [Password], [CreatedOn], [Status]) VALUES (1, N'Admin', N'admin11@gmail.com', N'12345', CAST(N'2022-11-29 20:52:03.750' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_admin_login]    Script Date: 11/30/2022 9:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_admin_login]
(
@email varchar(100),
@password varchar(250)
)
as
begin

if(EXISTS(SELECT 1 FROM Admin WHERE Email=@email AND Password=@password and Status=1))
		begin
			select 1 as exist
		end
	else
		begin
			select 0 as exist
		end

end
GO
USE [master]
GO
ALTER DATABASE [online_test_db] SET  READ_WRITE 
GO
