INSERT INTO CategoriaProducto (nombre) VALUES
('Pizzas'), ('Panzarottis'), ('Bebidas'), ('Postres');

INSERT INTO Producto (nombre, id_categoria, precio, es_elaborado, tipo_elaborado) VALUES
('Pizza Margarita', 1, 60.00, 1, 'PIZZA'),
('Pizza Pepperoni', 1, 70.00, 1, 'PIZZA'),
('Panzarotti Jamón', 2, 45.00, 1, 'PANZAROTTI'),
('Coca-Cola 500ml', 3, 10.00, 0, NULL),
('Brownie', 4, 20.00, 0, NULL);

INSERT INTO Adicion (nombre, precio) VALUES
('Extra queso', 8.00),
('Salsa BBQ', 5.00);

INSERT INTO Combo (nombre, precio_combo) VALUES
('Combo Pizza + Bebida', 75.00);

INSERT INTO ComboProducto (id_combo, id_producto, cantidad) VALUES
(1, 1, 1),  

INSERT INTO Cliente (nombre, telefono, email) VALUES
('Juan Pérez', '555-1111', 'juan@example.com'),
('María López', '555-2222', 'maria@example.com');

INSERT INTO Pedido (id_cliente, fecha_hora, tipo_pedido) VALUES
(1, '2026-08-01 19:30:00', 'LOCAL'),
(1, '2026-08-02 20:00:00', 'RECOGER'),
(2, '2026-08-02 21:00:00', 'LOCAL');

INSERT INTO PedidoDetalle (id_pedido, id_producto, cantidad, id_combo, precio_unitario) VALUES
(1, 1, 2, NULL, 60.00),   
(1, 4, 2, NULL, 10.00),   
(2, 1, 1, 1, 75.00),      
(3, 3, 1, NULL, 45.00);   

INSERT INTO PedidoDetalleAdicion (id_detalle, id_adicion, cantidad) VALUES
(1, 1, 1),  
(3, 1, 1);  
