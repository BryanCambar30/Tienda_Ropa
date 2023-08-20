CREATE DATABASE	TiendaRopa_V1	

USE TiendaRopa_V1

CREATE TABLE Paises(
idPais INTEGER IDENTITY (1,1) PRIMARY KEY,
descripcion VARCHAR (20) NOT NULL
);

CREATE TABLE Departamentos(
idDepto INTEGER IDENTITY(1,1) PRIMARY KEY, 
idPais INTEGER NOT NULL,
descripcion VARCHAR (50)
CONSTRAINT FK_depto_pais FOREIGN KEY (idPais) REFERENCES Paises(idPais)
);

CREATE TABLE Municipios(
idMuncipio INTEGER IDENTITY (1,1) PRIMARY KEY, 
idDepto INTEGER NOT NULL,
decripcion VARCHAR(50)
CONSTRAINT FK_mun_depto FOREIGN KEY (idDepto) REFERENCES Departamentos(idDepto)
);

CREATE TABLE Generos(
id_genero INTEGER IDENTITY PRIMARY KEY,
descripcion VARCHAR(20) NOT NULL,
);

CREATE TABLE Personas(
idPersona INTEGER IDENTITY(1,1) PRIMARY KEY, 
id_lugarNacimiento INTEGER NOT NULL,
id_genero INTEGER NOT NULL,	
P_nombre VARCHAR (25) NOT NULL, 
S_nombre VARCHAR (25) NULL,
P_apellido VARCHAR (25) NOT NULL,
S_apellido VARCHAR (25) NULL, 
fecha_nacimiento DATE NULL,
correo VARCHAR (100) NOT NULL,
CONSTRAINT FK_per_mun FOREIGN KEY (id_lugarNacimiento) REFERENCES Municipios(idMuncipio),
CONSTRAINT FK_per_gen FOREIGN KEY (id_genero) REFERENCES Generos(id_genero)
);

CREATE TABLE Sucursales(
idLocal INTEGER PRIMARY KEY,
idMuncipio INTEGER NOT NULL,
horaApertura TIME NOT NULL, 
horaCierre TIME NOT NULL, 
telefono VARCHAR (8) NOT NULL,
eMail VARCHAR (50) NULL,
cai VARCHAR(25) NOT NULL,
razonSocial VARCHAR (100)
CONSTRAINT FK_sucur_mun FOREIGN KEY (idMuncipio) REFERENCES Municipios(idMuncipio)
);
ALTER TABLE Sucursales
ADD es_casa_matriz BIT; -- 1 si es casa matriz, 0 si no

CREATE TABLE Profesiones(
idProfesion INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR(100) NOT NULL,
comentarios VARCHAR(200) NULL,
);

CREATE TABLE PuestosTrabajo(
idPuesto INTEGER IDENTITY (1,1) PRIMARY KEY,
descripcion VARCHAR (80) NOT NULL,
comentario VARCHAR (150) NULL
);

CREATE TABLE Clientes(
id_clientes INTEGER IDENTITY(1,1) PRIMARY KEY, 
id_persona INTEGER NOT NULL,
id_profesion INTEGER NOT NULL,
CONSTRAINT FK_cliente_persona FOREIGN KEY (id_persona) REFERENCES Personas(idPersona),
CONSTRAINT FK_cliente_profesion FOREIGN KEY (id_profesion) REFERENCES Profesiones(idProfesion)
);

ALTER TABLE Clientes
ADD Tipo_Mayoritario bit;

CREATE TABLE Empleados(
id_empleado INTEGER PRIMARY KEY,
id_persona INTEGER NOT NULL,
id_puesto INTEGER NOT NULL,
id_profesion INTEGER NOT NULL,
id_tienda INTEGER NOT NULL,
telefono INTEGER NOT NULL,
horaEntrada TIME NOT NULL, --HH:MM:SS
horaSalida TIME NOT NULL,
horasTrabajas TIME NOT NULL, -- analizar el tipo de dato esta bien 
Salario DECIMAL(10, 2),
CONSTRAINT CHK_telefono CHECK (LEN(CONVERT(VARCHAR, Telefono)) = 8),--analizar 
CONSTRAINT FK_emp_per FOREIGN KEY (id_persona) REFERENCES Personas(idPersona),
CONSTRAINT FK_emp_puesto FOREIGN KEY (id_puesto) REFERENCES PuestosTrabajo(idPuesto),
CONSTRAINT FK_emp_prof FOREIGN KEY (id_profesion) REFERENCES Profesiones(idProfesion),
CONSTRAINT FK_emp_tienda FOREIGN KEY (id_tienda) REFERENCES Sucursales(idLocal),
);

CREATE TABLE Tallas(
id_talla INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR (10) NOT NULL
);

CREATE TABLE GeneroRopa(
id_gen_ropa INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR (15) NOT NULL
);

CREATE TABLE Colores(
id_colores INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR (15) NOT NULL
);

CREATE TABLE Tipos(
id_tipos INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR (30) NOT NULL
);

CREATE TABLE Marcas(
id_marcas INTEGER IDENTITY(1,1) PRIMARY KEY,
descripcion VARCHAR (30) NOT NULL
);

CREATE TABLE Proveedores(
id_proveedores INTEGER IDENTITY(1,1) PRIMARY KEY,
id_direccion INTEGER NOT NULL,
nombre_empresa VARCHAR(50) NOT NULL,
telefono INTEGER NOT NULL,
RTN VARCHAR(30) NOT NULL,
email VARCHAR (30),
CONSTRAINT CHK_telefonoPro CHECK (LEN(CONVERT(VARCHAR, Telefono)) = 8),--analizar 
CONSTRAINT FK_prov_municipio FOREIGN KEY (id_direccion) REFERENCES Municipios(idMuncipio)
);

