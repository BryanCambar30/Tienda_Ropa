
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Mario Villanueva>
-- Create date: <Create Date,13/08/2023>
-- Description:	<procedimiento para buscar productos>
-- =============================================
CREATE PROCEDURE Search_pr
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

execute Search_pr 'nike'
