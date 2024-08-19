USE computer_shop_ejercicio;
-- 1.1.7.3 Subconsultas con IN y NOT IN
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE id IN (
    SELECT DISTINCT id_fabricante
    FROM producto
);
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE id NOT IN (
    SELECT DISTINCT id_fabricante
    FROM producto
);