USE [master]
GO
/****** Object:  Database [superNumero]    Script Date: 25/05/2022 7:40:02:p. m. ******/
CREATE DATABASE [superNumero]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'superNumero', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\superNumero.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'superNumero_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\superNumero_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [superNumero] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [superNumero].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [superNumero] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [superNumero] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [superNumero] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [superNumero] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [superNumero] SET ARITHABORT OFF 
GO
ALTER DATABASE [superNumero] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [superNumero] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [superNumero] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [superNumero] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [superNumero] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [superNumero] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [superNumero] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [superNumero] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [superNumero] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [superNumero] SET  ENABLE_BROKER 
GO
ALTER DATABASE [superNumero] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [superNumero] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [superNumero] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [superNumero] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [superNumero] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [superNumero] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [superNumero] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [superNumero] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [superNumero] SET  MULTI_USER 
GO
ALTER DATABASE [superNumero] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [superNumero] SET DB_CHAINING OFF 
GO
ALTER DATABASE [superNumero] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [superNumero] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [superNumero] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [superNumero] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [superNumero] SET QUERY_STORE = OFF
GO
USE [superNumero]
GO
/****** Object:  Table [dbo].[numeros]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[numeros](
	[idNumero] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](5) NOT NULL,
	[resultado] [int] NOT NULL,
	[detalle] [varchar](100) NULL,
	[fechayhora] [date] NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([idUsuario], [pass], [nombre]) VALUES (2, N'123', N'hector')
INSERT [dbo].[usuarios] ([idUsuario], [pass], [nombre]) VALUES (3, N'321', N'julia')
INSERT [dbo].[usuarios] ([idUsuario], [pass], [nombre]) VALUES (18, N'123', N'Pedro')
INSERT [dbo].[usuarios] ([idUsuario], [pass], [nombre]) VALUES (19, N'123', N'Elvis')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
ALTER TABLE [dbo].[numeros]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([idUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[numeros] CHECK CONSTRAINT [FK_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[sp_createUser]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_createUser](
@nombre varchar(20),
@pass varchar (20),
@registrado bit output,
@mensaje varchar(100) output 
)
as
begin 
	if(not exists(select * from usuarios where nombre =@nombre))
	begin 
		insert into usuarios(nombre, pass)values(@nombre,@pass)
		set @registrado =1;
		set @mensaje ='Usuario Registrado'
	end
	else 
	begin
		set @registrado =0
		set @mensaje ='Usuario ya Existe'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_delet]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delet]
@idurio as int
As
delete numeros
where idUsuario=@idurio
GO
/****** Object:  StoredProcedure [dbo].[sp_delete]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_delete] 
@idUser as int
As
delete numeros
where idUsuario=@idUser

GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUs]    Script Date: 25/05/2022 7:40:03:p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_RegistrarUs]
@nombre varchar(40),
@pass varchar(40)
AS
 insert into usuarios (nombre, pass) values (@nombre,@pass)
	
GO
USE [master]
GO
ALTER DATABASE [superNumero] SET  READ_WRITE 
GO