CREATE TABLE DetallesRopa (
id_detalle INTEGER IDENTITY(1,1) PRIMARY KEY,
id_talla INTEGER NOT NULL,
id_genero INTEGER NOT NULL,
id_color INTEGER NOT NULL,
id_tipo INTEGER NOT NULL,
id_marca INTEGER NOT NULL,
id_proveedor INTEGER NOT NULL,
nombre_producto varchar (55) NOT NULL,
CONSTRAINT FK_detalle_talla FOREIGN KEY (id_talla) REFERENCES Tallas(id_talla),
CONSTRAINT FK_detalle_genero FOREIGN KEY (id_genero) REFERENCES GeneroRopa(id_gen_ropa),
CONSTRAINT FK_detalle_color FOREIGN KEY (id_color) REFERENCES Colores(id_colores),
CONSTRAINT FK_detalle_tipo FOREIGN KEY (id_tipo) REFERENCES Tipos(id_tipos),
CONSTRAINT FK_detalle_marca FOREIGN KEY (id_marca) REFERENCES Marcas(id_marcas),
CONSTRAINT FK_detalle_proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedores),
);

CREATE TABLE Productos(
	codigo_barras VARCHAR(20) PRIMARY KEY,
	precio DECIMAL(10,2) NOT NULL, --este va a asi para poder almacenar precios mayores a 1,000 y para no tener fallas le puse un valor alto por si en algun momento se tiene un producto de mas de 10,000 
	detalle INTEGER IDENTITY(1,1),
	CONSTRAINT FK_id_detalle_ropa FOREIGN KEY (detalle) REFERENCES DetallesRopa(id_detalle),
	)

CREATE TABLE Descuento(
	id_descuento INTEGER PRIMARY KEY,
	descuentto DECIMAL(5,2)
	)

CREATE TABLE Bodega(
	id_bodega INTEGER PRIMARY KEY,
	id_seccion INTEGER IDENTITY,
	fecha_entrada DATETIME NOT NULL,
	fecha_salida DATETIME NOT NULL,
	id_empleado_ingreso INTEGER NOT NULL,
	id_empleado_salida INTEGER,
	observaciones VARCHAR(250)
	);
	
CREATE TABLE Inventario(
	id_inventario INTEGER IDENTITY(1,1) PRIMARY KEY,
	producto VARCHAR(20) NOT NULL,
	cantidad_disponible INTEGER,
	fecha_llegada DATETIME NOT NULL,
	id_bodega INTEGER NOT NULL,
	CONSTRAINT FK_id_bodega FOREIGN KEY (id_bodega) REFERENCES Bodega(id_bodega),
	CONSTRAINT FK_id_producto FOREIGN KEY (producto) REFERENCES Productos(codigo_barras)
	);
	
CREATE TABLE Factura(
	n_Factura INTEGER PRIMARY KEY,
	id_empleado INTEGER NOT NULL,
	id_cliente INTEGER,
	fecha_hora DATETIME NOT NULL,
	id_local INTEGER NOT NULL,
	monto_pagado DECIMAL (10,2) NOT NULL,
	cambio DECIMAL (10,2) NOT NULL,
	sub_total DECIMAL (10,2) NOT NULL,
	gravado15 DECIMAL (10,2) NOT NULL,
	total DECIMAL (10,2) NOT NULL,
	CONSTRAINT FK_id_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_clientes),
	CONSTRAINT FK_id_local FOREIGN KEY (id_local) REFERENCES Sucursales(idlocal)
	);

CREATE TABLE detalle_compra(
	id_detalleCOmpra INTEGER PRIMARY KEY,
	n_factura INTEGER NOT NULL,
	producto VARCHAR(20) NOT NULL,
	cantidad INTEGER NOT NULL,
	CONSTRAINT FK_n_factura FOREIGN KEY (n_factura) REFERENCES Factura(n_factura),
	CONSTRAINT FK_Producto FOREIGN KEY (producto) REFERENCES Productos(codigo_barras)
	);
ALTER TABLE detalle_compra
ADD PrecioProducto DECIMAL(10,2)

-------------------------------------------------------
ALTER TABLE Producto_mas_vendido
DROP COLUMN mes, anio;
ALTER TABLE Producto_mas_vendido
ADD Fecha DATETIME;
Drop table Producto_mas_vendido
CREATE TABLE Producto_mas_vendido(
	id_Producto VARCHAR (20) PRIMARY KEY,
	cantidad INTEGER NOT NULL,
	Fecha DATETIME NOT NULL,
	CONSTRAINT fk_id_producto_mas_vendido FOREIGN KEY (id_producto) REFERENCES productos(codigo_barras)
	)


ALTER TABLE Empleados
ADD password_hash VARCHAR(64), password_salt VARCHAR(25);

DECLARE @Password VARCHAR(50);
DECLARE @Salt VARCHAR(25);
DECLARE @Hash VARCHAR(64);

SET @Password = 'Qwerty123';
SET @Salt = CONVERT(VARCHAR(36))--, NEWID());
SET @Hash = HASHBYTES('SHA2_256', @Password) --+ @Salt);

UPDATE Empleados
SET password_hash = @Hash, password_salt = @Salt
Where id_empleado = 2;



