
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

--prueba
	DECLARE @codigoProducto VARCHAR(50) = 'F213T425ABC'; --se busca mediante el codigo
	SELECT * FROM dbo.obtener_cantidad_ventas_producto(@codigoProducto);

	select * from Productos
	select * from detalle_compra










