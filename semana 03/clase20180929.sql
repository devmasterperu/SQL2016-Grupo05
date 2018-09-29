/*para emitir un backup de información, se debe de especificar
el nombre con que se desea guardar y al final la extensión
.bak
bk_Contactabilidad.bak
*/
--USO DEL DISTINCT
--te diferencia según las columnas que se hayan seleccionado
select * from tb_Producto
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto)
VALUES ('Tarjeta Lan Pass','500',1)

SELECT DISTINCT nombreProducto from tb_Producto

--uso del CASE

select nombreColaborador, apellidoColaborador, numeroDocumentoColaborador,
idTipoDocumento,
CASE
	WHEN idTipoDocumento = 1 --se puede colocar distintas sintaxis
		THEN 'DNI' --si el valor cumple, se imprime la información
	WHEN idTipoDocumento = 5 THEN 'Pasaporte'
	--WHEN
	--WHEN
END AS tipoDocumento
FROM tb_Colaborador
/*Tipos de documentos
1	DNI
2	RUC
3	LE
4	Carnet Extranjería
5	Pasaporte

Roles
1           GERENTE
2           SUBGERENTE
3           SUPERVISOR ONLINE
4           SUPERVISOR CAMPO
5           EJECUTOR
*/
/* realizar 3 registros de colaboradores y 
mostrar un reporte con el nombre del tipo documento y separado el rol
*/
select nombreColaborador, apellidoColaborador, numeroDocumentoColaborador,
idTipoDocumento,
CASE
	WHEN idTipoDocumento = 1 THEN 'DNI'
	WHEN idTipoDocumento = 2 THEN 'RUC'
	WHEN idTipoDocumento = 3 THEN 'LE'
	WHEN idTipoDocumento = 4 THEN 'Carnet Extranjería'
	WHEN idTipoDocumento = 5 THEN 'Pasaporte'
END AS tipoDocumento,

CASE
	WHEN idRol = 1 THEN 'GERENTE'
	WHEN idRol = 2 THEN 'SUBGERENTE'
	WHEN idRol = 3 THEN 'SUPERVISOR ONLINE'
	WHEN idRol = 4 THEN 'SUPERVISOR CAMPO'
	WHEN idRol = 5 THEN 'EJECUTOR'
END AS ROL
FROM tb_Colaborador

--USO DEL IN
--elaborar un reporte de productos que tenga las siguientes cantidades
--10,5,50
--MODO1
select * from tb_Producto
where cantidadProducto = 10 or cantidadProducto = 5
or cantidadProducto = 50
--MODO2
select * from tb_Producto
where cantidadProducto in(10,5,50)

--USO DE BETWEEN
-- se especifica un rango de valores (inicio and fin)
select * from tb_Producto
where cantidadProducto between 5 --valor iniciar
AND 10-- valor final

--USO DE CONVERT Y CAST
SELECT CONVERT (int, 25.10)--primero el tipo de variable, luego el valor
SELECT CAST (25.10 AS int)

select getdate()-- con el getdate() se obtiene la fecha del día del sistema

SELECT CONVERT(date,getdate(),101) as [date],
CONVERT(datetime,getdate(),101)as [datetime],
CONVERT(varchar,getdate(),101) as [varchar],
CONVERT(date,'09/29/2018',101) as [mm/dd/yyyy->yyyy-mm-dd]

SELECT CONVERT(date,getdate(),103) as [date],
CONVERT(datetime,getdate(),103)as [datetime],
CONVERT(varchar,getdate(),103) as [varchar],
CONVERT(date,'29/09/2018',103) as [dd/mm/yyyy->yyyy-mm-dd]

SELECT CONVERT(date,getdate(),112) as [date],
CONVERT(datetime,getdate(),112)as [datetime],
CONVERT(varchar,getdate(),112) as [varchar],
CONVERT(date,'20180929',112) as [yyyymmdd->yyyy-mm-dd]

select * from tb_SemanaPlanificada

INSERT INTO tb_SemanaPlanificada 
(nombreSemanaPlan, fechaInicio, fechaFin, estadoSemanaPlan)
VALUES ('S1-9',CONVERT(date,'03/09/2018',103),CONVERT(date,'09/09/2018',103),1) --dd/mm/yyyy

