--Elaborar un reporte de los productos que en su nombre tengan la 'S' al inicio
select * from tb_Producto
where nombreProducto like 'S%'
--LIKE
--% te indica n cantidad de caracteres hacia donde esté ubicado
--LIKE 'a%' - cualquier valor inicie con a
--LIKE '%a'	- cualquier valor finalice "a"
--LIKE '%or%' - cualquier valor que contenga "or"
--LIKE '_r%' - cualquire valor que contenga "r" en la segunda posición
--LIKE 'a%o' - cualquier valor que inicie con "a" y finalice con "o"
--- caso 2: nombreCampo like 'a%' AND nombreCampo like '%o'

--Elaborar un reporte de los productos que en su nombre tengan la 'S' al inicio
-- y finalice con la letra 'A'
select * from tb_Producto
where nombreProducto like 'S%A'
select * from tb_Producto
where nombreProducto like 'S%' AND nombreProducto like '%a'

--uso del not o del !=
--elabore un reporte donde la cantidad de productos no sea 100 o 500
select * from tb_Producto
WHERE cantidadProducto != 100 AND cantidadProducto != 500

select * from tb_Producto
where (not cantidadProducto = 100 AND not cantidadProducto = 500)
ORDER BY cantidadProducto

--elabore un reporte donde la cantidad de productos no sea 100 o 500
--y filtrar los productos que la cantidad de sea de 30 a 300
select * from tb_Producto
where (not cantidadProducto = 100 AND not cantidadProducto = 500) AND
(cantidadProducto between 30 AND 300)
ORDER BY cantidadProducto

--elaborar un reporte donde la cantidad de producto sea de 10,30, 50 o 300 
select * from tb_Producto
where cantidadProducto = 10 OR cantidadProducto = 30 or cantidadProducto =50
or cantidadProducto = 300

select * from  tb_Producto
where cantidadProducto IN (10,30,50,300)

--TOP
-- elaborar un reporte que muestre el primer producto que inicien con la letra S
select top 1 
idProducto, nombreProducto, cantidadProducto from tb_Producto
where nombreProducto like 'S%'

--OFFSET-FECTH
SELECT *
FROM   tb_Producto
ORDER BY idProducto
OFFSET 9 ROWS--Se saltea 0 registros y de donde quieres iniciar
FETCH NEXT 6 ROWS ONLY -- cantidad de registros que se muestran
--**************************************************
DECLARE  @tamPagina AS BIGINT = 10, 
         @numPagina AS BIGINT = 2;

SELECT     *
FROM       tb_Producto
--es importante declarar el ordenar 'ORDER BY' (ascendente o descendente)
ORDER BY   idProducto --DESC
OFFSET    (@numPagina - 1) * @tamPagina ROWS 
FETCH NEXT @tamPagina ROWS ONLY
-----

-- elaborar un reporte que me muestre el producto y la meta
select nombreProducto, cantidadProducto, totalMeta from 
tb_Producto left join  tb_Meta
on tb_Producto.idProducto = tb_Meta.idProducto

select nombreProducto, cantidadProducto, totalMeta from 
tb_Meta m right join tb_Producto p
on m.idProducto = p.idProducto

select nombreProducto, cantidadProducto, totalMeta, sp.nombreSemanaPlan from 
tb_Meta m right join tb_Producto p
on m.idProducto = p.idProducto left join tb_SemanaPlanificada sp
on m.idSemanaPlan = sp.idSemanaPlan

select * from tb_Cliente
select * from tb_Colaborador
select * from tb_Producto
insert into tb_ContactoCliente (idProducto, idCliente, idColaborador, comentarioContactoCliente,fechaContactoCliente, estadoContactoCliente)
SELECT 9,2,5,'-',GETDATE(),1 UNION ALL
SELECT 2,3,7, 'cliente acepto estafa',GETDATE(),1

SELECT 1, 2, '3' UNION ALL
select 1, 2, '3' UNION ALL
select 1, 2, '3' UNION ALL
select 1, 2, 'Texto'


select * from tb_ContactoCliente
-- elaborar un reporte que muestre a los clientes (todos), nombre del producto,
-- y el colaborador que realizó el contacto
select c.nombreCliente, p.nombreProducto, col.nombreColaborador
from tb_Cliente c left join tb_ContactoCliente cc
on c.idCliente = cc.idCliente left join tb_Producto p
on p. idProducto = cc.idProducto left join tb_Colaborador col
on cc.idColaborador = col.idColaborador
--a la consulta anterior, mostrar una columna adicional Comentario 
--que muestre un mensaje "NO TIENE CONTACTO" si el nombre del producto es nullo o vacío
-- si tiene nombre producto, que muestre "TIENE CONTACTO"
select c.nombreCliente, p.nombreProducto, col.nombreColaborador,
CASE
	WHEN p.nombreProducto = '' OR p.nombreProducto IS NULL
		THEN  'NO TIENE CONTACTO'/*
	WHEN p.nombreProducto != '' OR p.nombreProducto IS NOT NULL
		THEN  'TIENE CONTACTO'*/
	WHEN p.nombreProducto like '[A-Z]%'
		THEN 'TIENE LETRAS'
END as COMENTARIO
from tb_Cliente c left join tb_ContactoCliente cc
on c.idCliente = cc.idCliente left join tb_Producto p
on p. idProducto = cc.idProducto left join tb_Colaborador col
on cc.idColaborador = col.idColaborador

select * from tb_Producto

SELECT CONVERT (int, 25.10)--primero el tipo de variable, luego el valor
SELECT CAST (25.10 AS int)-- primero el valor, leugo el tipo de variable


SELECT CONVERT(date,getdate(),101) as [date],
CONVERT(datetime,getdate(),101)as [datetime],
CONVERT(varchar,getdate(),101) as [varchar],
CONVERT(date,'10/06/2018',101) as [mm/dd/yyyy->yyyy-mm-dd]

SELECT CONVERT(date,getdate(),103) as [date],
CONVERT(datetime,getdate(),103)as [datetime],
CONVERT(varchar,getdate(),103) as [varchar],
CONVERT(date,'29/09/2018',103) as [dd/mm/yyyy->yyyy-mm-dd]

SELECT CONVERT(date,getdate(),112) as [date],
CONVERT(datetime,getdate(),112)as [datetime],
CONVERT(varchar,getdate(),112) as [varchar],
CONVERT(date,'20180929',112) as [yyyymmdd->yyyy-mm-dd]

--CONCAT
select nombreCliente + ' ' + apellidosCliente + ' nació en la fecha: '
+ CONVERT(varchar,fechaNacimientoCliente)
from tb_Cliente
select CONCAT ('El Cliente:',nombreCliente, ' ',apellidosCliente, 'nacio en la fecha', 
fechaNacimientoCliente)
from tb_Cliente

select SUBSTRING(nombreProducto,9,15)
from tb_Producto

select LEN(nombreProducto)
from tb_Producto

select CHARINDEX('Tarjeta', nombreProducto)
from tb_Producto

select REPLACE(nombreProducto,'Tarjeta','T'),nombreProducto
from tb_Producto

select UPPER(nombreProducto),LOWER(nombreProducto)
from tb_Producto

SELECT CONVERT(DATE,GETDATE()), CONVERT(TIME,GETDATE())