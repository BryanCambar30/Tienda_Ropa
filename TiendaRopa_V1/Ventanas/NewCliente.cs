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
    public partial class NewCliente : Form
    {
        public NewCliente()
        {
            InitializeComponent();
        }
        Boolean Mayoritario;
        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void Facturar_Click(object sender, EventArgs e)
        {
            TiendaRopa_V1.Ventanas.Factura Facturar = new Factura();
            Facturar.Show();
            this.Hide();
            conexion.cn.Close();
        }

        private void NewCliente_Load(object sender, EventArgs e)
        {
            //llena el checkBox de denero
            try
            {
                this.cbGenero.DataSource = conexion.LllenarComboBox("Generos");
                this.cbGenero.DisplayMember = "descripcion";
                this.cbGenero.ValueMember = "id_genero";
                this.cbGenero.Text = "";
                this.cbGenero.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }

            /*este llena el combo box de Nacionalidad para que solo selecionesn uno*/
            try
            {
                this.cbLugarNacimineto.DataSource = conexion.LllenarComboBox("Municipios");
                this.cbLugarNacimineto.DisplayMember = "descripcion";
                this.cbLugarNacimineto.ValueMember = "idMuncipio";
                this.cbLugarNacimineto.Text = "";
                this.cbLugarNacimineto.Refresh();
            }
            catch (Exception Error)
            {
                MessageBox.Show(Error.Message);
            }

            /*este llena el combo box de Profesion para que solo selecionesn uno*/
            try
            {
                this.cbprofesion.DataSource = conexion.LllenarComboBox("Profesiones");
                this.cbprofesion.DisplayMember = "descripcion";
                this.cbprofesion.ValueMember = "idProfesion";
                this.cbprofesion.Text = "";
                this.cbprofesion.Refresh();
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
                if (string.IsNullOrEmpty(txP_Nombre.Text) == false)
                {
                    SqlCommand cmd = new SqlCommand("RegistrarNuevoCliente", conexion.cn)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    conexion.cn.Open();
                    cmd.Parameters.Add("@P_nombre", System.Data.SqlDbType.VarChar).Value = this.txP_Nombre.Text.Trim();
                    cmd.Parameters.Add("@S_nombre", System.Data.SqlDbType.VarChar).Value = this.txS_Nombre.Text.Trim();
                    cmd.Parameters.Add("@P_apellido", System.Data.SqlDbType.VarChar).Value = this.txP_Apellido.Text.Trim();
                    cmd.Parameters.Add("@S_apellido", System.Data.SqlDbType.VarChar).Value = this.txS_Apellido.Text.Trim();
                    cmd.Parameters.Add("@id_genero", System.Data.SqlDbType.Int).Value = this.cbGenero.SelectedValue;
                    cmd.Parameters.Add("@id_profesion", System.Data.SqlDbType.Int).Value = this.cbprofesion.SelectedValue;
                    cmd.Parameters.Add("@correo", System.Data.SqlDbType.VarChar).Value = this.Correo.Text.Trim();
                    cmd.Parameters.Add("@fecha_nacimiento", System.Data.SqlDbType.Date).Value = this.monthCalendar1.SelectionRange.Start.ToShortDateString();
                    cmd.Parameters.Add("@id_lugarNacimiento", System.Data.SqlDbType.Int).Value = this.cbLugarNacimineto.SelectedValue;
                    cmd.Parameters.Add("@Tipo_Mayoritario", System.Data.SqlDbType.Bit).Value = this.Tipo_Mayoritario.Checked;

                    int result = cmd.ExecuteNonQuery();

                    if (result == 1)
                    {
                        MessageBox.Show("Ingresado con exito.");
                    }
                    else
                    {
                        MessageBox.Show("Hubo un error en el guardado de datos.");
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

        private void Cancelar_Click(object sender, EventArgs e)
        {
            //this.txP_Apellido = this.txS_Apellido = this.txP_Nombre = this.txS_Nombre = this.Correo = "";
            //this.cbGenero = this.cbLugarNacimineto = this.cbprofesion = 0;
            this.Tipo_Mayoritario.Checked = false;

        }

        private void Tipo_Mayoritario_CheckedChanged(object sender, EventArgs e)
        {
            if(this.Tipo_Mayoritario.Checked == true)
            {
                Mayoritario =  true;
            }
            else
            {
                Mayoritario = false;
            }
        }
    }
}
