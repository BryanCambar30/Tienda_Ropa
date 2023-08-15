
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<mario villanueva>
-- Create date: <12/08/2023>
-- Description:	proceso para buscar un cliente
-- =============================================
CREATE PROCEDURE Search_cliente
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
		OR p.P_nombre  LIKE '%' +@P_search + '%'
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

--prueba 
exec Search_cliente 'EL SALVADOR'

