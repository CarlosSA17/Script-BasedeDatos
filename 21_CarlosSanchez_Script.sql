-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-10-14 05:58:46.774

-- tables
-- Table: ALMACEN
CREATE TABLE ALMACEN (
    ID int NOT NULL COMMENT 'almacena el ID del almacén',
    Nombre varchar(50) NOT NULL COMMENT 'Almacena el nombre de la empres',
    Fecha_Entrada date NOT NULL COMMENT 'Almacena la fecha donde se compró los productos',
    Fecha_Salida date NOT NULL COMMENT 'Almacena la fecha donde se vendió los productos',
    Calle varchar(100) NOT NULL COMMENT 'Almacena el nombre de la calle donde se ubica el almacén',
    Distrito varchar(50) NOT NULL COMMENT 'Almacena el nombre del distrito donde se ubica el almacén',
    Provincia varchar(50) NOT NULL COMMENT 'Almacena el nombre de la provincia donde se ubica el almacén',
    Departamento varchar(50) NOT NULL COMMENT 'Almacena el nombre del departamento donde se ubica el almacén',
    Stock_Maximo int NOT NULL COMMENT 'Almacena la cantidad maxima de productos en el almacén',
    Stock_Minimo int NOT NULL COMMENT 'Almacena la cantidad minima de productos en el almacén',
    LOTE int NOT NULL COMMENT 'Almacena la cantidad de productos que llegan al almacen',
    Entrada int NOT NULL COMMENT 'este campo almacenará la cantidad de productos que estan entrando',
    Salida int NOT NULL COMMENT 'este campo almacenará la cantidad de productos que estan saliendo',
    ID_producto int NOT NULL,
    Num_Pasillo int NOT NULL,
    CONSTRAINT ALMACEN_pk PRIMARY KEY (ID)
) COMMENT 'Este campo almacenara todo los datos correspondientes al almacén';

-- Table: CLIENTE
CREATE TABLE CLIENTE (
    ID_Cliente int NOT NULL COMMENT 'almacena el ID del cliente',
    Nombre varchar(50) NOT NULL COMMENT 'Almacena el nombre del cliente',
    Ap_Paterno varchar(50) NOT NULL COMMENT 'Almacena el apellido paterno del cliente',
    Ap_Materno varchar(50) NOT NULL COMMENT 'Almacena el apellido materno del cliente',
    DNI varchar(7) NOT NULL COMMENT 'Almacena el numero de DNI  del cliente',
    Calle varchar(100) NOT NULL COMMENT 'Almacena el nombre de la calle donde se ubica el cliente',
    Distrito varchar(50) NOT NULL COMMENT 'Almacena el nombre del distrito donde se ubica el cliente',
    Departamento varchar(50) NOT NULL COMMENT 'Almacena el nombre del departamento donde se ubica el cliente',
    Provincia varchar(50) NOT NULL COMMENT 'Almacena el nombre de la provincia donde se ubica el cliente',
    Telefono_Movil varchar(9) NOT NULL COMMENT 'Almacena el numero de teléfono móvil del cliente',
    Telefono_Fijo varchar(7) NOT NULL COMMENT 'Almacena el numero de teléfono fijo del cliente',
    Email varchar(100) NOT NULL COMMENT 'Almacena el correo electrónico del cliente',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (ID_Cliente)
) COMMENT 'Este campo almacenara todo los datos correspondientes al cliente';

-- Table: OFRECE
CREATE TABLE OFRECE (
    ID_Ofrece int NOT NULL COMMENT 'Almacena el ID de ofrece',
    Precio_compra int NOT NULL COMMENT 'Almacena el precio por el cual se esta comprando los productos del proveedor',
    Precio_venta int NOT NULL COMMENT 'Almacena el precio por el cual se esta vendiendo los productos del almacen a los clientes',
    ID_Producto int NOT NULL,
    ID_Proveedores int NOT NULL,
    CONSTRAINT OFRECE_pk PRIMARY KEY (ID_Ofrece)
) COMMENT 'Almacena la informacion de la relacion entre el proveedor y los productos que se ofrece';