--INSERTS
INSERT INTO Paises(descripcion) VALUES('Honduras'), ('Costa Rica'),('Panamá'),('Nicaragua'),('EL Salvador');
INSERT INTO Departamentos(idPais,descripcion) VALUES(1,'Francisco Morazn'), (5,'San Salvador'),(1,'Atlantida'),(1,'Cortes'),(2,'San jose');
INSERT INTO Municipios(idDepto,decripcion) VALUES(1,'Tegucigalpa'),(1,'Talanga'),(4,'San Pedro Sula'),(4,'Choloma'),(4,'Omoa');
INSERT INTO Generos(descripcion) VALUES('Masculino'),('Femenino'),('Otro');
INSERT INTO Personas(id_lugarNacimiento,id_genero,P_nombre,S_nombre,P_apellido,S_apellido,fecha_nacimiento,correo)VALUES (1,1,'Walter', 'White','Heisenberg','Targaryen','1980-06-01','BRB@gmail.com');
INSERT INTO Personas(id_lugarNacimiento,id_genero,P_nombre,S_nombre,P_apellido,S_apellido,fecha_nacimiento,correo)VALUES  (1,1,'Pedro', 'Pica','Piedra','Roca','2000-06-01','pedro@gmail.com');
INSERT INTO Personas(id_lugarNacimiento,id_genero,P_nombre,S_nombre,P_apellido,S_apellido,fecha_nacimiento,correo)VALUES (1,2,'Loenel', 'Andres','Messi','Ronaldo','1999-06-01','messi@gmail.com');
INSERT INTO Personas(id_lugarNacimiento,id_genero,P_nombre,S_nombre,P_apellido,S_apellido,fecha_nacimiento,correo)VALUES(1,1,'Jonh', 'Snow','Aegon','Targaryen','1999-06-01','GOT@gmail.com');
INSERT INTO Personas(id_lugarNacimiento,id_genero,P_nombre,S_nombre,P_apellido,S_apellido,fecha_nacimiento,correo)VALUES(1,4,'Daenerys ', 'Tormenta','Targaryen','Lopez','1998-06-01','GOTa@gmail.com');
INSERT INTO Profesiones(descripcion,comentarios)VALUES('Abogado',''),('Ingeniero en Sistemas','que pro'),('Maestro',''),('Futbolista',''),('Arquitecto','');

INSERT INTO Colores(descripcion)VALUES('Azul'),('Verde'),('Amarillo'),('Rojo'),('Negro');
INSERT INTO Tallas(descripcion)VALUES('xs'),('s'),('m'),('l'),('xl'),('xxl'),('xxxl'),('xxs');
INSERT INTO GeneroRopa(descripcion)VALUES('Femenino'),('Masculino'),('bebe'),('unisex');
INSERT INTO Tipos(descripcion)VALUES('Camisa Formal'),('Camisa Polo'),('Camiseta'),('Pantalon Formal'),('Pantalon Mesclilla');
INSERT INTO Marcas(descripcion)VALUES('Nike'),('Adidas'),('Flamingo'),('Joma'),('Ralph Lauren');
INSERT INTO Proveedores(id_direccion, nombre_empresa, telefono, RTN, email)VALUES(1, 'El General FM', '22909001', '0801-1903-229011', 'elGeneral@gmail.com');
INSERT INTO Proveedores(id_direccion, nombre_empresa, telefono, RTN, email)VALUES(1, 'Salvatore Style', '28909090', '9809-1903-229011', 'Salvatorel@gmail.com');
INSERT INTO Proveedores(id_direccion, nombre_empresa, telefono, RTN, email)VALUES(1, 'PieceArts', '22905555', '0819-1903-229011', 'PieceArts@gmail.com');
INSERT INTO Proveedores(id_direccion, nombre_empresa, telefono, RTN, email)VALUES(1, 'CautionStyle', '22955551', '0801-1903-229331', 'CautionS@gmail.com');
INSERT INTO Proveedores(id_direccion, nombre_empresa, telefono, RTN, email)VALUES(4, 'Leopoldo', '22908501', '0801-1903-222220', 'Leopoldo@gmail.com');
INSERT INTO DetallesRopa(id_marca, id_tipo, id_color, id_genero, id_talla, id_proveedor, nombre_producto)VALUES(1, 1, 1, 1, 2, 1,'terreneitor');
INSERT INTO DetallesRopa(id_marca, id_tipo, id_color, id_genero, id_talla, id_proveedor, nombre_producto)VALUES(1, 2, 2, 1, 3, 2,'supra');
INSERT INTO DetallesRopa(id_marca, id_tipo, id_color, id_genero, id_talla, id_proveedor, nombre_producto)VALUES(1, 3, 3, 2, 5, 3,'configsistem');
INSERT INTO DetallesRopa(id_marca, id_tipo, id_color, id_genero, id_talla, id_proveedor, nombre_producto)VALUES(1, 2, 2, 2, 3, 4,'System32');
INSERT INTO DetallesRopa(id_marca, id_tipo, id_color, id_genero, id_talla, id_proveedor, nombre_producto)VALUES(5, 3, 4, 3, 8, 5,'linuxlovers');
SET IDENTITY_INSERT Productos ON INSERT INTO Productos(codigo_barras, precio, detalle) VALUES('F213T425ABC', 1099.00, 1),('P683T425ABC', 1199.00, 2),('M2563T425ABC', 1099.00, 3),('DI578T425ABC', 9999.00, 4),('JDIE7425ABC', 4075.99, 5) SET IDENTITY_INSERT Productos OFF;

