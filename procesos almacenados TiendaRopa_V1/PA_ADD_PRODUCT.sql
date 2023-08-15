
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mario Villanueva
-- Create date: 15/08/2023
-- Description:	proceso para agregar un producto con sus detalles y se almacene en inventario 
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

	SET IDENTITY_INSERT Productos ON; --para que se pueda insertar el codigo de barras a productos
	EXEC RegistrarProducto_AgregarInventario
	@codigo_barras = 'pruebaFinal2',
    @precio = 29.99,
    @id_talla = 1,
    @id_genero = 2,
    @id_color = 2,
    @id_tipo = 3,
    @id_marca = 3,
    @id_proveedor = 2,
	@cantidad_disponible = 100,
	@fecha_llegada = '2000-03-02', 
    @nombre_producto = 'producto prueba',
	@id_bodega=1

	select* from Inventario
	select * from Productos