USE computer_shop_ejercicio;

-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM fabricante 
WHERE EXISTS (
	SELECT 1 FROM producto 
    WHERE producto.id_fabricante = fabricante.id
);
-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
/*La subconsulta SELECT 1 FROM producto p WHERE p.id_fabricante = f.id verifica si hay al menos un producto con 
el mismo id_fabricante que el fabricante actual (f.id).*/
SELECT nombre
FROM fabricante f
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);