INSERT INTO tb_SemanaPlanificada 
(nombreSemanaPlan, fechaInicio, fechaFin, estadoSemanaPlan)
VALUES ('S2-9',CONVERT(date,'2018/09/10',111),CONVERT(date,'2018/09/16',111),1) --yyyy/mm/dd

INSERT INTO tb_SemanaPlanificada 
(nombreSemanaPlan, fechaInicio, fechaFin, estadoSemanaPlan)
VALUES ('S3-9',CONVERT(date,'09/17/2018',101),CONVERT(date,'09/23/2018',101),1) --mm/dd/yyyy

select * from tb_SemanaPlanificada

delete from tb_SemanaPlanificada
DBCC CHECKIDENT (tb_SemanaPlanificada, RESEED, 0)

--insertar registros para la S4-9 hasta la S4-10

INSERT INTO tb_SemanaPlanificada 
(nombreSemanaPlan, fechaInicio, fechaFin, estadoSemanaPlan)
VALUES ('S4-9',CONVERT(date,'20180924',112),CONVERT(date,'20180930',112),1)

INSERT INTO tb_SemanaPlanificada 
(nombreSemanaPlan, fechaInicio, fechaFin, estadoSemanaPlan)
SELECT 'S1-10',CONVERT(date,'20181001',112),CONVERT(date,'20181007',112),1 UNION ALL
SELECT 'S2-10',CONVERT(date,'20181008',112),CONVERT(date,'20181014',112),1 UNION ALL
SELECT 'S3-10',CONVERT(date,'20181015',112),CONVERT(date,'20181021',112),1 UNION ALL
SELECT 'S4-10',CONVERT(date,'20181022',112),CONVERT(date,'20181031',112),1

--elborar un reporte donde se muestre que la fecha inicio sea entre 18 de septiembre y
-- 16 de octubre
select * from tb_SemanaPlanificada
where fechaInicio between CONVERT(date,'20180918',112) and CONVERT(date,'20181016',112)

--elaborar un reporte donde se muestre que la fecha fin sea mayor a 11 de septiembre o
-- fecha inicio igual a 20 de octubre
USE BD_G5_TALLER_CONTACTABILIDAD
select * from tb_SemanaPlanificada
where fechaFin > CONVERT(date,'20180911',112) OR
fechaInicio = CONVERT(date,'20181020',112)

--USO DEL LIKE
--elaborar un reporte de productos que tengan el nombre tarjeta
select * from tb_Producto
WHERE nombreProducto like '%tarjeta%' 
--el % indica n caracteres hacia el lado donde esté especificado

--elaborar un reporte de productos que finalicen con la letra 'S'
select * from tb_Producto
WHERE nombreProducto like '%S' 
--elaborar un reporte de productos que la segunda letra sea 'e'
select * from tb_Producto
WHERE nombreProducto like '__e%'
--el subguión '_' especifica las posiciones

--elaborar un reporte de productos que inicien con la letra 'T' y 
-- termine con la letra 'S'
--modo1
select * from tb_Producto
WHERE nombreProducto like 'T%' and nombreProducto like '%S'
--modo2
select * from tb_Producto
WHERE nombreProducto like 'T%S'
--LIKE
--LIKE 'a%' - cualquier valor inicie con a
--LIKE '%a'	- cualquier valor finalice "a"
--LIKE '%or%' - cualquier valor que contenga "or"
--LIKE '_r%' - cualquire valor que contenga "r" en la segunda posición
--LIKE 'a%o' - cualquier valor que inicie con "a" y finalice con "o"

---actualizar los productos con el estado 0, que finalicen el nombre
--con el caracter '0'(cero) y tenga una cantidad mayor o igual a 500
UPDATE tb_Producto
SET estadoProducto = 0
--select * from tb_Producto
WHERE nombreProducto like '%0' and cantidadProducto >= 500

--uso del NOT
--elaborar un reporte que no tengan el estado 1 de la tabala producto
select * from tb_Producto
--where estadoProducto != 1 --modo 1 se interpreta como DIFERENTE A
where not estadoProducto = 1 --modo2
select * from tb_Producto
--elaborar un reporte de productos que la cantidad no sea menor igual a 10, 
--con estado activo y nombre culmine con 'a','s' o 'x
select * from tb_Producto
where not cantidadProducto <=10 and estadoProducto = 1 and 
(nombreProducto like '%a' or nombreProducto like '%s' 
or nombreProducto like '%x')

