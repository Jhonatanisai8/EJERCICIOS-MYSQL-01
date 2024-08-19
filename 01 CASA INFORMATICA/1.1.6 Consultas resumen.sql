USE computer_shop_ejercicio;

-- 1.1.6 Consultas resumen

#Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*)  AS 'CANTIDAD DE PRODUCTOS'
FROM producto;
-- Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*)  AS 'CANTIDAD DE FABRICANTES'
FROM fabricante;
-- Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(id_fabricante) FROM producto GROUP BY id_fabricante;
-- Calcula la media del precio de todos los productos.
SELECT AVG(precio) AS 'PRECIO MEDIO' FROM producto;
-- Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS 'PRECIO MAS BARATO' FROM producto;
-- Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS 'PRECIO MAS CARO' FROM producto;
-- Lista el nombre y el precio del producto más barato.
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto)
LIMIT 1;
-- Lista el nombre y el precio del producto más caro.
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto)
LIMIT 1;
-- Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto WHERE id_fabricante = 1;
-- Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) AS 'CANTIDAD DE PRODUCTOS DE ASUS' FROM producto INNER JOIN fabricante
ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre LIKE 'Asus';
-- Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) AS 'PRECIO MEDIO DE PRODUCTOS DE ASUS' FROM producto INNER JOIN fabricante
ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre LIKE 'Asus';
-- Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) AS 'PRECIO MAS BARATO DE PRODUCTOS DE ASUS' FROM producto INNER JOIN fabricante
ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre LIKE 'Asus';
-- Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) AS 'PRECIO MAS CARO DE PRODUCTOS DE ASUS' FROM producto INNER JOIN fabricante
ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre LIKE 'Asus';
-- para comprobar
SELECT * FROM producto WHERE id_fabricante = 1;
-- Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) AS 'SUMA DE PRECIOS DE PRODUCTOS DE ASUS' FROM producto INNER JOIN fabricante
ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre LIKE 'Asus';
-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(precio) AS 'PRECI MINIMO',
MIN(precio) AS 'PRECIO MAXIMO',
AVG(precio) AS 'PRECIO MEDIO',
COUNT(*) AS 'Nº TOTAL DE PRODUCTOS DEL FABRICANTE CRUCIAL'
FROM producto INNER JOIN fabricante
ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre LIKE '%Crucial%';
/*Muestra el número total de productos que tiene cada uno de los fabricantes. 
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante 
y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.*/
SELECT COUNT(producto.id_fabricante) AS 'Nº DE PRODUCTOS',
fabricante.nombre AS 'FABRICANTE'
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id,fabricante.nombre
ORDER BY COUNT(fabricante.id) DESC;
/*Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.*/
SELECT fabricante.nombre AS 'FABRICANTE',
       MAX(producto.precio) AS 'PRECIO MAXIMO',
       MIN(producto.precio) AS 'PRECIO MINIMO',
       AVG(producto.precio) AS 'PRECIO MEDIO'
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id, fabricante.nombre;
/*Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes 
que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante,
 con el identificador del fabricante es suficiente.
 SELECT fabricante.nombre AS 'FABRICANTE',
 fabricante.id AS 'IDFABRICANTE',
       MAX(producto.precio) AS 'PRECIO MAXIMO',
       MIN(producto.precio) AS 'PRECIO MINIMO',
       AVG(producto.precio) AS 'PRECIO MEDIO',
       SUM(producto.precio) AS 'SUMA',
       COUNT(producto.id_fabricante) AS 'CANTIDAD DE PRODUCTOS superior a 200€'
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id, fabricante.nombre;*/
SELECT fabricante.nombre AS 'FABRICANTE',
 fabricante.id AS 'IDFABRICANTE',
       MAX(producto.precio) AS 'PRECIO MAXIMO',
       MIN(producto.precio) AS 'PRECIO MINIMO',
       AVG(producto.precio) AS 'PRECIO MEDIO',
       COUNT(producto.id_fabricante) AS 'CANTIDAD DE PRODUCTOS superior a 200€'
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio > 200
GROUP BY fabricante.id, fabricante.nombre;
/*Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio
 y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
 Es necesario mostrar el nombre del fabricante.*/