INSERT INTO Sucursales (idLocal, idMuncipio, horaApertura, horaCierre, telefono, eMail, cai, razonSocial, es_casa_matriz) VALUES (1, 1, '08:00:00', '18:00:00', '22334455', 'sucursal1@example.com', 'ABCDE12345', 'Sucursal A', 1), (2, 2, '09:30:00', '17:30:00', '99887766', 'sucursal2@example.com', 'FGHIJ67890', 'Sucursal B', 0), (3, 3, '07:45:00', '19:00:00', '11223344', 'sucursal3@example.com', 'KLMNO54321', 'Sucursal C', 0), (4, 4, '08:15:00', '17:15:00', '77665544', 'sucursal4@example.com', 'PQRST67890', 'Sucursal D', 1),(5, 5, '09:00:00', '18:00:00', '99001122', 'sucursal5@example.com', 'UVWXYZ12345', 'Sucursal E', 0);
INSERT INTO PuestosTrabajo (descripcion, comentario) VALUES ('Gerente de Proyectos', 'Encargado de liderar y coordinar proyectos estrategicos.'), ('Analista de Marketing', 'Responsable de realizar analisis de mercado y estrategias de marketing.'), ('Tecnico de Soporte', 'Brinda asistencia tecnica y resuelve problemas de los clientes.'), ('Disenador Grafico', 'Crea y disena materiales graficos para campanas publicitarias.'), ('Desarrollador de Software', 'Encargado de programar y desarrollar aplicaciones y software.');
INSERT INTO Clientes (id_persona, id_profesion) VALUES (1, 1);
INSERT INTO Clientes (id_persona, id_profesion) VALUES(2, 2);
INSERT INTO Clientes (id_persona, id_profesion) VALUES(3, 3);
INSERT INTO Clientes (id_persona, id_profesion) VALUES(4, 4);
INSERT INTO Clientes (id_persona, id_profesion) VALUES(4, 5);
INSERT INTO Clientes (id_persona, id_profesion,Tipo_Mayoritario) VALUES (1,1,1);
INSERT INTO Empleados (id_empleado, id_persona, id_puesto, id_profesion, id_tienda, telefono, horaEntrada, horaSalida, horasTrabajas, Salario) VALUES ( 1, 1, 1, 2, 1, 94345678, '08:00:00', '17:00:00', '08:00:00', 2500.00);
INSERT INTO Empleados (id_empleado, id_persona, id_puesto, id_profesion, id_tienda, telefono, horaEntrada, horaSalida, horasTrabajas, Salario) VALUES( 2, 2, 3, 2, 2, 98765432, '09:30:00', '18:30:00', '08:00:00', 2100.00); 
INSERT INTO Empleados (id_empleado, id_persona, id_puesto, id_profesion, id_tienda, telefono, horaEntrada, horaSalida, horasTrabajas, Salario) VALUES( 3, 3, 2, 4, 3, 94681357, '07:45:00', '16:45:00','08:00:00', 2300.00); 
INSERT INTO Empleados (id_empleado, id_persona, id_puesto, id_profesion, id_tienda, telefono, horaEntrada, horaSalida, horasTrabajas, Salario) VALUES( 4, 4, 5, 5, 5, 33579246, '08:15:00', '17:15:00','08:00:00', 2700.00);
INSERT INTO Empleados (id_empleado, id_persona, id_puesto, id_profesion, id_tienda, telefono, horaEntrada, horaSalida, horasTrabajas, Salario) VALUES( 5, 3, 4, 3, 4, 37481923, '09:00:00', '18:00:00','08:00:00', 2400.00);
INSERT INTO Bodega (id_bodega, fecha_entrada, fecha_salida, id_empleado_ingreso, observaciones) VALUES (1, '2023-08-06 10:30:00', '2023-08-06 15:45:00', 101, 'Art�culos recibidos para almacenamiento temporal.'), (2, '2023-08-07 09:15:00', '2023-08-07 16:30:00', 105, 'Nuevo inventario de productos electr�nicos.'), (3, '2023-08-08 11:00:00', '2023-08-08 17:20:00', 110, 'Art�culos enviados para distribuci�n.'), (4, '2023-08-09 08:45:00', '2023-08-09 15:15:00', 107, 'Inventario de productos perecederos.'), (5, '2023-08-10 12:30:00', '2023-08-10 17:00:00', 103, 'Art�culos recibidos para inspecci�n y reparaci�n.');

