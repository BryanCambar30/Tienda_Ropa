# 🧾 Tienda_Ropa – Sistema de Facturación y Gestión Multisucursal

<div align="center">
  <img src="https://img.shields.io/badge/C%23-.NET_Framework-blue?style=flat&logo=.net" />
  <img src="https://img.shields.io/badge/SQL_Server-Database-red?style=flat&logo=microsoftsqlserver" />
  <img src="https://img.shields.io/badge/Oracle-DB-orange?style=flat&logo=oracle" />
  <img src="https://img.shields.io/badge/Desktop-App-informational?style=flat&logo=windows" />
</div>

## 🇪🇸 Español

**Tienda_Ropa** es un sistema de facturación y gestión diseñado para tiendas de ropa con múltiples sucursales. El proyecto fue desarrollado como una aplicación de escritorio en **C# utilizando .NET Framework**, y emplea **SQL Server** como base de datos principal, con soporte adicional para **Oracle DB** como alternativa multiplataforma.

---

### 🛠 Tecnologías utilizadas

- 💻 Lenguaje principal: C# (.NET Framework)
- 🗃️ Bases de datos: SQL Server y Oracle DB
- 🧠 Lógica de negocio implementada con procedimientos almacenados
- ⚙️ Aplicación de escritorio con arquitectura en capas

---

### 🧩 Características principales

- 📦 Gestión de productos
- 👥 Gestión de clientes y empleados
- 🏬 Gestión multisucursal (inventario por sucursal)
- 💰 Registro y control de ventas
- 🚀 Optimización mediante procedimientos almacenados en SQL
- 🔄 Migración parcial a Oracle para exploración multiplataforma

---

### 📁 Estructura del proyecto

✨ Este proyecto está compuesto por varios componentes clave que trabajan en conjunto para ofrecer una solución completa de software de escritorio, con backend en SQL Server y entorno de desarrollo configurado profesionalmente.

- `TiendaRopa_V1/`  
  🔹 **Aplicación de escritorio en C#**  
  Contiene archivos del proyecto como `.csproj`, clases `.cs`, configuraciones `.config` y recursos visuales de la interfaz. Es el núcleo funcional del sistema.

- `Funciones_TiendaRopa/`  
  📄 **Scripts SQL con funciones y procedimientos almacenados**  
  Incluye la lógica del lado del servidor para realizar operaciones complejas como validaciones, cálculos y manejo de datos.

- `P_F_Q_TiendaRopa.sql`  
  🧪 **Consultas de prueba**  
  Archivo de validación para probar funciones, procedimientos y lógica implementada en la base de datos.

- `TiendaRopa_V1.sql`  
  🏗 **Script de base de datos**  
  Permite restaurar toda la base de datos en un entorno SQL Server, incluyendo tablas, relaciones, índices, etc.

- `TiendaRopa_V1.txt`  
  📝 **Documentación técnica del sistema**  
  Describe la arquitectura del software, su lógica, entidades principales y flujo de datos.

- `.vscode/`  
  ⚙ **Configuración de entorno para Visual Studio Code**  
  Carpetas y archivos para mantener configuraciones comunes como formato de código, depuración, y extensiones.

- `.gitattributes`  
  🧭 **Metadatos del repositorio**  
  Define reglas de tratamiento de archivos en Git, útil para entornos colaborativos y cross-platform.

---

### 🚀 Cómo iniciar el proyecto

1. Clona este repositorio
2. Restaura la base de datos desde `TiendaRopa_V1.sql` o usa la versión Oracle
3. Abre el proyecto en Visual Studio
4. Configura tu cadena de conexión a la base de datos
5. Compila y ejecuta la aplicación

---

### 👥 Autores

Proyecto desarrollado por:

- [BryanCambar30](https://github.com/BryanCambar30)
- [Mariod12](https://github.com/mariod12)

---

## en English

**Tienda_Ropa** is a billing and management system designed for multi-branch clothing stores. It was built as a desktop application in **C# using the .NET Framework**, with **SQL Server** as the main database and **Oracle DB** as a secondary platform for compatibility testing.

---

### 🛠 Tech Stack

- 💻 Language: C# (.NET Framework)
- 🗃️ Databases: SQL Server & Oracle DB
- 🧠 Business logic via stored procedures
- ⚙️ Desktop App with layered architecture

---

### 🧩 Key Features

- 📦 Product management
- 👥 Customers and staff management
- 🏬 Inventory by branch
- 💰 Sales tracking and control
- 🚀 SQL stored procedure optimization
- 🔄 Partial Oracle migration for cross-platform support

---

### 📁 Repository Structure

✨ This project is composed of several key components that work together to deliver a full desktop software solution, with a SQL Server backend and a professionally configured development environment.

- `TiendaRopa_V1/`  
  🔹 **C# Desktop Application**  
  Contains project files such as `.csproj`, C# classes `.cs`, configuration files `.config`, and UI resources. It’s the core of the system.

- `Funciones_TiendaRopa/`  
  📄 **SQL Scripts for Stored Procedures and Functions**  
  Includes server-side logic for complex operations such as validations, calculations, and data handling.

- `P_F_Q_TiendaRopa.sql`  
  🧪 **Test Queries**  
  A file for testing stored logic and validating the correctness of procedures and functions.

- `TiendaRopa_V1.sql`  
  🏗 **Database Script**  
  Used to restore the complete database in SQL Server, including tables, relationships, indexes, and data structures.

- `TiendaRopa_V1.txt`  
  📝 **Technical Documentation**  
  Describes the software’s architecture, internal logic, main entities, and data flow.

- `.vscode/`  
  ⚙ **Visual Studio Code Environment Configuration**  
  Includes workspace settings, debugging configurations, and code formatting preferences.

- `.gitattributes`  
  🧭 **Repository Metadata**  
  Defines file-handling rules in Git, especially useful in cross-platform or collaborative environments.

---

### 🚀 Getting Started

1. Clone this repository
2. Restore the DB using `TiendaRopa_V1.sql` or the Oracle version
3. Open the project with Visual Studio
4. Set your database connection string
5. Build and run the application

---

### 👥 Authors

Project developed by:

- [BryanCambar30](https://github.com/BryanCambar30)
- [Mariod12](https://github.com/mariod12)
