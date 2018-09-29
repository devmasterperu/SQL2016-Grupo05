--Listado de información
SELECT 2 + 2 -- Adición
SELECT 'Hervey' --para declarar texto, deberá ir entre comillas simples
SELECT 2 + 'Hervey' --muestra error por tipos de datos
SELECT 'Hervey' + ' Quiñones' --concatenando texto

--muestre la suma, resta, multiplicación, división y módulo de dos números

SELECT 6+3,6-3,6*3,6/3,6%3
--RENOMBRADO DE COLUMNA o TABLAS --> AS

SELECT 6+3 AS SUMA,6-3 AS RESTA,6*3 AS MULTIPLICACIÓN,
6/3 AS DIVISIÓN,6%3 AS MÓDULO
--NOTA: no es necesario colocar el AS para renombrar columnas o tablas

SELECT 6+3 SUMA,6-3  RESTA,6*3  MULTIPLICACIÓN,
6/3  DIVISIÓN,6%3  MÓDULO

-- si se requiere renombrar con nombres con espacio, deberá ir entre []
SELECT 6+3 [Suma_Total]
SELECT 6+3 SumaTotal

--DECLARACIÓN DE VARIABLES
DECLARE @V1 int
DECLARE @V2 int
SET @V1=6 --Asignación de información
SET @V2=3

SELECT @V1 Variable1, @v2 Variable2,
@V1+@V2 AS SUMA,@V1-@V2 AS RESTA,@V1*@V2 AS MULTIPLICACIÓN,
@V1/@V2 AS DIVISIÓN,@V1%@V2 AS MÓDULO

USE BD_G5_TALLER_CONTACTABILIDAD
SELECT * --liste todas las columnas sin excepción
FROM categoria$
SELECT * FROM categoria_2

SELECT * FROM tb_Categoria

--TRUNCATE TABLE tb_Categoria

DELETE FROM tb_Categoria
DBCC CHECKIDENT (tb_Categoria, RESEED,0)

--INSERTAR INFORMACIÓN
INSERT INTO 
tb_Categoria --NOMBRE DE LA TABLA
(nombreCategoria) -- COLUMNAS QUE SE INSERTARÁN*
VALUES ('Cliente Clásico') --LOS VALORES SEGUN LA CANTIDAD DE COLUMNAS

INSERT INTO tb_Categoria (nombreCategoria)
VALUES ('Cliente Vip') 
INSERT INTO tb_Categoria (nombreCategoria)
VALUES ('Cliente Oro') 

INSERT INTO tb_Categoria (nombreCategoria)
VALUES ('Cliente Platinum')
SELECT * FROM tb_Categoria


INSERT INTO tb_Rol (nombreRol) VALUES ('GERENTE')
INSERT INTO tb_Rol (nombreRol) VALUES ('SUBGERENTE')
INSERT INTO tb_Rol (nombreRol) VALUES ('SUPERVISOR ONLINE')
INSERT INTO tb_Rol (nombreRol) VALUES ('SUPERVISOR CAMPO')
INSERT INTO tb_Rol (nombreRol) VALUES ('EJECUTOR')
SELECT * from tb_Rol

/*REALIZAR LA INSERCIÓN DE PRODUCTOS*/

INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Lan Pass',500,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Clásica Visa',100,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Clásica Mastercard',30,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Clásica Amex',10,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Cásica Dinner Club',5,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Tarjeta Débito Lan Pass',250,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Préstamo',50,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Seguro Oncológico',300,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Crédito Vehicular',600,1)
INSERT INTO tb_Producto (nombreProducto,cantidadProducto,estadoProducto) VALUES ('Seguro de Vida',2,1)

SELECT * FROM tb_Producto

--INSERCIÓN DE DATOS CON SELECT
INSERT INTO tb_Producto 
(nombreProducto,cantidadProducto,estadoProducto)
SELECT '#TRV12', 500,1 UNION ALL
SELECT '$TRV00', 500,1 UNION ALL
SELECT '&SegVida2', 100,1 

--USO DEL WHERE
SELECT idProducto, nombreProducto, cantidadProducto, estadoProducto 
FROM tb_Producto
WHERE cantidadProducto = 100

--mostrar los productos que tengan la cantidad mayor a 100
SELECT idProducto, nombreProducto, cantidadProducto, estadoProducto 
FROM tb_Producto
WHERE cantidadProducto > 100

--mostrar los productos que tengan la cantidad mayor o igual a 100
--Modo 1
SELECT idProducto, nombreProducto, cantidadProducto, estadoProducto 
FROM tb_Producto
WHERE cantidadProducto >= 100
--Modo 2
SELECT idProducto, nombreProducto, cantidadProducto, estadoProducto 
FROM tb_Producto
WHERE cantidadProducto > 100 OR cantidadProducto = 100

--seleccionar los productos con estado activo y mayor o igual a 500,
-- deberán mostrarse los nombres de manera ascendente
SELECT * FROM tb_Producto
WHERE cantidadProducto >= 500 AND estadoProducto = 1
ORDER BY nombreProducto
--ASC -> ascendente
--DESC ->descendente

--insertar información en la tabla tipo documento y colaborador

INSERT INTO tb_TipoDocumento
SELECT 'DNI' UNION ALL
SELECT 'RUC' UNION ALL
SELECT 'LE' UNION ALL
SELECT 'Carnet Extranjería' UNION ALL
SELECT 'Pasaporte'

select * from tb_TipoDocumento
select * from tb_Rol

INSERT INTO tb_Colaborador
(nombreColaborador, apellidoColaborador, numeroDocumentoColaborador, idTipoDocumento, idRol)
SELECT 'Hervey', 'Quiñones Valentin', '70868111', 1,5 UNION ALL
SELECT 'Karla','Fuentes', '15964537', 1, 2 UNION ALL
SELECT 'Pepe','el gallo', '32659812', 1, 3 UNION ALL
SELECT 'Morita','Del Río', '98654512',1, 1

select * from tb_Colaborador

--Actualización de información

UPDATE tb_Colaborador
SET apellidoColaborador = 'Morales'
--recomendación: USAR SIEMPRE EL WHERE
Where idColaborador = 3
select * from tb_Colaborador

/*
actualizar el nombre y el apellido del colaborador que tenga el número de documento
98654512 y el rol 1
*/
UPDATE tb_Colaborador
SET nombreColaborador = 'nuevo nombre', apellidoColaborador = 'nuevo app'
WHERE numeroDocumentoColaborador = 98654512 AND idRol = 1
select * from tb_Colaborador

/*actualizar al tipo documento pasaporte de los colaboradores
que tengan el rol 1, 2 o 3
*/
--modo 1
UPDATE tb_Colaborador
SET idTipoDocumento = 5
WHERE idRol=1 OR idRol=2 or idRol = 3

--modo 2 uso del IN
UPDATE tb_Colaborador
SET idTipoDocumento = 5
WHERE idRol IN(1,2,3)

select * from tb_Colaborador
select * from tb_Rol

--estructura de un DELETE
--borrar los colaboradores que tengan tipo documento pasaporte
-- y con rol GERENTE
DELETE tb_Colaborador
where idTipoDocumento = 5 and idRol = 1
--