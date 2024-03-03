CREATE TABLE Proveedor(
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    direccion VARCHAR2(200),
    paginaweb VARCHAR2(100),
    telefono VARCHAR2(8)
);

CREATE TABLE Cliente(
    CLIENTE_ID NUMBER PRIMARY KEY,
    cui VARCHAR2(13) UNIQUE,
    nit VARCHAR2(10),
    nombre VARCHAR2(100),
    direccion VARCHAR2(200)
);

CREATE TABLE Categoria(
    CATEGORIA_ID NUMBER PRIMARY KEY,
    id_c INTEGER UNIQUE,
    nombre VARCHAR2(20),
    descripcion VARCHAR2(40)
);

CREATE TABLE Telefono(
    CLIENTE_ID NUMBER,
    cui VARCHAR2(13),
    id_t INTEGER PRIMARY KEY,
    telefono VARCHAR2(8)
);

ALTER TABLE Telefono
ADD CONSTRAINT fk_cliente_telefono FOREIGN KEY (cui) REFERENCES Cliente(cui);

CREATE TABLE Producto(
    id_proveedor NUMBER,
    PRODUCTO_ID NUMBER PRIMARY KEY,
    sku INTEGER UNIQUE,
    nombre VARCHAR2(30),
    precio FLOAT(2),
    stock NUMBER, 
    id_c NUMBER
);

ALTER TABLE Producto
ADD CONSTRAINT fk_proveedor_producto FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor);

ALTER TABLE Producto
ADD CONSTRAINT fk_categoria_producto FOREIGN KEY (id_c) REFERENCES Categoria(CATEGORIA_ID);

CREATE TABLE Venta(
    CLIENTE_ID NUMBER,
    PRODUCTO_ID NUMBER, 
    sku INTEGER, 
    cui VARCHAR2(13),
    id_v INTEGER PRIMARY KEY, 
    fecha DATE,
    monto FLOAT(2)
);

ALTER TABLE Venta
ADD CONSTRAINT fk_cliente_venta FOREIGN KEY (cui) REFERENCES Cliente(cui);

ALTER TABLE Venta
ADD CONSTRAINT fk_producto_venta FOREIGN KEY (sku) REFERENCES Producto(PRODUCTO_ID);

