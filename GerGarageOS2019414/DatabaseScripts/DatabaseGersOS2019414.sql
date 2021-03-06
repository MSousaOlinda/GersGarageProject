USE [master]
GO
/****** Object:  Database [fabiofin_ireland]    Script Date: 14/08/2020 17:31:15 ******/
CREATE DATABASE [fabiofin_ireland]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fabiofin_ireland', FILENAME = N'D:\MSSQL\MSSQL13.MSSQLSERVER\MSSQL\DATA\fabiofin_ireland.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fabiofin_ireland_log', FILENAME = N'D:\MSSQL\MSSQL13.MSSQLSERVER\MSSQL\DATA\fabiofin_ireland_log.ldf' , SIZE = 1160KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [fabiofin_ireland] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fabiofin_ireland].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fabiofin_ireland] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET ARITHABORT OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fabiofin_ireland] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fabiofin_ireland] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET  ENABLE_BROKER 
GO
ALTER DATABASE [fabiofin_ireland] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fabiofin_ireland] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [fabiofin_ireland] SET  MULTI_USER 
GO
ALTER DATABASE [fabiofin_ireland] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fabiofin_ireland] SET DB_CHAINING OFF 
GO
ALTER DATABASE [fabiofin_ireland] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fabiofin_ireland] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fabiofin_ireland] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [fabiofin_ireland] SET QUERY_STORE = OFF
GO
USE [fabiofin_ireland]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [fabiofin_ireland]
GO
/****** Object:  User [fabiofin_ireland]    Script Date: 14/08/2020 17:31:17 ******/
CREATE USER [fabiofin_ireland] FOR LOGIN [fabiofin_ireland] WITH DEFAULT_SCHEMA=[fabiofin_ireland]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [fabiofin_ireland]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [fabiofin_ireland]
GO
ALTER ROLE [db_datareader] ADD MEMBER [fabiofin_ireland]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [fabiofin_ireland]
GO
/****** Object:  Schema [fabiofin_d]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofin_d]
GO
/****** Object:  Schema [fabiofin_fabiofin]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofin_fabiofin]
GO
/****** Object:  Schema [fabiofin_fabiofinoo]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofin_fabiofinoo]
GO
/****** Object:  Schema [fabiofin_fabiotest]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofin_fabiotest]
GO
/****** Object:  Schema [fabiofin_ireland]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofin_ireland]
GO
/****** Object:  Schema [fabiofino]    Script Date: 14/08/2020 17:31:17 ******/
CREATE SCHEMA [fabiofino]
GO
/****** Object:  View [fabiofin_ireland].[VW_Book_OLD]    Script Date: 14/08/2020 17:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [fabiofin_ireland].[VW_Booking]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [fabiofin_ireland].[VW_Booking]
AS 
SELECT b.id_booking, b.reservationDate, b.customer_notes, 
b.id_customer, c.[name], v.[type], b.id_vehicle, v.model, v.brand, 
v.engine, b.id_service, st.service_type, b.id_time, t.[time], b.id_status, 
sst.status_type, b.id_staff, sff.staff_name
FROM Booking b
left join [fabiofin_d].[Customer] c 
ON b.id_customer = c.id_customer 
left join [fabiofin_ireland].[Vehicle] v
ON b.id_vehicle = v.id_vehicle
left join [fabiofin_ireland].[Service_Types] st
ON b.id_service = st.id_service
left join [fabiofin_ireland].[Time_Booking] t
ON b.id_time = t.id_time
left join [fabiofin_ireland].[Service_Status] sst
ON b.id_status = sst.id_status
left join [fabiofin_ireland].[Staff] sff
ON b.id_staff = sff.id_staff
GO
/****** Object:  View [fabiofin_ireland].[VW_Invoice]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [fabiofin_ireland].[VW_Invoice]
AS 
select iv.id_invoice, o.id_order, b.id_booking,
iv.id_customer, c.[name], iv.id_service, st.service_type, 
st.service_price, iv.id_items_parts, ip.item_name, ip.price
from Invoice iv

left join [Order] o
ON iv.id_order = o.id_order
left join Booking b
ON iv.id_booking = b.id_booking
left join [fabiofin_d].[Customer] c
ON iv.id_customer = c.id_customer
left join [fabiofin_ireland].[Service_Types] st
ON iv.id_service = st.id_service
left join [fabiofin_ireland].[Items_Parts] ip
ON iv.id_items_parts = ip.id_items_parts
GO
/****** Object:  View [fabiofin_ireland].[VW_Order]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [fabiofin_ireland].[VW_Order]
AS 
select o.id_order, o.id_booking, b.reservationDate, b.customer_notes, 
b.id_customer, c.name, b.id_staff, sff.staff_name, b.id_service, 
st.service_type, st.service_price, b.id_status, sst.status_type
from [fabiofin_ireland].[Order] o
left join [fabiofin_ireland].[Booking] b
ON o.id_booking = b.id_booking
left join [fabiofin_d].[Customer] c
ON o.id_customer = c.id_customer
left join [fabiofin_ireland].[Staff]sff
ON o.id_staff = sff.id_staff
left join [fabiofin_ireland].[Service_Types] st
ON o.id_service = st.id_service
left join [fabiofin_ireland].[Service_Status] sst
ON b.id_status = sst.id_status

GO
/****** Object:  Table [fabiofin_d].[Customer]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_d].[Customer](
	[id_customer] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Booking]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Booking](
	[id_booking] [int] IDENTITY(1,1) NOT NULL,
	[reservationDate] [date] NULL,
	[customer_notes] [varchar](500) NULL,
	[id_customer] [int] NULL,
	[id_vehicle] [int] NULL,
	[id_service] [int] NULL,
	[id_time] [int] NULL,
	[licence] [nchar](15) NULL,
	[id_status] [int] NULL,
	[id_staff] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[id_booking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Customer_Vehicle]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Customer_Vehicle](
	[id_custVehicle] [int] IDENTITY(1,1) NOT NULL,
	[id_vehicle] [int] NULL,
	[id_customer] [int] NULL,
	[license] [varchar](15) NULL,
 CONSTRAINT [PK_Customer_Vehicle] PRIMARY KEY CLUSTERED 
(
	[id_custVehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Htry_Stts_Bking]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Htry_Stts_Bking](
	[id_histBooking] [int] IDENTITY(1,1) NOT NULL,
	[id_booking] [int] NULL,
	[id_status] [int] NULL,
 CONSTRAINT [PK_Htry_Stts_Bking] PRIMARY KEY CLUSTERED 
(
	[id_histBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Invoice]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Invoice](
	[id_invoice] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NULL,
	[id_booking] [int] NULL,
	[id_customer] [int] NULL,
	[id_service] [int] NULL,
	[id_items_parts] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id_invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Items_Parts]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Items_Parts](
	[id_items_parts] [int] IDENTITY(1,1) NOT NULL,
	[item_name] [varchar](50) NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Items_Parts] PRIMARY KEY CLUSTERED 
(
	[id_items_parts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Order]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Order](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_booking] [int] NULL,
	[id_customer] [int] NULL,
	[id_staff] [int] NULL,
	[id_service] [int] NULL,
	[id_parts_items] [int] NULL,
	[id_status] [int] NOT NULL,
	[order_notes] [varchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Service_Status]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Service_Status](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_type] [varchar](50) NULL,
	[status_description] [varchar](150) NULL,
 CONSTRAINT [PK_Service_Status] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Service_Types]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Service_Types](
	[id_service] [int] IDENTITY(1,1) NOT NULL,
	[service_type] [varchar](20) NULL,
	[service_price] [int] NULL,
 CONSTRAINT [PK_Service_Types] PRIMARY KEY CLUSTERED 
(
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Staff]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Staff](
	[id_staff] [int] IDENTITY(1,1) NOT NULL,
	[staff_name] [varchar](50) NULL,
	[birth_dt] [date] NULL,
	[staff_phone] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[password] [varchar](20) NULL,
	[staff_type] [varchar](30) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Time_Booking]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Time_Booking](
	[id_time] [int] IDENTITY(1,1) NOT NULL,
	[time] [int] NULL,
 CONSTRAINT [PK_Time_Booking] PRIMARY KEY CLUSTERED 
(
	[id_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [fabiofin_ireland].[Vehicle]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fabiofin_ireland].[Vehicle](
	[id_vehicle] [int] IDENTITY(1,1) NOT NULL,
	[model] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[engine] [varchar](10) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[id_vehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [fabiofin_ireland].[Customer_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Vehicle_Customer_Vehicle] FOREIGN KEY([id_custVehicle])
REFERENCES [fabiofin_ireland].[Customer_Vehicle] ([id_custVehicle])
GO
ALTER TABLE [fabiofin_ireland].[Customer_Vehicle] CHECK CONSTRAINT [FK_Customer_Vehicle_Customer_Vehicle]
GO
/****** Object:  StoredProcedure [fabiofin_ireland].[PR_TimeAvailable]    Script Date: 14/08/2020 17:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [fabiofin_ireland].[PR_TimeAvailable]
@dataSelected varchar(30)
as

declare @qtdeStaff int
select @qtdeStaff = count(*) from [fabiofin_ireland].[Staff] where staff_type = 'mechanical'

declare @data_ varchar(30)
set @data_ = @dataSelected

select a.id_time, a.time, isnull(xx.reservationDate,@data_)reservationDate , isnull(xx.qtde_IdTime,0) qtde_IdTime, isnull(xx.Status,'available') Status
from  Time_Booking a
left join 
(
SELECT  b.reservationDate,  count(b.id_time) as qtde_IdTime, b.id_time, case when  count(b.id_time) > 2 then 'not available' else 'available' end as Status
FROM Booking b
where b.reservationDate = @data_
group by b.reservationDate, b.id_time
) xx
on a.id_time = xx.id_time
GO
USE [master]
GO
ALTER DATABASE [fabiofin_ireland] SET  READ_WRITE 
GO
