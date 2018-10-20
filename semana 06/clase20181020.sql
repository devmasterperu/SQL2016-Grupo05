USE BD_G5_TALLER_CONTACTABILIDAD
--SUBCONSULTAS
--elaborar un reporte de colaboradores con sus respectivos roles
--consultas con inner join
select c.nombreColaborador, r.nombreRol
from tb_Colaborador c inner join  tb_Rol r
ON c.idRol = r.idRol
--consultas con subconsultas dentro de un select
select  c.nombreColaborador, c.idRol, 
(select top 1 nombreRol from tb_Rol r where r.idRol = c.idRol)
from tb_Colaborador c

/*elaborar un reporte con subconsultas de la tabla colaborador
que muestre el nombre colaborador, nombre rol y nombre del tipo documento
*/
select  c.nombreColaborador, c.idRol,
(select top 1 nombreRol from tb_Rol r where r.idRol = c.idRol) as ROL,
(select top 1 nombreTipoDocumento from tb_TipoDocumento td 
where td.idTipoDocumento = c.idTipoDocumento) as Documento
from tb_Colaborador c

/*elaborar un reporte con subconsulta, donde se muestre los siguientes campo
idRol, nombre semana planificada, nombre del producto
y total de la meta
*/
select 
(select r.nombreRol from tb_Rol r where r.idRol=m.idRol)Rol,
(select sp.nombreSemanaPlan from tb_SemanaPlanificada sp where sp.idSemanaPlan = m.idSemanaPlan)SemanaPlan,
(select p.nombreProducto from tb_Producto p where p.idProducto = m.idProducto)Producto,
totalMeta
from tb_Meta m
--subconsultas dentro de un from
select prod.idProducto,Producto, totalMeta from
(select SemanaPlan, Producto, totalMeta 
from
(select 
(select r.nombreRol from tb_Rol r where r.idRol=m.idRol)Rol,
(select sp.nombreSemanaPlan from tb_SemanaPlanificada sp where sp.idSemanaPlan = m.idSemanaPlan)SemanaPlan,
(select p.nombreProducto from tb_Producto p where p.idProducto = m.idProducto)Producto,
totalMeta
from tb_Meta m) metaNuevo --nombre de una nueva tabla
) metaNuevo2 inner join tb_Producto prod
on metaNuevo2.Producto = prod.nombreProducto

/*elaborar un reporte que muestre de la tabla cliente el nombre, nro documento
nombre tipo documento y el nombre de la categoria
*/
select nombreCliente,numeroDocumentoCliente, c.idTipoDocumento, 
(select top 1 nombreTipoDocumento from tb_TipoDocumento td
where td.idTipoDocumento = c.idTipoDocumento)
, c.idCategoria,
(select TOP 1 cat.nombreCategoria from tb_Categoria cat
where cat.idCategoria = c.idCategoria)
from tb_Cliente c

/*del anterior resultado, quitar los id*/
--subconsulta dentro de un select y un from
select nombreCliente, nombreCat from
(select nombreCliente, numeroDocumentoCliente, nombreTD, nombreCat from
(select nombreCliente,numeroDocumentoCliente, c.idTipoDocumento, 
(select top 1 nombreTipoDocumento from tb_TipoDocumento td
where td.idTipoDocumento = c.idTipoDocumento) as nombreTD
, c.idCategoria,
(select TOP 1 cat.nombreCategoria from tb_Categoria cat
where cat.idCategoria = c.idCategoria) as nombreCat
from tb_Cliente c) resultado1) resultado2
-- subconsulta dentro de un INSERT
INSERT INTO tb_Producto (nombreProducto, cantidadProducto, estadoProducto)
select 'Tarjeta Premium',20,1 UNION ALL
select 'tarjeta premium visa',10,1

select * from tb_Producto
--sub consultas dentro de un where
--elaborar un reporte de los cliente que tengan tipo documento DNI
select nombreCliente, fechaNacimientoCliente, numeroDocumentoCliente
from tb_Cliente c
where c.idTipoDocumento = 
(select top 1 td.idTipoDocumento from tb_TipoDocumento td
where nombreTipoDocumento like '%DNI%')

