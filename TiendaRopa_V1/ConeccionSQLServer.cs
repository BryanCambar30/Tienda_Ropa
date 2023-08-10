using Microsoft.Data.SqlClient;
using Microsoft.Identity.Client;
using System;
using System.CodeDom;
using System.Data.SqlClient;

public class Class1
{
    public Class1()
    {
        SqlConnection conexionSQL = new SqlConnection();
         string server="localhost";
         string db="TiendaRopa_V1";
         string usuario="hachypants";
         string port="1433";
         string password="Qwerty123";

        string CadenaConexion = "Data Source=" + server + "," + port + ";" + "user id=" + usuario + ";" + "password=" + password + ";" + "Initial catalog=" + db;
    }

    private static SqlConnection establecerConexion(SqlConnection conexionSQL, string CadenaConexion)
    {
        try
        {
            conexionSQL.ConnectionString = CadenaConexion;
            conexionSQL.Open();
            MessageBox.Show("Felicidades este grupo si pudo realizar la conexion con la base de datos ");

        }
        catch (SqlException e)
        {
            MessageBox.Show("No se logro realizar la conexion con la base de datos" + e.ToString());
        }

        return conexionSQL;
    }
}
