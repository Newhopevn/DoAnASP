USE [master]
GO
/****** Object:  Database [QLXe]    Script Date: 3/31/2024 9:00:35 AM ******/
CREATE DATABASE [QLXe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLXe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLXe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLXe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLXe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLXe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLXe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLXe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLXe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLXe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLXe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLXe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLXe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLXe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLXe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLXe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLXe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLXe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLXe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLXe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLXe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLXe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLXe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLXe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLXe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLXe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLXe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLXe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLXe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLXe] SET RECOVERY FULL 
GO
ALTER DATABASE [QLXe] SET  MULTI_USER 
GO
ALTER DATABASE [QLXe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLXe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLXe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLXe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLXe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLXe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLXe', N'ON'
GO
ALTER DATABASE [QLXe] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLXe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLXe]
GO
/****** Object:  Table [dbo].[CTDatHang]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDatHang](
	[MaXe] [int] NOT NULL,
	[SoDH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Dongia] [decimal](12, 2) NULL,
	[Thanhtien] [decimal](12, 2) NULL,
 CONSTRAINT [IX_CTDatHang] UNIQUE CLUSTERED 
(
	[MaXe] ASC,
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [datetime] NULL,
	[Trigia] [decimal](12, 2) NULL,
	[Dagiao] [bit] NULL,
	[Ngaygiao] [datetime] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongXe]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongXe](
	[MaDongXe] [int] IDENTITY(1,1) NOT NULL,
	[TenDongXe] [nvarchar](100) NULL,
 CONSTRAINT [PK_DongXe] PRIMARY KEY CLUSTERED 
(
	[MaDongXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[Diachi] [nvarchar](150) NULL,
	[SDT] [nvarchar](15) NULL,
	[Matkhau] [nvarchar](15) NULL,
	[Ngaysinh] [date] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe]    Script Date: 3/31/2024 9:00:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[MaXe] [int] IDENTITY(1,1) NOT NULL,
	[TenXe] [nvarchar](100) NULL,
	[AnhBia] [nvarchar](100) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluotxem] [int] NULL,
	[MaDongXe] [int] NULL,
	[MaNSX] [int] NULL,
	[Mota] [nvarchar](max) NULL,
	[Dongia] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DongXe] ON 

INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe]) VALUES (1, N'Xe tay ga')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe]) VALUES (2, N'Xe số')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe]) VALUES (3, N'Xe côn tay')
INSERT [dbo].[DongXe] ([MaDongXe], [TenDongXe]) VALUES (4, N'Xe thể thao')
SET IDENTITY_INSERT [dbo].[DongXe] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [Diachi], [SDT], [Matkhau], [Ngaysinh], [Email]) VALUES (1, N'tan', N'HCM', N'0932196522', N'123', CAST(N'2004-04-09' AS Date), N'nguyebuiquoctanpro@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (1, N'Yamaha')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (2, N'Honda')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (3, N'kawasaki')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[Xe] ON 

INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (1, N'R15 V4', N'R15.jpg', CAST(N'2024-03-28T00:00:00.000' AS DateTime), 0, 3, 1, N'Thiết kế đậm chất R-ADN
Yamaha R15V4 sở hữu thiết kế R-ADN đậm chất thể thao và tính khí động học mang đến trải nghiệm lái tuyệt vời ở tốc độ cao.', CAST(86000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (2, N'Vario 160', N'vario.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 1, 2, N'Lần đầu tiên được Honda Việt Nam giới thiệu, với thiết kế của mẫu xe ga thể thao độc đáo, năng động và linh hoạt trên từng cung đường, động cơ eSP+ 4 van 160cc đầy uy lực cùng những tiện ích vượt trội; Vario 160 hứa hẹn sẽ mang lại những trải nghiêm vô cùng ấn tượng cho khách hàng luôn sống hết mình với đam mê.', CAST(52400000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (3, N'Air Blade 160/125', N'AirBlade.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 1, 2, N'NULLXứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', CAST(42000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (4, N'EXCITER 155 VVA PHIÊN BẢN CAO CẤP ABS MỚI', N'Excite.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 3, 1, N'Yamaha Exciter mới được thiết kế theo xu hướng những mẫu xe phân khối lớn Sport Bike.
Yamaha Exciter 150 mới có thiết kế tổng thể có các kích thước dài x rộng x cao là 1.985 x 670 x 1.100 mm (dài hơn phiên bản cũ 15 mm và cao hơn 20 mm).
Ngoài ra, khoảng sáng gầm cũng được thêm vào 20 mm lên thành 155 mm, chiều cao yên cũng được tăng lên thành 795 mm (tăng 15 mm), trọng lượng của Exciter tăng thêm 2 kg so với thế hệ trước là 117 kg.', CAST(54000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (5, N'CBR1000RR-R Fireblade SP', N'CBR1000.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 4, 2, N'ĐƯỜNG ĐUA LÀ SÂN CHƠI CỦA BẠN Nơi bạn sống thực với đam mê CBR1000RR-R Fireblade SP được trang bị hệ thống giảm xóc Smart Electronic Control (S-EC) thế hệ 2 và cụm phanh Brembo Stylema trên phanh trước. Với khả năng vận hành vượt trội, CBR1000RR-R Fireblade SP là món quà đắt giá nhất của Honda dành tặng cho các tín đồ tốc độ. HÃY TẬN HƯỞNG !!!', CAST(1050000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (6, N'NINJA H2 CARBON', N'ninjaH2.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 4, 3, N'NULLNinja H2 đem sức mạnh vô song của cỗ máy Siêu nạp đến đường phố. Rạng danh bởi khối động cơ Siêu nạp 998 cm³ 4 xi-lanh thẳng hàng, cùng các công nghệ tiên tiến nhất và hệ thống phanh Brembo thế hệ mới, Ninja H2 mang lại một hiệu suất đáng kinh ngạc trên những con đường.', CAST(1370000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (7, N'Winner X 2024', N'winer.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 3, 2, N'WINNER X 2024 mới tiếp tục khẳng định chất riêng khác biệt hướng tới hình ảnh một mẫu siêu mô tô thể thao cỡ nhỏ hàng đầu tại Việt Nam. Thiết kế ngoại quan bắt mắt, kết hợp những trang bị hiện đại như trên các mẫu xe phân khối lớn, WINNER X 2024 sẵn sàng cùng các tay lái bứt tốc trên mọi hành trình khám phá.', CAST(46160000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (8, N'Future 125 FI', N'FUTURE.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 2, 2, N'Honda Future 125 FI có thiết kế sang trọng, trẻ trung, lịch lãm và hiện đại với phối màu mới tạo những điểm nhấn ấn tượng, thu hút mọi ánh nhìn. Cùng với vị thế là mẫu xe số cao cấp hàng đầu phân khúc tại Việt Nam, Future 125 FI cho bạn tự tin thể hiện phong cách, phẩm chất của mình trên mọi hành trình.', CAST(30524000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (9, N'SIRIUS FI PHIÊN BẢN VÀNH ĐÚC MÀU HOÀN TOÀN MỚI', N'SiriusFI.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 2, 1, N'Nhờ trang bị hệ thống phun xăng điện tử FI, Yamaha Sirius FI có mức tiêu thụ nhiên liệu chỉ 1,57 lít/100km. 

Cùng với Jupiter FI, Sirius FI là chiếc xe số tiết kiệm xăng số 1 Việt Nam theo số liệu thống kê và phân tích được Cục Đăng kiểm Việt Nam công bố, xác nhận bởi Báo Giao thông.', CAST(2395000.00 AS Decimal(12, 2)))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [AnhBia], [Ngaycapnhat], [Soluotxem], [MaDongXe], [MaNSX], [Mota], [Dongia]) VALUES (10, N'GRANDE PHIÊN BẢN GIỚI HẠN MÀU MỚI HOÀN TOÀN MỚI', N'Grande.jpg', CAST(N'2024-03-31T00:00:00.000' AS DateTime), 0, 1, 1, N'Yamaha Grande là mẫu xe tay ga tiết kiệm xăng số 1 Việt Nam với mức tiêu thụ chỉ 1,69 lít/100km, theo số liệu thống kê và phân tích được Cục Đăng kiểm Việt Nam công bố, xác nhận bởi Báo Giao thông. Bên cạnh thiết kế thời trang và thanh lịch, phiên bản Grande Bluecore Hybrid mới còn sở hữu cốp xe siêu rộng 27 lít và được trang bị hàng loạt tính năng hiện đại như trợ lực Hybrid, Smart key, hệ thống Stop & Start System, phanh ABS,.. với mức giá rất hấp dẫn.



Hứa hẹn trở thành một trong những mẫu xe ga đáng mua nhất thị trường, Yamaha cho ra mắt dòng Grande Hybrid phiên bản giới hạn với hệ thống phanh ABS đáng mơ ước. Mức giá cho chiếc xe giới hạn này là 50 triệu đồng với 4 màu cơ bản lựa chọn: Cam, trắng, đen, xám. Đi kèm đó là ngoại hình đẳng cấp Châu Âu tinh tế, sang trọng miễn chê.', CAST(51500000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Xe] OFF
GO
/****** Object:  Index [PK_CTDatHang]    Script Date: 3/31/2024 9:00:36 AM ******/
ALTER TABLE [dbo].[CTDatHang] ADD  CONSTRAINT [PK_CTDatHang] PRIMARY KEY NONCLUSTERED 
(
	[MaXe] ASC,
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_CTDatHang_1]    Script Date: 3/31/2024 9:00:36 AM ******/
CREATE NONCLUSTERED INDEX [PK_CTDatHang_1] ON [dbo].[CTDatHang]
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDatHang_DonDatHang] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DonDatHang] ([SoDH])
GO
ALTER TABLE [dbo].[CTDatHang] CHECK CONSTRAINT [FK_CTDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[CTDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDatHang_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[CTDatHang] CHECK CONSTRAINT [FK_CTDatHang_Xe]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_DongXe] FOREIGN KEY([MaDongXe])
REFERENCES [dbo].[DongXe] ([MaDongXe])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_DongXe]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_NhaSanXuat]
GO
USE [master]
GO
ALTER DATABASE [QLXe] SET  READ_WRITE 
GO
