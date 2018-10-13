/*--SUBCONSULTAS
INSERT INTO tb_Cliente (idcCliente,nombreCliente, emailCliente, estadoCliente)
VALUES (159654,'PERSONA5', '-', 'A')

INSERT INTO tb_Cliente (idcCliente,nombreCliente, emailCliente, estadoCliente)
SELECT 987654, 'PERSON6', 'emailP6', 'A'
SELECT * FROM tb_Cliente
--SELECT
--WHERE
--FROM
--INSERT
SELECT TOP 1 idModulo FROM tb_Modulo
WHERE nombreModulo LIKE '%1. MÓDULO: IDENTIFICACIÓN DEL PROVEEDOR%'

INSERT INTO tb_Evaluacion (idModulo, idCliente, estadoEvaluacion)
SELECT (SELECT TOP 1 idModulo FROM tb_Modulo
WHERE nombreModulo LIKE '%1. MÓDULO: IDENTIFICACIÓN DEL PROVEEDOR%'), '5', 'A'

--3° MÓDULO: ACCIONES IMPACTANTES DE LAS ACTIVIDADES DEL PROVEEDOR 
--PERSON6

INSERT INTO tb_Evaluacion (idModulo, idCliente, estadoEvaluacion)
SELECT 
(SELECT TOP 1 idModulo FROM tb_Modulo
WHERE nombreModulo LIKE '%3° MÓDULO: ACCIONES IMPACTANTES DE LAS ACTIVIDADES DEL PROVEEDOR%'),
(SELECT TOP 1 idCliente FROM tb_Cliente
WHERE nombreCliente LIKE '%PERSON6%'), 'A'


INSERT INTO tb_Cuestionario 
(ordenPregunta, tituloCuestionario, idTipoCuestionario,idModulo, estadoCuestionario)
SELECT '32', 'NuevaPregunta', 4,4,'A'

select * from tb_Cuestionario


--SUBCONSULTAS DENTRO DE UN SELECT
-- ELABORAR UN REPORTE DONDE SE MUESTRE
--ORDEN DE PREGUNTA, TITULO, TIPO CUESTIONARIO
SELECT ordenPregunta, tituloCuestionario, idTipoCuestionario,
(select nombreTipoCuestionario from tb_TipoCuestionario tc
where tc.idTipoCuestionario = cuest.idTipoCuestionario) AS NombreTipoCuest
FROM tb_Cuestionario cuest
--SUBCONSULTA DE UN SELECT con EL INNER JOIN
--se mostrará el mismo resultado, a diferencia que el el INNER JOIN es mas optimo
select ordenPregunta, tituloCuestionario, c.idTipoCuestionario, 
tc.nombreTipoCuestionario
from tb_TipoCuestionario tc inner join
tb_Cuestionario c on tc.idTipoCuestionario = c.idTipoCuestionario
--ELABORAR UN REPORTE QUE MUESTRE ordenpregunta, titulocuestionario,
--idmodulo y nombremodulo
select ordenPregunta, tituloCuestionario, idModulo,
(select TOP 1 nombreModulo from tb_Modulo m where m.idModulo = c.idModulo)
from tb_Cuestionario c
--ELABORAR UN REPORTE que muestre el nombre del modulo y el cliente de la tabla
--evaluación
select (SELECT m.nombreModulo from tb_Modulo m where m.idModulo = e.idModulo),
(select nombreCliente from tb_Cliente c where c.idCliente = e.idCliente)
from tb_Evaluacion e
--del anterior resultado, contar las personas que tengan el nombre N1
--SUB CONSULTAS DENTRO DE UN FROM
SELECT COUNT(*) FROM
(select (SELECT m.nombreModulo from tb_Modulo m where m.idModulo = e.idModulo) modulo,
(select nombreCliente from tb_Cliente c where c.idCliente = e.idCliente) cliente
from tb_Evaluacion e) as EVALUACION_CONSULTA
WHERE cliente like '%N1%'

--elaborar un reporte donde se muestre cuantas preguntas tiene cada tipo de cuestionario 
--y por cuantas preguntas tiene el modulo

select tc.idTipoCuestionario,tc.nombreTipoCuestionario,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idTipoCuestionario = tc.idTipoCuestionario)as CantPreguntas
from tb_TipoCuestionario tc

select m.idModulo, m.nombreModulo,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idModulo = m.idModulo) as CantPreguntas
from tb_Modulo m

--mostrar el top de cada uno
select TOP 1 tc.idTipoCuestionario,tc.nombreTipoCuestionario,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idTipoCuestionario = tc.idTipoCuestionario)as CantPreguntas
from tb_TipoCuestionario tc
ORDER BY CantPreguntas DESC

select TOP 1 m.idModulo, m.nombreModulo,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idModulo = m.idModulo) as CantPreguntas
from tb_Modulo m
ORDER BY CantPreguntas DESC

select TOP 1 tc.nombreTipoCuestionario,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idTipoCuestionario = tc.idTipoCuestionario)as CantPreguntas
from tb_TipoCuestionario tc
ORDER BY CantPreguntas DESC

select m.nombreModulo,
(select COUNT(cu.idCuestionario) 
from tb_Cuestionario cu WHERE cu.idModulo = m.idModulo) as CantPreguntas
from tb_Modulo m
ORDER BY CantPreguntas DESC
*/
---BD_G5_TALLER_CONTACTABILIDAD
USE BD_G5_TALLER_CONTACTABILIDAD
/*
1) registrar mas clientes y colaboradores
2) registrar contacto de cliente
3) elaborar cual es el colaborador top que tiene mas contactos
- se debe de mostrar todos los colaboradores
4) si es colaborador no tiene contactos, mostrar un comentario 'NO TIENE CONTACTOS'
*/
select * from tb_Colaborador
--select * from tb_Cliente
select * from tb_ContactoCliente
select * from tb_Producto

