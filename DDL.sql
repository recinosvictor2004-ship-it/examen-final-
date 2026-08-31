
CREATE DATABASE restaurante;
USE restaurante;


CREATE TABLE Cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE CategoriaProducto (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  id_categoria INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  es_elaborado TINYINT(1) NOT NULL DEFAULT 0,
  tipo_elaborado ENUM('PIZZA','PANZAROTTI','OTRO') NULL,
  FOREIGN KEY (id_categoria) REFERENCES CategoriaProducto(id_categoria)
);

CREATE TABLE Ingrediente (
  id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ProductoIngrediente (
  id_producto INT NOT NULL,
  id_ingrediente INT NOT NULL,
  PRIMARY KEY (id_producto, id_ingrediente),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente)
);

CREATE TABLE Adicion (
  id_adicion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Combo (
  id_combo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio_combo DECIMAL(10,2) NOT NULL
);

CREATE TABLE ComboProducto (
  id_combo INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_combo, id_producto),
  FOREIGN KEY (id_combo) REFERENCES Combo(id_combo),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE MenuProducto (
  id_producto INT PRIMARY KEY,
  activo TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  fecha_hora DATETIME NOT NULL,
  tipo_pedido ENUM('LOCAL','RECOGER') NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE PedidoDetalle (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  id_combo INT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
  FOREIGN KEY (id_combo) REFERENCES Combo(id_combo)
);

CREATE TABLE PedidoDetalleAdicion (
  id_detalle INT NOT NULL,
  id_adicion INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_detalle, id_adicion),
  FOREIGN KEY (id_detalle) REFERENCES PedidoDetalle(id_detalle),
  FOREIGN KEY (id_adicion) REFERENCES Adicion(id_adicion)
);
