/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      HEQUIVA
 * Project :      Modelo_Contactabilidad.DM1
 * Author :       Windows User
 *
 * Date Created : Saturday, September 15, 2018 13:58:00
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: tb_Categoria 
 */
USE BD_G5_TALLER_CONTACTABILIDAD
GO
CREATE TABLE tb_Categoria(
    idCategoria        int            IDENTITY(1,1),
    nombreCategoria    varchar(50)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (idCategoria)
)
go



IF OBJECT_ID('tb_Categoria') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Categoria >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Categoria >>>'
go

/* 
 * TABLE: tb_Cliente 
 */

CREATE TABLE tb_Cliente(
    idCliente                 int            IDENTITY(1,1),
    nombreCliente             varchar(50)    NOT NULL,
    apellidosCliente          varchar(50)    NOT NULL,
    fechaNacimientoCliente    date           NOT NULL,
    idTipoDocumento           int            NOT NULL,
    numeroDocumentoCliente    varchar(20)    NOT NULL,
    celularCliente            varchar(20)    NULL,
    direccionCliente          varchar(50)    NULL,
    emailCliente              varchar(50)    NULL,
    generoCliente             char(1)        NOT NULL,
    estadoCliente             bit            NOT NULL,
    idCategoria               int            NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (idCliente)
)
go



IF OBJECT_ID('tb_Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Cliente >>>'
go

/* 
 * TABLE: tb_Colaborador 
 */

CREATE TABLE tb_Colaborador(
    idColaborador                 int            IDENTITY(1,1),
    nombreColaborador             varchar(50)    NOT NULL,
    apellidoColaborador           varchar(50)    NOT NULL,
    numeroDocumentoColaborador    varchar(20)    NOT NULL,
    idTipoDocumento               int            NOT NULL,
    idRol                         int            NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (idColaborador)
)
go



IF OBJECT_ID('tb_Colaborador') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Colaborador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Colaborador >>>'
go

/* 
 * TABLE: tb_ContactoCliente 
 */

CREATE TABLE tb_ContactoCliente(
    idProducto                   int             NOT NULL,
    idCliente                    int             NOT NULL,
    idColaborador                int             NOT NULL,
    comentarioContactoCliente    varchar(250)    NULL,
    fechaContactoCliente         datetime        NOT NULL,
    estadoContactoCliente        char(1)         NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (idProducto, idCliente)
)
go



IF OBJECT_ID('tb_ContactoCliente') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_ContactoCliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_ContactoCliente >>>'
go

/* 
 * TABLE: tb_Meta 
 */

CREATE TABLE tb_Meta(
    idRol           int    NOT NULL,
    idSemanaPlan    int    NOT NULL,
    idProducto      int    NOT NULL,
    totalMeta       int    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY NONCLUSTERED (idRol, idSemanaPlan, idProducto)
)
go



IF OBJECT_ID('tb_Meta') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Meta >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Meta >>>'
go

/* 
 * TABLE: tb_Producto 
 */

CREATE TABLE tb_Producto(
    idProducto          int            IDENTITY(1,1),
    nombreProducto      varchar(50)    NOT NULL,
    cantidadProducto    int            NULL,
    estadoProducto      bit            NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (idProducto)
)
go



IF OBJECT_ID('tb_Producto') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Producto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Producto >>>'
go

/* 
 * TABLE: tb_Rol 
 */

CREATE TABLE tb_Rol(
    idRol        int            IDENTITY(1,1),
    nombreRol    varchar(20)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (idRol)
)
go



IF OBJECT_ID('tb_Rol') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_Rol >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_Rol >>>'
go

/* 
 * TABLE: tb_SemanaPlanificada 
 */

CREATE TABLE tb_SemanaPlanificada(
    idSemanaPlan        int            IDENTITY(1,1),
    nombreSemanaPlan    varchar(10)    NOT NULL,
    fechaInicio         date           NOT NULL,
    fechaFin            date           NOT NULL,
    estadoSemanaPlan    bit            NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (idSemanaPlan)
)
go



IF OBJECT_ID('tb_SemanaPlanificada') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_SemanaPlanificada >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_SemanaPlanificada >>>'
go

/* 
 * TABLE: tb_TipoDocumento 
 */

CREATE TABLE tb_TipoDocumento(
    idTipoDocumento        int            IDENTITY(1,1),
    nombreTipoDocumento    varchar(20)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (idTipoDocumento)
)
go



IF OBJECT_ID('tb_TipoDocumento') IS NOT NULL
    PRINT '<<< CREATED TABLE tb_TipoDocumento >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE tb_TipoDocumento >>>'
go

/* 
 * TABLE: tb_Cliente 
 */

ALTER TABLE tb_Cliente ADD CONSTRAINT Reftb_TipoDocumento21 
    FOREIGN KEY (idTipoDocumento)
    REFERENCES tb_TipoDocumento(idTipoDocumento)
go

ALTER TABLE tb_Cliente ADD CONSTRAINT Reftb_Categoria81 
    FOREIGN KEY (idCategoria)
    REFERENCES tb_Categoria(idCategoria)
go


/* 
 * TABLE: tb_Colaborador 
 */

ALTER TABLE tb_Colaborador ADD CONSTRAINT Reftb_TipoDocumento91 
    FOREIGN KEY (idTipoDocumento)
    REFERENCES tb_TipoDocumento(idTipoDocumento)
go

ALTER TABLE tb_Colaborador ADD CONSTRAINT Reftb_Rol171 
    FOREIGN KEY (idRol)
    REFERENCES tb_Rol(idRol)
go


/* 
 * TABLE: tb_ContactoCliente 
 */

ALTER TABLE tb_ContactoCliente ADD CONSTRAINT Reftb_Producto131 
    FOREIGN KEY (idProducto)
    REFERENCES tb_Producto(idProducto)
go

ALTER TABLE tb_ContactoCliente ADD CONSTRAINT Reftb_Cliente151 
    FOREIGN KEY (idCliente)
    REFERENCES tb_Cliente(idCliente)
go

ALTER TABLE tb_ContactoCliente ADD CONSTRAINT Reftb_Colaborador161 
    FOREIGN KEY (idColaborador)
    REFERENCES tb_Colaborador(idColaborador)
go


/* 
 * TABLE: tb_Meta 
 */

ALTER TABLE tb_Meta ADD CONSTRAINT Reftb_Rol181 
    FOREIGN KEY (idRol)
    REFERENCES tb_Rol(idRol)
go

ALTER TABLE tb_Meta ADD CONSTRAINT Reftb_SemanaPlanificada191 
    FOREIGN KEY (idSemanaPlan)
    REFERENCES tb_SemanaPlanificada(idSemanaPlan)
go

ALTER TABLE tb_Meta ADD CONSTRAINT Reftb_Producto201 
    FOREIGN KEY (idProducto)
    REFERENCES tb_Producto(idProducto)
go


