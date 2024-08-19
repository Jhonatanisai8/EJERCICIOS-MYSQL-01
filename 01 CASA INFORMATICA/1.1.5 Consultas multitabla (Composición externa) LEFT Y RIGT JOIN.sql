USE computer_shop_ejercicio;

-- 1.1.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

/* Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos
 que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.*/
 SELECT fabricante.nombre FROM fabricante
 LEFT JOIN producto 
 ON fabricante.id = producto.id_fabricante;
-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
 SELECT DISTINCT fabricante.nombre FROM fabricante
 LEFT JOIN producto 
 ON fabricante.id = producto.id_fabricante
 WHERE producto.id_fabricante IS NULL;
-- ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
SELECT * FROM producto;