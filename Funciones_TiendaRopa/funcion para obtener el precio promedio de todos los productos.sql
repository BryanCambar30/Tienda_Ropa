
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
