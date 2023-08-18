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
    public partial class ProdcutoMasVendido : Form
    {
        public ProdcutoMasVendido()
        {
            InitializeComponent();
        }
        string Mes;
        Clases.ConexionSQLServer conexion = new Clases.ConexionSQLServer();
        private void Buscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtMes.Text) == false)
                {
                    if (int.TryParse(txtMes.Text.Trim(), out int numeroMes))
                    {
                        if (numeroMes >= 1 && numeroMes <= 12)
                        {
                            Mes = txtMes.Text.Trim();
                        }
                        else
                        {
                            MessageBox.Show("Número del mes no existe");
                        }
                    }
                    else
                    {
                        switch (txtMes.Text.Trim().ToLower())
                        {
                            case "enero":
                                Mes = "1";
                                break;
                            case "febrero":
                                Mes = "2";
                                break;
                            case "marzo":
                                Mes = "3";
                                break;
                            case "abril":
                                Mes = "4";
                                break;
                            case "mayo":
                                Mes = "5";
                                break;
                            case "junio":
                                Mes = "6";
                                break;
                            case "Julio":
                                Mes = "7";
                                break;
                            case "agosto":
                                Mes = "8";
                                break;
                            case "septiembre":
                                Mes = "9";
                                break;
                            case "octubre":
                                Mes = "10";
                                break;
                            case "noviembre":
                                Mes = "11";
                                break;
                            case "diciembre":
                                Mes = "12";
                                break;
                            default:
                                MessageBox.Show("el mes que esta ingresando esta mal escrito o no existe");
                                break;
                        }
                    }
                    conexion.cn.Open();
                    SqlCommand cmd = new SqlCommand("ActualizarProductosMasVendidos", conexion.cn)
                    {
                    CommandType = System.Data.CommandType.StoredProcedure
                     };
                    cmd.Parameters.Add("@Mes", System.Data.SqlDbType.Int).Value =Mes;
                    cmd.Parameters.Add("@Anio", System.Data.SqlDbType.Int).Value = this.txtAnio.Text.Trim();
                
                    int result = cmd.ExecuteNonQuery();

                    
                    if (result == 1)
                    {
                        
                    }
                    else
                    {
                        SqlCommand cmdtabla = new SqlCommand("SELECT * FROM Producto_mas_vendido", conexion.cn);
                        SqlDataAdapter sda = new SqlDataAdapter(cmdtabla);
                        DataTable tabla = new DataTable();
                        sda.Fill(tabla);
                        TablaProducto.DataSource = tabla;
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

        private void txtMes_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void ProdcutoMasVendido_Load(object sender, EventArgs e)
        {
            SqlCommand cmdtabla = new SqlCommand("SELECT * FROM Producto_mas_vendido", conexion.cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmdtabla);
            DataTable tabla = new DataTable();
            sda.Fill(tabla);
            TablaProducto.DataSource = tabla;
        }

        private void Cancelar_Click(object sender, EventArgs e)
        {
            //TiendaRopa_V1.Ventanas.Factura Facturar = new TiendaRopa_V1.Ventanas.Factura();
            //Facturar.Show();
            this.Close();
            conexion.cn.Close();
        }
    }
}