INSERT INTO Bodega (id_bodega, fecha_entrada, fecha_salida, id_empleado_ingreso, observaciones) VALUES (1, '2023-08-06 10:30:00', '2023-08-06 15:45:00', 101, 'Art�culos recibidos para almacenamiento temporal.'), (2, '2023-08-07 09:15:00', '2023-08-07 16:30:00', 105, 'Nuevo inventario de productos electr�nicos.'), (3, '2023-08-08 11:00:00', '2023-08-08 17:20:00', 110, 'Art�culos enviados para distribuci�n.'), (4, '2023-08-09 08:45:00', '2023-08-09 15:15:00', 107, 'Inventario de productos perecederos.'), (5, '2023-08-10 12:30:00', '2023-08-10 17:00:00', 103, 'Art�culos recibidos para inspecci�n y reparaci�n.');
INSERT INTO Inventario (producto, cantidad_disponible, fecha_llegada, id_bodega) VALUES ('F213T425ABC', 100, '2023-08-06 10:30:00', 1), ('P683T425ABC', 50, '2023-08-07 09:15:00', 2), ('M2563T425ABC', 200, '2023-08-08 11:00:00', 3), ('DI578T425ABC', 75, '2023-08-09 08:45:00', 4), ('JDIE7425ABC', 120, '2023-08-10 12:30:00', 5);
INSERT INTO Factura (n_Factura, id_empleado, id_cliente, fecha_hora, id_local, monto_pagado, cambio, sub_total, gravado15, total) VALUES (1, 1, 3, '2023-08-06 10:30:00', 1, 250.00, 50.00, 200.00, 30.00, 230.00);
INSERT INTO Factura (n_Factura, id_empleado, id_cliente, fecha_hora, id_local, monto_pagado, cambio, sub_total, gravado15, total) VALUES(2, 2, 3, '2023-08-07 09:15:00', 2, 350.00, 100.00, 250.00, 50.00, 300.00);
INSERT INTO Factura (n_Factura, id_empleado, id_cliente, fecha_hora, id_local, monto_pagado, cambio, sub_total, gravado15, total) VALUES(3, 3, 4, '2023-08-08 11:00:00', 3, 450.00, 150.00, 300.00, 45.00, 345.00); 
INSERT INTO Factura (n_Factura, id_empleado, id_cliente, fecha_hora, id_local, monto_pagado, cambio, sub_total, gravado15, total) VALUES(4, 4, 2, '2023-08-09 08:45:00', 1, 300.00, 50.00, 250.00, 37.50, 287.50);
INSERT INTO Factura (n_Factura, id_empleado, id_cliente, fecha_hora, id_local, monto_pagado, cambio, sub_total, gravado15, total) VALUES(5, 4, 3, '2023-08-10 12:30:00', 4, 550.00, 100.00, 450.00, 67.50, 517.50);
INSERT INTO detalle_compra (id_detalleCOmpra, n_factura, producto, cantidad) VALUES (1, 1, 'F213T425ABC', 10);
INSERT INTO detalle_compra (id_detalleCOmpra, n_factura, producto, cantidad) VALUES (2, 2, 'P683T425ABC', 5)
INSERT INTO detalle_compra (id_detalleCOmpra, n_factura, producto, cantidad) VALUES(3, 3, 'M2563T425ABC', 8);
INSERT INTO detalle_compra (id_detalleCOmpra, n_factura, producto, cantidad) VALUES(4, 4, 'DI578T425ABC', 15);
INSERT INTO detalle_compra (id_detalleCOmpra, n_factura, producto, cantidad) VALUES(5, 5, 'JDIE7425ABC', 20);


--SELECTS 
SELECT * FROM Paises
SELECT * FROM Departamentos
SELECT * FROM Municipios
SELECT * FROM Generos
SELECT * FROM Personas
SELECT * FROM Profesiones
Select * from Colores
SELECT * FROM Tallas
SELECT * FROM  GeneroRopa
SELECT * FROM  Tipos
SELECT * FROM  Marcas
SELECT * FROM  Proveedores
SELECT * FROM  Municipios
SELECT * FROM DetallesRopa
SELECT * fROM Productos
SELECT * FROM Sucursales
SELECT * FROM PuestosTrabajo
select * from Personas
SELECT * FROM Clientes 
SELECT * FROM Empleados
SELECT * FROM Bodega 
SELECT * FROM Producto_mas_vendido
SELECT * FROM Factura
SELECT * FROM detalle_compra


--Procedimientos Almacenados

-- =============================================
-- Author:		<Bryan Cámbar>
-- Create date: 08/13/2023
-- Description: proceso para Almacenar automaticamente el producto mas vendido a la tambla 
-- =============================================
CREATE PROCEDURE ActualizarProductosMasVendidos
    @Mes INT,
    @Anio INT
AS
BEGIN
    DECLARE @FechaInicio DATETIME;
    DECLARE @FechaFin DATETIME;

    SET @FechaInicio = DATEADD(MONTH, @Mes - 1, DATEADD(YEAR, @Anio - 1900, 0));
    SET @FechaFin = DATEADD(MONTH, 1, @FechaInicio);

    TRUNCATE TABLE producto_mas_vendido; -- Borra los datos existentes en la tabla producto_mas_vendido

    INSERT INTO producto_mas_vendido (id_Producto, Cantidad, Fecha ) -- Insertar nuevos datos desde la tabla Factura
    SELECT TOP 5
        DC.Producto,
        SUM(DC.Cantidad) AS Cantidad,
		F.fecha_hora
    FROM detalle_compra DC
	INNER JOIN Factura F ON dc.n_factura = f.n_Factura
	INNER JOIN (Productos INNER JOIN DetallesRopa ON detalle = id_detalle) ON producto = codigo_barras
    WHERE F.fecha_hora >= @FechaInicio AND fecha_hora < @FechaFin
    GROUP BY producto, nombre_producto, F.fecha_hora
    ORDER BY Cantidad DESC;

	SELECT * FROM Producto_mas_vendido 
END;

EXEC ActualizarProductosMasVendidos @mes = 8, @anio = 2023;


--============Funcion Factura y aplicacion de descuento======================--
--CREATE FUNCTION TotalConDescuentoEnFactura
--(
	--@precioTotal DECIMAL (10,2),
	--@Descuento DECIMAL(5,2)
--)
--RETURNS DECIAML (10,2)
--AS
--BEGIN
	--DECLARE @TotalConDescuento DECIMAL(10,2);
	--SET @TotalConDescuento = @precioTotal - (@precioTotal * (@Descuento / 100));
	--RETURNS @TotalConDescuento;
--END

--DECLARE @precioTotal DECIMAL(18, 2) = 300;
--DECLARE @Descuento DECIMAL(5, 2) = 10;

--SELECT @PrecioTotal AS PrecioTotal,
  --     @Descuento AS Descuento,
    --   dbo.TotalConDescuentoEnFactura(@PrecioTotal, @Descuento) AS TotalConDescuento;


--==============================================================------------------
-- =============================================
-- Author:		<Bryan Cámbar>
-- Create date: 08/15/2023
-- Description: proceso para Facturar 
-- =============================================
CREATE TYPE dbo.ProductoDetalleTableType AS TABLE
(
    codigo_barras VARCHAR(20),
    Cantidad INT
);

