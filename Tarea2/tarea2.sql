CREATE DATABASE tarea2 DEFAULT CHARACTER SET = 'utf8mb4';

USE tarea2;

CREATE TABLE IF NOT EXISTS sucursal (
    id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    ubicacion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleado (
    identificacion_unica INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    id_sucursal INT,
    CONSTRAINT fk_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal)
);

CREATE TABLE IF NOT EXISTS proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    contacto VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS proveedor_producto (
    id_proveedor_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT,
    id_producto INT,
    CONSTRAINT fk_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    tipo enum('individual', 'corporativo') NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_empleado INT,
    fecha_pedido DATE NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(identificacion_unica)
);

CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_detalle_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_en_el_momento DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_producto_detalle FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE IF NOT EXISTS factura (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    fecha_factura DATE NOT NULL,
    monto_total DECIMAL(10, 2) NOT NULL,
    estado_pago enum('pendiente', 'pagado') NOT NULL DEFAULT 'pendiente',
    CONSTRAINT fk_pedido_factura FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);