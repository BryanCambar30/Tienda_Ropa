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
using System.Globalization;
using System.Drawing.Printing;

namespace TiendaRopa_V1.Ventanas
{
    public partial class Factura : Form
    {
        public Factura()
        {
            InitializeComponent();
        }
        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        double cantidad = 0;
        double precio = 0;
        double decuecuento_producto = 0;
        double ISV = 0;
        double subTotal_producto = 0;

        private bool ValidarCamposNumericos(char caracter)
        {
            if ((caracter >= 48 && caracter <= 57) || (caracter == 8))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        private bool ValidarCamposNumericosDecimales(char caracter)
        {
            if ((caracter >= 48 && caracter <= 57) || (caracter == 8) || caracter == 46)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        private void Factura_Load(object sender, EventArgs e)
        {   
            //Llena el chheckbox de cliente
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
            //llena el checkBox de local
            try
            {
                this.cbLocal.DataSource = conexion.LllenarComboBox("Sucursales");
                this.cbLocal.DisplayMember = "razonSocial";
                this.cbLocal.ValueMember = "idLocal";
                this.cbLocal.Text = "";
                this.cbLocal.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //llena el checkBox de Empleado
            try
            {
                this.cbEmpleado.DataSource = conexion.LllenarComboBox("Empleados");
                this.cbEmpleado.DisplayMember = "id_empleado";
                this.cbEmpleado.ValueMember = "id_empleado";
                this.cbEmpleado.Text = "";
                this.cbEmpleado.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
        }

        private void txtCantidad_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericos(e.KeyChar);
        }

        private void txtDescuento_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericos(e.KeyChar);
        }

        private void txtTotalPagado_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericosDecimales(e.KeyChar);
        }

        private void txtGravado_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericosDecimales(e.KeyChar);
        }

        private void Facturar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtProducto.Text) == false)
                {
                    DataTable productosDetalleTable = new DataTable();
                    productosDetalleTable.Columns.Add("codigo_barras", typeof(string));
                    productosDetalleTable.Columns.Add("Cantidad", typeof(int));

                    // Agregar filas a la tabla de detalles de productos
                    productosDetalleTable.Rows.Add(txtProducto.Text.Trim(), txtCantidad.Text.Trim());
                    /*/productosDetalleTable.Rows.Add("codigo2", 2);

                   // string sql = "INSERT INTO dbo.ProductoDetalleTableTyp(Ccodigo_barras, Cantidad) VALUES ('" + txtProducto.Text.Trim() + "','" + txtCantidad.Text.Trim() + "')";
                    //if (conexion.insertar(sql))
                    //{

                    //}
                    //else
                    {
                        MessageBox.Show("Error al insertar Productos o cantidad de productos", "Aviso");
                        return;
                    }*/
                    conexion.cn.Open();
                    SqlCommand cmd = new SqlCommand("GenerarFactura", conexion.cn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add("@cliente_id", System.Data.SqlDbType.Int).Value = this.cbCliente.SelectedValue;
                    cmd.Parameters.Add("@empleado_id", System.Data.SqlDbType.Int).Value = this.cbEmpleado.SelectedValue;
                    cmd.Parameters.Add("@id_local", System.Data.SqlDbType.Int).Value = this.cbLocal.SelectedValue;
                    cmd.Parameters.Add("@TotalPagado", System.Data.SqlDbType.Decimal).Value = this.txtTotalPagado.Text.Trim();
                    cmd.Parameters.Add("@gravado", System.Data.SqlDbType.Decimal).Value = this.txtGravado.Text.Trim();
                    cmd.Parameters.Add("@Descuento", System.Data.SqlDbType.Decimal).Value = this.txtDescuento.Text.Trim();

                    SqlParameter productosDetalleParam = cmd.Parameters.AddWithValue("@ProductosDetalle", productosDetalleTable);
                    productosDetalleParam.SqlDbType = SqlDbType.Structured;
                    productosDetalleParam.TypeName = "dbo.ProductoDetalleTableType";

                    int result = cmd.ExecuteNonQuery();

                    if (result == 1)
                    {
                        MessageBox.Show("Hubo un error en el guardado de datos.");
                    }
                     else
                     {
                        MessageBox.Show("Ingresado con exito.");
                }
                conexion.cn.Close();
            }
                conexion.cn.Open();
                SqlCommand command = new SqlCommand("SELECT TOP 1 * FROM Factura ORDER BY fecha_hora DESC;", conexion.cn);
                command.Parameters.AddWithValue("@F_id_cliente", cbCliente.SelectedValue);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                dgvDetalleFactura.DataSource = dataTable;
                conexion.cn.Close();
            }
            catch (Exception ex)
            {
                conexion.cn.Close();
                MessageBox.Show(ex.Message);
            }
}

        private void agregarEmpleadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.New_Empleado new_Empleado = new TiendaRopa_V1.Ventanas.New_Empleado();
            new_Empleado.Show();
            this.Close();
            conexion.cn.Close();
        }

        private void agregarClienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.NewCliente newCliente = new TiendaRopa_V1.Ventanas.NewCliente();
            newCliente.Show();
            this.Close();
            conexion.cn.Close();
        }

        private void productoMasVendidoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.ProdcutoMasVendido ProductoMes = new TiendaRopa_V1.Ventanas.ProdcutoMasVendido();
            ProductoMes.Show();
            this.Close();
            conexion.cn.Close();
        }

        private void buscarEmpleadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.EmpleadoVentas EmpleadosVentas = new TiendaRopa_V1.Ventanas.EmpleadoVentas();
            EmpleadosVentas.Show();
            conexion.cn.Close();
        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            this.txtProducto.Clear();
            this.txtCantidad.Clear();
            this.txtDescuento.Clear();
            this.txtGravado.Clear();
            this.txtTotalPagado.Clear();
            this.cbCliente.SelectedIndex = 0;
            this.cbEmpleado.SelectedIndex = 0;
            this.cbLocal.SelectedIndex = 0;
        }

        private void buscarClienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.ClientesCompras CLienteCompras = new TiendaRopa_V1.Ventanas.ClientesCompras();
            CLienteCompras.Show();
            this.Close();
            conexion.cn.Close();

        }

        private void addToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.ProductoNuevo ProductoAdd = new TiendaRopa_V1.Ventanas.ProductoNuevo();
            ProductoAdd.Show();
            this.Close();
            conexion.cn.Close();
        }



       private void button1_Click(object sender, EventArgs e)
        {
            conexion.cn.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = conexion.cn;
            string sqlQuery = "UPDATE TOP(1) Factura SET monto_pagado = @MontoPagado WHERE N_fACTURA =(SELECT MAX(n_factura) FROM Factura)  UPDATE TOP(1) Factura SET cambio = monto_pagado - total WHERE N_fACTURA =(SELECT MAX(n_factura) FROM Factura)";
            command.Parameters.AddWithValue("@MontoPagado", txtTotalPagado.Text);
            command.CommandText = sqlQuery;
            command.ExecuteNonQuery();

            SqlCommand commando = new SqlCommand("SELECT TOP 1 * FROM Factura ORDER BY fecha_hora DESC;", conexion.cn);
            

            SqlDataAdapter adapter = new SqlDataAdapter(commando);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            dgvDetalleFactura.DataSource = dataTable;
            conexion.cn.Close();
        }

        private void estadoProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