-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    ID_Producto int NOT NULL COMMENT 'Almacena el identificador del producto',
    Nombre varchar(50) NOT NULL COMMENT 'Almacena el nombre del producto',
    Marca varchar(50) NOT NULL COMMENT 'Almacena la marca del producto',
    Modelo varchar(50) NOT NULL COMMENT 'Almacena el modelo del producto',
    Categoria varchar(50) NOT NULL COMMENT 'Almacena la categoria en el que se han dividido los productos',
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (ID_Producto)
) COMMENT 'Almacena datos de los productos entregados por los proveedores ';

-- Table: PROVEEDORES
CREATE TABLE PROVEEDORES (
    Id_Proveedores int NOT NULL COMMENT 'Almacena el identificador del ID del proveedor',
    Nombre varchar(50) NOT NULL COMMENT 'Almacena el nombre del proveedor',
    Calle varchar(100) NOT NULL COMMENT 'Almacena el nombre de la calle donde se ubica el proveedor',
    Distrito varchar(50) NOT NULL COMMENT 'Almacena el nombre del distrito donde se ubica el proveedor',
    Provincia varchar(50) NOT NULL COMMENT 'Almacena el nombre de la provincia donde se ubica el proveedor',
    Departamento varchar(50) NOT NULL COMMENT 'Almacena el nombre del departamento donde se ubica el proveedor',
    Movil varchar(9) NOT NULL COMMENT 'Almacena el numero de celular del proveedor',
    Fijo varchar(7) NOT NULL COMMENT 'Almacena el numero de telefono fijo del proveedor',
    Correo varchar(100) NOT NULL COMMENT 'Almacena el correo electronico del proveedor',
    CONSTRAINT PROVEEDORES_pk PRIMARY KEY (Id_Proveedores)
) COMMENT 'Almacena los datos de los productos entregados por los proveedores';

-- Table: VENTA
CREATE TABLE VENTA (
    ID_Venta int NOT NULL COMMENT 'almacena el ID de la venta',
    Fecha date NOT NULL COMMENT 'Almacena la fecha donde esta saliendo el producto',
    Cantidad int NOT NULL COMMENT 'Almacena el nombre de la calle donde se ubica el cliente',
    Precio decimal(5,2) NOT NULL COMMENT 'Almacena el nombre del distrito donde se ubica el cliente',
    ID_Cliente int NOT NULL,
    ID_Almacen int NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (ID_Venta)
) COMMENT 'Este campo almacenara todo los datos correspondientes entre el cliente y el almacén';

-- foreign keys
-- Reference: ALMACEN_Producto (table: ALMACEN)
ALTER TABLE ALMACEN ADD CONSTRAINT ALMACEN_Producto FOREIGN KEY ALMACEN_Producto (ID_producto)
    REFERENCES PRODUCTO (ID_Producto);

-- Reference: Ofrece_PROVEEDORES (table: OFRECE)
ALTER TABLE OFRECE ADD CONSTRAINT Ofrece_PROVEEDORES FOREIGN KEY Ofrece_PROVEEDORES (ID_Proveedores)
    REFERENCES PROVEEDORES (Id_Proveedores);

-- Reference: Ofrece_Producto (table: OFRECE)
ALTER TABLE OFRECE ADD CONSTRAINT Ofrece_Producto FOREIGN KEY Ofrece_Producto (ID_Producto)
    REFERENCES PRODUCTO (ID_Producto);

-- Reference: VENTA_ALMACEN (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_ALMACEN FOREIGN KEY VENTA_ALMACEN (ID_Almacen)
    REFERENCES ALMACEN (ID);

-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (ID_Cliente)
    REFERENCES CLIENTE (ID_Cliente);

-- End of file.

