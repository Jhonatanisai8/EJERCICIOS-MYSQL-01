USE computer_shop_ejercicio;
-- 1.1.7.2 Subconsultas con ALL y ANY

-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre, precio
FROM producto
WHERE precio >= ALL (
    SELECT precio
    FROM producto
);
-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT nombre,precio FROM producto 
WHERE precio <= ALL (
	SELECT precio FROM producto
);
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
/*La condición id ANY (...) asegura que solo se seleccionen los fabricantes cuyo identificador (id) 
coincida con al menos uno de los identificadores devueltos por la subconsulta. Esto significa que el 
fabricante tiene al menos un producto asociado.*/
SELECT nombre
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante f
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);