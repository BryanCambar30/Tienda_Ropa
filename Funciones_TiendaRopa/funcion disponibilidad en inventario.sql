
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

use TiendaRopa_V2