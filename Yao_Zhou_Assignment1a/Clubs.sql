USE [master]
GO
/****** Object:  Database [Clubs]    Script Date: 2020-08-28 11:06:45 AM ******/
IF DB_ID (N'Clubs') IS NOT NULL  
DROP DATABASE Clubs;  
GO  
CREATE DATABASE [Clubs]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clubs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clubs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clubs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clubs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clubs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clubs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clubs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clubs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clubs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clubs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clubs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clubs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clubs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clubs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clubs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clubs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clubs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clubs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clubs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clubs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clubs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clubs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clubs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clubs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clubs] SET  MULTI_USER 
GO
ALTER DATABASE [Clubs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clubs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clubs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clubs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clubs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clubs] SET QUERY_STORE = OFF
GO
USE [Clubs]
GO
/****** Object:  Table [dbo].[artist]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artist](
	[artistId] [int] NOT NULL,
	[minimumHourlyRate] [float] NOT NULL,
	[nameAddressid] [int] NOT NULL,
 CONSTRAINT [PK_artist] PRIMARY KEY CLUSTERED 
(
	[artistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artistInstrument]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artistInstrument](
	[artistInstrumentId] [int] IDENTITY(1,1) NOT NULL,
	[artistId] [int] NOT NULL,
	[instrumentId] [int] NOT NULL,
 CONSTRAINT [PK_artistInstrument] PRIMARY KEY CLUSTERED 
(
	[artistInstrumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artistStyle]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artistStyle](
	[artistId] [int] NOT NULL,
	[styleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_artistStyle] PRIMARY KEY CLUSTERED 
(
	[artistId] ASC,
	[styleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[club]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club](
	[clubId] [int] NOT NULL,
 CONSTRAINT [PK_club] PRIMARY KEY CLUSTERED 
(
	[clubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clubStyle]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubStyle](
	[clubId] [int] NOT NULL,
	[styleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_clubStyle] PRIMARY KEY CLUSTERED 
(
	[clubId] ASC,
	[styleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract](
	[contract] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[artistId] [int] NOT NULL,
	[clubId] [int] NOT NULL,
	[pricePerPerformance] [float] NOT NULL,
	[numberPerformances] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
 CONSTRAINT [PK_contract] PRIMARY KEY CLUSTERED 
(
	[contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[postalPattern] [varchar](255) NULL,
	[phonePattern] [varchar](50) NULL,
	[federalSalesTax] [float] NOT NULL,
	[provinceTerminology] [varchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupMember]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupMember](
	[artistIdGroup] [int] NOT NULL,
	[artistIdMember] [int] NOT NULL,
	[dateJoined] [datetime] NULL,
	[dateLeft] [datetime] NULL,
 CONSTRAINT [PK_groupMember_1] PRIMARY KEY CLUSTERED 
(
	[artistIdGroup] ASC,
	[artistIdMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instrument]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instrument](
	[instrumentId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_instrument] PRIMARY KEY CLUSTERED 
(
	[instrumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nameAddress]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nameAddress](
	[nameAddressId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[companyName] [varchar](50) NULL,
	[streetAddress] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[postalCode] [varchar](50) NULL,
	[provinceCode] [char](2) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_nameAddress] PRIMARY KEY CLUSTERED 
(
	[nameAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[countryCode] [char](2) NOT NULL,
	[salesTaxCode] [varchar](50) NULL,
	[salesTax] [float] NOT NULL,
	[includesFederalTax] [bit] NOT NULL,
	[firstPostalLetter] [varchar](50) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[style]    Script Date: 2020-08-28 11:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[style](
	[styleName] [varchar](50) NOT NULL,
	[description] [varchar](255) NULL,
 CONSTRAINT [PK_style] PRIMARY KEY CLUSTERED 
(
	[styleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (1, 0, 1)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (2, 0, 2)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (3, 0, 3)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (4, 0, 4)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (5, 0, 5)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (6, 0, 6)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (7, 0, 7)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (8, 0, 8)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (9, 0, 9)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (10, 0, 10)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (11, 0, 11)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (12, 0, 12)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (13, 0, 13)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (14, 0, 14)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (15, 15, 15)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (16, 0, 16)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (17, 0, 17)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (18, 0, 18)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (19, 0, 19)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (20, 0, 20)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (21, 0, 21)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (22, 0, 22)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (23, 0, 23)
INSERT [dbo].[artist] ([artistId], [minimumHourlyRate], [nameAddressid]) VALUES (24, 0, 24)
SET IDENTITY_INSERT [dbo].[artistInstrument] ON 

INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (1, 1, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (2, 1, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (3, 1, 17)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (4, 1, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (5, 2, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (6, 2, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (7, 3, 4)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (8, 3, 7)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (9, 3, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (10, 3, 23)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (11, 3, 27)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (12, 4, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (13, 4, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (14, 4, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (15, 4, 27)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (16, 5, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (17, 5, 2)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (18, 5, 4)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (19, 5, 7)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (20, 5, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (21, 5, 20)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (22, 5, 27)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (23, 5, 2)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (24, 5, 3)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (25, 5, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (26, 8, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (27, 8, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (28, 8, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (29, 9, 14)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (30, 9, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (31, 11, 1)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (32, 11, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (33, 12, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (34, 13, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (35, 13, 24)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (36, 14, 8)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (37, 14, 3)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (38, 14, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (39, 14, 20)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (40, 16, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (41, 16, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (42, 16, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (43, 17, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (44, 17, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (45, 17, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (46, 18, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (47, 18, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (48, 18, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (49, 20, 1)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (50, 20, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (51, 20, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (52, 22, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (53, 22, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (54, 22, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (55, 23, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (56, 23, 15)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (57, 23, 1)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (58, 23, 22)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (59, 24, 4)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (60, 24, 7)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (61, 24, 11)
INSERT [dbo].[artistInstrument] ([artistInstrumentId], [artistId], [instrumentId]) VALUES (62, 24, 23)
SET IDENTITY_INSERT [dbo].[artistInstrument] OFF
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (1, N'Country')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (2, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (3, N'Country-Rock')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (4, N'Top 40 Hits')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (5, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (6, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (7, N'Classic Rock & Roll')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (8, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (9, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (10, N'Country-Rock')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (11, N'Folk')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (12, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (13, N'Top 40 Hits')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (14, N'Karaoke')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (15, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (16, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (17, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (18, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (19, N'Top 40 Hits')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (20, N'Contemporary')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (21, N'Middle of the Road')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (22, N'Classic Rock & Roll')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (23, N'Country-Rock')
INSERT [dbo].[artistStyle] ([artistId], [styleName]) VALUES (24, N'Country-Rock')
INSERT [dbo].[club] ([clubId]) VALUES (25)
INSERT [dbo].[club] ([clubId]) VALUES (26)
INSERT [dbo].[club] ([clubId]) VALUES (27)
INSERT [dbo].[club] ([clubId]) VALUES (28)
INSERT [dbo].[club] ([clubId]) VALUES (29)
INSERT [dbo].[club] ([clubId]) VALUES (30)
INSERT [dbo].[club] ([clubId]) VALUES (31)
INSERT [dbo].[club] ([clubId]) VALUES (32)
INSERT [dbo].[club] ([clubId]) VALUES (33)
INSERT [dbo].[club] ([clubId]) VALUES (34)
INSERT [dbo].[club] ([clubId]) VALUES (35)
INSERT [dbo].[club] ([clubId]) VALUES (36)
INSERT [dbo].[club] ([clubId]) VALUES (37)
INSERT [dbo].[club] ([clubId]) VALUES (38)
INSERT [dbo].[club] ([clubId]) VALUES (39)
INSERT [dbo].[club] ([clubId]) VALUES (40)
INSERT [dbo].[club] ([clubId]) VALUES (41)
INSERT [dbo].[club] ([clubId]) VALUES (42)
INSERT [dbo].[club] ([clubId]) VALUES (43)
INSERT [dbo].[club] ([clubId]) VALUES (44)
INSERT [dbo].[club] ([clubId]) VALUES (45)
INSERT [dbo].[club] ([clubId]) VALUES (46)
INSERT [dbo].[club] ([clubId]) VALUES (47)
INSERT [dbo].[club] ([clubId]) VALUES (48)
INSERT [dbo].[club] ([clubId]) VALUES (49)
INSERT [dbo].[club] ([clubId]) VALUES (50)
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (25, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (26, N'Classic Rock & Roll')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (27, N'Magic')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (28, N'Folk')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (29, N'Country-Rock')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (30, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (31, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (32, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (33, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (34, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (35, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (36, N'50s Music')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (37, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (38, N'Country-Rock')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (39, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (40, N'Contemporary')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (41, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (42, N'Classic Rock & Roll')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (43, N'Country-Rock')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (44, N'Top 40 Hits')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (45, N'Folk')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (46, N'Middle of the Road')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (47, N'Folk')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (48, N'Comedy')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (49, N'Comedy')
INSERT [dbo].[clubStyle] ([clubId], [styleName]) VALUES (50, N'Karaoke')
SET IDENTITY_INSERT [dbo].[contract] ON 

INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (284, CAST(N'1999-06-26T00:00:00.000' AS DateTime), 1, 35, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (285, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 6, 49, 450, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (286, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 4, 47, 0, 16, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (287, CAST(N'1999-07-03T00:00:00.000' AS DateTime), 5, 31, 600, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (288, CAST(N'1999-07-09T00:00:00.000' AS DateTime), 23, 27, 700, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (289, CAST(N'1999-07-12T00:00:00.000' AS DateTime), 20, 26, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (290, CAST(N'1999-07-12T00:00:00.000' AS DateTime), 5, 26, 550, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (291, CAST(N'1999-07-12T00:00:00.000' AS DateTime), 5, 26, 550, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (292, CAST(N'1999-07-12T00:00:00.000' AS DateTime), 15, 26, 550, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (293, CAST(N'1999-07-12T00:00:00.000' AS DateTime), 20, 26, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (294, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 8, 37, 300, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (295, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 16, 38, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (296, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 38, 550, 15, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (297, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 11, 38, 550, 15, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (298, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 11, 38, 550, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (299, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 38, 550, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (300, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 6, 38, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (301, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 38, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (302, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 38, 550, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (303, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 15, 45, 700, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (304, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 11, 38, 550, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (305, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 6, 38, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (306, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 17, 45, 750, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (307, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 23, 45, 800, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (308, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 26, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (309, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 17, 45, 750, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (310, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 17, 45, 750, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (311, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 4, 26, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (312, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 23, 45, 800, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (313, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 23, 45, 800, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (314, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 16, 38, 550, 13, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (315, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 16, 38, 550, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (316, CAST(N'1999-07-13T00:00:00.000' AS DateTime), 23, 45, 800, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (317, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 7, 47, 0, 17, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (318, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 18, 36, 1500, 15, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (319, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 7, 36, 750, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (320, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 18, 36, 1500, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (321, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 21, 36, 1100, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (322, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 21, 36, 1100, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (323, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 21, 36, 1100, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (324, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 5, 31, 600, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (325, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 5, 49, 450, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (326, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 20, 49, 450, 18, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (327, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 4, 25, 300, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (328, CAST(N'1999-07-16T00:00:00.000' AS DateTime), 10, 36, 1100, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (329, CAST(N'1999-07-23T00:00:00.000' AS DateTime), 17, 47, 0, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (330, CAST(N'1999-07-24T00:00:00.000' AS DateTime), 1, 41, 750, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (331, CAST(N'1999-07-26T00:00:00.000' AS DateTime), 20, 26, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (332, CAST(N'1999-07-26T00:00:00.000' AS DateTime), 20, 26, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (333, CAST(N'1999-07-27T00:00:00.000' AS DateTime), 20, 25, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (334, CAST(N'1999-08-03T00:00:00.000' AS DateTime), 6, 25, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (335, CAST(N'1999-08-04T00:00:00.000' AS DateTime), 1, 27, 450, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (336, CAST(N'1999-08-10T00:00:00.000' AS DateTime), 21, 25, 400, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (337, CAST(N'1999-08-11T00:00:00.000' AS DateTime), 15, 41, 650, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (338, CAST(N'1999-08-11T00:00:00.000' AS DateTime), 20, 41, 750, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (339, CAST(N'1999-08-11T00:00:00.000' AS DateTime), 20, 41, 650, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (340, CAST(N'1999-08-11T00:00:00.000' AS DateTime), 15, 41, 650, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (341, CAST(N'1999-08-11T00:00:00.000' AS DateTime), 1, 41, 750, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (342, CAST(N'1999-08-12T00:00:00.000' AS DateTime), 5, 41, 650, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (343, CAST(N'1999-08-12T00:00:00.000' AS DateTime), 17, 48, 750, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (344, CAST(N'1999-08-12T00:00:00.000' AS DateTime), 4, 48, 600, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (345, CAST(N'1999-08-12T00:00:00.000' AS DateTime), 20, 48, 550, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (346, CAST(N'1999-08-13T00:00:00.000' AS DateTime), 21, 47, 0, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (347, CAST(N'1999-09-02T00:00:00.000' AS DateTime), 16, 49, 450, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (348, CAST(N'1999-09-03T00:00:00.000' AS DateTime), 8, 27, 450, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (349, CAST(N'1999-09-10T00:00:00.000' AS DateTime), 6, 48, 550, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (350, CAST(N'1999-09-17T00:00:00.000' AS DateTime), 21, 47, 0, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (351, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 18, 36, 1500, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (352, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 21, 34, 1350, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (353, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 16, 49, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (354, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 6, 49, 450, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (355, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 21, 25, 400, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (356, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 16, 25, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (357, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 12, 39, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (358, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 17, 34, 925, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (359, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 12, 39, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (360, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 4, 26, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (361, CAST(N'1999-09-23T00:00:00.000' AS DateTime), 8, 25, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (362, CAST(N'1999-09-27T00:00:00.000' AS DateTime), 1, 27, 450, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (363, CAST(N'1999-09-27T00:00:00.000' AS DateTime), 8, 27, 450, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (364, CAST(N'1999-09-30T00:00:00.000' AS DateTime), 18, 36, 1500, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (365, CAST(N'1999-10-06T00:00:00.000' AS DateTime), 8, 46, 475, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (366, CAST(N'1999-10-19T00:00:00.000' AS DateTime), 21, 36, 1100, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (367, CAST(N'1999-10-24T00:00:00.000' AS DateTime), 1, 27, 450, 13, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (368, CAST(N'1999-11-02T00:00:00.000' AS DateTime), 8, 37, 300, 13, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (369, CAST(N'1999-11-02T00:00:00.000' AS DateTime), 11, 25, 300, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (370, CAST(N'1999-11-12T00:00:00.000' AS DateTime), 20, 48, 600, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (371, CAST(N'1999-11-15T00:00:00.000' AS DateTime), 20, 25, 300, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (372, CAST(N'1999-11-15T00:00:00.000' AS DateTime), 4, 25, 300, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (373, CAST(N'1999-11-16T00:00:00.000' AS DateTime), 8, 29, 250, 10, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (374, CAST(N'1999-11-20T00:00:00.000' AS DateTime), 14, 41, 600, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (375, CAST(N'1999-11-26T00:00:00.000' AS DateTime), 13, 38, 550, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (376, CAST(N'1999-11-26T00:00:00.000' AS DateTime), 8, 25, 300, 1, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (377, CAST(N'1999-11-26T00:00:00.000' AS DateTime), 8, 25, 400, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (378, CAST(N'1999-11-26T00:00:00.000' AS DateTime), 6, 42, 400, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (379, CAST(N'1999-12-03T00:00:00.000' AS DateTime), 8, 27, 450, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (380, CAST(N'1999-12-14T00:00:00.000' AS DateTime), 12, 25, 400, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (381, CAST(N'1999-12-19T00:00:00.000' AS DateTime), 1, 27, 150, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (382, CAST(N'1999-12-21T00:00:00.000' AS DateTime), 16, 43, 250, 33, 0)
GO
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (383, CAST(N'1999-12-24T00:00:00.000' AS DateTime), 21, 36, 1100, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (384, CAST(N'1999-12-24T00:00:00.000' AS DateTime), 7, 36, 800, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (385, CAST(N'1999-12-24T00:00:00.000' AS DateTime), 18, 36, 1500, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (386, CAST(N'1999-12-24T00:00:00.000' AS DateTime), 13, 47, 0, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (387, CAST(N'1999-12-24T00:00:00.000' AS DateTime), 18, 36, 1500, 66, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (388, CAST(N'1999-12-28T00:00:00.000' AS DateTime), 11, 43, 250, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (389, CAST(N'2000-01-04T00:00:00.000' AS DateTime), 4, 25, 300, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (390, CAST(N'2000-01-05T00:00:00.000' AS DateTime), 20, 42, 400, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (391, CAST(N'2000-01-05T00:00:00.000' AS DateTime), 21, 42, 500, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (392, CAST(N'2000-01-05T00:00:00.000' AS DateTime), 4, 42, 400, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (393, CAST(N'2000-01-05T00:00:00.000' AS DateTime), 4, 42, 400, 21, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (394, CAST(N'2000-01-11T00:00:00.000' AS DateTime), 6, 25, 300, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (395, CAST(N'2000-01-18T00:00:00.000' AS DateTime), 12, 25, 300, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (396, CAST(N'2000-01-18T00:00:00.000' AS DateTime), 6, 43, 250, 15, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (397, CAST(N'2000-01-21T00:00:00.000' AS DateTime), 5, 42, 400, 17, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (398, CAST(N'2000-01-21T00:00:00.000' AS DateTime), 1, 41, 750, 15, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (399, CAST(N'2000-01-25T00:00:00.000' AS DateTime), 8, 25, 300, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (400, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 8, 44, 300, 13, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (401, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 13, 30, 300, 14, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (402, CAST(N'2000-02-01T00:00:00.000' AS DateTime), 4, 25, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (403, CAST(N'2000-02-04T00:00:00.000' AS DateTime), 7, 47, 235, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (404, CAST(N'2000-02-05T00:00:00.000' AS DateTime), 20, 41, 650, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (405, CAST(N'2000-02-06T00:00:00.000' AS DateTime), 10, 32, 650, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (406, CAST(N'2000-02-08T00:00:00.000' AS DateTime), 16, 25, 300, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (407, CAST(N'2000-02-08T00:00:00.000' AS DateTime), 21, 36, 400, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (408, CAST(N'2000-02-15T00:00:00.000' AS DateTime), 8, 25, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (409, CAST(N'2000-02-22T00:00:00.000' AS DateTime), 4, 43, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (410, CAST(N'2000-02-22T00:00:00.000' AS DateTime), 22, 30, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (411, CAST(N'2000-02-22T00:00:00.000' AS DateTime), 21, 25, 400, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (413, CAST(N'2000-02-29T00:00:00.000' AS DateTime), 22, 25, 300, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (414, CAST(N'2000-03-11T00:00:00.000' AS DateTime), 11, 26, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (415, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 5, 41, 650, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (416, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 8, 27, 200, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (417, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 14, 38, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (418, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 20, 30, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (419, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 23, 25, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (420, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 20, 42, 400, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (421, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 1, 42, 400, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (422, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 13, 30, 450, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (423, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 12, 30, 250, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (424, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 23, 45, 850, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (425, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 8, 45, 650, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (426, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 21, 25, 400, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (427, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 21, 42, 500, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (428, CAST(N'2000-03-16T00:00:00.000' AS DateTime), 4, 43, 350, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (429, CAST(N'2000-03-17T00:00:00.000' AS DateTime), 20, 46, 0, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (430, CAST(N'2000-03-17T00:00:00.000' AS DateTime), 20, 46, 0, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (431, CAST(N'2000-03-17T00:00:00.000' AS DateTime), 20, 46, 0, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (432, CAST(N'2000-03-17T00:00:00.000' AS DateTime), 20, 46, 0, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (433, CAST(N'2000-03-23T00:00:00.000' AS DateTime), 13, 47, 100, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (434, CAST(N'2000-03-23T00:00:00.000' AS DateTime), 4, 29, 0, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (435, CAST(N'2000-03-23T00:00:00.000' AS DateTime), 23, 41, 700, 1, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (436, CAST(N'2000-03-23T00:00:00.000' AS DateTime), 15, 26, 0, 1, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (437, CAST(N'2000-03-23T00:00:00.000' AS DateTime), 4, 26, 0, 12, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (438, CAST(N'2000-03-27T00:00:00.000' AS DateTime), 1, 35, 150, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (439, CAST(N'2000-03-27T00:00:00.000' AS DateTime), 1, 35, 450, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (440, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (441, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (442, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (443, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (444, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (445, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (446, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 47, 1000, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (447, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (448, CAST(N'2000-03-30T00:00:00.000' AS DateTime), 18, 36, 1500, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (449, CAST(N'2000-04-11T00:00:00.000' AS DateTime), 22, 39, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (450, CAST(N'2000-04-22T00:00:00.000' AS DateTime), 1, 28, 600, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (451, CAST(N'2000-04-27T00:00:00.000' AS DateTime), 7, 47, 160, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (452, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 4, 34, 700, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (453, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 1, 28, 600, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (454, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 4, 34, 1350, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (455, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 4, 34, 1350, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (456, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 4, 34, 1350, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (457, CAST(N'2000-05-02T00:00:00.000' AS DateTime), 21, 25, 750, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (458, CAST(N'2000-05-03T00:00:00.000' AS DateTime), 14, 39, 250, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (459, CAST(N'2000-05-03T00:00:00.000' AS DateTime), 4, 30, 400, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (460, CAST(N'2000-05-04T00:00:00.000' AS DateTime), 21, 40, 750, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (461, CAST(N'2000-05-08T00:00:00.000' AS DateTime), 4, 34, 1350, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (462, CAST(N'2000-05-08T00:00:00.000' AS DateTime), 17, 34, 950, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (463, CAST(N'2000-05-08T00:00:00.000' AS DateTime), 17, 34, 950, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (464, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 21, 41, 850, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (465, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 14, 41, 600, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (466, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 23, 41, 0, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (467, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 14, 41, 600, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (468, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 1, 41, 750, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (469, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 15, 41, 650, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (470, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 21, 45, 800, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (471, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 21, 45, 800, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (472, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 17, 45, 800, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (474, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 17, 45, 800, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (475, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 23, 45, 800, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (476, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 20, 41, 650, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (477, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 23, 45, 800, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (478, CAST(N'2000-05-10T00:00:00.000' AS DateTime), 23, 45, 800, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (479, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 11, 26, 550, 8, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (480, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 11, 26, 550, 1, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (481, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 4, 26, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (482, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 20, 26, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (483, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 23, 26, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (484, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 15, 26, 550, 3, 0)
GO
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (485, CAST(N'2000-05-11T00:00:00.000' AS DateTime), 4, 26, 550, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (486, CAST(N'2000-05-18T00:00:00.000' AS DateTime), 20, 27, 400, 34, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (487, CAST(N'2000-05-18T00:00:00.000' AS DateTime), 8, 39, 200, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (488, CAST(N'2000-05-18T00:00:00.000' AS DateTime), 24, 25, 1000, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (489, CAST(N'2000-05-18T00:00:00.000' AS DateTime), 14, 27, 400, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (490, CAST(N'2000-05-23T00:00:00.000' AS DateTime), 7, 36, 640, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (491, CAST(N'2000-05-23T00:00:00.000' AS DateTime), 10, 47, 650, 45, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (492, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 4, 38, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (493, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 12, 27, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (494, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 6, 38, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (495, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 6, 38, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (496, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 4, 38, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (497, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 14, 38, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (498, CAST(N'2000-06-08T00:00:00.000' AS DateTime), 4, 38, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (499, CAST(N'2000-06-12T00:00:00.000' AS DateTime), 21, 41, 850, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (500, CAST(N'2000-06-12T00:00:00.000' AS DateTime), 21, 45, 850, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (501, CAST(N'2000-06-22T00:00:00.000' AS DateTime), 7, 39, 0, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (502, CAST(N'2000-06-22T00:00:00.000' AS DateTime), 13, 39, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (503, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 5, 38, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (504, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (505, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (506, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (507, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (508, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 12, 27, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (509, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 20, 45, 500, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (510, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 4, 27, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (511, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (512, CAST(N'2000-06-23T00:00:00.000' AS DateTime), 10, 32, 700, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (513, CAST(N'2000-06-29T00:00:00.000' AS DateTime), 6, 49, 450, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (514, CAST(N'2000-07-11T00:00:00.000' AS DateTime), 11, 38, 550, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (515, CAST(N'2000-07-11T00:00:00.000' AS DateTime), 8, 37, 300, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (516, CAST(N'2000-07-14T00:00:00.000' AS DateTime), 6, 49, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (517, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 19, 33, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (518, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 20, 27, 300, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (519, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 12, 39, 250, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (520, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 22, 27, 300, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (521, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 22, 39, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (522, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 7, 47, 180, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (523, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 12, 27, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (524, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 24, 25, 1000, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (525, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 1, 27, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (526, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 13, 46, 400, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (527, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 12, 39, 300, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (528, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 9, 27, 300, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (529, CAST(N'2000-07-19T00:00:00.000' AS DateTime), 8, 37, 300, 7, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (530, CAST(N'2000-07-20T00:00:00.000' AS DateTime), 12, 27, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (531, CAST(N'2000-07-20T00:00:00.000' AS DateTime), 9, 27, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (532, CAST(N'2000-07-20T00:00:00.000' AS DateTime), 22, 39, 250, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (533, CAST(N'2000-08-01T00:00:00.000' AS DateTime), 6, 25, 300, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (534, CAST(N'2000-08-09T00:00:00.000' AS DateTime), 15, 41, 650, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (535, CAST(N'2000-08-10T00:00:00.000' AS DateTime), 20, 48, 550, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (536, CAST(N'2000-08-10T00:00:00.000' AS DateTime), 4, 48, 600, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (537, CAST(N'2000-08-10T00:00:00.000' AS DateTime), 17, 48, 750, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (538, CAST(N'2000-08-16T00:00:00.000' AS DateTime), 1, 46, 500, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (539, CAST(N'2000-09-01T00:00:00.000' AS DateTime), 8, 27, 450, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (540, CAST(N'2000-09-08T00:00:00.000' AS DateTime), 6, 48, 550, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (541, CAST(N'2000-09-15T00:00:00.000' AS DateTime), 21, 47, 0, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (542, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 8, 25, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (543, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 12, 39, 250, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (544, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 6, 49, 450, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (545, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 12, 39, 250, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (546, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 17, 34, 925, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (547, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 21, 25, 400, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (548, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 21, 34, 1350, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (549, CAST(N'2000-09-21T00:00:00.000' AS DateTime), 16, 49, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (550, CAST(N'2000-09-25T00:00:00.000' AS DateTime), 8, 27, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (551, CAST(N'2000-09-25T00:00:00.000' AS DateTime), 1, 27, 450, 2, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (552, CAST(N'2000-10-04T00:00:00.000' AS DateTime), 8, 46, 475, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (553, CAST(N'2000-10-31T00:00:00.000' AS DateTime), 11, 25, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (554, CAST(N'2000-10-31T00:00:00.000' AS DateTime), 8, 37, 300, 3, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (555, CAST(N'2000-11-10T00:00:00.000' AS DateTime), 20, 48, 600, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (556, CAST(N'2000-11-13T00:00:00.000' AS DateTime), 20, 25, 300, 4, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (557, CAST(N'2000-11-14T00:00:00.000' AS DateTime), 8, 29, 250, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (558, CAST(N'2000-11-24T00:00:00.000' AS DateTime), 6, 42, 400, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (559, CAST(N'2000-11-24T00:00:00.000' AS DateTime), 13, 38, 550, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (560, CAST(N'2000-11-24T00:00:00.000' AS DateTime), 8, 25, 300, 5, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (561, CAST(N'2000-11-24T00:00:00.000' AS DateTime), 8, 25, 400, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (562, CAST(N'2000-12-01T00:00:00.000' AS DateTime), 8, 27, 450, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (563, CAST(N'2000-12-12T00:00:00.000' AS DateTime), 12, 25, 400, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (564, CAST(N'2000-12-17T00:00:00.000' AS DateTime), 1, 27, 150, 6, 0)
INSERT [dbo].[contract] ([contract], [startDate], [artistId], [clubId], [pricePerPerformance], [numberPerformances], [totalPrice]) VALUES (565, CAST(N'2000-12-19T00:00:00.000' AS DateTime), 16, 43, 250, 6, 0)
SET IDENTITY_INSERT [dbo].[contract] OFF
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax], [provinceTerminology]) VALUES (N'CA', N'Canada', N'[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] ?\d[ABCEGHJKLMNPRSTVWXYZ]\d', N'\d{3}-\d{3}-\d{4}', 0.05, N'Province')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax], [provinceTerminology]) VALUES (N'DE', N'Germany', N'\d{5}', N'\(0\d{3}\) \d{4} \d{4} ', 0.19, N'State')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax], [provinceTerminology]) VALUES (N'FR', N'France', N'\d{5}', N'0\d (\d\d){4}', 0.2, N'Prefecture')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax], [provinceTerminology]) VALUES (N'US', N'United States Of America', N'\d{5}(-\d{4})?', N'\d{3}-\d{3}-\d{4}', 0, N'State')
INSERT [dbo].[groupMember] ([artistIdGroup], [artistIdMember], [dateJoined], [dateLeft]) VALUES (5, 14, CAST(N'2020-05-25T01:01:00.000' AS DateTime), NULL)
INSERT [dbo].[groupMember] ([artistIdGroup], [artistIdMember], [dateJoined], [dateLeft]) VALUES (5, 18, CAST(N'2020-05-25T00:00:00.000' AS DateTime), CAST(N'2020-05-26T01:01:00.000' AS DateTime))
INSERT [dbo].[groupMember] ([artistIdGroup], [artistIdMember], [dateJoined], [dateLeft]) VALUES (24, 1, NULL, NULL)
INSERT [dbo].[groupMember] ([artistIdGroup], [artistIdMember], [dateJoined], [dateLeft]) VALUES (24, 18, CAST(N'2020-05-25T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[instrument] ON 

INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (1, N'Acoustic Guitar')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (2, N'Acoustic Piano')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (3, N'Bass')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (4, N'Bass Guitar')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (5, N'Conga Drums')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (6, N'Clarinet')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (7, N'Drums')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (8, N'Disco')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (9, N'Flute')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (10, N'Fiddle')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (11, N'Guitar')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (12, N'Harp')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (13, N'Hypnosis')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (14, N'Karaoke')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (15, N'Keyboards')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (16, N'Lights')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (17, N'Marimba')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (18, N'Magician')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (19, N'Piano')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (20, N'Saxophone')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (21, N'Steel Drums')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (22, N'Sequences')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (23, N'Steel Guitar')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (24, N'Trombone')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (25, N'Tapes')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (26, N'Trumpet')
INSERT [dbo].[instrument] ([instrumentId], [name]) VALUES (27, N'Vocals')
SET IDENTITY_INSERT [dbo].[instrument] OFF
SET IDENTITY_INSERT [dbo].[nameAddress] ON 

INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (1, N'The Yurts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (2, N'Non-Nutritious', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (3, N'Internal Hemorrhage', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (4, N'Tomes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (5, N'Blind Logwara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (6, N'Muddled Thoughts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (7, N'The Buddy Love Orchestra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (8, N'Monk Seal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (9, N'Cornish Game Hens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (10, N'Generation Sex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (11, N'Seiza Bench', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (12, N'King Tut and the Uncommons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (13, N'Jelly Plug', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (14, N'The Kevins', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (15, N'Bedcandy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (16, N'Life Irritates Art', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (17, N'The Codpieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (18, N'Bucky and the Fullerenes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (19, N'Henry and Otis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (20, N'Shaman''s Apprentice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (21, N'Apes of Wrath', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (22, N'Tiny People', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (23, N'Urban Runoff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (24, N'Supertube', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (25, N'Issai', N'Hyodo', N'The Alligator Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-0471')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (26, N'Rias', N'Gremory', N'The Baby Seal Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-2200')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (27, N'Freed', N'Sellzen', N'The Bacchus Tavern', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1616')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (28, N'Mil', N'Tan', N'The Bosston Inn', NULL, NULL, NULL, NULL, NULL, N'(206) 555-0100')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (29, N'Aika', N'Kiryuu', N'The Candy Bar', NULL, NULL, NULL, NULL, NULL, N'(206) 555-2200')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (30, N'Sairaorg', N'Bael', N'CandyBox', NULL, NULL, NULL, NULL, NULL, N'(206) 555-7755')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (31, N'Akeno', N'Himejima', N'Dirty Dance Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1440')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (32, N'Asia', N'Argento', N'Geppetto''s Rockshop', NULL, NULL, NULL, NULL, NULL, N'(206) 555-0229')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (33, N'Gasper', N'Bloody', N'Jumpin'' Jack''s Tavern', NULL, NULL, NULL, NULL, NULL, N'(206) 555-3333')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (34, N'Xenovia', N'Quarta', N'Lilliput Tavern', NULL, NULL, NULL, NULL, NULL, N'(509) 555-9211')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (35, N'Koneko', N'Toujou', N'Lucifer''s Lighthouse', NULL, NULL, NULL, NULL, NULL, N'(206) 555-7447')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (36, N'Irina', N'Shido', N'The Misery Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-6325')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (37, N'Ravel', N'Phoenix', N'Mudskipper''s', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1064')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (38, N'Rossweisse', N'', N'The Olympic Bar', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1123')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (39, N'Sona', N'Sitri', N'The Putt Putt Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-8877')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (40, N'Genshiro', N'Saji', N'The Rickshaw Shack', NULL, NULL, NULL, NULL, NULL, N'(206) 555-7700')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (41, N'Matsuda', N'', N'Little Ricky''s Diner', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1000')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (42, N'Motohama', N'', N'Rock Chocolate', NULL, NULL, NULL, NULL, NULL, N'(206) 555-6430')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (43, N'Sirzechs', N'Lucifer', N'Satyr''s', NULL, NULL, NULL, NULL, NULL, N'(206) 555-4141')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (44, N'Elsha', N'', N'The Salt and Pepper Lounge', NULL, NULL, NULL, NULL, NULL, N'(206) 555-2704')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (45, N'Gondul', N'', N'The Sourdough Café', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1234')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (46, N'Tsubaki', N'Shinra', N'Mom''s Kitchen Café', NULL, NULL, NULL, NULL, NULL, N'(206) 555-7559')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (47, N'Riser', N'Phoenix', N'The Ski Haus', NULL, NULL, NULL, NULL, NULL, N'519-748-5220')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (48, N'Kiba', N'Yuuto', N'The Wine Seller', NULL, NULL, NULL, NULL, NULL, N'(206) 555-3241')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (49, N'Azazel', N'', N'West Coast Comedy Club', NULL, NULL, NULL, NULL, NULL, N'(206) 555-1224')
INSERT [dbo].[nameAddress] ([nameAddressId], [firstName], [lastName], [companyName], [streetAddress], [city], [postalCode], [provinceCode], [email], [phone]) VALUES (50, N'Grayfia', N'Lucifuge', N'No One Wants to Work Here', NULL, NULL, NULL, NULL, NULL, N'(360) 888-5555')
SET IDENTITY_INSERT [dbo].[nameAddress] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AB', N'Alberta', N'CA', N'', 0, 0, N'T')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AK', N'Alaska', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AR', N'Arkansas', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AZ', N'Arizona', N'US', N'state tax', 0.056, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'BC', N'British Columbia', N'CA', N'PST', 0.07, 0, N'V')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CA', N'California', N'US', N'state tax', 0.0725, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CO', N'Colorado', N'US', N'state tax', 0.029, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CT', N'Connecticut', N'US', N'state tax', 0.0635, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'DC', N'District of Columbia', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'DE', N'Delaware', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'FL', N'Forida', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'GA', N'Georgia', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'HI', N'Hawaii', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IA', N'Iowa', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ID', N'Idaho', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IL', N'Illinois', N'US', N'state tax', 0.0625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IN', N'Indiana', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'KA', N'Kansas', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'KY', N'Kentucky', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'LA', N'Louisiana', N'US', N'state tax', 0.0445, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MA', N'Massachusetts', N'US', N'state tax', 0.0625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MB', N'Manitoba', N'CA', N'PST', 0.08, 0, N'R')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MD', N'MaryLand', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ME', N'Maine', N'US', N'state tax', 0.055, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MI', N'Michigan', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MN', N'Minnesota', N'US', N'state tax', 0.06875, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MO', N'Missouri', N'US', N'state tax', 0.04225, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MS', N'Mississippi', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MT', N'Montana', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NB', N'New Brunswick                 ', N'CA', N'HST', 0.1, 1, N'E')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NC', N'North Carolina', N'US', N'state tax', 0.0475, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ND', N'North Dakota', N'US', N'state tax', 0.05, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NE', N'Nebraska', N'US', N'state tax', 0.055, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NH', N'New Hampshire', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NJ', N'New Jersey', N'US', N'state tax', 0.06625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NL', N'Newfoundland and Labrador', N'CA', N'HST', 0.15, 1, N'A')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NM', N'New Mexico', N'US', N'state tax', 0.05125, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NS', N'Nova Scotia', N'CA', N'HST', 0.15, 1, N'B')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NT', N'Northwest Territories', N'CA', N' ', 0, 0, N'X')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NU', N'Nunavut', N'CA', N' ', 0, 0, N'X')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NV', N'Nevada', N'US', N'state tax', 0.0685, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NY', N'New York', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OH', N'Ohio', N'US', N'state tax', 0.0575, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OK', N'Oklahoma', N'US', N'state tax', 0.045, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ON', N'Ontario', N'CA', N'HST', 0.13, 1, N'KLMNP')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OR', N'Oregon', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'PA', N'Pennsylvania', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'PI', N'Prince Edward Island          ', N'CA', N'HST', 0.15, 1, N'C')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'PR', N'Puerto Rico', N'US', N'state tax', 0.115, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'QC', N'Quebec', N'CA', N'QST', 0.09975, 0, N'GHJ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'RI', N'Rhode Island', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'SC', N'South Carolina', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'SD', N'South Dakota', N'US', N'state tax', 0.045, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'SK', N'Saskatchewan                  ', N'CA', N'PST', 0.06, 0, N'S')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'TN', N'Tennessee', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'TX', N'Texas', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'UT', N'Utah', N'US', N'state tax', 0.0485, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'VA', N'Virginia', N'US', N'state tax', 0.043, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'VT', N'Vermont', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WA', N'Washington', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WI', N'Wisconsin', N'US', N'state tax', 0.05, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WV', N'West Virginia', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WY', N'Wyoming', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'YT', N'Yukon', N'CA', N' ', 0, 0, N'Y')
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'50s Music', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Classic Rock & Roll', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Comedy', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Contemporary', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Country', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Country-Rock', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Folk', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Karaoke', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Magic', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Middle of the Road', NULL)
INSERT [dbo].[style] ([styleName], [description]) VALUES (N'Top 40 Hits', NULL)
ALTER TABLE [dbo].[artist] ADD  CONSTRAINT [DF_artist_minimumHourlyRate]  DEFAULT ((0)) FOR [minimumHourlyRate]
GO
ALTER TABLE [dbo].[artist] ADD  CONSTRAINT [DF_artist_nameAddressid]  DEFAULT ((0)) FOR [nameAddressid]
GO
ALTER TABLE [dbo].[contract] ADD  CONSTRAINT [DF_contract_pricePerPerformance]  DEFAULT ((0)) FOR [pricePerPerformance]
GO
ALTER TABLE [dbo].[contract] ADD  CONSTRAINT [DF_contract_numberOfPerformances]  DEFAULT ((0)) FOR [numberPerformances]
GO
ALTER TABLE [dbo].[contract] ADD  CONSTRAINT [DF_contract_totalPrice]  DEFAULT ((0)) FOR [totalPrice]
GO
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [DF_province_salesTax]  DEFAULT ((0)) FOR [salesTax]
GO
ALTER TABLE [dbo].[artist]  WITH CHECK ADD  CONSTRAINT [FK_artist_nameAddress] FOREIGN KEY([nameAddressid])
REFERENCES [dbo].[nameAddress] ([nameAddressId])
GO
ALTER TABLE [dbo].[artist] CHECK CONSTRAINT [FK_artist_nameAddress]
GO
ALTER TABLE [dbo].[artistInstrument]  WITH CHECK ADD  CONSTRAINT [FK_artistInstrument_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[artistInstrument] CHECK CONSTRAINT [FK_artistInstrument_artist]
GO
ALTER TABLE [dbo].[artistInstrument]  WITH CHECK ADD  CONSTRAINT [FK_artistInstrument_instrument] FOREIGN KEY([instrumentId])
REFERENCES [dbo].[instrument] ([instrumentId])
GO
ALTER TABLE [dbo].[artistInstrument] CHECK CONSTRAINT [FK_artistInstrument_instrument]
GO
ALTER TABLE [dbo].[artistStyle]  WITH CHECK ADD  CONSTRAINT [FK_artistStyle_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[artistStyle] CHECK CONSTRAINT [FK_artistStyle_artist]
GO
ALTER TABLE [dbo].[artistStyle]  WITH CHECK ADD  CONSTRAINT [FK_artistStyle_style] FOREIGN KEY([styleName])
REFERENCES [dbo].[style] ([styleName])
GO
ALTER TABLE [dbo].[artistStyle] CHECK CONSTRAINT [FK_artistStyle_style]
GO
ALTER TABLE [dbo].[club]  WITH CHECK ADD  CONSTRAINT [FK_club_nameAddress] FOREIGN KEY([clubId])
REFERENCES [dbo].[nameAddress] ([nameAddressId])
GO
ALTER TABLE [dbo].[club] CHECK CONSTRAINT [FK_club_nameAddress]
GO
ALTER TABLE [dbo].[clubStyle]  WITH CHECK ADD  CONSTRAINT [FK_clubStyle_club] FOREIGN KEY([clubId])
REFERENCES [dbo].[club] ([clubId])
GO
ALTER TABLE [dbo].[clubStyle] CHECK CONSTRAINT [FK_clubStyle_club]
GO
ALTER TABLE [dbo].[clubStyle]  WITH CHECK ADD  CONSTRAINT [FK_clubStyle_style] FOREIGN KEY([styleName])
REFERENCES [dbo].[style] ([styleName])
GO
ALTER TABLE [dbo].[clubStyle] CHECK CONSTRAINT [FK_clubStyle_style]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_artist] FOREIGN KEY([artistId])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [FK_contract_artist]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [FK_contract_club] FOREIGN KEY([clubId])
REFERENCES [dbo].[club] ([clubId])
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [FK_contract_club]
GO
ALTER TABLE [dbo].[groupMember]  WITH CHECK ADD  CONSTRAINT [FK_groupMember_artist] FOREIGN KEY([artistIdGroup])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[groupMember] CHECK CONSTRAINT [FK_groupMember_artist]
GO
ALTER TABLE [dbo].[groupMember]  WITH CHECK ADD  CONSTRAINT [FK_groupMember_artist1] FOREIGN KEY([artistIdMember])
REFERENCES [dbo].[artist] ([artistId])
GO
ALTER TABLE [dbo].[groupMember] CHECK CONSTRAINT [FK_groupMember_artist1]
GO
ALTER TABLE [dbo].[nameAddress]  WITH CHECK ADD  CONSTRAINT [FK_nameAddress_province] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[nameAddress] CHECK CONSTRAINT [FK_nameAddress_province]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
USE [master]
GO
ALTER DATABASE [Clubs] SET  READ_WRITE 
GO
