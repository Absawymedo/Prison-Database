USE [master]
GO
/****** Object:  Database [PrisonDatabase]    Script Date: 01-May-23 1:25:09 AM ******/
CREATE DATABASE [PrisonDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrisionDatabase_Data', FILENAME = N'D:\School\MSQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PrisionDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PrisionDatabase_Log', FILENAME = N'D:\School\MSQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\PrisionDatabase.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PrisonDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrisonDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrisonDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrisonDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrisonDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrisonDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrisonDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrisonDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrisonDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrisonDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrisonDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrisonDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrisonDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrisonDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrisonDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrisonDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrisonDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrisonDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrisonDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrisonDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrisonDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrisonDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrisonDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrisonDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrisonDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [PrisonDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [PrisonDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrisonDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrisonDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrisonDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PrisonDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PrisonDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PrisonDatabase', N'ON'
GO
ALTER DATABASE [PrisonDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [PrisonDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PrisonDatabase]
GO
/****** Object:  Table [dbo].[Cell]    Script Date: 01-May-23 1:25:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cell](
	[CID] [int] IDENTITY(10000,1) NOT NULL,
	[CellStatus] [varchar](50) NULL,
	[MaxCap] [int] NULL,
	[CBname] [varchar](50) NULL,
 CONSTRAINT [PK__cells__C1F8DC5975C8AD2C] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CellBlock]    Script Date: 01-May-23 1:25:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CellBlock](
	[CBname] [varchar](50) NOT NULL,
	[CBType] [varchar](50) NULL,
	[NoCams] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CBname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guards]    Script Date: 01-May-23 1:25:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guards](
	[GFirst] [varchar](50) NULL,
	[GLast] [varchar](50) NULL,
	[GID] [int] IDENTITY(100,1) NOT NULL,
	[GType] [varchar](50) NULL,
	[Clearance] [int] NULL,
	[Warden] [bit] NULL,
 CONSTRAINT [PK__guards__C51F0F3EFD34B3BE] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inmates]    Script Date: 01-May-23 1:25:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmates](
	[PFirst] [varchar](50) NULL,
	[PLast] [varchar](50) NULL,
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [char](1) NULL,
	[PSentence] [varchar](50) NULL,
	[PGang] [varchar](50) NULL,
	[PConduct] [varchar](50) NULL,
	[Parole] [varchar](3) NULL,
	[CID] [int] NULL,
 CONSTRAINT [PK__inmates__C577552090000B57] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 01-May-23 1:25:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[Day] [varchar](50) NOT NULL,
	[Time_] [varchar](50) NOT NULL,
	[GID] [int] NOT NULL,
	[CBname] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Day] ASC,
	[Time_] ASC,
	[GID] ASC,
	[CBname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cell]  WITH CHECK ADD  CONSTRAINT [FK__cells__CBname__3C69FB99] FOREIGN KEY([CBname])
REFERENCES [dbo].[CellBlock] ([CBname])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cell] CHECK CONSTRAINT [FK__cells__CBname__3C69FB99]
GO
ALTER TABLE [dbo].[Inmates]  WITH CHECK ADD  CONSTRAINT [FK__inmates__CID__3F466844] FOREIGN KEY([CID])
REFERENCES [dbo].[Cell] ([CID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Inmates] CHECK CONSTRAINT [FK__inmates__CID__3F466844]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK__shifts__CBname__412EB0B6] FOREIGN KEY([CBname])
REFERENCES [dbo].[CellBlock] ([CBname])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK__shifts__CBname__412EB0B6]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK__shifts__GID__44FF419A] FOREIGN KEY([GID])
REFERENCES [dbo].[Guards] ([GID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK__shifts__GID__44FF419A]
GO
USE [master]
GO
ALTER DATABASE [PrisonDatabase] SET  READ_WRITE 
GO
