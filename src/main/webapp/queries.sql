CREATE DATABASE tpractico;

USE tpractico;
/********************************TABLAS***********************************/
CREATE TABLE tb_productos (
    id_producto int NOT NULL AUTO_INCREMENT, 
    nombre varchar(45), 
    descripcion varchar(100), 
    costo int(100), 
    PRIMARY KEY(id_producto)
);

CREATE TABLE tb_sucursales (
    id_sucursal int NOT NULL AUTO_INCREMENT, 
    nombre varchar(30),
    direccion varchar(40),
    PRIMARY KEY (id_sucursal)
);

CREATE TABLE tb_productos_sucursales (
    id_tbsucursal int NOT NULL, 
    id_tbproducto int NOT NULL,
    stock int(4),
    PRIMARY KEY(id_tbsucursal, id_tbproducto),
    FOREIGN KEY(id_tbsucursal) REFERENCES tb_sucursales(id_sucursal),
    FOREIGN KEY(id_tbproducto) REFERENCES tb_productos(id_producto)
);

/*******************************INSERTS**************************************/

INSERT INTO tb_sucursales (nombre, direccion)
VALUES ('San Justo','Florio 3025'),
       ('Martinez','Edison 1754'),
       ('Quilmes','Rocha 55');
INSERT INTO tb_productos (nombre, descripcion, costo) 
VALUES ('mouse', 'inhalambrico',1200), 
       ('monitor','led, 16 pulgadas LG', 22000), 
       ('motherboard', 'Asus AMD A320 RAM DDR4', 17000), 
       ('parlante','Logitech z407 con bluetooth', 2420),
       ('microfono','Kolke condensador',2200),
       ('teclado','mecanico Gamer retroiluminado',21000);

SET @id_producto = LAST_INSERT_ID();

INSERT INTO tb_productos_sucursales(id_tbsucursal, id_tbproducto, stock)
VALUES(1,1,50),
      (1,2,2),
      (1,3,5),
      (1,4,10),
      (1,5,20),
      (1,6,33),
      (2,1,62),
      (2,2,3),
      (2,3,4),
      (2,4,15),
      (2,5,45),
      (2,6,47),
      (3,1,50),
      (3,2,2),
      (3,3,5),
      (3,4,10),
      (3,5,20),
      (3,6,33);
/********************************CONSULTAS************************************/
 
SELECT tb_productos.nombre AS producto, 
       tb_productos.descripcion AS descripcion, 
       tb_sucursales.nombre AS sucursal,
       tb_productos_sucursales.stock AS stock,
       tb_productos.costo AS costo
FROM tb_productos_sucursales 
    JOIN tb_sucursales 
        ON tb_productos_sucursales.id_tbsucursal= tb_sucursales.id_sucursal 
    JOIN tb_productos 
        ON tb_productos_sucursales.id_tbproducto= tb_productos.id_producto
    AND tb_sucursales.id_sucursal=1;


SELECT sucursal FROM tb_sucursales WHERE id_sucursal= ?

/*******************************UPDATES***************************************/
UPDATE tb_productos_sucursales SET stock= ? WHERE id_tbsucursal= ? AND tb_productos_sucursales.id_tbproductos=?;
/**********************************PRUEBAS************************************/