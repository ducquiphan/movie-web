USE [master]
GO
/****** Object:  Database [Java4]    Script Date: 10/26/2023 3:30:37 PM ******/
CREATE DATABASE [Java4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Java4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Java4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Java4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Java4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Java4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Java4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Java4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Java4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Java4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Java4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Java4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Java4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Java4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Java4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Java4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Java4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Java4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Java4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Java4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Java4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Java4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Java4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Java4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Java4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Java4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Java4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Java4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Java4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Java4] SET RECOVERY FULL 
GO
ALTER DATABASE [Java4] SET  MULTI_USER 
GO
ALTER DATABASE [Java4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Java4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Java4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Java4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Java4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Java4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Java4', N'ON'
GO
ALTER DATABASE [Java4] SET QUERY_STORE = OFF
GO
USE [Java4]
GO
/****** Object:  Table [dbo].[history]    Script Date: 10/26/2023 3:30:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewDate] [datetime] NOT NULL,
	[isLiked] [bit] NOT NULL,
	[likedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/26/2023 3:30:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 10/26/2023 3:30:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[video] [varchar](100) NOT NULL,
	[poster] [varchar](255) NOT NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (1, 1, 1, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 1, CAST(N'2023-08-09T13:58:48.693' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (2, 1, 2, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 1, CAST(N'2023-08-09T13:58:40.750' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (3, 1, 3, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (4, 1, 4, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (5, 2, 5, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 1, CAST(N'2023-08-08T04:30:11.660' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (6, 4, 6, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 1, CAST(N'2023-08-08T04:30:11.660' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (7, 4, 7, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 1, CAST(N'2023-08-08T04:30:11.660' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (8, 3, 8, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (9, 3, 9, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (10, 3, 10, CAST(N'2023-08-08T04:30:11.660' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (11, 3, 1, CAST(N'2023-08-08T04:30:46.373' AS DateTime), 1, CAST(N'2023-08-09T00:59:07.870' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (13, 3, 2, CAST(N'2023-08-08T05:21:41.577' AS DateTime), 1, CAST(N'2023-08-09T01:02:27.647' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (14, 3, 4, CAST(N'2023-08-08T22:35:38.203' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (15, 3, 5, CAST(N'2023-08-08T22:37:42.577' AS DateTime), 1, CAST(N'2023-08-08T23:52:10.353' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (16, 3, 3, CAST(N'2023-08-08T22:49:46.127' AS DateTime), 1, CAST(N'2023-08-08T23:52:06.637' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (17, 3, 6, CAST(N'2023-08-08T22:49:46.197' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (18, 3, 7, CAST(N'2023-08-08T22:49:46.210' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (19, 3, 11, CAST(N'2023-08-08T22:49:46.240' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (20, 3, 12, CAST(N'2023-08-08T22:49:46.260' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (21, 3, 13, CAST(N'2023-08-08T22:49:46.287' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (22, 3, 14, CAST(N'2023-08-08T22:49:46.310' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (23, 1, 5, CAST(N'2023-08-09T02:54:15.957' AS DateTime), 1, CAST(N'2023-08-09T15:00:27.013' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (24, 1, 14, CAST(N'2023-08-09T14:02:27.367' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (25, 1, 13, CAST(N'2023-08-09T14:10:08.233' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (26, 1, 6, CAST(N'2023-08-09T14:25:26.910' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewDate], [isLiked], [likedDate]) VALUES (27, 1, 10, CAST(N'2023-08-09T14:27:54.303' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (1, N'admin1', N'123', N'ducpqps25526@fpt.edu.vn', 1, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (2, N'admin2', N'123', N'danhthps25468@fpt.edu.vn', 1, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (3, N'user1', N'123', N'ducquiphan@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (4, N'user2', N'123', N'phanquiduc102@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (5, N'user3', N'123', N'phanquiduc000@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (14, N'phanquiduc', N'Quiduc123', N'phanquiduc@gmail.com', 0, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (16, N'ducphan', N'123', N'phanquiduc111@gmail.com', 0, 0)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (1, N'The Ring', N'yybjV3U68wc', N'https://wallpapercave.com/wp/wp4703013.jpg', 0, 0, N'Vòng tròn định mệnh là tựa đề tiếng Việt của bộ phim Mỹ có tên The ring, đây là một bộ phim kinh dị tâm linh sản xuất năm 2002, được làm lại từ phim Ring của Nhật Bản năm 1998 (hay còn gọi là Ringu). Cả hai bộ phim đều dựa theo cuốn tiểu thuyết Ring - Vòng tròn ác nghiệt của Koji Suzuki. Bộ phim được đạo diễn bởi Gore Verbinski với các diễn viên chính Naomi Watts và Martin Henderson. Bộ phim xếp thứ 20 trong top 100 khoảnh khắc kinh dị nhất mọi thời đại của kênh truyền hình cáp Bravo.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (2, N'Insidious 1', N'zuZnRUcoWos', N'https://wallpapers.com/images/high/insidious-dalton-poster-oxc8bz0d41bhgrd5.webp', 1, 0, N'Insidious là phim kinh dị siêu nhiên Mỹ - Canada năm 2010 do James Wan đạo diễn, Leigh Whannell viết kịch bản, diễn viên gồm Patrick Wilson, Rose Byrne và Barbara Hershey. Đây là phần phim đầu tiên (theo thứ tự thời gian, lần thứ ba) trong loạt phim Insidious. Câu chuyện xoay quanh cặp vợ chồng có con trai không hiểu sao đi vào tình trạng hôn mê và trở thành một vật chứa cho hồn ma trong một không gian tâm linh muốn cư ngụ cơ thể của mình, để sống một lần nữa.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (3, N'Annabelle', N'paFgQNPGlsg0', N'https://vincentloy.files.wordpress.com/2014/10/indiatv518aee_annabelle123456.jpg', 1, 0, N'Annabelle là một bộ phim theo thể loại kinh dị siêu nhiên được Hoa Kỳ sản xuất vào năm 2014. Phim do John R. Leonetti đạo diễn, cùng phần sản xuất và viết kịch bản lần lượt được thực hiện bởi James Wan, và Gary Dauberman. Đây vừa là phần tiếp theo, vừa là bộ phim nhỏ trích từ The Conjuring (2013).[7] Bộ phim có sự góp mặt của Annabelle Wallis, Ward Horton, và Alfre Woodard.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (4, N'Insidious chapter 2', N'5hvNMXh1GWw', N'https://wallpapers.com/images/high/insidious-chapter-2-poster-eul1lj0ao4tlxwse.webp', 1, 0, N'Quỷ quyệt 2 (nhan đề gốc tiếng Anh: Insidious: Chapter 2) là phim kinh dị Mỹ do James Wan làm đạo diễn và được ra mắt vào năm 2013. Phim là phần nối tiếp phần 1 đã ra mắt từ năm 2011 dưới nhan đề Quỷ quyệt (nhan đề gốc tiếng Anh: Insidious). Phim có sự tham gia diễn xuất của Patrick Wilson và Rose Byrne vẫn trong vai cặp vợ chồng hàng ngày đối mặt với sự phá rối của các linh hồn người chết. Phim công chiếu ngày 13 tháng 9 năm 2013 và giành được thành công lớn về thương mại, thu về trên 128 triệu đô la Mỹ trên toàn thế giới, gấp gần hai mươi sáu lần chi phí sản xuất.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (5, N'The Conjuring', N'k10ETZ41q5o', N'https://wallpapercave.com/wp/wp1922359.jpg', 2, 0, N'Ám ảnh kinh hoàng (tựa tiếng Anh: The Conjuring) là một bộ phim kinh dị siêu nhiên của điện ảnh Hoa Kỳ công chiếu vào năm 2013 do James Wan làm đạo diễn. Hai diễn viên Vera Farmiga và Patrick Wilson vào vai Ed và Lorraine Warren, họ là những nhà điều tra các hiện tượng siêu nhiên xảy ra trên nước Mỹ. Những báo cáo của họ còn truyền cảm hứng cho cuốn tiểu thuyết Amityville Horror. Trong phim hai vợ chồng Warren là những người điều tra các hiện tượng siêu nhiên, họ đến để hỗ trợ gia đình Perron (Ron Livingston và Lili Taylor) đang trải qua các sự kiện ngày càng đáng lo ngại trong trang trại của họ ở Harrisville, Rhode Island vào năm 1971.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (6, N'The Conjuring 2', N'VFsmuRPClr4', N'https://wallpapercave.com/wp/wp1851136.jpg', 2, 0, N'Ám ảnh kinh hoàng 2 (tựa gốc: The Conjuring 2) là bộ phim kinh dị siêu nhiên Mỹ phát hành năm 2016 của đạo diễn James Wan với kịch bản của Carey Hayes, Chad Hayes, Wan và David Leslie Johnson. Đây là phần hai của phim năm 2013, The Conjuring, với Patrick Wilson và Vera Farmiga tiếp tục thủ vai hai thám tử săn ma Ed và Lorraine Warren. Phim theo chân họ sang Anh quốc để giúp đỡ gia đình Hodgson khi họ bị tấn công bởi hàng loạt các hiện tượng ma ám được biết đến về sau dưới tên Enfield Poltergeist (hiện tượng ma ám Enfield) tại chính căn nhà của họ vào năm 1977. Phim sáng tạo dựa trên các ghi chép và tư liệu có thật.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (7, N'The Nun', N'pzD9zGcUNrw', N'https://wallpapercave.com/wp/wp7946800.jpg', 1, 0, N'Ác quỷ ma sơ (tên gốc tiếng Anh: The Nun) là phim điện ảnh kinh dị siêu nhiên của Mỹ năm 2018 do Corin Hardy đạo diễn và Gary Dauberman biên kịch, thực hiện từ cốt truyện gốc của Dauberman và James Wan.[2][3] Đây là tác phẩm spin-off của phim điện ảnh Ám ảnh kinh hoàng 2 năm 2016 và đồng thời cũng là bộ phim thứ năm của thương hiệu The Conjuring Universe. Phim có sự tham gia diễn xuất của Demián Bichir, Taissa Farmiga và Jonas Bloquet cùng với Bonnie Aarons trở lại với vai diễn Ác quỷ ma sơ, hay còn gọi là Valak, từ Ám ảnh kinh hoàng 2. Phim lấy bối cảnh tại România năm 1952, với nội dung xoay quanh một thầy tu và một nữ tu tập sự Công giáo La Mã đã phát hiện ra một bí mật kinh hoàng.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (8, N'The Nun 2', N'QF-oyCwaArU', N'https://wallpapercave.com/wp/wp3635351.jpg', 0, 0, N'Ác quỷ ma sơ 2 là bộ phim kinh dị siêu nhiên gothic của Hoa Kỳ được đạo diễn bởi Michael Chaves với kịch bản do Akela Cooper, Ian B. Goldberg và Richard Naing chấp bút dựa trên cốt truyện của Cooper và James Wan.[1] Đây sẽ là phần hậu truyện của Ác quỷ ma sơ (2018) và đồng thời là phần phim thứ chín thuộc Vũ trụ The Conjuring. Phim có sự tham gia của dàn diễn viên chính bao gồm Storm Reid, Taissa Farmiga và Anna Popplewell. Wan và Peter Safran sẽ tiếp tục trở lại với vai trò đồng sản xuất phim và Judson Scott sẽ đảm nhận vai trò nhà sản xuất phim.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (9, N'The Conjuring: Ma Xui Quỷ Khiến', N'h9Q4zZS2v1k', N'https://wallpapercave.com/wp/wp9303590.jpg', 0, 0, N'The Conjuring​: Ma xui quỷ khiến (tên gốc tiếng Anh: The Conjuring: The Devil Made Me Do It) là một bộ phim kinh dị siêu nhiên năm 2021 của Mỹ, được đạo diễn bởi Michael Chaves từ một kịch bản của David Leslie Johnson-McGoldrick. Bộ phim sẽ đóng vai trò là phần tiếp theo của Ám ảnh kinh hoàng (2013) và Ám ảnh kinh hoàng 2 (2016), và là phần thứ tám trong Vũ trụ The Conjuring. Patrick Wilson cùng Vera Farmiga sẽ trở lại vai trò của họ như các nhà điều tra và tác giả huyền bí Ed và Lorraine Warren, với James Wan và Peter Safran trở lại để hợp tác sản xuất dự án.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (10, N'Talk To Me', N'aLAKJu9aJys', N'https://wallpapercave.com/wp/wp12584127.jpg', 1, 0, N'Gọi hồn quỷ dữ: Phim xoay quanh một nhóm bạn phát hiện ra bàn tay ma quái cho phép họ triệu hồi và giao tiếp với các linh hồn bí ẩn. Họ dần bị cuốn vào trò chơi mà không hề hay biết rằng một trong số họ đã đi quá xa và giải phóng thế lực hắc ám kinh hoàng. Chỉ bằng cách nắm lấy bàn tay và nói câu thần chú đơn giản: Talk to me, nhóm bạn sẽ lần lượt được trải nghiệm cảm giác cơ thể bị chiếm đoạt bởi các vong hồn ngẫu nhiên.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (11, N'Annabelle: Tạo vật quỷ dữ', N'EjZkJa6Z-SY', N'https://wallpapercave.com/wp/wp2130023.jpg', 1, 0, N'Annabelle: Tạo vật quỷ dữ là bộ phim kinh dị siêu nhiên của Mỹ năm 2017 do David F. Sandberg đạo diễn và do Gary Dauberman viết. Đây là một phần trước của Annabelle năm 2014 và phần thứ tư trong loạt The Conjuring. Bộ phim có sự tham gia của Stephanie Sigman, Talitha Bateman, Anthony LaPaglia và Miranda Otto, và mô tả nguồn gốc của con búp bê Annabelle sở hữu.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (12, N'Annabelle: Ác quỷ trở về', N'XCpx7nEpOL4', N'https://wallpapercave.com/wp/wp4409283.jpg', 1, 0, N'Annabelle: Ác quỷ trở về (tiếng anh: Annabelle Comes Home) là một bộ phim kinh dị siêu nhiên của Mỹ năm 2019 do Gary Dauberman đạo diễn, trong tác phẩm đầu tay của ông, từ kịch bản của Dauberman và một câu chuyện của Dauberman và James Wan, người cũng đóng vai trò là nhà sản xuất với Peter Safran. Nó đóng vai trò là phần tiếp theo của Annabelle 2014 và Annabelle: Creation năm 2017, và là phần thứ bảy trong Vũ trụ kinh dị Conjuring. Phim có sự tham gia của Mckenna Grace, Madison Iseman và Katie Sarife, cùng với Patrick Wilson và Vera Farmiga, đảm nhận vai trò của họ là Ed và Lorraine Warren.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (13, N'IT Chapter 1', N'xKJmEC5ieOk', N'https://wallpapercave.com/wp/wp4722378.jpg', 2, 0, N'Chú hề ma quái (tựa tiếng Anh: It, hay còn gọi là It: Chapter One, tạm dịch: Nó: Phần Một) là một bộ phim kinh dị siêu nhiên Mỹ ra mắt năm 2017 của đạo diễn Andy Muschietti. Đây là phần đầu tiên trong kế hoạch sản xuất loạt phim It hai phần dựa trên cuốn tiểu thuyết cùng tên của nhà văn Stephen King. Nhóm biên kịch của phim gồm có Chase Palmer, Cary Fukunaga và Gary Dauberman.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (14, N'IT Chapter 2', N'xhJ5P7Up3jA', N'https://wallpapercave.com/wp/wp4326214.jpg', 2, 0, N'Gã hề ma quái 2 (tựa tiếng Anh: It Chapter Two) là một bộ phim kinh dị siêu nhiên năm 2019 của Mỹ và là phần tiếp theo của It (2017). Cả hai bộ phim được dựa trên cuốn tiểu thuyết cùng tên năm 1986 của nhà văn Stephen King. Phần phim thứ hai dựa trên nửa sau của cuốn tiểu thuyết và được đạo diễn bởi Andy Muschietti và biên kịch bởi Gary Dauberman. Lấy bối cảnh năm 2016, 27 năm sau các sự kiện từ năm 1988-1989 trong phần phim đầu tiên, phim có sự tham gia của Bill Skarsgård, người đảm nhận vai Pennywise, cùng với James McAvoy, Jessica Chastain, Bill Hader, Isaiah Mustafa, Jay Ryan, James Ransone và Andy Bean trong vai phiên bản trưởng thành của The Losers Club, trong khi Jaeden Lieberher, Sophia Lillis, Finn Wolfhard, Chosen Jacobs, Jeremy Ray Taylor, Jack Dylan Grazer và Wyatt Oleff trong vai những thành viên khi còn nhỏ. Bộ phim được sản xuất bởi New Line Cinema, Vertigo Entertainment và được phát hành bởi Warner Bros. Picture.', 1)
INSERT [dbo].[video] ([id], [title], [video], [poster], [views], [shares], [description], [isActive]) VALUES (29, N'Babadook', N'k5WQZzDRVtw', N'https://i.imgur.com/tDwa54U.jpg', 0, 0, N'adadadadada', 0)
SET IDENTITY_INSERT [dbo].[video] OFF
GO
/****** Object:  Index [UC_history]    Script Date: 10/26/2023 3:30:38 PM ******/
ALTER TABLE [dbo].[history] ADD  CONSTRAINT [UC_history] UNIQUE NONCLUSTERED 
(
	[userId] ASC,
	[videoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__AB6E6164346197C9]    Script Date: 10/26/2023 3:30:38 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__F3DBC572824B722B]    Script Date: 10/26/2023 3:30:38 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__video__F42570359DF9ABE0]    Script Date: 10/26/2023 3:30:38 PM ******/
ALTER TABLE [dbo].[video] ADD UNIQUE NONCLUSTERED 
(
	[video] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT (getdate()) FOR [viewDate]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT ((1)) FOR [isLiked]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[video] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_selectUsersLikedVideoByVideoLink]    Script Date: 10/26/2023 3:30:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectUsersLikedVideoByVideoLink](@videoLink varchar(50))
as
begin
		select u.username, u.email, h.likedDate
		from video v left join history h on v.id = h.userId
			left join [user] u on h.videoId = u.id
		where
			v.video = @videoLink and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1
end

GO
USE [master]
GO
ALTER DATABASE [Java4] SET  READ_WRITE 
GO
