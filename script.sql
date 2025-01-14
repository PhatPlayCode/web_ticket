USE [master]
GO
/****** Object:  Database [WEB_TICKET]    Script Date: 12/31/2024 6:39:46 PM ******/
CREATE DATABASE [WEB_TICKET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEB_TICKET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\WEB_TICKET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WEB_TICKET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\WEB_TICKET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WEB_TICKET] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEB_TICKET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEB_TICKET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEB_TICKET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEB_TICKET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEB_TICKET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEB_TICKET] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEB_TICKET] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEB_TICKET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEB_TICKET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEB_TICKET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEB_TICKET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEB_TICKET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEB_TICKET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEB_TICKET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEB_TICKET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEB_TICKET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEB_TICKET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEB_TICKET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEB_TICKET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEB_TICKET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEB_TICKET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEB_TICKET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEB_TICKET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEB_TICKET] SET RECOVERY FULL 
GO
ALTER DATABASE [WEB_TICKET] SET  MULTI_USER 
GO
ALTER DATABASE [WEB_TICKET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEB_TICKET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEB_TICKET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEB_TICKET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WEB_TICKET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEB_TICKET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEB_TICKET', N'ON'
GO
ALTER DATABASE [WEB_TICKET] SET QUERY_STORE = ON
GO
ALTER DATABASE [WEB_TICKET] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WEB_TICKET]
GO
/****** Object:  Table [dbo].[BOOKING]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKING](
	[ID_BOOKING] [int] IDENTITY(1,1) NOT NULL,
	[ID_CUSTOMER] [int] NOT NULL,
	[ID_EVENT] [int] NOT NULL,
	[ID_TICKET] [int] NOT NULL,
	[SEAT_NUMBER] [nvarchar](10) NULL,
	[BOOKING_DATE] [datetime] NOT NULL,
	[STATUS] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BOOKING] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID_CUSTOMER] [int] IDENTITY(1,1) NOT NULL,
	[PHONE] [varchar](20) NOT NULL,
	[EMAIL] [varchar](100) NOT NULL,
	[PASSWRD] [varchar](16) NOT NULL,
	[CUSTOMER_NAME] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CUSTOMER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER_EVENT]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_EVENT](
	[ID_CUSTOMER] [int] NOT NULL,
	[ID_EVENT] [int] NOT NULL,
	[PARTICIPATION_DATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CUSTOMER] ASC,
	[ID_EVENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENT]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENT](
	[ID_EVENT] [int] IDENTITY(1,1) NOT NULL,
	[NAME_EVENT] [nvarchar](20) NOT NULL,
	[INFO_EVENT] [nvarchar](100) NULL,
	[NAME_BTC] [nvarchar](20) NOT NULL,
	[INFO_BTC] [nvarchar](100) NULL,
	[TIME_START] [datetime] NOT NULL,
	[TIME_END] [datetime] NOT NULL,
	[MAX_SEATS] [int] NOT NULL,
	[REMAIN] [int] NOT NULL,
	[EVENT_LOCATION] [nvarchar](20) NULL,
	[STATUS] [int] NOT NULL,
	[POSTER] [nvarchar](200) NULL,
	[IMG] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_EVENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANAGE]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANAGE](
	[ID_MANAGE] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](10) NOT NULL,
	[PASSWRD] [varchar](16) NOT NULL,
	[ROLES] [int] NOT NULL,
	[EMAIL] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MANAGE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TICKET]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TICKET](
	[ID_TICKET] [int] IDENTITY(1,1) NOT NULL,
	[TICKET_NAME] [nvarchar](20) NOT NULL,
	[PRICE] [int] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[INFO] [nvarchar](100) NULL,
	[PRIVACY] [int] NOT NULL,
	[SEAT_NUMBER] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TICKET] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD FOREIGN KEY([ID_CUSTOMER])
REFERENCES [dbo].[CUSTOMER] ([ID_CUSTOMER])
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD FOREIGN KEY([ID_EVENT])
REFERENCES [dbo].[EVENT] ([ID_EVENT])
GO
ALTER TABLE [dbo].[BOOKING]  WITH CHECK ADD FOREIGN KEY([ID_TICKET])
REFERENCES [dbo].[TICKET] ([ID_TICKET])
GO
ALTER TABLE [dbo].[CUSTOMER_EVENT]  WITH CHECK ADD FOREIGN KEY([ID_CUSTOMER])
REFERENCES [dbo].[CUSTOMER] ([ID_CUSTOMER])
GO
ALTER TABLE [dbo].[CUSTOMER_EVENT]  WITH CHECK ADD FOREIGN KEY([ID_EVENT])
REFERENCES [dbo].[EVENT] ([ID_EVENT])
GO
/****** Object:  StoredProcedure [dbo].[AddEvent]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEvent]
    @EventName NVARCHAR(20),            -- Tên sự kiện
    @EventInfo NVARCHAR(100),           -- Thông tin sự kiện
    @NameBTC NVARCHAR(20),              -- Tên ban tổ chức
    @InfoBTC NVARCHAR(100),             -- Thông tin ban tổ chức
    @Poster NVARCHAR(500),              -- Đường dẫn poster
    @Img NVARCHAR(500),                 -- Đường dẫn hình ảnh
    @TimeStart DATETIME,                -- Thời gian bắt đầu
    @TimeEnd DATETIME,                  -- Thời gian kết thúc
    @MaxSeat INT,                       -- Số ghế tối đa
    @EventLocation NVARCHAR(100)        -- Địa điểm tổ chức
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Thêm sự kiện vào bảng EVENT
        INSERT INTO EVENT (NAME_EVENT, INFO_EVENT, NAME_BTC, INFO_BTC, TIME_START, TIME_END, MAX_SEATS, REMAIN, EVENT_LOCATION, STATUS, IMG)
        VALUES (@EventName, @EventInfo, @NameBTC, @InfoBTC, @TimeStart, @TimeEnd, @MaxSeat, @MaxSeat, @EventLocation, 1, @Img); -- Thêm IMG vào bảng EVENT

        -- Commit transaction
        COMMIT TRANSACTION;

        PRINT 'Sự kiện đã được thêm thành công.';
    END TRY
    BEGIN CATCH
        -- Rollback transaction nếu có lỗi xảy ra
        ROLLBACK TRANSACTION;

        PRINT 'Lỗi xảy ra khi thêm sự kiện: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateCustomerAccount]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCustomerAccount]
    @Phone VARCHAR(20),
    @Email VARCHAR(100),
    @Passwrd VARCHAR(16),
    @CustomerName NVARCHAR(100)
AS
BEGIN
   
    INSERT INTO CUSTOMER (PHONE, EMAIL, PASSWRD, CUSTOMER_NAME)
    VALUES (@Phone, @Email, @Passwrd, @CustomerName);

 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEvent]    Script Date: 12/31/2024 6:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEvent]
    @EventID INT,                           -- ID của sự kiện
    @EventName NVARCHAR(20),                 -- Tên sự kiện
    @EventInfo NVARCHAR(100),                -- Thông tin sự kiện
    @NameBTC NVARCHAR(20),                   -- Tên ban tổ chức
    @InfoBTC NVARCHAR(100),                  -- Thông tin ban tổ chức
    @TimeStart DATETIME,                     -- Thời gian bắt đầu
    @TimeEnd DATETIME,                       -- Thời gian kết thúc
    @MaxSeat INT,                            -- Số ghế tối đa
    @EventLocation NVARCHAR(100),            -- Địa điểm tổ chức
    @Status INT,                             -- Trạng thái sự kiện
    @Poster NVARCHAR(500),                   -- Poster mới
    @Img NVARCHAR(500)                       -- Đường dẫn hình ảnh duy nhất
AS
BEGIN
    BEGIN TRY
        -- Kiểm tra trạng thái của sự kiện
        DECLARE @CurrentStatus INT;
        SELECT @CurrentStatus = STATUS FROM EVENT WHERE ID_EVENT = @EventID;

        -- Không cho phép cập nhật nếu sự kiện đã diễn ra, đang diễn ra hoặc đã hủy
        IF @CurrentStatus IN (3, 4, 5)
        BEGIN
            PRINT 'Không thể sửa sự kiện đã diễn ra, đang diễn ra hoặc đã hủy.';
            RETURN;
        END

        -- Nếu sự kiện có trạng thái sắp diễn ra (2), không cho phép thay đổi địa điểm
        IF @CurrentStatus = 2 AND @EventLocation != (SELECT EVENT_LOCATION FROM EVENT WHERE ID_EVENT = @EventID)
        BEGIN
            PRINT 'Không thể thay đổi địa điểm của sự kiện sắp diễn ra.';
            RETURN;
        END

        -- Cập nhật sự kiện trong bảng EVENT
        UPDATE EVENT
        SET 
            NAME_EVENT = @EventName,
            INFO_EVENT = @EventInfo,
            NAME_BTC = @NameBTC,
            INFO_BTC = @InfoBTC,
            STATUS = CASE 
                        WHEN @Status IN (1, 2) THEN @Status  -- Chỉ thay đổi trạng thái nếu hợp lệ
                        ELSE @CurrentStatus  -- Giữ nguyên trạng thái nếu không hợp lệ
                    END,
            TIME_START = @TimeStart,
            TIME_END = @TimeEnd,
            MAX_SEATS = @MaxSeat,
            REMAIN = @MaxSeat,  -- Số ghế còn lại
            EVENT_LOCATION = CASE WHEN @CurrentStatus != 2 THEN @EventLocation ELSE EVENT_LOCATION END, -- Chỉ thay đổi địa điểm nếu sự kiện không phải sắp diễn ra
            IMG = @Img  -- Cập nhật hình ảnh duy nhất vào bảng EVENT
        WHERE ID_EVENT = @EventID;

        PRINT 'Sự kiện đã được cập nhật thành công.';
    END TRY
    BEGIN CATCH
        -- Rollback nếu có lỗi
        PRINT 'Lỗi xảy ra khi cập nhật sự kiện: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [WEB_TICKET] SET  READ_WRITE 
GO
