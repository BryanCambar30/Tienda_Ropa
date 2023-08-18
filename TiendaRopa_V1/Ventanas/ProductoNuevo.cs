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
    public partial class ProductoNuevo : Form
    {
        public ProductoNuevo()
        {
            InitializeComponent();
        }
        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void Limpiar_Click(object sender, EventArgs e)
        {
            this.txtCantidad.Clear();
            this.txtCodigoBarras.Clear();
            this.txtNombreP.Clear();
            this.txtPrecio.Clear();
            this.cbBodega.SelectedIndex = 0;
            this.cbColor.SelectedIndex = 0;
            this.cbGenero.SelectedIndex = 0;
            this.cbMarca.SelectedIndex = 0;
            this.cbProveedor.SelectedIndex = 0;
            this.cbtalla.SelectedIndex = 0;
            this.cbTipo.SelectedIndex = 0;
        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.Factura Facturar = new TiendaRopa_V1.Ventanas.Factura();
            Facturar.Show();
            this.Close();
            conexion.cn.Close();
        }

        private void ProductoNuevo_Load(object sender, EventArgs e)
        {
            //Llena el chheckbox de Bodega
            try
            {
                this.cbBodega.DataSource = conexion.LllenarComboBox("Bodega");
                this.cbBodega.DisplayMember = "id_bodega";
                this.cbBodega.ValueMember = "id_bodega";
                this.cbBodega.Text = "";
                this.cbBodega.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbColor.DataSource = conexion.LllenarComboBox("Colores");
                this.cbColor.DisplayMember = "descripcion";
                this.cbColor.ValueMember = "id_colores";
                this.cbColor.Text = "";
                this.cbColor.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbGenero.DataSource = conexion.LllenarComboBox("GeneroRopa");
                this.cbGenero.DisplayMember = "descripcion";
                this.cbGenero.ValueMember = "id_gen_ropa";
                this.cbGenero.Text = "";
                this.cbGenero.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbMarca.DataSource = conexion.LllenarComboBox("Marcas");
                this.cbMarca.DisplayMember = "descripcion";
                this.cbMarca.ValueMember = "id_marcas";
                this.cbMarca.Text = "";
                this.cbMarca.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbProveedor.DataSource = conexion.LllenarComboBox("Proveedores");
                this.cbProveedor.DisplayMember = "nombre_empresa";
                this.cbProveedor.ValueMember = "id_proveedores";
                this.cbProveedor.Text = "";
                this.cbProveedor.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbtalla.DataSource = conexion.LllenarComboBox("Tallas");
                this.cbtalla.DisplayMember = "descripcion";
                this.cbtalla.ValueMember = "id_talla";
                this.cbtalla.Text = "";
                this.cbtalla.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            //Llena el checkBox de Color
            try
            {
                this.cbTipo.DataSource = conexion.LllenarComboBox("Tipos");
                this.cbTipo.DisplayMember = "descripcion";
                this.cbTipo.ValueMember = "id_tipos";
                this.cbTipo.Text = "";
                this.cbTipo.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
        }

        private void Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtCodigoBarras.Text) == false)
                {
                    conexion.cn.Open();
                    SqlCommand cmd = new SqlCommand("RegistrarProducto_AgregarInventario", conexion.cn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add("@codigo_barras", System.Data.SqlDbType.VarChar).Value = this.txtCodigoBarras.Text.Trim();
                    cmd.Parameters.Add("@precio", System.Data.SqlDbType.Decimal).Value = this.txtPrecio.Text.Trim();
                    cmd.Parameters.Add("@id_talla", System.Data.SqlDbType.Int).Value = this.cbtalla.SelectedValue;
                    cmd.Parameters.Add("@id_genero", System.Data.SqlDbType.Int).Value = this.cbGenero.SelectedValue;
                    cmd.Parameters.Add("@id_color", System.Data.SqlDbType.Int).Value = this.cbColor.SelectedValue;
                    cmd.Parameters.Add("@id_tipo", System.Data.SqlDbType.Int).Value = this.cbTipo.SelectedValue;
                    cmd.Parameters.Add("@id_marca", System.Data.SqlDbType.Int).Value = this.cbMarca.SelectedValue;
                    cmd.Parameters.Add("@id_proveedor", System.Data.SqlDbType.Int).Value = this.cbProveedor.SelectedValue;
                    cmd.Parameters.Add("@cantidad_disponible", System.Data.SqlDbType.Int).Value = this.txtCantidad.Text.Trim();
                    cmd.Parameters.Add("@fecha_llegada", System.Data.SqlDbType.DateTime).Value = this.monthCalendar1.SelectionRange.Start.ToShortDateString();
                    cmd.Parameters.Add("@id_bodega", System.Data.SqlDbType.Int).Value = this.cbBodega.SelectedValue;
                    cmd.Parameters.Add("@nombre_producto", System.Data.SqlDbType.VarChar).Value = this.txtNombreP.Text.Trim();

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
            }
            catch (Exception ex)
            {
                conexion.cn.Close();
                MessageBox.Show(ex.Message);
            }
        }
    }
}
