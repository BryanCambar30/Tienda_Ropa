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
    public partial class EmpleadoVentas : Form
    {
        public EmpleadoVentas()
        {
            InitializeComponent();
        }


        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void EmpleadoVentas_Load(object sender, EventArgs e)
        {
            try
            {
                this.cbEmpleado.DataSource = conexion.LllenarComboBox("Empleados");
                this.cbEmpleado.DisplayMember = "id_empleado";
                this.cbEmpleado.ValueMember = "id_empleado";
                this.cbEmpleado.Text = "";
                this.cbEmpleado.Refresh();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Buscar_Click(object sender, EventArgs e)
        {
            conexion.cn.Open();
            
            SqlCommand command = new SqlCommand("SELECT * FROM obtener_ventas_empleado(@F_id_empleado)", conexion.cn);
            command.Parameters.AddWithValue("@F_id_empleado", cbEmpleado.SelectedValue);

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            VentasEmpleado.DataSource = dataTable;
            conexion.cn.Close();
        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
            conexion.cn.Close();
        }
    }
}
