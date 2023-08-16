using Microsoft.Data.SqlClient;
using TiendaRopa_V1.Clases;

namespace TiendaRopa_V1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void conectarSqlServerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Clases.ConexionSQLServer objetoConexion = new Clases.ConexionSQLServer();
            objetoConexion.establecerConexion();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            /*SqlCommand cmd = new SqlCommand("EmpledoValidacion")
            {
                 CommandType = System.Data.CommandType.StoredProcedure
             };

             cmd.Parameters.Add("@id_Empleado", System.Data.SqlDbType.Int).Value = textBox3;
             cmd.Parameters.Add("@contraseña", System.Data.SqlDbType.VarChar, 50).Value = textBox2;
             SqlDataReader dr = cmd.ExecuteReader();

             if (dr.Read())
             {
                */
            TiendaRopa_V1.Ventanas.indice Indice = new TiendaRopa_V1.Ventanas.indice();
             Indice.Show();
             this.Close();
            //}
            //cmd.Connection.Close();
        }

        private void conectarSqlServerToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Clases.ConexionSQLServer objetoConexion = new Clases.ConexionSQLServer();
            objetoConexion.establecerConexion();
        }
    }
}