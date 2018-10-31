--elaborar una función de tipo tabla que retorne los siguientes campos
--idRol, nombre del Rol, nombre producto y el total meta
CREATE FUNCTION f_Rol_Producto_Meta ()
returns table
AS
	return
		select m.idRol, r.nombreRol, p.nombreProducto, m.totalMeta
		from tb_Meta m inner join tb_Rol r
		on m.idRol=r.idRol inner join tb_Producto p
		on m.idProducto = p.idProducto

GO
SELECT * FROM f_Rol_Producto_Meta()

/*elaborar un función de tipo tabla, que muestre:
nombre del producto, nombre del cliente y todos los colaboradores 
(tenga o no contactos)
tabla principal, contacto cliente
*/
go
create function f_funcion1 ()
returns table
as
return
select p.nombreProducto, c.nombreCliente, col.nombreColaborador 
from tb_ContactoCliente cc
inner join tb_Producto p on cc.idProducto= p.idProducto
inner join tb_Cliente c on cc.idCliente = c.idCliente
right join tb_Colaborador col on cc.idColaborador = col.idColaborador

select * from f_funcion1()

/*elaborar una función de tipo escalar, donde se le enviará como parametro
el numero Documento Colaborador y calculará la cantidad de contactos realizados
*/
GO
CREATE FUNCTION f_funcion2 (@numDoc varchar(20))
returns int
as
BEGIN
	declare @cantidad int
	select @cantidad= count(*) from tb_ContactoCliente
	where idColaborador = (select idColaborador from tb_Colaborador 
	where numeroDocumentoColaborador = @numDoc)
	return @cantidad
END

select dbo.f_funcion2 ('70868111')
/*elaborar una función tipo tabla, que muestre lo siguiente:
la cantidad de productos contactados, la cantidad de clientes y 
la cantidad de colaboradores
*/
GO
ALTER FUNCTION f_funcion3()
returns table
AS

	return
	/*OPCION 1
	select
	(select count(*) from tb_ContactoCliente) as totalContacCli,
	(select count(*) from tb_Cliente) as totalCliente,
	(select count(*) from tb_Colaborador) as totalColaborador*/
	/*OPCION 2*/
	WITH 
	totalContacCli as (select count(*) totalContacCli from tb_ContactoCliente),
	totalCliente as (select count(*) totalCliente from tb_Cliente),
	totalColaborador as (select count(*) totalColaborador from tb_Colaborador)
	select (select * from totalContacCli)totalContacCli,
	(select * from totalCliente)totalCliente,
	(select * from totalColaborador)totalColaborador

select * from f_funcion3()

/*USO DEL ROW_NUMBER*/
select  ROW_NUMBER() OVER(order by idProducto) as CONTEO,
idProducto,idCliente, idColaborador, comentarioContactoCliente
from tb_ContactoCliente

--inicio de conteo por producto
select  ROW_NUMBER() OVER(partition by idProducto order by idProducto) as CONTEO,
idProducto,idCliente, idColaborador, comentarioContactoCliente
from tb_ContactoCliente
--inicio de conteo por cliente
select  ROW_NUMBER() OVER(partition by idCliente order by idProducto) as CONTEO,
idCliente,idProducto, idColaborador, comentarioContactoCliente
from tb_ContactoCliente

--USO DEL RANK
/*Retorna el ranking de cada registro dentro de un conjunto de resultados.  
A diferencia de ROW_NUMBER retorna el mismo valor para los empates*/
select nombreProducto, cantidadProducto,
RANK() OVER(order by cantidadProducto desc)as RANKING
from tb_Producto

--USO DEL DENSE_RANK
/*Retorna el ranking de cada registro dentro de un conjunto de resultados. 
A diferencia de ROW_NUMBER retorna el mismo valor para los empates*/
select nombreProducto, cantidadProducto,
RANK() OVER(order by cantidadProducto desc)as RANKING,
DENSE_RANK() OVER(order by cantidadProducto desc)as [DENSE_RANK]
from tb_Producto

--USO DEL NTILE
select nombreProducto, cantidadProducto,
NTILE(4) OVER(order by cantidadProducto desc)as [NTILE]
from tb_Producto

/*elaborar una vista de ranking de cantidad de productos contactados, 
debe de mostrar todos los productos (nombre, cantidad y número ranking)*/

select p.idProducto,p.nombreProducto, count(cc.idProducto) as cantidad,
DENSE_RANK() OVER(order by count(cc.idProducto) desc)as [DENSE_RANK]
from tb_ContactoCliente cc right join tb_Producto p
on cc.idProducto = p.idProducto
group by p.idProducto,p.nombreProducto