/*elaborar un reporte de clientes, que sean de la categoría
Cliente Clásico y que tenga documento DNI
*/
select nombreCliente, fechaNacimientoCliente, numeroDocumentoCliente
from tb_Cliente c
where c.idTipoDocumento = 
(select top 1 td.idTipoDocumento from tb_TipoDocumento td
where nombreTipoDocumento like '%DNI%')
and 
idCategoria = (select top 1 idCategoria from tb_Categoria 
where nombreCategoria like '%Cliente Clásico%')

--uso del CTE
--WITH --nombredemiconsulta
--as
--(consulta a realizar)
--(select * from nombredemiconsulta)
--consultas con WITH
WITH resultado1 --renombrado de la consulta
as
(select idRol, idSemanaPlan, idProducto, totalMeta from tb_Meta) --consulta
select idRol, idSemanaPlan from resultado1 --llamado del renombrado de la consulta


--subconsulta con from
select * from 
(select idRol, idSemanaPlan from 
(select idRol, idSemanaPlan, idProducto, totalMeta 
from tb_Meta) resultado1) resultado2


WITH 
resultadoMeta as (select idRol, idSemanaPlan, idProducto, totalMeta from tb_Meta),
resultadoRol as (select idRol, nombreRol from tb_Rol),
resultadoTotal as (select rm.idRol,rr.nombreRol, rm.idSemanaPlan  
from resultadoMeta rm inner join resultadoRol rr
on rm.idRol = rr.idRol)
select * from resultadoTotal

/*elaborar un reporte donde se muestre el colaborador y su rol
*/
GO
--query corto
WITH
resCol as (select idColaborador, nombreColaborador,idRol from tb_Colaborador),
resTotal as (select resCol. nombreColaborador, r.nombreRol
from tb_Rol r inner join resCol on r.idRol = resCol. idRol)
select * from resTotal

--query largo
GO
WITH
resCol as (select idColaborador,nombreColaborador,idRol,idTipoDocumento 
			from tb_Colaborador),
resRol as (select idRol, nombreRol from tb_Rol),
resTotal as (select idColaborador, nombreColaborador, nombreRol 
			from resCol inner join resRol on resCol.idRol= resRol.idRol)
select * from resTotal

/*elaborar un reporte donde se muestre el nombre del cliente, 
el numero documento, el tipo documento y que categoria tiene*/
GO
WITH
rcliente as (select nombreCliente, numeroDocumentoCliente, idTipoDocumento, idCategoria 
				from tb_Cliente),
rtipdoc as (select idTipoDocumento, nombreTipoDocumento from tb_TipoDocumento),
rcat as (select idCategoria, nombreCategoria from tb_Categoria),
resultadoFinal as (select rc.nombreCliente,numeroDocumentoCliente, rtd.nombreTipoDocumento, rcat.nombreCategoria
from rcliente rc inner join rtipdoc rtd on rc.idTipoDocumento = rtd.idTipoDocumento
inner join rcat on rc.idCategoria = rcat.idCategoria)
select * from resultadoFinal

/*FUNCIONES
escalares- permite realizar calculo y pueden ser llamados desde un select o procedimiento almacenado
tipo tabla- te emite un resultado formato tabla

VISTAS
te emite resultado formato tabla, no permite INSERT, UPDATE O DELETE

PROCEDIMIENTOS ALMACENADOS
te emite resultado formato tabla, pero el resultado no puede ser llamado desde otro lado

*/
GO
--FUNCIONES ESCALAR
--calcular el total de los contactos realizados
CREATE FUNCTION f_calculoContactos ()--el parentis es obligatorio
returns int --cual es el tipo de dato que va retornar
--debe de mencionarse como RETURNS
as
BEGIN
	declare @cantidad int --se tiene que declarar una variable igual al tipo de resultado a retornar
	select @cantidad = COUNT(idProducto) from tb_ContactoCliente
	return @cantidad
END

select dbo.f_calculoContactos()

select COUNT(idCliente) as cantidadCliente, dbo.f_calculoContactos() as cantidadContacto
from tb_Cliente

--funciones escalares con parametros
GO
CREATE FUNCTION f_CantidadContactoxColaborador
(@idColaborador int) --si se declara el parametro, se debe indicar el tipo de variable
returns int
AS
BEGIN
	declare @cantidad int --es el campo calculado a retornar
	select @cantidad= COUNT(idCliente) from tb_ContactoCliente
	where idColaborador = @idColaborador
	return @cantidad
