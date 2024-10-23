USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 23.10.2024 17:55:59 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticleNumber] [nvarchar](300) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompleteOrder]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompleteOrder](
	[ID_CompleteOrder] [int] NOT NULL,
	[FirstPart] [nvarchar](350) NOT NULL,
	[SecondPart] [int] NOT NULL,
	[ThirdPart] [nvarchar](350) NOT NULL,
	[FourthPart] [int] NOT NULL,
 CONSTRAINT [PK_CompleteOrder] PRIMARY KEY CLUSTERED 
(
	[ID_CompleteOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID_Manufacturer] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID_Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CompleteOrder] [int] NOT NULL,
	[DateOrder] [date] NOT NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[FIOClient] [int] NULL,
	[CodeReceive] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFA94D08EF] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID_OrderStatus] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID_OrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[ID_PickupPoint] [int] NOT NULL,
	[PostIndex] [int] NOT NULL,
	[City] [nvarchar](350) NOT NULL,
	[Street] [nvarchar](350) NOT NULL,
	[House] [int] NULL,
 CONSTRAINT [PK_PickUpPoint] PRIMARY KEY CLUSTERED 
(
	[ID_PickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_Article] [int] NOT NULL,
	[ProductArticleNumber] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [int] NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[SizeMaxDiscount] [int] NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductSupplier] [int] NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductDiscountAmount] [int] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductImage] [nvarchar](max) NULL,
	[ProductPhoto] [image] NULL,
 CONSTRAINT [PK__Product__2DB6DA424037C14E] PRIMARY KEY CLUSTERED 
(
	[ID_Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID_Supplier] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[ID_Title] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[ID_Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TovarCategory]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TovarCategory](
	[ID_TovarCategory] [int] IDENTITY(1,1) NOT NULL,
	[TovarCategory] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_TovarCategory] PRIMARY KEY CLUSTERED 
