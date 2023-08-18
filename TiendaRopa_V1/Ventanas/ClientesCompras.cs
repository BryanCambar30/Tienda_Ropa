using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaRopa_V1.Ventanas
{
    public partial class ClientesCompras : Form
    {
        public ClientesCompras()
        {
            InitializeComponent();
        }
        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void Cancelar_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.Factura Facturar = new TiendaRopa_V1.Ventanas.Factura();
            Facturar.Show();
            this.Close();
            conexion.cn.Close();
        }

        private void Buscar_Click(object sender, EventArgs e)
        {   

            conexion.cn.Open();

            SqlCommand command = new SqlCommand("SELECT * FROM obtener_compras_cliente(@F_id_cliente)", conexion.cn);
            command.Parameters.AddWithValue("@F_id_cliente", cbCliente.SelectedValue);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            ComprasClientes.DataSource = dataTable;
            conexion.cn.Close();
        }

        private void ClientesCompras_Load(object sender, EventArgs e)
        {
            //llena la check box de clientes
            try
            {
                this.cbCliente.DataSource = conexion.LllenarComboBox("Personas");
                this.cbCliente.DisplayMember = "P_nombre + P_apellido";
                this.cbCliente.ValueMember = "idPersona";
                this.cbCliente.Text = "";
                this.cbCliente.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
        }
    }
}
