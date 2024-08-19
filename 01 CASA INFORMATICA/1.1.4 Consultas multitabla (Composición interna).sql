USE computer_shop_ejercicio;
-- 1.1.4 Consultas multitabla (Composición interna)

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre AS 'NOMBRE',
producto.precio AS 'PRECIO',
fabricante.nombre AS 'FABRICANTE'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id;
/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos
 los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.*/
SELECT producto.nombre AS 'NOMBRE',
producto.precio AS 'PRECIO',
fabricante.nombre AS 'FABRICANTE'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY fabricante.nombre ASC;
/*Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante
 y nombre del fabricante, de todos los productos de la base de datos.*/
 SELECT producto.id AS 'ID PRODUCTO',
 producto.nombre AS 'NOMBRE',
producto.precio AS 'PRECIO',
fabricante.id AS 'ID FABRICANTE',
fabricante.nombre AS 'FABRICANTE'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id;
-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre AS 'PRODUCTO',
producto.precio AS 'PRECIO',
fabricante.nombre AS 'FABRICANTE'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio ASC LIMIT 1;
-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre AS 'PRODUCTO',
producto.precio AS 'PRECIO',
fabricante.nombre AS 'FABRICANTE'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id
ORDER BY producto.precio DESC LIMIT 1;
-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE 'Lenovo';
-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE 'Crucial'
AND producto.precio > 200;
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT * FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE 'Asus'
OR fabricante.nombre LIKE 'Hewlett-Packard'
OR fabricante.nombre LIKE 'Seagate';
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM fabricante;
SELECT * FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate');
-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT * FROM fabricante;
SELECT * FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%e';
-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre AS 'PRODUCTO',
producto.precio AS 'PRECIO'
 FROM producto 
INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%w%';
/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos 
que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente)
 y en segundo lugar por el nombre (en orden ascendente)*/
 SELECT 
 producto.nombre AS 'PRODUCTO',
 producto.precio AS 'PRECIO',
 fabricante.nombre AS 'FABRICANTE'
 FROM producto 
 INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
 WHERE producto.precio >= 180 ORDER BY producto.precio ASC,producto.nombre DESC;
/*Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen
 productos asociados en la base de datos.*/
 SELECT DISTINCT fabricante.id AS 'ID FABRICANTE',
 fabricante.nombre AS 'FABRICANTE'
 FROM fabricante INNER JOIN producto
 ON fabricante.id = producto.id_fabricante;
 