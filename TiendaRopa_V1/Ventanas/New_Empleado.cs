using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaRopa_V1.Ventanas
{
    public partial class New_Empleado : Form
    {
        public New_Empleado()
        {
            InitializeComponent();
        }

        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void Profesion_Click(object sender, EventArgs e)
        {

        }
 

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private bool ValidarCamposNumericos(char caracter)
        {
            if((caracter >= 48 && caracter <=57)||(caracter == 8))
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
            if ((caracter >= 48 && caracter <= 57) || (caracter == 8)||caracter == 46)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        private void New_Empleado_Load(object sender, EventArgs e)
        {
            /*este llena el combo box de Generos para que solo selecionesn uno*/
            try
            {
                this.cbGenero.DataSource = conexion.LllenarComboBox("Generos");
                this.cbGenero.DisplayMember = "descripcion";
                this.cbGenero.ValueMember = "id_genero";
                this.cbGenero.Text = "";
                this.cbGenero.Refresh();
            }catch(Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            /*este llena el combo box de Puesto para que solo selecionesn uno*/
            try
            {
                this.cbPuesto.DataSource = conexion.LllenarComboBox("PuestosTrabajo");
                this.cbPuesto.DisplayMember = "descripcion";
                this.cbPuesto.ValueMember = "idPuesto";
                this.cbPuesto.Text = "";
                this.cbPuesto.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            /*este llena el combo box de Profesion para que solo selecionesn uno*/
            try
            {
                this.cbProfesion.DataSource = conexion.LllenarComboBox("Profesiones");
                this.cbProfesion.DisplayMember = "descripcion";
                this.cbProfesion.ValueMember = "idProfesion";
                this.cbProfesion.Text = "";
                this.cbProfesion.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            /*este llena el combo box de Sucursal para que solo selecionesn uno*/
            try
            {
                this.cbSucursal.DataSource = conexion.LllenarComboBox("Sucursales");
                this.cbSucursal.DisplayMember = "razonSocial";
                this.cbSucursal.ValueMember = "idLocal";
                this.cbSucursal.Text = "";
                this.cbSucursal.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
            /*este llena el combo box de Nacionalidad para que solo selecionesn uno*/
            try
            {
                this.cbNacionalidad.DataSource = conexion.LllenarComboBox("Municipios");
                this.cbNacionalidad.DisplayMember = "descripcion";
                this.cbNacionalidad.ValueMember = "idMuncipio";
                this.cbNacionalidad.Text = "";
                this.cbNacionalidad.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }
        }

        private void comboBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void textBox9_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericosDecimales(e.KeyChar);
        }

        private void textBox5_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = ValidarCamposNumericos(e.KeyChar);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try {
                if (string.IsNullOrEmpty(txP_Nombre.Text) == false)
                {

                    DateTime horaValida;

                    bool esHoraValida = DateTime.TryParse(txHora_Entrada.Text, out horaValida);

                    // Mostrar el resultado de la validación
                    if (esHoraValida)
                    {
                        MessageBox.Show("La hora es válida: " + horaValida.ToString("HH:mm"));
                    }
                    else
                    {
                        MessageBox.Show("La hora no es válida");
                    }

                    //Format(txHora_Entrada.Text, "HH:mm am/pm");

                    DateTime horaValida2;

                    bool esHoraValida2 = DateTime.TryParse(txHora_Salida.Text, out horaValida);

                    // Mostrar el resultado de la validación
                    if (esHoraValida)
                    {
                        MessageBox.Show("La hora es válida: " + horaValida.ToString("HH:mm"));
                    }
                    else
                    {
                        MessageBox.Show("La hora no es válida");
                    }

                    //Format(txHora_Entrada.Text, "HH:mm am/pm");
                    /*string s = txHora_Entrada.Text.Trim();
                    DateTime dt = DateTime.ParseExact(s, "HH:mm", CultureInfo.InvariantCulture);
                    TimeSpan ts = dt.TimeOfDay; // ts es 10:30:00
                    string s2 = txHora_Salida.Text.Trim();
                    DateTime dt2 = DateTime.ParseExact(s, "HH:mm", CultureInfo.InvariantCulture);
                    TimeSpan ts2 = dt.TimeOfDay;
                /////////////////////////////////////////////////////////////////////////////////////////////*/

                    SqlCommand cmd = new SqlCommand("AgregarEmpleado", conexion.cn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    conexion.cn.Open();
                    cmd.Parameters.Add("@nombre", System.Data.SqlDbType.VarChar).Value = this.txP_Nombre.Text.Trim();
                    cmd.Parameters.Add("@s_nombre", System.Data.SqlDbType.VarChar).Value = this.txS_Nombre.Text.Trim();
                    cmd.Parameters.Add("@apellido", System.Data.SqlDbType.VarChar).Value = this.txP_Apellido.Text.Trim();
                    cmd.Parameters.Add("@s_apellido", System.Data.SqlDbType.VarChar).Value = this.rxS_Apellido.Text.Trim();
                    cmd.Parameters.Add("@id_puesto", System.Data.SqlDbType.Int).Value = this.cbPuesto.SelectedValue;
                    cmd.Parameters.Add("@genero", System.Data.SqlDbType.Int).Value = this.cbGenero.SelectedValue;
                    cmd.Parameters.Add("@id_profesion", System.Data.SqlDbType.Int).Value = this.cbProfesion.SelectedValue;
                    cmd.Parameters.Add("@id_tienda", System.Data.SqlDbType.Int).Value = this.cbSucursal.SelectedValue;
                    cmd.Parameters.Add("@telefono", System.Data.SqlDbType.Int).Value = this.txTelefono.Text.Trim();
                    cmd.Parameters.Add("@horaEntrada", System.Data.SqlDbType.Time).Value = this.txHora_Entrada.Text.Trim();
                    cmd.Parameters.Add("@horaSalida", System.Data.SqlDbType.Time).Value = this.txHora_Salida.Text.Trim();
                    cmd.Parameters.Add("@salario", System.Data.SqlDbType.Decimal).Value = this.txSalario.Text.Trim();
                    cmd.Parameters.Add("@correo", System.Data.SqlDbType.VarChar).Value = this.txCorreo.Text.Trim();
                    cmd.Parameters.Add("@fecha_nacimiento", System.Data.SqlDbType.Date).Value = this.monthCalendar1.SelectionRange.Start.ToShortDateString();
                    cmd.Parameters.Add("@id_lugarNacimiento", System.Data.SqlDbType.Int).Value = this.cbNacionalidad.SelectedValue;
                    //SqlDataReader dr = cmd.ExecuteReader();

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

        private void txHora_Entrada_TextChanged(object sender, EventArgs e)
        {

        }

        private void txHora_Salida_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}