(
	[ID_TovarCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.10.2024 17:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleEmployeer] [int] NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__User__1788CCAC93557222] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (1, N'B427R5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (2, N'D356R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (3, N'D563F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (4, N'D643B5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (5, N'E345R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (6, N'E431R5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (7, N'E434U6')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (8, N'E466T6')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (9, N'E532Q5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (10, N'F432F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (11, N'G345E4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (12, N'G453T5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (13, N'G542F5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (14, N'H342F5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (15, N'H432F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (16, N'H436R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (17, N'H542R6')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (18, N'H643W2')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (19, N'K436T5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (20, N'K452T5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (21, N'M356R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (22, N'Q245F5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (23, N'R356F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (24, N'S245R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (25, N'T432F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (26, N'V352R4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (27, N'V527T5')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (28, N'W548O7')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (29, N'Y324F4')
INSERT [dbo].[Article] ([OrderID], [ProductArticleNumber]) VALUES (30, N'А112Т4')
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (1, N'А112Т4', 15, N' G453T5', 1)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (2, N'E532Q5', 10, N' T432F4', 10)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (3, N'F432F4', 15, N' Y324F4', 15)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (4, N'G345E4', 1, N' E345R4', 2)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (5, N'H342F5', 2, N' Q245F5', 2)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (6, N'H436R4', 1, N' D643B5', 1)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (7, N'K436T5', 1, N' V527T5', 1)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (8, N'M356R4', 1, N' W548O7', 1)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (9, N'R356F4', 1, N' E431R5', 10)
INSERT [dbo].[CompleteOrder] ([ID_CompleteOrder], [FirstPart], [SecondPart], [ThirdPart], [FourthPart]) VALUES (10, N'V527T5', 1, N' K452T5', 1)
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (2, N'Chappy')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (4, N'Dreames')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (6, N'LIKER')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (7, N'Nobby')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (9, N'TitBit')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (10, N'Triol')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (11, N'trixie')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (12, N'True Touch')
INSERT [dbo].[Manufacturer] ([ID_Manufacturer], [Manufacturer]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID_OrderStatus], [OrderStatus]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatus] ([ID_OrderStatus], [OrderStatus]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (1, 125061, N' г. Нефтеюганск', N' ул. Подгорная', 8)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (2, 125703, N' г. Нефтеюганск', N' ул. Партизанская', 49)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (3, 125837, N' г. Нефтеюганск', N' ул. Шоссейная', 40)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (4, 190949, N' г. Нефтеюганск', N' ул. Мичурина', 26)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (5, 344288, N' г. Нефтеюганск', N' ул. Чехова', 1)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (6, 394060, N' г.Нефтеюганск', N' ул. Фрунзе', 43)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (7, 394242, N' г. Нефтеюганск', N' ул. Коммунистическая', 43)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (8, 394782, N' г. Нефтеюганск', N' ул. Чехова', 3)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (9, 400562, N' г. Нефтеюганск', N' ул. Зеленая', 32)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (10, 410172, N' г. Нефтеюганск', N' ул. Северная', 13)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (11, 410542, N' г. Нефтеюганск', N' ул. Светлая', 46)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (12, 410661, N' г. Нефтеюганск', N' ул. Школьная', 50)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (13, 420151, N' г. Нефтеюганск', N' ул. Вишневая', 32)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (14, 426030, N' г. Нефтеюганск', N' ул. Маяковского', 44)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (15, 443890, N' г. Нефтеюганск', N' ул. Коммунистическая', 1)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (16, 450375, N' г. Нефтеюганск ', N'ул. Клубная', 44)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (17, 450558, N' г. Нефтеюганск', N' ул. Набережная', 30)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (18, 450983, N' г.Нефтеюганск', N' ул. Комсомольская', 26)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (19, 454311, N' г.Нефтеюганск', N' ул. Новая', 19)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (20, 603002, N' г. Нефтеюганск', N' ул. Дзержинского', 28)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (21, 603036, N' г. Нефтеюганск', N' ул. Садовая', 4)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (22, 603379, N' г. Нефтеюганск', N' ул. Спортивная', 46)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (23, 603721, N' г. Нефтеюганск', N' ул. Гоголя', 41)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (24, 614164, N' г.Нефтеюганск', N'  ул. Степная', 30)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (25, 614510, N' г. Нефтеюганск', N' ул. Маяковского', 47)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (26, 614611, N' г. Нефтеюганск', N' ул. Молодежная', 50)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (27, 614753, N' г. Нефтеюганск', N' ул. Полевая', 35)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (28, 620839, N' г. Нефтеюганск', N' ул. Цветочная', 8)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (29, 625283, N' г. Нефтеюганск', N' ул. Победы', 46)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (30, 625560, N' г. Нефтеюганск', N' ул. Некрасова', 12)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (31, 625590, N' г. Нефтеюганск', N' ул. Коммунистическая', 20)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (32, 625683, N' г. Нефтеюганск', N' ул. 8 Марта', NULL)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (33, 630201, N' г. Нефтеюганск', N' ул. Комсомольская', 17)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (34, 630370, N' г. Нефтеюганск', N' ул. Шоссейная', 24)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (35, 660007, N' г.Нефтеюганск', N' ул. Октябрьская', 19)
INSERT [dbo].[PickUpPoint] ([ID_PickupPoint], [PostIndex], [City], [Street], [House]) VALUES (36, 660540, N' г. Нефтеюганск', N' ул. Солнечная', 25)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID_Supplier], [Supplier]) VALUES (1, N'PetShop')
INSERT [dbo].[Supplier] ([ID_Supplier], [Supplier]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (1, N'Игрушка')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (2, N'Клетка')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (3, N'Лакомство')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (4, N'Лежак')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (5, N'Миска')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (6, N'Мячик')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (7, N'Сухой корм')
INSERT [dbo].[Title] ([ID_Title], [Title]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[Title] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 1, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[User] ([UserID], [RoleEmployeer], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CompleteOrder] FOREIGN KEY([CompleteOrder])
REFERENCES [dbo].[CompleteOrder] ([ID_CompleteOrder])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CompleteOrder]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatus] ([ID_OrderStatus])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickUpPoint] ([ID_PickupPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([FIOClient])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Article] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Article] ([OrderID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Article]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufacturer] ([ID_Manufacturer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([ProductSupplier])
REFERENCES [dbo].[Supplier] ([ID_Supplier])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Title] FOREIGN KEY([ProductName])
REFERENCES [dbo].[Title] ([ID_Title])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Title]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TovarCategory] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[TovarCategory] ([ID_TovarCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TovarCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleEmployeer])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
