SELECT p.nombre, c.nombre AS categoria, SUM(d.cantidad) AS total_vendido
FROM PedidoDetalle d
JOIN Producto p ON d.id_producto = p.id_producto
JOIN CategoriaProducto c ON p.id_categoria = c.id_categoria
GROUP BY p.id_producto
ORDER BY total_vendido DESC;


SELECT co.nombre, SUM(d.cantidad * d.precio_unitario) AS ingresos_combo
FROM PedidoDetalle d
JOIN Combo co ON d.id_combo = co.id_combo
WHERE d.id_combo IS NOT NULL
GROUP BY co.id_combo;
