using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace TiendaRopa_V1.Clases
{
    internal class ConexionSQLServer
    {
        SqlConnection conexionSQL = new SqlConnection();
        public SqlConnection cn;
        private SqlCommandBuilder cmb;
        public DataSet ds = new DataSet();
        public SqlDataAdapter da;
        public SqlCommand comando;
        static string db = "TiendaRopa_V1";
        static string usuario = "sa";
        static string password = "Qwerty123";
        static string port = "1435";
        static string server = Dns.GetHostName();
        //static string server = Dns.GetHostName();
        string CadenaConexion = "Data Source=" + server + ","+port + ";" + "user id=" + usuario + ";" + "password=" + password + ";" + "Initial catalog=" + db + ";"+"TrustServerCertificate=True";

        public ConexionSQLServer()
        {
            cn = new SqlConnection(CadenaConexion);
        }
        public void ConexionSQL()
        {
            conectar();
        }
        private void conectar()
        {
            cn = new SqlConnection(CadenaConexion);
        }

        //Consultar Registros SQL
        public void consultar(string sql, string tabla)
        {
            ds.Tables.Clear();
            da = new SqlDataAdapter(sql, cn);
            cmb = new SqlCommandBuilder(da);
            da.Fill(ds, tabla);
        }

        //Insertar Registros SQL
        public bool insertar(string sql)
        {
            cn.Open();
            comando = new SqlCommand(sql, cn);
            int i = comando.ExecuteNonQuery();
            cn.Close();
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        //Eliminar Registros SQL
        public bool eliminar(string tabla, string condicion)
        {
            cn.Open();
            string sql = "delete from " + tabla + " where " + condicion;
            comando = new SqlCommand(sql, cn);
            int i = comando.ExecuteNonQuery();
            cn.Close();
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        //Actualizar Registros SQL
        public bool actualizar(string tabla, string campos, string condicion)
        {
            cn.Open();
            string sql = "update " + tabla + " set " + campos + " where " + condicion;
            comando = new SqlCommand(sql, cn);
            int i = comando.ExecuteNonQuery();
            cn.Close();
            if (i > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public DataTable LllenarComboBox(string tabla)
        {
            string sql = "select * from " + tabla;
            da = new SqlDataAdapter(sql, cn);
            DataSet dts = new DataSet();
            da.Fill(dts, tabla);
            DataTable dt = new DataTable();
            dt = dts.Tables[tabla];
            return dt;
        }
    }
}
