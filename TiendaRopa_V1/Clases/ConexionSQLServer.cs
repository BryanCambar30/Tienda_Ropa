using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace TiendaRopa_V1.Clases
{
    internal class ConexionSQLServer
    {
        SqlConnection conexionSQL = new SqlConnection();

        static string server = "localhost";
        static string db = "TiendaRopa_V1";
        static string usuario = "hachypants";
        static string password = "Qwerty123";
        static string port = "1433";

        string CadenaConexion = "Data Source=" + server + "," + port + ";" + "user id=" + usuario + ";" + "password=" + password + ";" + "Initial catalog=" + db + ";";

        public SqlConnection establecerConexion()
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
}
