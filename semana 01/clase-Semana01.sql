/*para crear una base de datos desde cero, usar el siguiente c�digo*/
CREATE DATABASE BD_G5_TALLER_CONTACTABILIDAD
--se mostrar� el siguiente mensaje indicando que est� correctamente
/*Commands completed successfully.*/
/*
para realizar comentarios en el c�digo sql 
*/
--comentario
/*
comentario*/
GO
USE BD_G5_TALLER_CONTACTABILIDAD



/*CREACI�N DE UNA TABLA*/
CREATE TABLE tb_TipoDocumento(
idTipoDocumento int identity (1,10) primary Key,
nombreTipoDocumento varchar(20)
)

/*consultar tabla tipo documento*/
select * from tb_TipoDocumento

/*borrado de tablas inciando los que tienen dependencia*/
GO
DROP TABLE tb_Cruce/*se tiene que eliminar primero porque tiene depedencias*/
DROP TABLE tb_Categoria
DROP TABLE tb_TipoDocumento
/*BORRADO DE BASE DE DATOS*/
--USE master
DROP DATABASE BD_G5_TALLER_CONTACTABILIDAD