CREATE PROCEDURE GenerarFactura
	@cliente_id INT,
	@empleado_id INT,
	@id_local int,
	@TotalPagado DECIMAL(10,2),
	@gravado DECIMAL(10,2),
	@Descuento DECIMAL(5,2),
	@ProductosDetalle dbo.ProductoDetalleTableType READONLY
AS
BEGIN
	DECLARE @Factura_id int;
	DECLARE @Subtotal DECIMAL(18, 2);
    DECLARE @Total DECIMAL(18, 2);
    DECLARE @ISV DECIMAL(18, 2);
    DECLARE @Cambio DECIMAL(18, 2);
	DECLARE @TotalConDescuento DECIMAL(10,2);
	CREATE TABLE #ProductosDetalle --crea una tabla temporal para tener los detalles de todos los productos de la compra
	(        
		codigo_barras varchar(20),
		Cantidad int
	)
	
	BEGIN TRANSACTION;
	
    INSERT INTO #ProductosDetalle(codigo_barras, Cantidad)
    SELECT codigo_barras, Cantidad
    FROM @ProductosDetalle;
	
	
	INSERT INTO Factura (id_cliente, id_empleado, id_local, fecha_hora, monto_pagado, cambio, sub_total, gravado15, total)
	VALUES (@cliente_id, @empleado_id, @id_local, GETDATE(), @TotalPagado, 0, 0, 0, 0);
	SET @Factura_id = SCOPE_IDENTITY(); --OBTIENE EL NUMERO DE FACTURA RECIEN HECHA O INSERTADA

	INSERT INTO detalle_compra(n_factura, producto, cantidad, PrecioProducto)
	SELECT @Factura_id, PD.codigo_barras, PD.Cantidad, P.Precio
	FROM #ProductosDetalle PD
	INNER JOIN Productos P ON PD.codigo_barras = P.codigo_barras;
	
	SET @Subtotal = (SELECT SUM(cantidad * PrecioProducto) FROM detalle_compra WHERE n_factura = @Factura_id); --calcucla el sub total sin el isv 

	set @ISV = @Subtotal * (@Gravado / 100); --clacula impuesto sobre la venta, no esta sujeto a que sea del 15 por que se puede cambiar en el futuro

	set @Total = @Subtotal + @ISV; --calcula el total a pagar

	SET @TotalConDescuento = @Total - (@Total * (@Descuento / 100));
	
	SET @Total = @TotalConDescuento

	set @Cambio = @TotalPagado - @Total
 
	
	UPDATE Factura
	SET cambio = @cliente_id,
		sub_total = @Subtotal,
		gravado15 = @ISV,
		total = @Total
	WHERE n_Factura = @Factura_id

	COMMIT;
	SELECT @Factura_id AS NumeroFactura;
	DROP TABLE #ProductosDetalle;
END

-- =============================================
-- Author:		<Bryan Cámbar>
-- Create date: 08/15/2023
-- Description: proceso para Validar Empleado 
-- =============================================
CREATE PROCEDURE EmpleadoValidacion
	@id_empleado integer,
	@Contraseña varchar(50)
AS
BEGIN 
	DECLARE @password_hash varchar(64);
	DECLARE @password_salt varchar (25);
	DECLARE @Password VARCHAR(50);
	DECLARE @Salt VARCHAR(25);
	DECLARE @Hash VARCHAR(64);
	SET @Password = @Contraseña;
	SET @Salt = CONVERT(VARCHAR(36), NEWID());
	SET @Hash = HASHBYTES('SHA2_256', @Password + @Salt);
	SET @password_hash = @Hash
	SET @password_salt = @Salt
	SELECT * FROM Empleados WHERE id_empleado =@id_empleado AND password_hash = @password_hash
	
END

EXEC EmpleadoValidacion @id_empleado=2, @contraseña='Qwerty123'
Select * from Empleados

--CREATE PROCEDURE ObtenerProductoMasVendido
	--@Mes int,
	--@anio int
 --AS
