using Microsoft.Data.SqlClient;
using System.Data;
using TiendaRopa_V1.Clases;

namespace TiendaRopa_V1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Clases.ConexionSQLServer objetoConexion = new Clases.ConexionSQLServer();
        private void conectarSqlServerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            objetoConexion.cn.Open();
        }

        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void conectarSqlServerToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            Clases.ConexionSQLServer objetoConexion = new Clases.ConexionSQLServer();
            objetoConexion.ConexionSQL();
            TiendaRopa_V1.Ventanas.New_Empleado New_Empleado = new TiendaRopa_V1.Ventanas.New_Empleado();
            New_Empleado.Show();
            this.Hide();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("EmpleadoValidacion", objetoConexion.cn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            objetoConexion.cn.Open();
            cmd.Parameters.Add("@id_Empleado", System.Data.SqlDbType.Int).Value = this.txN_Empleado.Text.Trim();
            cmd.Parameters.Add("@contraseña", System.Data.SqlDbType.VarChar, 50).Value = this.txPassword.Text.Trim();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            objetoConexion.cn.Close();
            if (dt.Rows.Count == 0)
            {
                MessageBox.Show("No existe el Usuario");
            }
            else
            {
                TiendaRopa_V1.Ventanas.Factura factura = new TiendaRopa_V1.Ventanas.Factura();
                factura.Show();
                this.Hide();
                objetoConexion.cn.Close();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }      
}