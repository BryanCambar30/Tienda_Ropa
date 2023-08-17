SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

)
GO


--prueba
DECLARE @empleadoID INT = 4; --es el unico que ha hecho mas de 1 venta 
SELECT *FROM dbo.obtener_ventas_empleado(@empleadoID);