--BEGIN 
	--DECLARE @FechaInicio DATETIME;
    --DECLARE @FechaFin DATETIME

	--SET @FechaInicio = DATEADD(MONTH, @Mes - 1, DATEADD(YEAR, @anio - 1900, 0));
	--SET @FechaFin = DATEADD(MONTH, DATEadd(MONTH, 1, @FechaInicio);

    --SELECT TOP 10
		--id_Producto,
		--nombre_producto,
		--SUM(cantidad) AS TotalVendido
	--FROM Producto_mas_vendido PV
	--INNER JOIN ( Productos INNER JOIN DetallesRopa ON id_detalle = id_detalle) ON id_Producto = codigo_barras
	--WHERE Fecha >= @FechaInicio AND Fecha < @FechaFin
	--GROUP BY  id_Producto, nombre_producto
	--ORDER BY TotalVendido DESC;
--END; 

--EXEC ObtenerProductoMasVendido;

-- =============================================
-- Author:		<Mario Villanueva>
-- Create date: 08/15/2023
-- Description: proceso para insertar un nuevo cliente 
-- =============================================
CREATE PROCEDURE RegistrarNuevoCliente
    @id_lugarNacimiento INTEGER,
    @id_genero INTEGER,
    @P_nombre VARCHAR(25),
    @S_nombre VARCHAR(25),
    @P_apellido VARCHAR(25),
    @S_apellido VARCHAR(25),
    @fecha_nacimiento DATE,
    @correo VARCHAR(100),
    @id_profesion INTEGER,
    @Tipo_Mayoritario BIT
AS
BEGIN
    DECLARE @id_persona INTEGER;

    -- Insertar en la tabla Personas
    INSERT INTO Personas (id_lugarNacimiento, id_genero, P_nombre, S_nombre, P_apellido, S_apellido, fecha_nacimiento, correo)
    VALUES (@id_lugarNacimiento, @id_genero, @P_nombre, @S_nombre, @P_apellido, @S_apellido, @fecha_nacimiento, @correo);
    
	-- Obtener el ID de la persona recién agragada
    SET @id_persona = SCOPE_IDENTITY();

    -- Insertar en la tabla Clientes
    INSERT INTO Clientes (id_persona, id_profesion, Tipo_Mayoritario)
    VALUES (@id_persona, @id_profesion, @Tipo_Mayoritario);
END
go

-- =============================================
-- Author:		<mario villanueva>
-- Create date: <12/08/2023>
-- Description:	proceso para buscar un cliente
-- =============================================
CREATE PROCEDURE Search_cliente_
@P_search VARCHAR (50) 

AS
BEGIN

	select c.id_clientes,(p.P_nombre+' '+p.S_nombre+' '+p.P_apellido+' '+p.S_apellido)nombre_complet, 
		pr.descripcion,p.correo,p.fecha_nacimiento,g.descripcion,(mun.decripcion+', '+dep.descripcion+', '+pa.descripcion) direccion,c.Tipo_Mayoritario
		from Clientes c
		inner join Personas p on p.idPersona=c.id_persona
		inner join Profesiones pr on pr.idProfesion=c.id_profesion
		inner join Generos g on g.id_genero=p.id_genero
		inner join Municipios mun on mun.idMuncipio=p.id_lugarNacimiento
		inner join Departamentos dep on dep.idDepto=mun.idMuncipio
		inner join Paises pa on pa.idPais=dep.idPais
		where 
		p.P_nombre LIKE '%' +@P_search + '%'
		OR p.S_nombre LIKE '%' +@P_search + '%'
		OR p.P_apellido  LIKE '%' +@P_search + '%'
		OR p.S_apellido LIKE '%' +@P_search + '%'
		OR pr.descripcion LIKE '%' +@P_search + '%'
		OR p.correo LIKE '%' +@P_search + '%'
		OR g.descripcion LIKE '%' +@P_search + '%'
		OR dep.descripcion LIKE '%' +@P_search + '%'
		OR mun.decripcion LIKE '%' +@P_search + '%'
		OR pa.descripcion LIKE '%' +@P_search + '%'
END
GO
-- =============================================
-- Author:	Mario Villanueva
-- Create date: 15/08/2023
-- Description:	proceso para agregar un producto con sus detalles y se almacena en inventario 
-- =============================================
CREATE PROCEDURE RegistrarProducto_AgregarInventario
    @codigo_barras VARCHAR(20),
    @precio DECIMAL(10, 2),
    @id_talla INTEGER,
    @id_genero INTEGER,
    @id_color INTEGER,
    @id_tipo INTEGER,
    @id_marca INTEGER,
    @id_proveedor INTEGER,
	@cantidad_disponible INTEGER,
    @fecha_llegada DATETIME,
    @id_bodega INTEGER,
    @nombre_producto VARCHAR(55)
AS
BEGIN
    DECLARE @id_detalle INTEGER;
    -- Insertar en la tabla DetallesRopa
    INSERT INTO DetallesRopa (id_talla, id_genero, id_color, id_tipo, id_marca, id_proveedor, nombre_producto)
    VALUES (@id_talla, @id_genero, @id_color, @id_tipo, @id_marca, @id_proveedor, @nombre_producto);
    SET @id_detalle = SCOPE_IDENTITY();

    -- Insertar en la tabla Productos
    INSERT INTO Productos (codigo_barras, precio, detalle)
    VALUES (@codigo_barras, @precio, @id_detalle);

    -- Insertar en la tabla Inventario
    INSERT INTO Inventario (producto, cantidad_disponible, fecha_llegada, id_bodega)--id producto esta asi en mi base de datos pero tenes que cambiar eso 
    VALUES (@codigo_barras, @cantidad_disponible, @fecha_llegada, @id_bodega);
END
go

-- =============================================
-- Author:		<Author,Mario Villanueva>
-- Create date: <Create Date,13/08/2023>
-- Description:	<procedimiento para buscar productos>
-- =============================================
CREATE PROCEDURE Search_producto
@P_search Varchar (50)
	
AS
BEGIN

SELECT pr.codigo_barras,dr.nombre_producto,ta.descripcion,ti.descripcion,co.descripcion,ma.descripcion,gr.descripcion,pr.precio,inv.cantidad_disponible FROM DetallesRopa dr
	inner join  Productos pr on pr.detalle=dr.id_detalle
	inner join Tallas ta on ta.id_talla=dr.id_talla
	inner join Tipos ti on ti.id_tipos=dr.id_tipo
	inner join Colores co on co.id_colores=dr.id_color
	inner join Marcas ma on ma.id_marcas=dr.id_marca
	inner join GeneroRopa gr on gr.id_gen_ropa=dr.id_genero
	inner join Inventario inv on inv.producto=pr.codigo_barras
	where dr.nombre_producto LIKE '%' +@P_search + '%'
	or ta.descripcion LIKE '%' +@P_search + '%'
	or ti.descripcion LIKE '%' +@P_search + '%'
	or co.descripcion LIKE '%' +@P_search + '%'
	or ma.descripcion LIKE '%' +@P_search + '%'
	or gr.descripcion LIKE '%' +@P_search + '%'
	or pr.precio LIKE '%' +@P_search + '%'

END
GO
--==================================FUNCIONES===========================================
-- =============================================
-- Author:		<Mario Villanueva>
-- Create date: <16/08/2023>
-- Description:	<funcion para obtener la cantidad de ventas de un producto y el monto total vendido
-- =============================================
CREATE FUNCTION obtener_cantidad_ventas_producto

(	
	@F_Codigo_producto VARCHAR (50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT dc.producto, SUM(dc.cantidad) CantidadTotalVendida, SUM(dc.cantidad * p.precio) MontoTotalVendido, dr.nombre_producto
	FROM detalle_compra dc
	INNER JOIN Productos p ON dc.producto = p.codigo_barras
	INNER JOIN DetallesRopa dr on dr.id_detalle=p.detalle
	WHERE p.codigo_barras=@F_Codigo_producto
	GROUP BY dc.producto,dr.nombre_producto
	);
GO

-- =============================================
-- Author:		<Mario Villanueva>
-- Create date: <16/08/2023>
-- Description:	<funcion para obtener la cantidad de compras realizadas por un cliente y el 
--				promedio de compra>
-- =============================================
CREATE FUNCTION obtener_compras_cliente 
(	
	@F_id_cliente INTEGER 
)
RETURNS TABLE 
AS
RETURN 
(
		select C.id_clientes,count(f.id_cliente)cantidad_de_compras, avg(pr.precio*dc.cantidad)promedio_de_compra,
		(p.P_nombre+' '+p.S_nombre+' '+p.P_apellido+' '+p.S_apellido) Cliente
		from detalle_compra dc 
		inner join Factura f on f.n_Factura=dc.id_detalleCOmpra
		inner join Clientes c on c.id_clientes=f.id_cliente
		inner join Personas p on p.idPersona=c.id_persona
		inner join Productos pr on pr.codigo_barras=dc.producto
		where c.id_clientes=@F_id_cliente
		group by p.P_nombre,p.S_nombre,p.P_apellido,p.S_apellido,C.id_clientes
	

);
GO
-- =============================================
-- Author:		<mario villanuva>
-- Create date: <08/16/2023>
-- Description:	<funcion para buscar a un empleado mediante su id, 
	-- devuelve la cantidad de ventas realizadas y el monto>
-- =============================================
CREATE FUNCTION	obtener_ventas_empleado (@F_id_empleado INTEGER)
RETURNS TABLE 
AS
RETURN 
(
select count(f.n_Factura) cantidad_ventas,sum(f.total)monto_ventas,
(p.P_nombre+' '+p.S_nombre+' '+P_apellido+' '+p.S_apellido)nombre_empleado, p.correo,pt.descripcion
from Factura f 
inner join Empleados e on e.id_empleado=f.id_empleado
inner join Personas p on p.idPersona=e.id_persona
inner join PuestosTrabajo pt on pt.idPuesto=e.id_puesto
where f.id_empleado=@F_id_empleado
group by p.P_nombre,p.S_nombre,P_apellido,p.S_apellido, p.correo,pt.descripcion

);
GO
-- =============================================
-- Author:		<Mario villanueva>
-- Create date: <19/08/2023>
-- Description:	<funcion para calcular el precio promedio de los productos>
-- =============================================
	CREATE FUNCTION CalcularPrecioPromedioProductos()
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @PrecioPromedio DECIMAL(10, 2)
    
    SELECT @PrecioPromedio = AVG(Precio)
    FROM Productos
    
    RETURN @PrecioPromedio
END;
-- =============================================
-- Author:		mario villanueva
-- Create date: 17/08/2023
-- Description:	obtener el estado de un producto en inventario (disponible o agotado)
-- =============================================
CREATE FUNCTION Obtener_Estado_Producto(@productoId VARCHAR(20))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @estado VARCHAR(20);
    
    SELECT @estado =
        CASE
            WHEN i.cantidad_disponible > 0 THEN 'disponible'
            ELSE 'agotado'
        END
    FROM Inventario i
    WHERE i.producto = @productoId;
    
    RETURN @estado;
END;

--INDEX
	CREATE NONCLUSTERED INDEX indexCliente ON Clientes (id_clientes asc)
	CREATE NONCLUSTERED INDEX idxEmpleado ON empleados (id_empleado)
	CREATE NONCLUSTERED INDEX idxProducto ON Productos (codigo_barras)
	CREATE NONCLUSTERED INDEX idxMunicipios ON Municipios (idMuncipio asc)

--CHECK 	
	ALTER TABLE empleados
	ADD CONSTRAINT CHK_Salario CHECK (Salario >= 0)

	ALTER TABLE Productos
	ADD CONSTRAINT CHK_Precio CHECK (Precio > 0);
	
-- =============================================
-- Author:		Bryan Cambar
-- Create date: 17/08/2023
-- Description:	obtener informacionde los productos para la factura antes de realizar la factura
-- =============================================

CREATE FUNCTION ObtenerContenidoTablaConSumaYCantidad
(
    @detalle_compra NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT
		F.n_Factura,
		p.detalle,
		p.precio,
		DC.cantidad,
	    DC.producto,
        DC.PrecioProducto,
        SUM(DC.PrecioProducto * DC.cantidad) AS SumaPrecioProductos,
        COUNT(DC.cantidad) AS CantidadProductos
    FROM
        detalle_compra DC inner join Factura F on DC.n_factura = F.n_Factura
		inner join Productos P on DC.producto = P.codigo_barras
    GROUP BY
        DC.cantidad, DC.producto, DC.PrecioProducto, F.n_Factura, p.detalle, p.precio
);

SELECT *
FROM dbo.ObtenerContenidoTablaConSumaYCantidad('detalle_compra');







