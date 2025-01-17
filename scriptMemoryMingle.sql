USE [master]
GO
/****** Object:  Database [memory_mingle]    Script Date: 18-05-2024 18:09:19 ******/
CREATE DATABASE [memory_mingle]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'memory_mingle', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\memory_mingle.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'memory_mingle_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\memory_mingle_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [memory_mingle] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [memory_mingle].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [memory_mingle] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [memory_mingle] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [memory_mingle] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [memory_mingle] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [memory_mingle] SET ARITHABORT OFF 
GO
ALTER DATABASE [memory_mingle] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [memory_mingle] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [memory_mingle] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [memory_mingle] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [memory_mingle] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [memory_mingle] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [memory_mingle] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [memory_mingle] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [memory_mingle] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [memory_mingle] SET  ENABLE_BROKER 
GO
ALTER DATABASE [memory_mingle] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [memory_mingle] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [memory_mingle] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [memory_mingle] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [memory_mingle] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [memory_mingle] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [memory_mingle] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [memory_mingle] SET RECOVERY FULL 
GO
ALTER DATABASE [memory_mingle] SET  MULTI_USER 
GO
ALTER DATABASE [memory_mingle] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [memory_mingle] SET DB_CHAINING OFF 
GO
ALTER DATABASE [memory_mingle] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [memory_mingle] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [memory_mingle] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [memory_mingle] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'memory_mingle', N'ON'
GO
ALTER DATABASE [memory_mingle] SET QUERY_STORE = ON
GO
ALTER DATABASE [memory_mingle] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [memory_mingle]
GO
/****** Object:  User [vidhhi]    Script Date: 18-05-2024 18:09:19 ******/
CREATE USER [vidhhi] FOR LOGIN [vidhhi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [memory_games]    Script Date: 18-05-2024 18:09:19 ******/
CREATE SCHEMA [memory_games]
GO
/****** Object:  Table [memory_games].[card_game_image]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[card_game_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[game_level_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[constraints]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[constraints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guardian_id] [int] NULL,
	[total_time] [int] NULL,
	[time_left] [int] NULL,
	[date_of_playing] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[game]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[game](
	[game_id] [int] IDENTITY(1,1) NOT NULL,
	[game_name] [varchar](100) NULL,
	[game_instructions] [nvarchar](max) NULL,
	[slug] [varchar](300) NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[game_level]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[game_level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[level_id] [int] NOT NULL,
	[game_id] [int] NULL,
	[moves] [int] NULL,
	[no_of_cards] [int] NULL,
	[level_type] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Game_Level] UNIQUE NONCLUSTERED 
(
	[game_id] ASC,
	[level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[guardian]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[guardian](
	[g_id] [int] IDENTITY(1,1) NOT NULL,
	[g_name] [varchar](500) NULL,
	[email] [varchar](100) NULL,
	[guardian_password] [varbinary](max) NULL,
	[child_name] [varchar](500) NULL,
	[child_dob] [date] NULL,
	[token] [nvarchar](max) NULL,
	[time_to_expire] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[g_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[progress]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[progress](
	[progress_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[points] [int] NULL,
	[game_played_name] [varchar](255) NULL,
	[game_level_id] [int] NULL,
	[level_type] [varchar](500) NULL,
	[game_played_date] [date] NULL,
	[won_yn] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[progress_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [memory_games].[users]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [memory_games].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[guardian_id] [int] NULL,
	[user_name] [varchar](500) NULL,
	[date_of_birth] [date] NULL,
	[logout_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [memory_games].[progress] ADD  DEFAULT (getdate()) FOR [game_played_date]
GO
ALTER TABLE [memory_games].[users] ADD  DEFAULT (NULL) FOR [logout_time]
GO
ALTER TABLE [memory_games].[card_game_image]  WITH CHECK ADD FOREIGN KEY([game_level_id])
REFERENCES [memory_games].[game_level] ([id])
GO
ALTER TABLE [memory_games].[constraints]  WITH CHECK ADD FOREIGN KEY([guardian_id])
REFERENCES [memory_games].[guardian] ([g_id])
GO
ALTER TABLE [memory_games].[game_level]  WITH CHECK ADD FOREIGN KEY([game_id])
REFERENCES [memory_games].[game] ([game_id])
GO
ALTER TABLE [memory_games].[progress]  WITH CHECK ADD FOREIGN KEY([game_level_id])
REFERENCES [memory_games].[game_level] ([id])
GO
ALTER TABLE [memory_games].[progress]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [memory_games].[users] ([user_id])
GO
ALTER TABLE [memory_games].[users]  WITH CHECK ADD FOREIGN KEY([guardian_id])
REFERENCES [memory_games].[guardian] ([g_id])
GO


----
CREATE TABLE memory_games.tile_pattern(
id int PRIMARY KEY IDENTITY(1,1),
game_level INT,
no_of_pattern INT,
pattern VARCHAR(200),
)
-------
/****** Object:  StoredProcedure [memory_games].[sp_check_and_insert]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [memory_games].[sp_check_and_insert]
    @guardian_id INT
AS
BEGIN
    DECLARE @today_count INT;
	DECLARE @previous_time INT;
	DECLARE @today_date DATE; 
	SET @today_date = CAST(GETDATE() AS DATE);

SELECT @today_count=COUNT(*)
FROM memory_games.constraints
WHERE date_of_playing = @today_date
AND guardian_id=@guardian_id

    IF @today_count>0
    BEGIN 
        SELECT time_left
        FROM memory_games.constraints
        WHERE date_of_playing =CAST(GETDATE() AS DATE) AND guardian_id=@guardian_id;
    END
    ELSE
    BEGIN
        -- If no entry for today, fetch total_time of the previous entry with max date
        SELECT @previous_time = total_time
        FROM memory_games.constraints
        WHERE date_of_playing = (SELECT MAX(date_of_playing) FROM memory_games.constraints);

        -- Insert the total_time for today's date
        INSERT INTO memory_games.constraints(guardian_id, total_time, time_left, date_of_playing)
        VALUES (@guardian_id, @previous_time, @previous_time,  GETDATE());
		SELECT @previous_time AS time_left;
    END
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_check_and_insert_game_play]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [memory_games].[sp_check_and_insert_game_play]
    @guardian_id INT
AS
BEGIN
    DECLARE @today_count INT;
	DECLARE @previous_time INT;

    -- Check if there is an entry for today's date
    SELECT @today_count = COUNT(*)
    FROM memory_games.constraints
    WHERE date_of_playing = GETDATE();

    IF @today_count > 0
    BEGIN
    BEGIN
      
        SELECT time_left
        FROM memory_games.constraints
        WHERE date_of_playing =GETDATE();
    END
    END
    ELSE
    BEGIN
        -- If no entry for today, fetch total_time of the previous entry with max date
        SELECT @previous_time = total_time
        FROM memory_games.constraints
        WHERE date_of_playing = (SELECT MAX(date_of_playing) FROM memory_games.constraints);

        -- Insert the total_time for today's date
        INSERT INTO memory_games.game_play (guardian_id, total_time, time_left, date_of_playing)
        VALUES (@guardian_id, @previous_time, @previous_time,  GETDATE());
		SELECT @previous_time AS time_left;
    END
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_fetch_constraint_time]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [memory_games].[sp_fetch_constraint_time]
    @guardian_id INT,
    @date DATE = NULL
AS
BEGIN
    IF @date IS NULL
        SET @date = GETDATE();
    SELECT time_left
    FROM [memory_games].[constraints]
    WHERE guardian_id = @guardian_id AND date_of_playing=@date;
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_Fetch_game_details]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [memory_games].[sp_Fetch_game_details]
AS
BEGIN
    SELECT game_id,game_name,slug,image_url FROM memory_games.game;
END;

GO
/****** Object:  StoredProcedure [memory_games].[sp_Fetch_game_instructions]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [memory_games].[sp_Fetch_game_instructions]
@slug VARCHAR(MAX)
AS
BEGIN
    SELECT game_instructions FROM memory_games.game WHERE slug=@slug;
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_fetch_images]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [memory_games].[sp_fetch_images]
    @game_id INT,
    @level_id INT
AS
BEGIN
    DECLARE @game_level_id INT;

    -- Fetch the game_level_id corresponding to the provided game_id and level_id
    SELECT @game_level_id = id 
    FROM memory_games.game_level 
    WHERE level_id = @level_id
    AND game_id = @game_id;

    -- Retrieve image_url based on the obtained game_level_id
    SELECT image_url,id 
    FROM memory_games.card_game_image 
    WHERE game_level_id = @game_level_id;
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_fetch_images_id]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [memory_games].[sp_fetch_images_id]
    @game_id INT,
    @level_id INT
AS
BEGIN
    DECLARE @game_level_id INT;

    -- Fetch the game_level_id corresponding to the provided game_id and level_id
    SELECT @game_level_id = id 
    FROM memory_games.game_level 
    WHERE level_id = @level_id
    AND game_id = @game_id;

    -- Retrieve image_url based on the obtained game_level_id
    SELECT id 
    FROM memory_games.card_game_image 
    WHERE game_level_id = @game_level_id;
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_fetch_images_url_by_id]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [memory_games].[sp_fetch_images_url_by_id]
    @id INT
AS
BEGIN




    -- Retrieve image_url based on the obtained id
    SELECT image_url 
    FROM memory_games.card_game_image 
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_fetch_progress_with_level]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [memory_games].[sp_fetch_progress_with_level]
    @user_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.points,
        P.game_played_name,
        P.game_level_id,
        GL.level_id,
        P.level_type,
        P.game_played_date,
        P.won_yn
    FROM 
        [memory_games].[progress] AS P
    INNER JOIN
        [memory_games].[game_level] AS GL ON P.game_level_id = GL.id
    WHERE
        P.user_id = @user_id;
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_get_Child_Data]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [memory_games].[sp_get_Child_Data] 
    @user_id int
	AS


BEGIN
    SELECT user_name, date_of_birth
	FROM memory_games.users 
    WHERE user_id = @user_id



END
GO
/****** Object:  StoredProcedure [memory_games].[sp_get_Child_Game_Data]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [memory_games].[sp_get_Child_Game_Data]
    @user_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT g.[game_name], COUNT(p.[progress_id]) AS 'PlayCount'
    FROM [memory_games].[progress] p
    INNER JOIN [memory_games].[game] g ON p.[game_played_name] = g.[game_name]
    WHERE p.[user_id] = @user_id
    GROUP BY g.[game_name];
END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_Get_level_details]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [memory_games].[sp_Get_level_details] 
    @game_id int,
    @level_id int
	AS


BEGIN
    SELECT moves, no_of_cards
FROM memory_games.game_level 
    WHERE game_id = @game_id AND level_id =@level_id;
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_insert_guardian]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/******************************
* Store Procedure : {name}
* Author      :  AH
* Date        :  1/27/2024
* Description     : sp to register guardian
* Test Code      : EXEC game.sp_insert_details_of_guardian
* Revision      : [Vidhhi]: 03/01/2024: changes done
******************************/
CREATE    PROCEDURE [memory_games].[sp_insert_guardian]
@g_name VARCHAR(200),
@email NVARCHAR(MAX),
@guardian_password NVARCHAR(MAX),
@child_name VARCHAR(500),
@child_dob date
AS
BEGIN

  DECLARE @hashed_password VARBINARY(MAX);
    SET @hashed_password = HASHBYTES('SHA2_512', @guardian_password);
	INSERT INTO memory_games.guardian(g_name,email,guardian_password,child_name,child_dob) 
	VALUES (@g_name,@email,@hashed_password,@child_name,@child_dob)


DECLARE @g_id INT;

SELECT @g_id = g_id 
FROM memory_games.guardian 
WHERE guardian_password = @hashed_password;

INSERT INTO memory_games.users (guardian_id,user_name,date_of_birth) 
VALUES (@g_id,@child_name,@child_dob )

 INSERT INTO memory_games.constraints (guardian_id,total_time,time_left,date_of_playing) 
        VALUES (@g_id,30,30,GETDATE());
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_insert_progress_of_user]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [memory_games].[sp_insert_progress_of_user]
    @user_id INT,
	@points INT,
    @game_id INT, 
	@level_id INT, 
	@gamewon INT
   
