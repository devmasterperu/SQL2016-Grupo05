/*para crear una base de datos desde cero, usar el siguiente código*/
CREATE DATABASE BD_G5_TALLER_CONTACTABILIDAD
--se mostrará el siguiente mensaje indicando que está correctamente
/*Commands completed successfully.*/
/*
para realizar comentarios en el código sql 
*/
--comentario
/*
comentario*/
GO
USE BD_G5_TALLER_CONTACTABILIDAD



/*CREACIÓN DE UNA TABLA*/
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