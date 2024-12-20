USE [master]
GO
/****** Object:  Database [KoiFish]    Script Date: 11/22/2024 9:28:27 PM ******/
CREATE DATABASE [KoiFish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KoiFish_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KoiFish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KoiFish_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KoiFish.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KoiFish] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KoiFish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KoiFish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KoiFish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KoiFish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KoiFish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KoiFish] SET ARITHABORT OFF 
GO
ALTER DATABASE [KoiFish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KoiFish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KoiFish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KoiFish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KoiFish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KoiFish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KoiFish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KoiFish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KoiFish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KoiFish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KoiFish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KoiFish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KoiFish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KoiFish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KoiFish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KoiFish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KoiFish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KoiFish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KoiFish] SET  MULTI_USER 
GO
ALTER DATABASE [KoiFish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KoiFish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KoiFish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KoiFish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KoiFish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KoiFish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KoiFish] SET QUERY_STORE = ON
GO
ALTER DATABASE [KoiFish] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KoiFish]
GO
/****** Object:  Table [dbo].[fish]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fish](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[age] [bigint] NULL,
	[body_shape] [nvarchar](255) NULL,
	[breed] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[image] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[origin] [nvarchar](255) NULL,
	[price] [real] NULL,
	[size] [real] NULL,
	[weight] [real] NULL,
	[pond_id] [bigint] NULL,
 CONSTRAINT [PK__fish__3213E83FD2C4DF30] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fish_growth]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fish_growth](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[age] [bigint] NULL,
	[date] [date] NULL,
	[food_amount] [real] NULL,
	[size] [real] NULL,
	[weight] [real] NULL,
	[fish_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pond]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pond](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[depth] [real] NULL,
	[drain_count] [bigint] NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[pump_capacity] [real] NULL,
	[size] [real] NULL,
	[volume] [real] NULL,
 CONSTRAINT [PK__pond__3213E83F4DCB2449] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[img] [varchar](255) NULL,
	[link_to_buy] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [real] NULL,
	[status] [bit] NULL,
	[type] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime2](6) NULL,
	[email] [varchar](255) NULL,
	[full_name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[profile_picture] [varchar](255) NULL,
	[role] [bit] NULL,
	[status] [bit] NULL,
	[username] [varchar](255) NULL,
 CONSTRAINT [PK__users__B9BE370FB61D4EDB] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[water_parameter]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[water_parameter](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[measurement_date] [datetime2](6) NULL,
	[no2] [float] NULL,
	[no3] [float] NULL,
	[o2] [float] NULL,
	[ph] [float] NULL,
	[po4] [float] NULL,
	[salinity] [float] NULL,
	[temperature] [float] NULL,
	[pond_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[water_quality]    Script Date: 11/22/2024 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[water_quality](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[mucdo_oxygen] [real] NULL,
	[mucdo_ph] [real] NULL,
	[nhietdo] [real] NULL,
	[pond_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[fish] ON 

INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (5, 25, N'Thân dài, cân đối, vảy mịn', N'Màu trắng với các mảng đỏ', 0, N'/images/thumb_5_2024-11-22T13_17_04.662761700', N'Koi Kohaku', N'Nhật Bản', 2500000, 80, 10, 5)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (6, 25, N'Cơ thể trắng với các đốm đỏ và đen', N'Sanke (trắng, đỏ, đen)', 1, N'/images/thumb_6_2024-11-22T13_18_10.038956200', N'Taisho Sanke', N'Nhật Bản', 2700000, 80, 9, 6)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (7, 26, N'Nền đen kết hợp các mảng màu đỏ, trắng hoặc vàng', N'Hi Utsuri (đen-đỏ), Shiro Utsuri (đen-trắng), Ki Utsuri (đen-vàng)', 1, N'/images/thumb_7_2024-11-22T13_20_06.708983600', N'Showa Sanshoku', N'Nhật Bản', 1200000, 70, 7, 8)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (8, 23, N'Nền trắng, vàng hoặc đỏ với các đốm đen', N'Shiro Bekko', 0, N'/images/thumb_8_2024-11-22T13_21_47.841112100', N'Bekko', N'Nhật Bản', 1000000, 60, 6, 7)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (9, 28, N'Màu xanh lam, bụng trắng, đôi khi có cam ở vây và bụng', N'Asagi truyền thống', 0, N'/images/thumb_9_2024-11-22T13_23_19.241051800', N'Asagi', N'Nhật Bản', 2800000, 75, 10, 8)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (10, 25, N'Không có vảy, màu xanh lam với dải vảy dọc theo lưng', N'Biến thể của Asagi', 1, N'/images/thumb_10_2024-11-22T13_25_04.428597200', N'Shusui', N'Nhật Bản', 3000000, 70, 8, 8)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (11, 20, N'Thân trắng, có một đốm đỏ duy nhất trên đầu', N'Tancho Kohaku, Tancho Sanke', 1, N'/images/thumb_11_2024-11-22T13_26_40.487744600', N'Tancho', N'Nhật Bản', 6000000, 50, 5, 7)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (12, 21, N'Nền trắng với các mảng đỏ phủ bởi lớp viền xanh hoặc đen tạo thành hoa văn', N'Ai Goromo (viền xanh), Sumi Goromo (viền đen), Budo Goromo (giống như chùm nho)', 0, N'/images/thumb_12_2024-11-22T13_28_12.168370700', N'Goromo', N'Nhật Bản', 5600000, 55, 6, 6)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (13, 25, N' Thân đơn sắc, có ánh kim', N'Platinum (trắng ánh kim)', 1, N'/images/thumb_13_2024-11-22T13_29_55.942300900', N'Hikarimuji', N'Nhật Bản', 2100000, 60, 7, 5)
INSERT [dbo].[fish] ([id], [age], [body_shape], [breed], [gender], [image], [name], [origin], [price], [size], [weight], [pond_id]) VALUES (14, 22, N'Mảng màu đỏ (Kanoko) có họa tiết giống như đốm da hươu', N'Kanoko Kohaku, Kanoko Sanke', 0, N'/images/thumb_14_2024-11-22T13_32_09.343756500', N'Kanoko Koi', N'Nhật Bản', 1000000, 53, 5, 8)
SET IDENTITY_INSERT [dbo].[fish] OFF
GO
SET IDENTITY_INSERT [dbo].[pond] ON 

INSERT [dbo].[pond] ([id], [depth], [drain_count], [image], [name], [pump_capacity], [size], [volume]) VALUES (5, 2, 4, N'/images/thumb_5_2024-11-22T13_12_10.604157700', N'Thiên Mộc', 2000, 24, 36)
INSERT [dbo].[pond] ([id], [depth], [drain_count], [image], [name], [pump_capacity], [size], [volume]) VALUES (6, 2, 3, N'/images/thumb_6_2024-11-22T13_14_17.703288500', N'Huyền Thanh', 1200, 15, 18)
INSERT [dbo].[pond] ([id], [depth], [drain_count], [image], [name], [pump_capacity], [size], [volume]) VALUES (7, 2, 1, N'/images/thumb_7_2024-11-22T13_14_56.841873600', N'Ngân Sắc', 2500, 35, 53)
INSERT [dbo].[pond] ([id], [depth], [drain_count], [image], [name], [pump_capacity], [size], [volume]) VALUES (8, 2, 1, N'/images/thumb_8_2024-11-22T13_15_30.052106600', N'Hoàng Kim', 3000, 36, 65)
SET IDENTITY_INSERT [dbo].[pond] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (8, N'/images/thumb_8_2024-11-22T18_35_06.680125900', N'https://shopee.vn/minh_tamtv?categoryId=100631&entryPoint=ShopByPDP&itemId=14208604506', N'Thức ăn Hikari Saki-Hikari Color', 900000, NULL, N'Điều trị sức khoẻ')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (9, N'/images/thumb_9_2024-11-22T18_36_10.013841100', N'https://shopee.vn/minh_tamtv?categoryId=100631&entryPoint=ShopByPDP&itemId=14208604506', N'Thức ăn Tetra Koi Vibrance', 620000, NULL, N'Điều trị sức khoẻ')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (11, N'/images/thumb_11_2024-11-22T18_55_25.192409600', N'https://shopee.vn/minh_tamtv?categoryId=100631&entryPoint=ShopByPDP&itemId=14208604506', N'Thức ăn Aqua master', 910000, NULL, N'Điều trị sức khoẻ')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (12, N'/images/thumb_12_2024-11-22T18_59_45.690069800', N'https://shopee.vn/namaquatools?categoryId=100631&entryPoint=ShopByPDP&itemId=5100277442&upstream=search', N'SunSun HW-3000', 1800000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (13, N'/images/thumb_13_2024-11-22T19_01_47.409798600', N'https://shopee.vn/hiromastore?categoryId=100631&entryPoint=ShopByPDP&itemId=29301226588&upstream=search', N'Máy sục sủi bơm khí oxy RESUN', 700000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (14, N'/images/thumb_14_2024-11-22T19_04_12.022120100', N'https://shopee.vn/auzola?categoryId=100631&entryPoint=ShopByPDP&itemId=2616661642&upstream=search', N'Máy bơm sủi khí 6 vòi sủi 25W/ 30W/ 45W Hailea ACO-208, ACO-308, ACO-318', 500000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (15, N'/images/thumb_15_2024-11-22T19_06_57.699091', N'https://thuysinh4u.com/seachem-prime', N'Dung dịch khử độc nước hồ cá Seachem Prime', 280000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (16, N'/images/thumb_16_2024-11-22T19_08_22.098941900', N'https://thuysinh4u.com/melafix-api', N'Thuốc API Melafix xử lý bệnh nấm, sát khuẩn và trị ký sinh trùng cá cảnh', 170000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (17, N'/images/thumb_17_2024-11-22T19_09_30.066931800', N'https://thuysinh4u.com/vi-sinh-seachem-stability', N'Vi sinh Seachem Stability tái tạo hệ vi sinh hiệu quả', 140000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (18, N'/images/thumb_18_2024-11-22T19_11_09.787409200', N'https://shrimphome.vn/bo-api-ammonia-nh3-nh4-test-kit', N'Bộ API Ammonia Nh3/Nh4 test kit', 310000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (19, N'/images/thumb_19_2024-11-22T19_14_08.556526700', N'https://www.apifishcare.com/product/freshwater-master-test-kit', N'Bộ kiểm tra chất lượng nước Api Freshwater Master Test Kit', 690000, NULL, N'Thông số nước')
INSERT [dbo].[product] ([id], [img], [link_to_buy], [name], [price], [status], [type]) VALUES (20, N'/images/thumb_20_2024-11-22T19_21_43.806618500', N'https://becahoanggia.vn/san-pham/may-ve-sinh-hut-can-ho-ca-koi-oase-pondovac-4', N'MÁY VỆ SINH HÚT CẶN HỒ CÁ KOI OASE-PONDOVAC 4', 1130000, NULL, N'Thông số nước')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [created_at], [email], [full_name], [password], [profile_picture], [role], [status], [username]) VALUES (1, NULL, N'admin@gmail.com', N'admin', N'$2a$12$wzV1DR.gqvjMakaas7SPAufdl49XATUZ7V.VPzA2djUMRrDxzIr8C', NULL, 1, 1, N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[water_parameter] ON 

INSERT [dbo].[water_parameter] ([id], [measurement_date], [no2], [no3], [o2], [ph], [po4], [salinity], [temperature], [pond_id]) VALUES (2, NULL, 0.1, 0.1, 7, 7, 0.1, 0.4, 23, 5)
INSERT [dbo].[water_parameter] ([id], [measurement_date], [no2], [no3], [o2], [ph], [po4], [salinity], [temperature], [pond_id]) VALUES (3, NULL, 0.1, 0.1, 8, 7, 0.1, 0.5, 24, 6)
INSERT [dbo].[water_parameter] ([id], [measurement_date], [no2], [no3], [o2], [ph], [po4], [salinity], [temperature], [pond_id]) VALUES (4, NULL, 0.1, 0.1, 9, 7, 0.1, 0.6, 25, 7)
INSERT [dbo].[water_parameter] ([id], [measurement_date], [no2], [no3], [o2], [ph], [po4], [salinity], [temperature], [pond_id]) VALUES (5, NULL, 0.1, 0.1, 9, 7, 0.1, 0.7, 27, 8)
SET IDENTITY_INSERT [dbo].[water_parameter] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKjmivyxk9rmgysrmsqw15lqr5b]    Script Date: 11/22/2024 9:28:27 PM ******/
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [UKjmivyxk9rmgysrmsqw15lqr5b] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKr43af9ap4edm43mmtq01oddj6]    Script Date: 11/22/2024 9:28:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKr43af9ap4edm43mmtq01oddj6] ON [dbo].[users]
(
	[username] ASC
)
WHERE ([username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[fish]  WITH CHECK ADD  CONSTRAINT [FKlta3uf54qalefalalraksyk9p] FOREIGN KEY([pond_id])
REFERENCES [dbo].[pond] ([id])
GO
ALTER TABLE [dbo].[fish] CHECK CONSTRAINT [FKlta3uf54qalefalalraksyk9p]
GO
ALTER TABLE [dbo].[fish_growth]  WITH CHECK ADD  CONSTRAINT [FKml702jy5e2ch3d7qmhrlvaido] FOREIGN KEY([fish_id])
REFERENCES [dbo].[fish] ([id])
GO
ALTER TABLE [dbo].[fish_growth] CHECK CONSTRAINT [FKml702jy5e2ch3d7qmhrlvaido]
GO
ALTER TABLE [dbo].[water_parameter]  WITH CHECK ADD  CONSTRAINT [FKd10ld9glyded0bqj07vksmsj5] FOREIGN KEY([pond_id])
REFERENCES [dbo].[pond] ([id])
GO
ALTER TABLE [dbo].[water_parameter] CHECK CONSTRAINT [FKd10ld9glyded0bqj07vksmsj5]
GO
ALTER TABLE [dbo].[water_quality]  WITH CHECK ADD  CONSTRAINT [FKi8s3x9wsgg5wkc53k5va4p31g] FOREIGN KEY([pond_id])
REFERENCES [dbo].[pond] ([id])
GO
ALTER TABLE [dbo].[water_quality] CHECK CONSTRAINT [FKi8s3x9wsgg5wkc53k5va4p31g]
GO
USE [master]
GO
ALTER DATABASE [KoiFish] SET  READ_WRITE 
GO