SELECT fabricante.nombre AS 'FABRICANTE',
 -- fabricante.id AS 'IDFABRICANTE',
       MAX(producto.precio) AS 'PRECIO MAXIMO',
       MIN(producto.precio) AS 'PRECIO MINIMO',
       AVG(producto.precio) AS 'PRECIO MEDIO',
       COUNT(producto.id_fabricante) AS 'CANTIDAD DE PRODUCTOS superior a 200€'
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio > 200
GROUP BY fabricante.id, fabricante.nombre;
-- Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) AS 'Nº DE PRODUCTOS CON PRECIO MAYOR A 180$ 'FROM producto WHERE precio >= 180;
-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT COUNT(producto.id_fabricante),fabricante.nombre AS 'Nº DE PRODUCTOS POR FABRICANTE' 
FROM producto INNER JOIN fabricante  ON producto.id_fabricante = fabricante.id
WHERE  precio >= 180 GROUP BY producto.id_fabricante,fabricante.nombre ORDER BY fabricante.id DESC;

SELECT COUNT(producto.id) AS 'Nº DE PRODUCTOS POR FABRICANTE', fabricante.nombre
FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE precio >= 180
GROUP BY fabricante.id, fabricante.nombre ORDER BY fabricante.id DESC;
DESCRIBE fabricante;
-- Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT AVG(producto.precio) AS 'PRECIO MEDIO', 
fabricante.nombre AS 'NOMBRE DEL FABRICANTE ',
fabricante.id AS 'ID DE FABRICANTE'
FROM producto INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.id,fabricante.nombre;
-- Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(producto.precio) AS 'PRECIO MEDIO', 
fabricante.nombre AS 'NOMBRE DEL FABRICANTE ',
fabricante.id AS 'ID DE FABRICANTE'
FROM producto INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.id,fabricante.nombre;
-- Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre AS 'FABRICANTE',
AVG(producto.precio) AS 'PRECIO MEDIO '
FROM producto 
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.id,fabricante.nombre 
HAVING (AVG(producto.precio)) >= 150;
-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre AS 'FABRICANTE',
COUNT(producto.id) AS 'CANTIDAD '
FROM producto INNER JOIN fabricante 
ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.id,fabricante.nombre
HAVING (COUNT(producto.id)) > 2;
/*Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior
 o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.*/
 SELECT fabricante.nombre AS 'FABRICANTE',
 COUNT(producto.id) AS 'CANTIDAD DE PRODUCTOS'
 FROM producto 
 INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
 WHERE producto.precio >= 220
 GROUP BY fabricante.id,fabricante.nombre;
 /*Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio 
 superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante 
 que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el 
 número de productos.*/
SELECT fabricante.nombre AS 'FABRICANTE',
       COALESCE(COUNT(producto.id), 0) AS 'CANTIDAD DE PRODUCTOS'
FROM fabricante
LEFT JOIN producto ON producto.id_fabricante = fabricante.id AND producto.precio >= 220
GROUP BY fabricante.id, fabricante.nombre;
/*Devuelve un listado con los nombres de los fabricantes donde la suma del precio
 de todos sus productos es superior a 1000 */
 SELECT fabricante.nombre,
 SUM(producto.precio) 
 FROM producto LEFT JOIN fabricante 
 ON producto.id_fabricante = fabricante.id
 GROUP BY fabricante.id,fabricante.id
 HAVING(SUM(producto.precio)) > 1000 ;
 
SELECT fabricante.nombre,
       SUM(producto.precio) AS total_precio
FROM fabricante
INNER JOIN producto ON producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) > 1000;
/*Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener 
tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado 
alfabéticamente de menor a mayor por el nombre del fabricante.*/
SELECT p.nombre AS NOMBRE,
       p.precio AS PRECIO,
       f.nombre AS FABRICANTE
FROM producto p
INNER JOIN fabricante f ON p.id_fabricante = f.id
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM producto p2
    WHERE p2.id_fabricante = f.id
)
ORDER BY f.nombre;
