USE computer_shop_ejercicio;
#1.1.7.5 Subconsultas correlacionadas
#Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

/*Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos 
los productos de su mismo fabricante.*/
SELECT producto.* FROM producto
WHERE precio >= (
	SELECT AVG(producto.precio) FROM producto
    WHERE producto.id_fabricante = producto.id_fabricante
);
-- esta es la valida
SELECT p1.*
FROM producto p1
WHERE precio >= (
    SELECT AVG(p2.precio)
    FROM producto p2
    WHERE p2.id_fabricante = p1.id_fabricante
);
-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto 
WHERE precio = (
	SELECT MAX(precio)  FROM producto
	WHERE id_fabricante = (
		SELECT id FROM fabricante 
		Where nombre = 'Lenovo'
		)
);
/*1.1.8 Subconsultas (En la cláusula HAVING)*/

/*Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el
 fabricante Lenovo.*/
SELECT f1.nombre
FROM fabricante f1
JOIN producto p1 ON f1.id = p1.id_fabricante
GROUP BY f1.id, f1.nombre
HAVING COUNT(p1.id) = (
    SELECT COUNT(p2.id)
    FROM producto p2
    JOIN fabricante f2 ON p2.id_fabricante = f2.id
    WHERE f2.nombre = 'Lenovo'
);