END
--calcular la cantidad de clientes del colaborador con DNI 70868111
select dbo.f_CantidadContactoxColaborador (
(select idColaborador from tb_Colaborador
where numeroDocumentoColaborador= '70868111'))

--elaborar una función donde se sume las metas del rol GERENTE
--la función debe de tener 1 parametro
GO
CREATE FUNCTION f_SumaMetasxRol
(@nombreRol varchar(10))
returns int
AS
BEGIN
	declare @cantidad int
	select @cantidad= sum(totalMeta) from tb_Meta
	where idRol = (select idRol from tb_Rol where nombreRol = @nombreRol)
	return @cantidad
END


select dbo.f_SumaMetasxRol ('GERENTE')
GO
--actualización de funciones
ALTER FUNCTION f_SumaMetasxRol
(@nombreRol varchar(10))
returns int
AS
BEGIN
	declare @cantidad int
	select @cantidad= COUNT(totalMeta) from tb_Meta
	where idRol = (select idRol from tb_Rol where nombreRol = @nombreRol)
	return @cantidad
END


--elaborar una función que retorne la suma de metas 
--y la cantidad de contactos realizados por rol
--FUNCIONES TIPO TABLA
GO
ALTER FUNCTION f_CalculosMetayContacto ()
returns table
AS
	return
	SELECT
	(SELECT SUM(totalMeta) FROM tb_Meta)as Metas ,
	(SELECT COUNT(*) from tb_ContactoCliente)as Contactos 

--llamada de una función tipo tabla
select * from dbo.f_CalculosMetayContacto()

--VISTAS
GO
CREATE VIEW v_MetayContacto
as
SELECT
	(SELECT SUM(totalMeta) FROM tb_Meta)as Metas ,
	(SELECT COUNT(*) from tb_ContactoCliente)as Contactos 

select * from v_MetayContacto

ALTER VIEW v_MetayContacto
as
SELECT
	(SELECT COUNT(*) from tb_ContactoCliente)as Contactos,
	(SELECT SUM(totalMeta) FROM tb_Meta)as Metas 

--PROCEDIMIENTOS ALMACENADOS
GO
CREATE PROCEDURE sp_listaMetayContacto
as
SELECT
	(SELECT COUNT(*) from tb_ContactoCliente)as Contactos,
	(SELECT SUM(totalMeta) FROM tb_Meta)as Metas 

--llamada de un procedimiento almacenado
execute sp_listaMetayContacto
exec sp_listaMetayContacto

--elborar un SP donde te permita ingresar el nombre del rol
-- y luego te liste los resultados de la tabla Rol
CREATE PROCEDURE sp_Rol_Insert
@nombre varchar(50) 
AS
INSERT INTO tb_Rol (nombreRol)
SELECT @nombre

SELECT * FROM tb_Rol
---------------------------------------
exec sp_Rol_Insert 'ROL5'

/*Elaborar un SP que inserte al colaborador y se liste.
debe tener los siguientes parametros
-nombre
-apellido
-numeroDocumento
-nombre del documento (Carnet Extranjería,Pasaporte, LE)
-nombre del rol (SUBGERENTE, GERENTE)
*/
--INICIO***********************************************
ALTER PROCEDURE sp_Colaborador_Insert
@NombreCol varchar(50),
@AppCol varchar(50),
@numDoc varchar(20),
@tipoDoc varchar(20),
@nombreRol varchar(20)
as
INSERT INTO tb_Colaborador 
(nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, 
idTipoDocumento, idRol)
SELECT @NombreCol, @AppCol, @numDoc,
(select top 1 idTipoDocumento from tb_TipoDocumento
where nombreTipoDocumento = @tipoDoc),
(select top 1 idRol from tb_Rol
where nombreRol = @nombreRol)

select * from tb_Colaborador
--FIN*******************************************

exec sp_Colaborador_Insert 'Juana','la Cuaba','95468135','RUC','SUBGERENTE'
select * from tb_Colaborador

---TIPS de como ver la estructura de un SP
sp_helptext sp_Meta_listxRol