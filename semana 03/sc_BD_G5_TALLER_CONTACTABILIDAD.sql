/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [BD_G5_TALLER_CONTACTABILIDAD]    Script Date: 29/09/2018 02:26:04 ******/
CREATE DATABASE [BD_G5_TALLER_CONTACTABILIDAD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_G5_TALLER_CONTACTABILIDAD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSQL_HEQUIVA\MSSQL\DATA\BD_G5_TALLER_CONTACTABILIDAD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_G5_TALLER_CONTACTABILIDAD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSQL_HEQUIVA\MSSQL\DATA\BD_G5_TALLER_CONTACTABILIDAD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_G5_TALLER_CONTACTABILIDAD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET  MULTI_USER 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_G5_TALLER_CONTACTABILIDAD', N'ON'
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET QUERY_STORE = OFF
GO
USE [BD_G5_TALLER_CONTACTABILIDAD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BD_G5_TALLER_CONTACTABILIDAD]
GO
/****** Object:  Table [dbo].[tb_Categoria]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombreCategoria] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Cliente]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](50) NOT NULL,
	[apellidosCliente] [varchar](50) NOT NULL,
	[fechaNacimientoCliente] [date] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[numeroDocumentoCliente] [varchar](20) NOT NULL,
	[celularCliente] [varchar](20) NULL,
	[direccionCliente] [varchar](50) NULL,
	[emailCliente] [varchar](50) NULL,
	[generoCliente] [char](1) NOT NULL,
	[estadoCliente] [bit] NOT NULL,
	[idCategoria] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Colaborador]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Colaborador](
	[idColaborador] [int] IDENTITY(1,1) NOT NULL,
	[nombreColaborador] [varchar](50) NOT NULL,
	[apellidoColaborador] [varchar](50) NOT NULL,
	[numeroDocumentoColaborador] [varchar](20) NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[idRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ContactoCliente]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ContactoCliente](
	[idProducto] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idColaborador] [int] NOT NULL,
	[comentarioContactoCliente] [varchar](250) NULL,
	[fechaContactoCliente] [datetime] NOT NULL,
	[estadoContactoCliente] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Meta]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Meta](
	[idRol] [int] NOT NULL,
	[idSemanaPlan] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[totalMeta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Producto]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[cantidadProducto] [int] NULL,
	[estadoProducto] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Rol]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SemanaPlanificada]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SemanaPlanificada](
	[idSemanaPlan] [int] IDENTITY(1,1) NOT NULL,
	[nombreSemanaPlan] [varchar](10) NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[estadoSemanaPlan] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TipoDocumento]    Script Date: 29/09/2018 02:26:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TipoDocumento](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipoDocumento] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Categoria] ON 
GO
INSERT [dbo].[tb_Categoria] ([idCategoria], [nombreCategoria]) VALUES (1, N'Cliente Clásico')
GO
INSERT [dbo].[tb_Categoria] ([idCategoria], [nombreCategoria]) VALUES (2, N'Cliente Vip')
GO
INSERT [dbo].[tb_Categoria] ([idCategoria], [nombreCategoria]) VALUES (3, N'Cliente Oro')
GO
INSERT [dbo].[tb_Categoria] ([idCategoria], [nombreCategoria]) VALUES (4, N'Cliente Platinum')
GO
SET IDENTITY_INSERT [dbo].[tb_Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Colaborador] ON 
GO
INSERT [dbo].[tb_Colaborador] ([idColaborador], [nombreColaborador], [apellidoColaborador], [numeroDocumentoColaborador], [idTipoDocumento], [idRol]) VALUES (5, N'Hervey', N'Quiñones Valentin', N'70868111', 1, 5)
GO
INSERT [dbo].[tb_Colaborador] ([idColaborador], [nombreColaborador], [apellidoColaborador], [numeroDocumentoColaborador], [idTipoDocumento], [idRol]) VALUES (6, N'Karla', N'Fuentes', N'15964537', 5, 2)
GO
INSERT [dbo].[tb_Colaborador] ([idColaborador], [nombreColaborador], [apellidoColaborador], [numeroDocumentoColaborador], [idTipoDocumento], [idRol]) VALUES (7, N'Pepe', N'el gallo', N'32659812', 5, 3)
GO
SET IDENTITY_INSERT [dbo].[tb_Colaborador] OFF
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (1, 1, 1, 100)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (2, 1, 2, 50)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (3, 1, 3, 20)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (4, 1, 4, 500)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (1, 3, 4, 40)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (2, 3, 3, 800)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (3, 3, 2, 10)
GO
INSERT [dbo].[tb_Meta] ([idRol], [idSemanaPlan], [idProducto], [totalMeta]) VALUES (4, 3, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[tb_Producto] ON 
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (1, N'Tarjeta Lan Pass', 500, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (2, N'Tarjeta Clásica Visa', 100, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (3, N'Tarjeta Clásica Mastercard', 30, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (4, N'Tarjeta Clásica Amex', 10, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (5, N'Tarjeta Cásica Dinner Club', 5, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (6, N'Tarjeta Débito Lan Pass', 250, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (7, N'Préstamo', 50, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (8, N'Seguro Oncológico', 300, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (9, N'Crédito Vehicular', 600, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (10, N'Seguro de Vida', 2, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (11, N'TR100', 500, 0)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (12, N'TRV500', 500, 0)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (13, N'TR101', 600, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (14, N'SegVida200', 100, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (15, N'PR1', 500, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (16, N'#TRV12', 500, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (17, N'$TRV00', 500, 0)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (18, N'&SegVida2', 100, 1)
GO
INSERT [dbo].[tb_Producto] ([idProducto], [nombreProducto], [cantidadProducto], [estadoProducto]) VALUES (1002, N'Tarjeta Lan Pass', 500, 1)
GO
SET IDENTITY_INSERT [dbo].[tb_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Rol] ON 
GO
INSERT [dbo].[tb_Rol] ([idRol], [nombreRol]) VALUES (1, N'GERENTE')
GO
INSERT [dbo].[tb_Rol] ([idRol], [nombreRol]) VALUES (2, N'SUBGERENTE')
GO
INSERT [dbo].[tb_Rol] ([idRol], [nombreRol]) VALUES (3, N'SUPERVISOR ONLINE')
GO
INSERT [dbo].[tb_Rol] ([idRol], [nombreRol]) VALUES (4, N'SUPERVISOR CAMPO')
GO
INSERT [dbo].[tb_Rol] ([idRol], [nombreRol]) VALUES (5, N'EJECUTOR')
GO
SET IDENTITY_INSERT [dbo].[tb_Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_SemanaPlanificada] ON 
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (1, N'S1-9', CAST(N'2018-09-03' AS Date), CAST(N'2018-09-09' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (3, N'S2-9', CAST(N'2018-09-10' AS Date), CAST(N'2018-09-16' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (4, N'S3-9', CAST(N'2018-09-17' AS Date), CAST(N'2018-09-23' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (5, N'S4-9', CAST(N'2018-09-24' AS Date), CAST(N'2018-09-30' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (6, N'S1-10', CAST(N'2018-10-01' AS Date), CAST(N'2018-10-07' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (7, N'S2-10', CAST(N'2018-10-08' AS Date), CAST(N'2018-10-14' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (8, N'S3-10', CAST(N'2018-10-15' AS Date), CAST(N'2018-10-21' AS Date), 1)
GO
INSERT [dbo].[tb_SemanaPlanificada] ([idSemanaPlan], [nombreSemanaPlan], [fechaInicio], [fechaFin], [estadoSemanaPlan]) VALUES (9, N'S4-10', CAST(N'2018-10-22' AS Date), CAST(N'2018-10-31' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[tb_SemanaPlanificada] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_TipoDocumento] ON 
GO
INSERT [dbo].[tb_TipoDocumento] ([idTipoDocumento], [nombreTipoDocumento]) VALUES (1, N'DNI')
GO
INSERT [dbo].[tb_TipoDocumento] ([idTipoDocumento], [nombreTipoDocumento]) VALUES (2, N'RUC')
GO
INSERT [dbo].[tb_TipoDocumento] ([idTipoDocumento], [nombreTipoDocumento]) VALUES (3, N'LE')
GO
INSERT [dbo].[tb_TipoDocumento] ([idTipoDocumento], [nombreTipoDocumento]) VALUES (4, N'Carnet Extranjería')
GO
INSERT [dbo].[tb_TipoDocumento] ([idTipoDocumento], [nombreTipoDocumento]) VALUES (5, N'Pasaporte')
GO
SET IDENTITY_INSERT [dbo].[tb_TipoDocumento] OFF
GO
/****** Object:  Index [PK9]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Categoria] ADD  CONSTRAINT [PK9] PRIMARY KEY NONCLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK11]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Cliente] ADD  CONSTRAINT [PK11] PRIMARY KEY NONCLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK12]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Colaborador] ADD  CONSTRAINT [PK12] PRIMARY KEY NONCLUSTERED 
(
	[idColaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK13]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_ContactoCliente] ADD  CONSTRAINT [PK13] PRIMARY KEY NONCLUSTERED 
(
	[idProducto] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK15]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Meta] ADD  CONSTRAINT [PK15] PRIMARY KEY NONCLUSTERED 
(
	[idRol] ASC,
	[idSemanaPlan] ASC,
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK10]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Producto] ADD  CONSTRAINT [PK10] PRIMARY KEY NONCLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK14]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_Rol] ADD  CONSTRAINT [PK14] PRIMARY KEY NONCLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK16]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_SemanaPlanificada] ADD  CONSTRAINT [PK16] PRIMARY KEY NONCLUSTERED 
(
	[idSemanaPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK1]    Script Date: 29/09/2018 02:26:05 ******/
ALTER TABLE [dbo].[tb_TipoDocumento] ADD  CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Cliente]  WITH CHECK ADD  CONSTRAINT [Reftb_Categoria81] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[tb_Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[tb_Cliente] CHECK CONSTRAINT [Reftb_Categoria81]
GO
ALTER TABLE [dbo].[tb_Cliente]  WITH CHECK ADD  CONSTRAINT [Reftb_TipoDocumento21] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tb_TipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[tb_Cliente] CHECK CONSTRAINT [Reftb_TipoDocumento21]
GO
ALTER TABLE [dbo].[tb_Colaborador]  WITH CHECK ADD  CONSTRAINT [Reftb_Rol171] FOREIGN KEY([idRol])
REFERENCES [dbo].[tb_Rol] ([idRol])
GO
ALTER TABLE [dbo].[tb_Colaborador] CHECK CONSTRAINT [Reftb_Rol171]
GO
ALTER TABLE [dbo].[tb_Colaborador]  WITH CHECK ADD  CONSTRAINT [Reftb_TipoDocumento91] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[tb_TipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[tb_Colaborador] CHECK CONSTRAINT [Reftb_TipoDocumento91]
GO
ALTER TABLE [dbo].[tb_ContactoCliente]  WITH CHECK ADD  CONSTRAINT [Reftb_Cliente151] FOREIGN KEY([idCliente])
REFERENCES [dbo].[tb_Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[tb_ContactoCliente] CHECK CONSTRAINT [Reftb_Cliente151]
GO
ALTER TABLE [dbo].[tb_ContactoCliente]  WITH CHECK ADD  CONSTRAINT [Reftb_Colaborador161] FOREIGN KEY([idColaborador])
REFERENCES [dbo].[tb_Colaborador] ([idColaborador])
GO
ALTER TABLE [dbo].[tb_ContactoCliente] CHECK CONSTRAINT [Reftb_Colaborador161]
GO
ALTER TABLE [dbo].[tb_ContactoCliente]  WITH CHECK ADD  CONSTRAINT [Reftb_Producto131] FOREIGN KEY([idProducto])
REFERENCES [dbo].[tb_Producto] ([idProducto])
GO
ALTER TABLE [dbo].[tb_ContactoCliente] CHECK CONSTRAINT [Reftb_Producto131]
GO
ALTER TABLE [dbo].[tb_Meta]  WITH CHECK ADD  CONSTRAINT [Reftb_Producto201] FOREIGN KEY([idProducto])
REFERENCES [dbo].[tb_Producto] ([idProducto])
GO
ALTER TABLE [dbo].[tb_Meta] CHECK CONSTRAINT [Reftb_Producto201]
GO
ALTER TABLE [dbo].[tb_Meta]  WITH CHECK ADD  CONSTRAINT [Reftb_Rol181] FOREIGN KEY([idRol])
REFERENCES [dbo].[tb_Rol] ([idRol])
GO
ALTER TABLE [dbo].[tb_Meta] CHECK CONSTRAINT [Reftb_Rol181]
GO
ALTER TABLE [dbo].[tb_Meta]  WITH CHECK ADD  CONSTRAINT [Reftb_SemanaPlanificada191] FOREIGN KEY([idSemanaPlan])
REFERENCES [dbo].[tb_SemanaPlanificada] ([idSemanaPlan])
GO
ALTER TABLE [dbo].[tb_Meta] CHECK CONSTRAINT [Reftb_SemanaPlanificada191]
GO
USE [master]
GO
ALTER DATABASE [BD_G5_TALLER_CONTACTABILIDAD] SET  READ_WRITE 
GO