--Pregunta 03
--3.1 Obtener contactos por cliente
    
   --Mostrar el nombre del colaborador
   --consulta externa

   select --top 1 
   idColaborador,nombreColaborador,apellidoColaborador 
   from
   (
    --consulta interna
	select col.nombreColaborador,col.apellidoColaborador,cto.idColaborador,count(idCliente) as totalcontactos
	from tb_ContactoCliente cto
	inner join tb_Colaborador col on cto.idColaborador=col.idColaborador
	group by col.nombreColaborador,col.apellidoColaborador,cto.idColaborador
   ) rescontactos
   order by totalcontactos desc

select * from tb_Cliente
INSERT INTO tb_Cliente (nombreCliente, apellidosCliente, fechaNacimientoCliente, idTipoDocumento,numeroDocumentoCliente,generoCliente,estadoCliente,idCategoria)
SELECT 'cliente1','cliente1', getdate(), 1,'98765438','M',1,1

select * from tb_ContactoCliente
select * from tb_Colaborador
select * from tb_Producto

insert into tb_ContactoCliente (idProducto,idCliente,idColaborador, fechaContactoCliente,estadoContactoCliente)
select 2,1, 5,getdate(),1 union all
select 4,2, 5,getdate(),1

--como insertar información en un IDENTITY
select * from tb_Colaborador
select * from tb_Rol
INSERT INTO tb_Colaborador 
(nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 'Abelardo','kiros','65498331','1', '2'

INSERT INTO tb_Colaborador 
(nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 'Gabriela','Rojas','65498216','1', '3'

-------------------------------------------------------
SET IDENTITY_INSERT tb_Colaborador ON; 
INSERT INTO tb_Colaborador 
(idColaborador,nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 1004,'Gabriela','Rojas','65498216','1', '3'
SET IDENTITY_INSERT tb_Colaborador OFF; 
-------------------------------------------------------

SET IDENTITY_INSERT tb_Colaborador ON; 
INSERT INTO tb_Colaborador 
(idColaborador,nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 8,'Bernardo','Benites','6549831','1', '1'
SET IDENTITY_INSERT tb_Colaborador OFF; 

INSERT INTO tb_Colaborador 
(nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 'Fiorella','Caguas','65489134','1', '4'

SET IDENTITY_INSERT tb_Colaborador ON; 
INSERT INTO tb_Colaborador 
(idColaborador,nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, 
idTipoDocumento, idRol)
SELECT 9,'Bernardo','Benites','6549831','1', '1' UNION ALL
SELECT 10,'Magaly','Medina', '6549831','1',2
SET IDENTITY_INSERT tb_Colaborador OFF; 

select * from tb_Colaborador

--FUNCIONES, VISTAS, PROCEDIMIENTOS ALMACENADOS
--elaborar una VISTA que muestre los clientes
--como crear una vista
--nomenclatura para crear una vista 
--V -> significa vista
--Cliente ->nombre de la tabla
--Lista -> acción a realizar
-- la vista SOLO emite resultados de un Select
CREATE VIEW v_Cliente_lista
AS
select idCliente, nombreCliente, apellidosCliente,
fechaNacimientoCliente, td.nombreTipoDocumento, celularCliente, direccionCliente,
emailCliente, generoCliente, cat.nombreCategoria
 from tb_Cliente c inner join tb_TipoDocumento td
 on c.idTipoDocumento = td.idTipoDocumento inner join tb_Categoria cat
 on c.idCategoria = cat.idCategoria
 --como llamar una vista
 select * from v_Cliente_lista
 --como moficar una vista
ALTER VIEW v_Cliente_lista
AS
select idCliente, nombreCliente, apellidosCliente,
fechaNacimientoCliente, td.nombreTipoDocumento, celularCliente, direccionCliente,
emailCliente, generoCliente, cat.nombreCategoria
 from tb_Cliente c inner join tb_TipoDocumento td
 on c.idTipoDocumento = td.idTipoDocumento inner join tb_Categoria cat
 on c.idCategoria = cat.idCategoria
 WHERE apellidosCliente like '%a%' or apellidosCliente like '%e%'

 --ELABORAR UNA VISTA donde se muestre todos los colaboradores, su cliente contactado
 --el producto y su comentario
 CREATE VIEW v_Reporte_ClienteconColaborador
 AS
 select col.nombreColaborador, cli.nombreCliente, pro.nombreProducto, concli.comentarioContactoCliente
 from tb_Colaborador col left join tb_ContactoCliente concli
 on col.idColaborador = concli.idColaborador left join tb_Cliente cli
 on concli.idCliente = cli.idCliente left join tb_Producto pro
 on concli.idProducto = pro.idProducto
 
 --segun la vista creada, si no tiene nombre cliente, colocar una columna donde
 --se muestre el mensaje 'NO TIENE CLIENTES'
 select nombreColaborador, nombreCliente, nombreProducto, comentarioContactoCliente,
 CASE
	WHEN nombreCliente IS NULL OR nombreCliente = ''
		THEN 'No tiene Clientes'
 END AS MENSAJE
 from v_Reporte_ClienteconColaborador

ALTER VIEW v_Reporte_ClienteconColaborador
 AS
 select col.idColaborador, col.nombreColaborador, 
 cli.idCliente, cli.nombreCliente, 
 pro.idProducto, concli.comentarioContactoCliente
 from tb_Colaborador col left join tb_ContactoCliente concli
 on col.idColaborador = concli.idColaborador left join tb_Cliente cli
 on concli.idCliente = cli.idCliente left join tb_Producto pro
 on concli.idProducto = pro.idProducto

 select nombreColaborador, nombreCliente, nombreProducto
 from v_Reporte_ClienteconColaborador vrC INNER JOIN tb_Producto p
 on vrC.idProducto = p.idProducto
 --ELIMINACIÓN DE VISTAS
 DROP VIEW v_Reporte_ClienteconColaborador
 
 --PROCEDIMIENTOS ALMACENADOS
 --elaborar un reporte que se visualice el nombre del rol y su meta total
CREATE PROCEDURE sp_Meta_listxRol
AS
SELECT r.nombreRol, totalMeta FROM tb_Meta m inner join tb_Rol r
on m.idRol = r.idRol

execute sp_Meta_listxRol
exec sp_Meta_listxRol

CREATE VIEW v_Meta_listxRol
AS
SELECT r.nombreRol, totalMeta FROM tb_Meta m inner join tb_Rol r
on m.idRol = r.idRol

select * from v_Meta_listxRol
exec sp_Meta_listxRol

ALTER PROCEDURE sp_Meta_listxRol
AS
SELECT r.nombreRol, totalMeta, idProducto FROM tb_Meta m inner join tb_Rol r
on m.idRol = r.idRol

exec sp_Meta_listxRol
 --variables tipo tabla, tablas temporales
 
 CREATE PROCEDURE sp_Rol_Insert
 AS
 INSERT INTO tb_Rol (nombreRol)
 SELECT 'ROL1'

 exec sp_Rol_Insert
 select * from tb_Rol

 ALTER PROCEDURE sp_Rol_Insert
 @nombreRol varchar(50)
 AS
 INSERT INTO tb_Rol (nombreRol)
 SELECT @nombreRol
 select * from tb_Rol

 exec sp_Rol_Insert 'ROL3'


 CREATE PROCEDURE sp_Producto_Insert
 @nombreProducto varchar(50),
 @cantidadProducto int
 as
INSERT INTO tb_Producto (nombreProducto, cantidadProducto, estadoProducto)
SELECT @nombreProducto,@cantidadProducto, 1

exec sp_Producto_Insert 'Producto2',10
select * from tb_Producto