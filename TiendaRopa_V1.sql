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

CREATE TABLE Producto_mas_vendido(
	id_mes INTEGER PRIMARY KEY,
	id_Producto VARCHAR (20) NOT NULL,
	mes INTEGER NOT NULL,
	anio INTEGER NOT NULL,
	cantidad INTEGER NOT NULL,
	CONSTRAINT fk_id_producto_mas_vendido FOREIGN KEY (id_producto) REFERENCES productos(codigo_barras)
	)

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