AS
BEGIN

--get the game name from g_id
DECLARE @game_played_name VARCHAR(500);
SELECT @game_played_name = game_name FROM memory_games.game WHERE game_id = @game_id;

--get the level type 
DECLARE @level_type VARCHAR(500);
SELECT @level_type = level_type FROM memory_games.game_level
WHERE game_id = @game_id AND level_id = @level_id;

--get the game level id
DECLARE @game_level_id INT;
SELECT @game_level_id  = id FROM memory_games.game_level
WHERE game_id = @game_id AND level_id = @level_id;

-- Insert into progress table
INSERT INTO memory_games.progress (user_id, points, game_played_name, game_level_id, level_type, game_played_date, won_yn)
VALUES (@user_id, @points, @game_played_name, @game_level_id, @level_type, GETDATE(), @gamewon);

END;
GO
/****** Object:  StoredProcedure [memory_games].[sp_insert_user]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE
[memory_games].[sp_insert_user]
@guardian_id INT ,
@user_name VARCHAR(500),
@date_of_birth DATE
AS
BEGIN

INSERT INTO memory_games.users
(guardian_id,user_name,date_of_birth) VALUES
(@guardian_id,@user_name,@date_of_birth)

END

GO
/****** Object:  StoredProcedure [memory_games].[sp_login_Guardian]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     PROCEDURE [memory_games].[sp_login_Guardian]
    @username VARCHAR(255),
    @password NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @hashed_password VARBINARY(MAX);
    SET @hashed_password = HASHBYTES('SHA2_512', @password);

    DECLARE @count INT;

    SELECT @count = COUNT(1)
    FROM memory_games.guardian
    WHERE g_name = @username AND guardian_password = @hashed_password;

    IF @count = 1
    BEGIN
	DECLARE @child_name VARCHAR(300);


        SELECT g_id, g_name,child_name,user_id, 1 AS validYN
        FROM memory_games.guardian guardian
        INNER JOIN memory_games.users users ON guardian.g_id = users.guardian_id
        WHERE guardian.g_name = @username AND guardian.guardian_password = @hashed_password;
    END
    ELSE
    BEGIN
        SELECT 0 AS validYN;
    END
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_login_Guardian_portal]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       PROCEDURE [memory_games].[sp_login_Guardian_portal]
    @username VARCHAR(255),
    @password NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @hashed_password VARBINARY(MAX);
    SET @hashed_password = HASHBYTES('SHA2_512', @password);

    DECLARE @count INT;

    SELECT @count = COUNT(1)
    FROM memory_games.guardian
    WHERE g_name = @username AND guardian_password = @hashed_password;

    IF @count = 1
    BEGIN
        SELECT g_id, g_name,child_name,user_id, 1 AS validYN
        FROM memory_games.guardian guardian
        INNER JOIN memory_games.users users ON guardian.g_id = users.guardian_id
        WHERE guardian.g_name = @username AND guardian.guardian_password = @hashed_password;
    END
    ELSE
    BEGIN
        SELECT 0 AS validYN;
    END
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_update_daily_time]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       PROCEDURE [memory_games].[sp_update_daily_time]
    @guardian_id INT,
	@time INT
AS
BEGIN
    -- Update the time_left for the specified guardian and date
    UPDATE memory_games.constraints
    SET total_time = @time,time_left=@time-- Set @time_left to the desired value
    WHERE guardian_id = @guardian_id
    AND date_of_playing =CAST(GETDATE() AS DATE);;
	SELECT 1 as updated_time
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_update_time_left]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [memory_games].[sp_update_time_left]
    @guardian_id INT,
	@time_left INT,
	@date_of_playing DATE=NULL

AS
BEGIN
    -- Update the time_left for the specified guardian and date
    UPDATE memory_games.constraints
    SET time_left = @time_left  -- Set @time_left to the desired value
    WHERE guardian_id = @guardian_id
    AND date_of_playing=CAST(GETDATE() AS DATE);
	SELECT 1 as updated_yn
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_update_time_to_expire]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [memory_games].[sp_update_time_to_expire]
    @username VARCHAR(255),
    @time_in_minutes INT
AS
BEGIN

    DECLARE @new_time_to_expire DATETIME;
    SET @new_time_to_expire = DATEADD(mi, @time_in_minutes, GETDATE());

    UPDATE memory_games.guardian
    SET time_to_expire = @new_time_to_expire
    WHERE g_name = @username;

 
END
GO
/****** Object:  StoredProcedure [memory_games].[sp_validate_token]    Script Date: 18-05-2024 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE     PROCEDURE [memory_games].[sp_validate_token] 
@token NVARCHAR(MAX),
@userid INT
AS
BEGIN
	DECLARE @count INT 
	select @count=count(1) from memory_games.guardian where g_id=@userid and token=@token and time_to_expire > GETDATE()
	IF @count = 1
	BEGIN
		select 1 as ValidYN
	END
	ELSE
	BEGIN
		select 0 as ValidYN
	END
END
GO
USE [master]
GO
ALTER DATABASE [memory_mingle] SET  READ_WRITE 
GO

---


CREATE OR ALTER   PROCEDURE [memory_games].[sp_progress_for_charts]
    @user_id INT
AS
BEGIN
    SELECT 
        g.game_name,
        l.level_type,
        l.level_id,
        COUNT(p.progress_id) AS TimesPlayed,
        SUM(CASE WHEN p.won_yn = 0 THEN 1 ELSE 0 END) AS TimesLost,
        SUM(CASE WHEN p.won_yn = 1 THEN 1 ELSE 0 END) AS TimesWon
    FROM 
        memory_games.progress p
    INNER JOIN 
        memory_games.game_level l ON p.game_level_id = l.id
    INNER JOIN 
        memory_games.game g ON l.game_id = g.game_id
    WHERE 
        p.user_id = @user_id
    GROUP BY 
        g.game_name, l.level_type, l.level_id;
END;
GO


-----

----Insert values


INSERT INTO memory_games.game (game_name, game_instructions)
VALUES 
('Card Match', N'Welcome to Card Match!
The objective of this game is simple: match pairs of cards with identical symbols.
Youll start with all cards face down, scattered across the play area.
Click on two cards at a time to reveal them. If they match, they stay face up, and you earn points. If not, they flip back over, and its the next players turn. Keep flipping and matching until all pairs are found. The player with the most matches wins! Get ready to challenge your memory and have fun!'),

('Object Recall', N'Welcome to Object Recall! In this game,
youll be presented with a grid of words or objects.
Your task is to remember the location of each item to match pairs correctly.
Click on two items at a time to reveal them. If they match, they stay visible,
earning you points. If not theyll be hidden again, and its the next players turn. Keep uncovering and matching pairs to test your memory skills. With each successful match, the challenge increases. Get ready to exercise your memory and enjoy the thrill of Object Recall!'),

('Pattern Recognition', N'Welcome to Pattern Recognition! Your challenge is to identify and remember complex patterns displayed on the screen. Youll be shown a series of intricate designs, shapes, or sequences. Study them closely, as youll need to recreate them from memory. Once the pattern disappears, its your turn to replicate it. Pay attention to details like arrangement and colors. With each correct match, youll advance to more challenging patterns. Are you ready to put your visual memory and attention to the test? Lets see how well you can recognize patterns!')

INSERT INTO memory_games.game_level (level_id,game_id,moves,no_of_cards,level_type)
VALUES (1,1,10,16,'Easy'),
 (2,1,15,20,'Medium'),
 (3,1,20,24,'Hard'), 
(1,3,3,16,'Easy'),
(2,3,3,20,'Medium'),
(3,3,3,24,'Hard')

 UPDATE memory_games.game 
SET slug = 'cardMatch' ,
image_url='cardmatchGame.png'
WHERE game_id = 1;


UPDATE memory_games.game 
SET slug = 'ObjectRecall' ,
image_url='ObjectGame.png'
WHERE game_id = 2;

UPDATE memory_games.game 
SET slug = 'patternMatch' ,
image_url='PatternMatch.png'
WHERE game_id = 3;

INSERT INTO memory_games.card_game_image VALUES
(3,'apple.PNG'),
(3,'orange.PNG'),
(3,'sweetLime.PNG'),
(3,'watermelon.PNG'),
(3,'banana.PNG'),
(3,'blueberry.PNG'),
(3,'cranberry.PNG'),
(3,'cherry.PNG'),
(3,'guava.PNG'),
(3,'pineapple.PNG'),
(3,'strawberry.PNG'),
(3,'grapes.PNG')

INSERT INTO memory_games.card_game_image VALUES
(2,'bat.PNG'),
(2,'cran.PNG'),
(2,'duck.PNG'),
(2,'eagle.PNG'),
(2,'hen.PNG'),
(2,'ostrich.PNG'),
(2,'owl.PNG'),
(2,'parrot.PNG'),
(2,'peacock.PNG'),
(2,'swan.PNG')

INSERT INTO memory_games.card_game_image VALUES
(1,'dog.PNG'),
(1,'cat.PNG'),
(1,'elephant.PNG'),
(1,'goat.PNG'),
(1,'graffe.PNG'),
(1,'hippo.PNG'),
(1,'monkey.PNG'),
(1,'tiger.PNG')


INSERT INTO memory_games.tile_pattern(game_level,no_of_pattern,pattern)
VALUES
(1,4,'1,2,6,10'),
(1,4,'5,6,7,10'),
(1,4,'4,8,12,7'),
(1,4,'13,14,10,11'),
(1,4,'4,3,7,11'),
(2,5,'5,6,7,8,11'),
(2,5,'7,6,10,14,15'),
(2,5,'19,10,11,14,15'),
(2,5,'17,14,11,12,8'),
(2,5,'9,10,14,15,19'),
(3,6,'2,3,6,11,14,15'),
(3,6,'21,22,18,19,15,16'),
(3,6,'6,7,8,11,14,15'),
(3,6,'7,6,10,14,18,17'),
(3,6,'13,10,15,18,23,24')
-------

