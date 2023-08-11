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
            Clases.ConexionSQLServer objetoConexion = new Clases.ConexionSQLServer();
            objetoConexion.establecerConexion();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}