--uso del MIN, MAX, AVG, COUNT, SUM
select MIN(cantidadProducto)minimo, MAX(cantidadProducto)maximo,
COUNT(cantidadProducto) totalProductos,AVG(cantidadProducto)promedio,
SUM(cantidadProducto) sumatotal
from tb_Producto

--UNION y UNION ALL
--el UNION no te permite valores duplicados,
--solo mostrará un solo valor
select 'Hervey','70868111','Los Cipreses M-24' UNION
select 'Hervey','70868111','Los Cipreses M-24'

--el UNION ALL se juntará todos los registros, que tengan la misma
--cantidad de columnas y el mismo tipo de dato
select 'Hervey','70868111','Los Cipreses M-24' UNION ALL
select 'Hervey','70868111','Los Cipreses M-24' UNION ALL
select 'Quiñones','70868112','Los Cipreses M-24' UNION ALL
select 'Hervey','70868111', 3.14

--USO DEL INTERSECT
/* te emite los resultado coincidentes, pero no los duplicados
*/
--elaborar un reporte que muestre los colaboradores que SI tienen contacto
select cc.idColaborador, c.nombreColaborador
from tb_ContactoCliente cc inner join tb_Colaborador c
on cc.idColaborador =  c.idColaborador
INTERSECT 
select idColaborador, nombreColaborador from tb_Colaborador

--USO DEL EXCEPT
--elaborar un reporte que muestre los colaboradores que NO tienen contacto
select idColaborador, nombreColaborador from tb_Colaborador
EXCEPT
select cc.idColaborador, c.nombreColaborador
from tb_ContactoCliente cc inner join tb_Colaborador c
on cc.idColaborador =  c.idColaborador

--USO DE XML
--< apertura
--> cierre
--USO DEL FOR XML AUTO
--en este formato, la etiqueta principal es el nombre de la tabla y las columnas son los atributos
select idCliente, nombreCliente, fechaNacimientoCliente, numeroDocumentoCliente
from tb_Cliente
FOR XML AUTO
--USO DEL FOR XML RAW
select idCliente, nombreCliente, fechaNacimientoCliente, numeroDocumentoCliente
from tb_Cliente
FOR XML RAW
--USO DEL FOR XML PATH
select idCliente, nombreCliente, fechaNacimientoCliente, numeroDocumentoCliente
from tb_Cliente
FOR XML PATH

--
select idCliente as '@idCliente', --con el '@' el id ya no se genera como etiqueta, si no como atributo
nombreCliente as 'NombreCliente',
fechaNacimientoCliente as 'comple/fechaNac',
idTipoDocumento as 'comple/tipoDoc',
numeroDocumentoCliente as 'comple/nroDoc',
celularCliente as 'celular/@nrocel'
from tb_Cliente
FOR XML PATH, ROOT ('CLIENTE')

select * from tb_Cliente

select idProducto as '@id', 
nombreProducto, 
cantidadProducto, 
estadoProducto as 'adicional/estadoProd'
from tb_Producto
FOR XML PATH

--USO DE JSON AUTO
select idRol, nombreRol 
from tb_Rol
FOR JSON AUTO

--JSON con PATH
select idRol, nombreRol 
from tb_Rol
FOR JSON PATH, root ('Rol')

--INCLUDE_NULL_VALUES, incluye los valores nulos
select idCliente, nombreCliente, fechaNacimientoCliente,
numeroDocumentoCliente, celularCliente
from tb_Cliente
FOR JSON PATH, INCLUDE_NULL_VALUES


DECLARE @jsonVariable NVARCHAR(MAX)

SET @jsonVariable = N'[  
        {  
          "Order": {  
            "Number":"SO43659",  
            "Date":"2011-05-31T00:00:00"  
          },  
          "AccountNumber":"AW29825",  
          "Item": {  
            "Price":2024.9940,  
            "Quantity":1  
          }  
        },  
        {  
          "Order": {  
            "Number":"SO43661",  
            "Date":"2011-06-01T00:00:00"  
          },  
          "AccountNumber":"AW73565",  
          "Item": {  
            "Price":2024.9940,  
            "Quantity":3  
          }  
       }  
  ]'

INSERT INTO SalesReport  
SELECT SalesOrderJsonData.*  
FROM OPENJSON (@jsonVariable, N'$.Orders.OrdersArray')  
           WITH (  
              Number   varchar(200) N'$.Order.Number',   
              Date     datetime     N'$.Order.Date',  
              Customer varchar(200) N'$.AccountNumber',   
              Quantity int          N'$.Item.Quantity'  
           )  
  AS SalesOrderJsonData; 

  