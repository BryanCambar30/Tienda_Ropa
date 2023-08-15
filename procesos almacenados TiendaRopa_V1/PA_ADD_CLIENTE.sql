
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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



--agregar
EXEC RegistrarNuevoCliente
    @id_lugarNacimiento = 2, -- ID de municipio de nacimiento
    @id_genero = 1, -- ID de género
    @P_nombre = 'tato',
    @S_nombre = 'prueba1',
    @S_apellido  = 'prueba1',
    @P_apellido = 'p1',
    @correo = 'correo@eprueba.com',
    @fecha_nacimiento='2021-06-06',
    @id_profesion = 1, -- ID de profesión
    @Tipo_Mayoritario = 1 -- 1

	exec Search_cliente_ 'tato'