--uso del TOP
SELECT TOP 3 * FROM tb_Producto
order by idProducto desc

--uso del OFFSET-FETCH
SELECT *
FROM   tb_Producto
ORDER BY idProducto
OFFSET 10 ROWS--Se saltea 0 registros y de donde quieres iniciar
FETCH NEXT 5 ROWS ONLY -- cantidad de registros que se muestran

DECLARE  @tamPagina AS BIGINT = 7, 
         @numPagina AS BIGINT = 3;

SELECT     *
FROM       tb_Producto
--es importante declarar el ordenar 'ORDER BY' (ascendente o descendente)
ORDER BY   idProducto --DESC
OFFSET    (@numPagina - 1) * @tamPagina ROWS 
FETCH NEXT @tamPagina ROWS ONLY

/*CONSULTA DE MULTIPLES TABLAS
para mostrar un listado de registros con cruce de tablas
CROSS JOIN
INNER JOIN
LEFT JOIN
RIGTH JOIN
FULL OUTER JOIN*/
--uso del INNER JOIN (ver caso similar con el tipo documento)
SELECT nombreColaborador, apellidoColaborador, numeroDocumentoColaborador,
col.idTipoDocumento, td.nombreTipoDocumento
FROM tb_Colaborador as col INNER JOIN tb_TipoDocumento as td
ON col.idTipoDocumento = td.idTipoDocumento

--elaborar un reporte donde se muestre el nombre del colaborador,
--numero de documento, id rol y nombre del rol
SELECT nombreColaborador, apellidoColaborador, numeroDocumentoColaborador,
col.idRol, r.nombreRol, col.idTipoDocumento, td.nombreTipoDocumento
FROM tb_Colaborador as col INNER JOIN tb_Rol r 
ON col.idRol = r.idRol INNER JOIN tb_TipoDocumento td
ON col.idTipoDocumento = td.idTipoDocumento

--INSERTAR REGISTROS EN LA TABLA META
INSERT INTO tb_Meta (idRol,idSemanaPlan,idProducto,totalMeta)
select 1,1,1,100 union all
select 2,1,2, 50 union all
select 3,1,3,20  union all
select 4,1,4,500 union all
select 1,3,4,40 union all
select 2,3,3, 800 union all
select 3,3,2,10  union all
select 4,3,1,2

--elabore un reporte para mostrar la semana planificada,
-- y las metas por rol
select r.idRol, r.nombreRol,m.idSemanaPlan, m.totalMeta
--from tb_Rol r LEFT join tb_Meta m
from tb_Meta m RIGHT join tb_Rol r
on r.idRol = m.idRol

--elaborar un reporte mostrando todos los roles, sus respectivo
-- nombre de la semana planificada y el total de la meta
select r.idRol, r.nombreRol,m.idSemanaPlan, m.totalMeta, sp.nombreSemanaPlan
from tb_Rol r LEFT join tb_Meta m
on r.idRol = m.idRol left JOIN tb_SemanaPlanificada sp
on m.idSemanaPlan = sp.idSemanaPlan

select nombreColaborador + ' '+
 apellidoColaborador from tb_Colaborador

 select CONCAT(nombreColaborador, ' ',apellidoColaborador)
 from tb_Colaborador

 --elaborar un reporte que se muestre todas las semanas planificadas
 -- con su meta y mostrar una columna adicional, 
 ---si la meta es mayor igual a 100 que se muestre un mesaje 'META ALTA'
 -- contrario se muestra un mensaje 'META BAJA'
 select sp.nombreSemanaPlan, m.totalMeta,
 CASE
	WHEN totalMeta >=100 THEN 'META ALTA'
	WHEN totalMeta <100 THEN 'META BAJA'
 END
 --from tb_Meta m right join tb_SemanaPlanificada sp
 from tb_SemanaPlanificada sp left join tb_Meta m
 on m.idSemanaPlan = sp.idSemanaPlan
