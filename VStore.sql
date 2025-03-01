CREATE DATABASE test_vstore


/****** Object:  Table [dbo].[Admin]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
)
/****** Object:  Table [dbo].[Adv]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Adv](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Position] [int] NULL,
)
/****** Object:  Table [dbo].[Categories]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[ParentId] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[DisplayHomePage] [int] NULL,
)
/****** Object:  Table [dbo].[CategoriesProducts]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[CategoriesProducts] (
    [Id] INT IDENTITY(1,1) NOT NULL,
    [CategoryId] INT REFERENCES [Categories]([Id]),
    [ProductId] INT REFERENCES [Products]([Id])
)
/****** Object:  Table [dbo].[News]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Timestamp] [date] NULL,
	[Hot] [int] NULL,
)
/****** Object:  Table [dbo].[Orders]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CreateTime] [date] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
)
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[OrdersDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
)
/****** Object:  Table [dbo].[Products]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[OriginalPrice] [float] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[Hot] [int] NULL,
)
/****** Object:  Table [dbo].[QtvWeb]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[QtvWeb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
)
/****** Object:  Table [dbo].[Rating]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Star] [int] NULL,

)
/****** Object:  Table [dbo].[Slides]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Title] [nvarchar](max) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[Info] [nvarchar](max) NULL,
	[Link] [nvarchar](500) NULL,
)
/****** Object:  Table [dbo].[Tags]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
)
/****** Object:  Table [dbo].[TagsProducts]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[TagsProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ProductId] [int] NULL,

)
/****** Object:  Table [dbo].[Users]    Script Date: 6/3/2024 5:26:48 PM ******/

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](10) NULL,
	[Password] [nvarchar](500) NULL,
)

INSERT [dbo].[Admin] ([Id], [Photo], [Name], [Email], [Password]) VALUES (1, N'133603002959622133_admin1.jpg', N'Lê Anh Tuấn', N'leanhtuan@gmail.com', N'$2a$11$uiWn35KxZnpkq78avEwa2uaUNiD5NoHHnBdGvN5BndCoKXnEGe49K')
INSERT [dbo].[Admin] ([Id], [Photo], [Name], [Email], [Password]) VALUES (2, N'133602989820154429_admin6.jpg', N'Lê Anh Tuấn 2', N'leanhtuan2@gmail.com', N'$2a$11$Lqh1WirGW9obBh..lX0g2.s/RQZLWEtZB4vPpNXyKzfjqKGpzcZ4y')
INSERT [dbo].[Admin] ([Id], [Photo], [Name], [Email], [Password]) VALUES (4, N'133602990897929526_admin5.jpg', N'Lê Thị Hương', N'lethihuong@gmail.com', N'$2a$11$PnmLHXVbVzYNtWBXCYMGxu.VPf9fJVR.jEXu2BOhvXDwWEXXO8lSi')
INSERT [dbo].[Admin] ([Id], [Photo], [Name], [Email], [Password]) VALUES (6, N'133612467280524698_admin3.jpg', N'Lê Anh Tú', N'leanhtu@gmail.com', N'$2a$11$9l/H4HLIfWZK5W7eAeQoqOKBhbXUq8y0vAsM3t8S21APsO1VGeTzW')

INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (1, N'133602319745208374_M4-Góc-phải-100_32539440910052024.jpg', N'iPad Pro', 2)
INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (2, N'133602320230070475_M2-Góc-phải-100_55639410910052024.jpg', N'iPad Air', 2)
INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (1007, N'133602320590660906_Goc-phai-(21)_38705361407052024.png', N'Samsung Galaxy AI', 2)
INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (1008, N'133602321041178323_Goc-phai-(6)_59839061015052024.jpg', N'Watch', 1)
INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (2008, N'133602321350422415_Goc-phai-(4)_70659502230042024.png', N'Vivo Y36', 1)
INSERT [dbo].[Adv] ([Id], [Photo], [Name], [Position]) VALUES (2009, N'133602321696706951_BANNER-GÓC-PHẢI_66254231502052024.jpg', N'Smart Tivi', 1)

INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (1, 0, N'Điện thoại', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (2, 0, N'Laptop', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (3, 0, N'Máy tính bảng', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (4, 0, N'Tivi', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (5, 1, N'Samsung', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (6, 1, N'iPhone', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (7, 1, N'Oppo', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (8, 1, N'Xiaomi', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (9, 0, N'Đồng hồ', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (10, 2, N'Dell', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (11, 2, N'Hp', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (12, 2, N'Lenovo', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (13, 2, N'Acer', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (14, 0, N'Đồ gia dụng', 1)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (15, 1, N'Vivo', 0)
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [DisplayHomePage]) VALUES (16, 2, N'Macbook Air', 0)


INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1006, 15, 3)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1007, 1, 3)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1018, 15, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1019, 1, 1)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1024, 14, 1004)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1026, 14, 1005)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1031, 14, 1007)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1033, 9, 1008)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1034, 9, 1009)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1035, 9, 1010)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1042, 11, 1011)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1043, 2, 1011)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1044, 10, 1012)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1045, 2, 1012)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1046, 16, 1013)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1047, 2, 1013)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1048, 4, 1014)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1049, 4, 1015)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1050, 4, 1016)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1051, 8, 1017)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1052, 1, 1017)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1053, 8, 1018)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1054, 1, 1018)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1055, 8, 1019)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1056, 1, 1019)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1057, 3, 1020)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1059, 3, 1021)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1060, 3, 1022)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1061, 6, 1023)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1062, 1, 1023)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1063, 6, 1024)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1064, 1, 1024)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1065, 5, 1025)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1066, 1, 1025)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1067, 5, 1026)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1068, 1, 1026)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1069, 5, 1027)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1070, 1, 1027)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1071, 14, 1006)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1072, 7, 1003)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1073, 1, 1003)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1074, 7, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1075, 1, 4)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1078, 5, 1028)
INSERT [dbo].[CategoriesProducts] ([Id], [CategoryId], [ProductId]) VALUES (1079, 1, 1028)


INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (1, N'133546895711853066_list_new_1.jpg', N'TikTok Rewards là gì? Cách kiếm tiền thưởng từ TikTok Rewards', N'', CAST(N'2024-04-30' AS Date), 1)
INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (2, N'133546899955922645_list_new_8.jpg', N'Đánh giá OPPO Reno8 T 5G: Thiết kế mới lạ, màn hình tỏa sáng, hiệu năng đủ dùng, camera đáp ứng nhu cầu nhiếp ảnh cơ bản', N'', CAST(N'2024-04-30' AS Date), 1)
INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (3, N'133602312584609873_New1.jpg', N'TOP điện thoại chụp ảnh đẹp nhất thế giới #update 2024', N'', CAST(N'2024-05-15' AS Date), 1)
INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (4, N'133602313956758564_mediatek-dimensity-8250-ra-mat-350x250.jpg', N'MediaTek Dimensity 8250 ra mắt với hiệu suất AI mạnh mẽ hơn', N'<p>Avt</p>', CAST(N'2024-05-15' AS Date), 1)
INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (5, N'133602314282756293_so-sanh-redmi-note-13-pro-va-realme-11-1-350x250.jpg', N'So sánh Redmi Note 13 Pro và Realme 11: Nên mua smartphone nào?', N'<p>a</p>', CAST(N'2024-05-15' AS Date), 1)
INSERT [dbo].[News] ([Id], [Photo], [Name], [Content], [Timestamp], [Hot]) VALUES (6, N'133602314738332187_co-nen-mua-may-tinh-bang-galaxy-tab-s9-plus-1-350x250.jpg', N'Có nên mua máy tính bảng Galaxy Tab S9 Plus hay không?', N'<p>a</p>', CAST(N'2024-05-15' AS Date), 0)


INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (5, 2, CAST(N'2024-05-15' AS Date), 20093300, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (6, 13, CAST(N'2024-05-20' AS Date), 24890600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (9, 1, CAST(N'2024-05-22' AS Date), 41014200, 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (10, 1, CAST(N'2024-05-22' AS Date), 14550900, 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (12, 12, CAST(N'2024-05-24' AS Date), 31833600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (13, 2, CAST(N'2024-05-24' AS Date), 13286400, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (14, 1, CAST(N'2024-05-27' AS Date), 22080700, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (15, 1, CAST(N'2024-05-30' AS Date), 149556000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (16, 1, CAST(N'2024-05-30' AS Date), 38963000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (17, 12, CAST(N'2024-05-30' AS Date), 89733600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (18, 12, CAST(N'2024-05-30' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (19, 12, CAST(N'2024-05-30' AS Date), 29911200, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (20, 17, CAST(N'2024-05-30' AS Date), 29911200, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (21, 17, CAST(N'2024-05-30' AS Date), 29911200, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (22, 17, CAST(N'2024-05-30' AS Date), 29911200, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (23, 13, CAST(N'2024-05-30' AS Date), 29911200, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (24, 20, CAST(N'2024-05-30' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (25, 20, CAST(N'2024-05-31' AS Date), 34431600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (26, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (27, 20, CAST(N'2024-05-31' AS Date), 38963000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (28, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (29, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (30, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (31, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (32, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (33, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (34, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (35, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (36, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (37, 20, CAST(N'2024-05-31' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (38, 20, CAST(N'2024-05-31' AS Date), 62979000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (39, 20, CAST(N'2024-05-31' AS Date), 62979000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (40, 20, CAST(N'2024-05-31' AS Date), 62979000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (41, 20, CAST(N'2024-06-01' AS Date), 29101800, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (42, 20, CAST(N'2024-06-01' AS Date), 22491000, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (43, 20, CAST(N'2024-06-01' AS Date), 7792600, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (44, 20, CAST(N'2024-06-01' AS Date), 31170400, 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [CreateTime], [Price], [Status]) VALUES (45, 20, CAST(N'2024-06-01' AS Date), 34431600, 0)


INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 5, 1025, 1, 20093300)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 6, 1019, 1, 20920900)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (8, 6, 1006, 1, 3969700)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (12, 9, 1025, 1, 20093300)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (13, 9, 1019, 1, 20920900)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (14, 10, 1022, 1, 14550900)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (16, 12, 1028, 4, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (17, 13, 1020, 4, 3321600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (18, 14, 1009, 1, 1087700)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (19, 14, 1025, 1, 20993000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (20, 15, 1027, 5, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (21, 16, 1028, 5, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (22, 17, 1027, 3, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (23, 18, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (24, 19, 1027, 1, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (25, 20, 1027, 1, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (26, 21, 1027, 1, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (27, 22, 1027, 1, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (28, 23, 1027, 1, 29911200)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (29, 24, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (30, 25, 1026, 1, 34431600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (31, 26, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (32, 27, 1028, 5, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (33, 28, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (34, 29, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (35, 30, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (36, 31, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (37, 32, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (38, 33, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (39, 34, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (40, 35, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (41, 36, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (42, 37, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (43, 38, 1025, 3, 20993000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (44, 39, 1025, 3, 20993000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (45, 40, 1025, 3, 20993000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (46, 41, 1022, 2, 14550900)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (47, 42, 1023, 1, 22491000)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (48, 43, 1028, 1, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (49, 44, 1028, 4, 7792600)
INSERT [dbo].[OrdersDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (50, 45, 1026, 1, 34431600)


INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1, N'133602327350020206_Vivo V27e.jpg', N'Vivo V27e (8+256GB)', N'<p>Tặng quà cho khách hàng thân thiết <strong>VStore</strong> (Chi tiết liên hệ 18008123 hoặc tại điểm ...</p>', 4500000, 8990000, 11, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (3, N'133602328767386694_Vivo-Y33S-1.jpg', N'Vivo Y33s', N'<p>Giá và khuyến mãi áp dụng đặt và nhận hàng từ <i><strong>05/04-30/06</strong></i></p>', 3100000, 6690000, 25, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (4, N'133602330266238830_Oppo A78.jpeg', N'OPPO A78', N'<p>Khách hàng lựa chọn 1 trong 2 chương trình khuyến mại sau: Chương trình Online: ...</p>', 3800000, 6990000, 1, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1003, N'133602334737107713_Oppo Reno-10-ble1.1.jpg', N'OPPO Reno 10 5G 256G', N'<p>Trả góp 0% trên giá giảm. Trợ giá thu cũ đến 1 triệu đồng (Tùy model thu cũ)</p>', 6500000, 10990000, 16, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1004, N'133602349642673279_X10-Series-3.jpg', N'Robot hút bụi Xiaomi X10 BHR6068EU', N'<p>Giá và khuyến mãi áp dụng đặt và nhận hàng từ <i><strong>01/05-31/05</strong></i></p>', 6400000, 12990000, 27, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1005, N'133602357075624699_Xiaomi-Mi-Smart-Air-Fryer-1.jpg', N'Nồi chiên không dầu Xiaomi Mi Smart Air', N'<p>Một đổi 1 trong 30 ngày nếu lỗi do nhà sản xuất</p>', 450000, 2390000, 42, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1006, N'133602358331302791_SHD7723.jpg', N'Máy làm mát không khí Sunhouse SHD7723', N'<p>Tặng Ấm siêu tốc Inox SHD1182 trị giá 385.000 đồng. Ưu đãi sinh nhật, cơ hội trúng ...</p>', 2490000, 7490000, 30, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1007, N'133602361396373420_Máy-lọc-nước-Sunhouse-SHR76210CK-2.jpg', N'Máy lọc nước RO nóng lạnh 10 lõi Sunhouse SHR76210CK', N'<p>Tặng phí lắp đặt trị giá 300.000 đ.</p>', 4908000, 10908000, 30, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1008, N'133602363769447359_WATCH6-BT-blk1-44.jpg', N'Samsung Galaxy Watch6 Bluetooth 44mm', N'<p>Giảm 30% Samsung Watch6 Series <i><strong>khi mua kèm điện thoại</strong></i><strong> </strong><i><strong>Galaxy Z Fold5| ZFlip5</strong></i> giá chỉ còn ...</p>', 3090000, 7490000, 13, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1009, N'133602364943244136_Watch-3-Active-1.jpg', N'Redmi Watch 3 Active', N'<p>Giá ưu đãi chỉ 990.000đ khi mua kèm máy điện thoại, máy tính bảng Xiaomi</p>', 490000, 1490000, 25, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1010, N'133602365657516637_WATCH6-CLASSIC-47mm-blk1.jpg', N'Samsung Galaxy Watch6 Classic Bluetooth 47mm', N'<p>Giảm 30% Samsung Watch6 Series<i><strong> khi mua kèm điện thoại Galaxy Z Fold5| ZFlip5</strong></i> giá chỉ còn ...</p>', 5090000, 9490000, 16, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1011, N'133602368558571628_MTXT-HP-15-fd0079TU-1.jpg', N'MTXT HP 14s-fq1065AU - AMD Ryzen 5 5500U/ 8GB DDR4-3200/ SSD 512GB', N'<p>Tặng phiếu mua hàng 1.500.000đ (Đã trừ vào giá). Tặng <i><strong>Balo/ Túi xách Laptop</strong></i></p>', 10090000, 15290000, 10, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1012, N'133602373515019464_Dell-Inspiron-3520-N5I5122W1-2.jpg', N'MTXT Dell Inspiron 3520 N5I5122W1 Core i5 1235U/ 8GB/ 256GB SSD', N'<p>Tặng phiếu mua hàng 1.000.000đ (Đã trừ vào giá). Tặng <i><strong>Balo/ Túi xách Laptop</strong></i></p>', 12590000, 17590000, 6, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1013, N'133602375951678497_Macbook-Air-M2-mid1.jpg', N'Laptop Apple Macbook Air M2 8GPU/8Gb/256Gb Midnight - MLY33SA/A', N'<p>Giá và khuyến mãi áp dụng đặt và nhận hàng từ <i><strong>05/04-30/06</strong></i></p>', 20990000, 32990000, 18, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1014, N'133602377257465652_AU7002.1509771385.jpg', N'Tivi Samsung  UHD 55 inch UA55AU7002KXXV', N'<p>Giao hàng miễn phí (nếu cách Viettel Store dưới 10km). <i><strong>Bảo hành chính hãng</strong></i></p>', 6900000, 12900000, 11, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1015, N'133602378477688707_Google-TV-55A-65A.12054835893.jpg', N'Xiaomi Google Tivi 65Apro 65inch', N'<p>Tặng thêm 200k phí vận chuyển. Tặng<i><strong> thêm 01 tháng gói cước TV 360</strong></i> khi mua kèm sim số ...</p>', 8990000, 14990000, 7, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1016, N'133602379254827509_Casper-55QG8000-1.jpg', N'Tivi Casper UHD Qled 55 inch 55QG8000', N'<p>Tặng thêm 200k phí vận chuyển. Tặng <i><strong>thêm 01 tháng gói cước TV 360</strong></i> khi mua kèm sim số ...</p>', 4990000, 8990000, 14, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1017, N'133602380678689527_Xiaomi Note-13-gold1.jpg', N'Xiaomi Redmi Note 13 (6+128)', N'<p>Tặng quà cho khách hàng thân thiết Viettel (Chi tiết liên hệ 18008123 hoặc tại điểm ...</p>', 2590000, 4890000, 4, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1018, N'133602381283344373_Xiaomi-Redmi-13C-grn1.jpg', N'Xiaomi Redmi 13C (6+128)', N'<p>Tặng quà cho khách hàng thân thiết Viettel (Chi tiết liên hệ 18008123 hoặc tại điểm ...</p>', 1090000, 3490000, 6, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1019, N'133602381977052233_Xiaomi-14-grn1.jpg', N'Xiaomi 14 (12+256)', N'<p>Tặng quà cho khách hàng thân thiết Viettel (Chi tiết liên hệ 18008123 hoặc tại điểm ...</p>', 16990000, 22990000, 9, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1020, N'133602383438238587_Lenovo-Tab-M10-Gen-2-TB-X306X-2GB-32GB-(ZA6V0121VN)-1.jpg', N'Máy tính bảng Lenovo Tab M10 Gen 2 TB-X306X 2GB/32GB', N'<p>Giá và khuyến mãi áp dụng đặt và nhận hàng từ <i><strong>05/04-30/06</strong></i></p>', 1190000, 5190000, 36, 0)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1021, N'133602384409458033_Samsung-New-UI-with-Galaxy-AI-Tab-s9-ultra.jpg', N'Samsung Galaxy Tab S9 Ultra 5G 12/256GB', N'<p>Trả góp 0% qua nhà tài chính HC/FE/Samsung Finance+. Tặng 1 năm sử dụng Microsoft ...</p>', 18990000, 28990000, 19, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1022, N'133602385484699196_iPad-Air-5G-Cell-2022-starl9-2.jpg', N'iPad Air (Gen 5) WIFI 64GB', N'<p>Giảm thêm 200,000đ cho khách hàng <i><strong>đổi 1,000 điểm Viettel++</strong></i> (không áp dụng kèm chương ...</p>', 10990000, 15990000, 9, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1023, N'133602386360915720_iPhone 15 Plus 128G.jpeg', N'iPhone 15 Plus 128GB', N'<p>Ưu đãi sinh nhật, cơ hội trúng <i><strong>đồng hồ Apple Watch</strong></i> hoặc <i><strong>tai nghe AirPods 2</strong></i> (Áp dụng từ ...</p>', 17990000, 24990000, 10, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1024, N'133602387333354539_iPhone 15 Pro 128G.jpeg', N'iPhone 15 Pro 128GB', N'<p>Ưu đãi sinh nhật, cơ hội trúng <i><strong>đồng hồ Apple Watch</strong></i> hoặc <i><strong>tai nghe AirPods 2 </strong></i>(Áp dụng từ ...</p>', 18990000, 27990000, 12, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1025, N'133602388221701326_Samsung-New-UI-with-Galaxy-AI-Flip5-Mint.jpg', N'Samsung Galaxy Z Flip5 5G 512GB', N'<p>Trả góp 0% trên giá giảm qua FE/HC hoặc thẻ tín dụng qua Galaxy Gift/ Samsung ...</p>', 16990000, 29990000, 30, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1026, N'133602389188642836_Samsung-New-UI-with-Galaxy-AI-Fold5-Cre.jpg', N'Samsung Galaxy Z Fold5 5G 256GB', N'<p>Trả góp 0% trên giá giảm qua FE/HC hoặc thẻ tín dụng qua Galaxy Gift/ Samsung ...</p>', 28990000, 40990000, 16, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1027, N'133602389985800874_S24 ultra 256.jpeg', N'Samsung Galaxy S24 Ultra 12/256GB', N'<p>Khách hàng lựa chọn 1 trong 3 khuyến mại sau:&nbsp;<br>Khuyến mại 1: Giảm giá 4.000.000đ ...</p>', 22990000, 33990000, 12, 1)
INSERT [dbo].[Products] ([Id], [Photo], [Name], [Description], [OriginalPrice], [Price], [Discount], [Hot]) VALUES (1028, N'133609598323321866_New-UI-Design---Galaxy-A35-5G-bl.png', N'Samsung Galaxy A35 5G 8/128GB', N'<p>Giảm 300.000đ (đã trừ giá) hoặc Giảm 1.000.000đ khi thu cũ đổi mới (áp dụng trên giá bán ...</p>', 4290000, 8290000, 6, 0)


INSERT [dbo].[QtvWeb] ([Id], [Photo], [Name], [Email], [Password]) VALUES (1, N'133563673916789885_89966398_112514177048351_8501990906071613440_n.jpg', N'admin1', N'admin1@gmail.com', N'$2a$11$VmMKQuY8OH5H7Fv25ACNoOaE82gOORS/FghBySheTfZZVIZNxgsEO')
INSERT [dbo].[QtvWeb] ([Id], [Photo], [Name], [Email], [Password]) VALUES (2, N'133563674225334286_89966398_112514177048351_8501990906071613440_n.jpg', N'admin2', N'admin2@gmail.com', N'$2a$11$VmMKQuY8OH5H7Fv25ACNoOaE82gOORS/FghBySheTfZZVIZNxgsEO')


INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (1, 3, 5)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (2, 3, 5)
INSERT [dbo].[Rating] ([Id], [ProductId], [Star]) VALUES (3, 1003, 5)


INSERT [dbo].[Slides] ([Id], [Photo], [Name], [Title], [SubTitle], [Info], [Link]) VALUES (2, N'133602317308165125_Main-PC-(3)_6650070904052024.jpg', N'Đổi máy 2G sang 4G', N'Đổi máy 2G sang 4G', N'Đổi máy 2G sang 4G', N'Đổi máy 2G sang 4G', N'https://')
INSERT [dbo].[Slides] ([Id], [Photo], [Name], [Title], [SubTitle], [Info], [Link]) VALUES (3, N'133602316689809649_Main-PC-(4)_62036221506052024.jpg', N'Vi vu du lịch', N'Vi vu du lịch', N'Vi vu du lịch', N'Vi vu du lịch', N'https://')
INSERT [dbo].[Slides] ([Id], [Photo], [Name], [Title], [SubTitle], [Info], [Link]) VALUES (1003, N'133602317888928160_Main_PC-(8)-lớn_38414142330042024.jpeg', N'iPhone 15 Pro Max', N'iPhone 15 Pro Max', N'iPhone 15 Pro Max', N'iPhone 15 Pro Max', N'https://')
INSERT [dbo].[Slides] ([Id], [Photo], [Name], [Title], [SubTitle], [Info], [Link]) VALUES (1004, N'133602318286944385_Main-(5)_85810112330042024.png', N'Samsung Galaxy AI', N'Samsung Galaxy AI', N'Samsung Galaxy AI', N'Samsung Galaxy AI', N'https://')


INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'Điện thoại & Máy tính bảng')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'Gia dụng & Phụ kiện')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1005, N'Tivi & Đồng hồ')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1006, N'Máy tính xách tay')


INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1004, 1, 3)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1010, 1, 1)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1013, 2, 1004)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1015, 2, 1005)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1020, 2, 1007)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1022, 1005, 1008)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1023, 1005, 1009)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1024, 1005, 1010)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1028, 1006, 1011)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1029, 1006, 1012)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1030, 1006, 1013)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1031, 1005, 1014)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1032, 1005, 1015)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1033, 1005, 1016)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1034, 1, 1017)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1035, 1, 1018)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1036, 1, 1019)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1037, 1, 1020)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1039, 1, 1021)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1040, 1, 1022)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1041, 1, 1023)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1042, 1, 1024)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1043, 1, 1025)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1044, 1, 1026)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1045, 1, 1027)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1046, 2, 1006)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1047, 1, 1003)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1048, 1, 4)
INSERT [dbo].[TagsProducts] ([Id], [TagId], [ProductId]) VALUES (1050, 1, 1028)


INSERT [dbo].[Users] ([Id], [Photo], [Name], [Email], [Address], [Phone], [Password]) VALUES (1, N'133614765347630415_user7.jpg', N'Son Heung Min', N'son@gmail.com', N'Gangwon, Hàn Quốc', N'0123456789', N'$2a$11$f.6ukO5fpX3ulszDnQl0leQXHo1na6QFGVZ2sGRTT7rnNMyIfIcJO')
INSERT [dbo].[Users] ([Id], [Photo], [Name], [Email], [Address], [Phone], [Password]) VALUES (2, N'133603023484402039_user3.jpg', N'Ronaldo', N'ronaldo@gmail.com', N'Madeira, Bồ Đào Nha', N'1234567890', N'$2a$11$CrfCO9ekM1hoL/jPWrlzM.0qnBgxc91y7Ylryxiu1S2fYIV38wTWy')
INSERT [dbo].[Users] ([Id], [Photo], [Name], [Email], [Address], [Phone], [Password]) VALUES (12, N'133603024370022876_user4.jpg', N'Kevin De Bruyne', N'kevin@gmail.com', N'Drongen, Bỉ', N'869896968', N'$2a$11$jBZ4mGYKj1M5ocIIvMcs1uIeoFzUgeyqk9sPBKoEr8sj05lFiLvyO')
INSERT [dbo].[Users] ([Id], [Photo], [Name], [Email], [Address], [Phone], [Password]) VALUES (13, N'133603024754888175_user2.jpg', N'Lionel Messi', N'messi@gmail.com', N'Rosario, Argentina', N'1234', N'$2a$11$1NgDt4KKTMpQt2hMRtfBteenb8Fhx9JMSW.Xiobf0tW77uMviUh9K')
INSERT [dbo].[Users] ([Id], [Photo], [Name], [Email], [Address], [Phone], [Password]) VALUES (20, N'133615510822363863_user6.jpg', N'Test', N'test@gmail.com', N'fgyuiqw', N'1245786', N'$2a$11$nAtsqinhGUDC76V4DMuRz.O.hADSRxRfuO.FgKwizTOyyb3qnutZ2')

