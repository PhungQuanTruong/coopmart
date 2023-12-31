USE [master]
GO
/****** Object:  Database [nodejs]    Script Date: 12/6/2021 11:50:36 PM ******/
CREATE DATABASE [nodejs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nodejs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PHUNGQUANTRUONG\MSSQL\DATA\nodejs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nodejs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PHUNGQUANTRUONG\MSSQL\DATA\nodejs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [nodejs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nodejs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nodejs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nodejs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nodejs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nodejs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nodejs] SET ARITHABORT OFF 
GO
ALTER DATABASE [nodejs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nodejs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nodejs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nodejs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nodejs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nodejs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nodejs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nodejs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nodejs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nodejs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [nodejs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nodejs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nodejs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nodejs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nodejs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nodejs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nodejs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nodejs] SET RECOVERY FULL 
GO
ALTER DATABASE [nodejs] SET  MULTI_USER 
GO
ALTER DATABASE [nodejs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nodejs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nodejs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nodejs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nodejs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [nodejs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'nodejs', N'ON'
GO
ALTER DATABASE [nodejs] SET QUERY_STORE = OFF
GO
USE [nodejs]
GO
/****** Object:  Table [dbo].[CONTENT]    Script Date: 12/6/2021 11:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTENT](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductName] [varchar](500) NULL,
	[ProductPrice] [numeric](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[catId] [numeric](18, 0) NULL,
 CONSTRAINT [PK_CONTENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 12/6/2021 11:50:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NULL,
	[pass] [nchar](30) NULL,
	[fullname] [nchar](50) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CONTENT] ON 

INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(1 AS Numeric(18, 0)), N'1.jpg', N'Casio GTS', CAST(30 AS Numeric(18, 0)), N'Là 1 sản phẩm Đồng hồ Casio Nam Nhật Bản, thương hiệu đã được khẳng định về chất lượng với giá thành vô cùng hợp lý. Bello là đối tác chính thức của Casio tại Việt Nam từ 2009. Mua Casio đến Bello!', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(2 AS Numeric(18, 0)), N'oppo.jpg', N'Oppo Reno6', CAST(1000 AS Numeric(18, 0)), N'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “siêu phẩm" mà bạn không thể bỏ qua.', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(3 AS Numeric(18, 0)), N'3.jpg', N'Tissot T5', CAST(40 AS Numeric(18, 0)), N'Là 1 sản phẩm Đồng hồ Casio Edifice Nhật Bản, phong cách lịch lãm, trẻ trung, tốc độ và thông minh. Bello là đối tác chính thức của Casio Edifice tại Việt Nam từ 2009. Mua Casio Edifice đến Bello!', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(4 AS Numeric(18, 0)), N'4.jpg', N'Casio GST 2.0', CAST(20 AS Numeric(18, 0)), N'Mặt đồng hồ có đường kính 35mm và vỏ lớn, đem đến vẻ mạnh mẽ và quyền năng.
Vòng mặt số và các vạch giờ nổi tạo độ sâu ba chiều, đem đến cho mặt đồng hồ nhiều đặc tính.
Thiết kế mặt đồng hồ ba mặt số phổ biến của G-SHOCK kết hợp một mặt số kim ở giữa với các mặt số kỹ thuật số ở hai bên.', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(5 AS Numeric(18, 0)), N'butket.jpg', N'Bucket nâu', CAST(5 AS Numeric(18, 0)), N'• Mũ tròn không vành phong cách Retro cho nam cựcchất Boo với thiết kế nón thích hợp cho bạn đi làm,dạo phố, shopping, dulịch hay hẹn hò bên người yêu…', CAST(8 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(6 AS Numeric(18, 0)), N'6.jpg', N'Vali kéo', CAST(20 AS Numeric(18, 0)), N'Combo Vali Dulcie LS1158 được hoàn thiện bởi chất liệu nhựa PP có khả năng chống bể vỡ tối ưu và hạn chế trầy xước bề mặt do tác động ngoại lực tốt hơn so với các chất liệu nhựa thông thường khác. Combo Vali Dulcie LS1158 gồm 2 size 20 inch và 24inch thoải mái chứa đựng mọi vật dụng cần thiết cho chuyến đi dù dài hay ngắn ngày với sức chứa khủng lên đến 32kg.', CAST(9 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(7 AS Numeric(18, 0)), N'ip11.jpg', N'iphone 11', CAST(1000 AS Numeric(18, 0)), N'iPhone 11 Pro 256GB cũ có thiết kế thời thượng, màn hình rộng 5.8 inch, hiệu năng mạnh mẽ với chip A13 Bionic, dung lượng 256GB dư sức lưu trữ. Đồng thời camera vuông phía sau máy cũng gây ấn tượng mạnh cho người dùng.', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(8 AS Numeric(18, 0)), N'VERTU-SIGNATURE-S.jpg', N'Vertu signature-S', CAST(100000 AS Numeric(18, 0)), N'Vertu Signature S Rose Gold-Vàng Hồng nguyên khối

Dòng Vertu Signature luôn là nguồn cảm hứng bất tận cho các doanh nhân thành đạt khi họ hướng tới quyết định sắm cho mình một món đồ để đánh dấu những thành tựu mà họ đạt được. Trong đó, Vertu Signature S Rose Gold-Vàng Hồng nguyên khối được xem như một quy chuẩn hoàn hảo trong dòng điện thoại siêu sang này. Cùng EU Luxury khám phá những giá trị ẩn sâu bên trong kiệt tác này nhé!', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(9 AS Numeric(18, 0)), N'9.jpg', N'G-Shock GX3', CAST(500 AS Numeric(18, 0)), N'Là 1 sản phẩm Đồng hồ G-Shock Nhật Bản chuyên chống va đập, chống nước tối thiểu 200m, wr20bar. Đặc biệt BẢO HÀNH 5 NĂM TOÀN QUỐC! Bello là đối tác chính thức của Casio G-Shock tại Việt Nam từ 2009. Mua G-Shock đến Bello!', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(10 AS Numeric(18, 0)), N'macbook.jpg', N'Macbook air', CAST(2000 AS Numeric(18, 0)), N'Máy sẽ mang kiểu dáng được Apple tái thiết kế lại cho dòng MacBook Pro năm 2021. MacBook Pro 14 inch 2021 sẽ được làm phẳng tối giản ở các cạnh nhằm tạo vẻ hiện đại cho máy.

Đặc biệt, máy sẽ được trang bị khe cắm thẻ SDXC. Đây chính là điểm ưu đối với các nhiếp ảnh gia hoặc người dùng không chuộng cổng USB-C để sao lưu dữ liệu.', CAST(5 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(11 AS Numeric(18, 0)), N'hp.jpg', N'HP Pavilion', CAST(1500 AS Numeric(18, 0)), N'Mỏng nhẹ là yếu tố quan trọng đối với các dòng laptop văn phòng. Với laptop HP 15-HP 15 T-DW300 1A3Y3AV, không chỉ sở hữu một thiết kế mỏng nhẹ, laptop còn được trang bị một cấu hình ổn định mang lại khả năng xử lý công việc nhanh chóng', CAST(5 AS Numeric(18, 0)))
INSERT [dbo].[CONTENT] ([id], [ProductImage], [ProductName], [ProductPrice], [MoTa], [catId]) VALUES (CAST(12 AS Numeric(18, 0)), N'hpgaming.jpg', N'HP-Gaming', CAST(1500 AS Numeric(18, 0)), N'Không giống những mẫu laptop chuyên chơi game trên thị trường, sản phẩm laptop HP Victus 16-e0175AX 4R0U8PA phối hợp hài hòa giữa ngoại hình lịch lãm cùng hiệu năng vượt trội nhằm mang đến trải nghiệm chiến game tuyệt vời và tiện lợi dành cho bạn.', CAST(5 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[CONTENT] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [name], [pass], [fullname]) VALUES (1, N'phungquantruong                                   ', N'123                           ', N'Quan Truong                                       ')
INSERT [dbo].[USERS] ([id], [name], [pass], [fullname]) VALUES (2, N'nguyenthinhubinh                                  ', N'456                           ', N'Nhu Binh                                          ')
INSERT [dbo].[USERS] ([id], [name], [pass], [fullname]) VALUES (12, N'nguyenminhtam                                     ', N'789                           ', N'Minh Tam                                          ')
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
USE [master]
GO
ALTER DATABASE [nodejs] SET  READ_WRITE 
GO
