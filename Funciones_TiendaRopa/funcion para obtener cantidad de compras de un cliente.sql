SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Mario Villanueva>
-- Create date: <16/08/2023>
-- Description:	<funcion para obtener la cantidad de compras realizadas por un cliente y el 
--				promedio de compre>
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

--prueba
DECLARE @clienteId INT = 3; --usuario 3 a realizado 3 compras  
SELECT *FROM dbo.obtener_compras_cliente(@clienteId);