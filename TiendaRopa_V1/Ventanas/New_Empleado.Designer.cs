namespace TiendaRopa_V1.Ventanas
{
    partial class New_Empleado
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txP_Nombre = new System.Windows.Forms.TextBox();
            this.txP_Apellido = new System.Windows.Forms.TextBox();
            this.Nombre = new System.Windows.Forms.Label();
            this.Apellido = new System.Windows.Forms.Label();
            this.Puesto = new System.Windows.Forms.Label();
            this.Profesion = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.Telefono = new System.Windows.Forms.Label();
            this.txTelefono = new System.Windows.Forms.TextBox();
            this.Calendario = new System.Windows.Forms.Label();
            this.monthCalendar1 = new System.Windows.Forms.MonthCalendar();
            this.id_tienda = new System.Windows.Forms.Label();
            this.s_Nombre = new System.Windows.Forms.Label();
            this.txS_Nombre = new System.Windows.Forms.TextBox();
            this.s_Apellido = new System.Windows.Forms.Label();
            this.rxS_Apellido = new System.Windows.Forms.TextBox();
            this.Salario = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.txSalario = new System.Windows.Forms.TextBox();
            this.Genero = new System.Windows.Forms.Label();
            this.Correo = new System.Windows.Forms.Label();
            this.txCorreo = new System.Windows.Forms.TextBox();
            this.Nacionalidad = new System.Windows.Forms.Label();
            this.Hora_Entrada = new System.Windows.Forms.Label();
            this.txHora_Entrada = new System.Windows.Forms.TextBox();
            this.Hora_Salida = new System.Windows.Forms.Label();
            this.txHora_Salida = new System.Windows.Forms.TextBox();
            this.cbGenero = new System.Windows.Forms.ComboBox();
            this.cbPuesto = new System.Windows.Forms.ComboBox();
            this.cbProfesion = new System.Windows.Forms.ComboBox();
            this.cbSucursal = new System.Windows.Forms.ComboBox();
            this.cbNacionalidad = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // txP_Nombre
            // 
            this.txP_Nombre.Location = new System.Drawing.Point(248, 35);
            this.txP_Nombre.Name = "txP_Nombre";
            this.txP_Nombre.Size = new System.Drawing.Size(380, 31);
            this.txP_Nombre.TabIndex = 0;
            // 
            // txP_Apellido
            // 
            this.txP_Apellido.Location = new System.Drawing.Point(248, 130);
            this.txP_Apellido.Name = "txP_Apellido";
            this.txP_Apellido.Size = new System.Drawing.Size(380, 31);
            this.txP_Apellido.TabIndex = 1;
            // 
            // Nombre
            // 
            this.Nombre.AutoSize = true;
            this.Nombre.Location = new System.Drawing.Point(74, 38);
            this.Nombre.Name = "Nombre";
            this.Nombre.Size = new System.Drawing.Size(134, 25);
            this.Nombre.TabIndex = 4;
            this.Nombre.Text = "Primer Nombre";
            // 
            // Apellido
            // 
            this.Apellido.AutoSize = true;
            this.Apellido.Location = new System.Drawing.Point(74, 133);
            this.Apellido.Name = "Apellido";
            this.Apellido.Size = new System.Drawing.Size(134, 25);
            this.Apellido.TabIndex = 5;
            this.Apellido.Text = "Primer Apellido";
            // 
            // Puesto
            // 
            this.Puesto.AutoSize = true;
            this.Puesto.Location = new System.Drawing.Point(142, 235);
            this.Puesto.Name = "Puesto";
            this.Puesto.Size = new System.Drawing.Size(66, 25);
            this.Puesto.TabIndex = 6;
            this.Puesto.Text = "Puesto";
            // 
            // Profesion
            // 
            this.Profesion.AutoSize = true;
            this.Profesion.Location = new System.Drawing.Point(121, 281);
            this.Profesion.Name = "Profesion";
            this.Profesion.Size = new System.Drawing.Size(87, 25);
            this.Profesion.TabIndex = 7;
            this.Profesion.Text = "Profesion";
            this.Profesion.Click += new System.EventHandler(this.Profesion_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(703, 556);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(112, 34);
            this.button1.TabIndex = 8;
            this.button1.Text = "Agregar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(863, 556);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(112, 34);
            this.button2.TabIndex = 9;
            this.button2.Text = "Cancelar";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // Telefono
            // 
            this.Telefono.AutoSize = true;
            this.Telefono.Location = new System.Drawing.Point(129, 330);
            this.Telefono.Name = "Telefono";
            this.Telefono.Size = new System.Drawing.Size(79, 25);
            this.Telefono.TabIndex = 10;
            this.Telefono.Text = "Telefono";
            // 
            // txTelefono
            // 
            this.txTelefono.Location = new System.Drawing.Point(248, 324);
            this.txTelefono.Name = "txTelefono";
            this.txTelefono.Size = new System.Drawing.Size(380, 31);
            this.txTelefono.TabIndex = 11;
            this.txTelefono.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox5_KeyPress);
            // 
            // Calendario
            // 
            this.Calendario.AutoSize = true;
            this.Calendario.Location = new System.Drawing.Point(771, 38);
            this.Calendario.Name = "Calendario";
            this.Calendario.Size = new System.Drawing.Size(152, 25);
            this.Calendario.TabIndex = 12;
            this.Calendario.Text = "Fecha Nacimiento";
            // 
            // monthCalendar1
            // 
            this.monthCalendar1.Location = new System.Drawing.Point(669, 72);
            this.monthCalendar1.Name = "monthCalendar1";
            this.monthCalendar1.TabIndex = 13;
            // 
            // id_tienda
            // 
            this.id_tienda.AutoSize = true;
            this.id_tienda.Location = new System.Drawing.Point(138, 380);
            this.id_tienda.Name = "id_tienda";
            this.id_tienda.Size = new System.Drawing.Size(77, 25);
            this.id_tienda.TabIndex = 14;
            this.id_tienda.Text = "Sucursal";
            // 
            // s_Nombre
            // 
            this.s_Nombre.AutoSize = true;
            this.s_Nombre.Location = new System.Drawing.Point(53, 89);
            this.s_Nombre.Name = "s_Nombre";
            this.s_Nombre.Size = new System.Drawing.Size(155, 25);
            this.s_Nombre.TabIndex = 16;
            this.s_Nombre.Text = "Segundo Nombre";
            // 
            // txS_Nombre
            // 
            this.txS_Nombre.Location = new System.Drawing.Point(248, 83);
            this.txS_Nombre.Name = "txS_Nombre";
            this.txS_Nombre.Size = new System.Drawing.Size(380, 31);
            this.txS_Nombre.TabIndex = 17;
            // 
            // s_Apellido
            // 
            this.s_Apellido.AutoSize = true;
            this.s_Apellido.Location = new System.Drawing.Point(60, 187);
            this.s_Apellido.Name = "s_Apellido";
            this.s_Apellido.Size = new System.Drawing.Size(155, 25);
            this.s_Apellido.TabIndex = 18;
            this.s_Apellido.Text = "Segundo Apellido";
            // 
            // rxS_Apellido
            // 
            this.rxS_Apellido.Location = new System.Drawing.Point(248, 184);
            this.rxS_Apellido.Name = "rxS_Apellido";
            this.rxS_Apellido.Size = new System.Drawing.Size(380, 31);
            this.rxS_Apellido.TabIndex = 19;
            // 
            // Salario
            // 
            this.Salario.AutoSize = true;
            this.Salario.Location = new System.Drawing.Point(139, 441);
            this.Salario.Name = "Salario";
            this.Salario.Size = new System.Drawing.Size(65, 25);
            this.Salario.TabIndex = 20;
            this.Salario.Text = "Salario";
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1143, 24);
            this.menuStrip1.TabIndex = 21;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // txSalario
            // 
            this.txSalario.Location = new System.Drawing.Point(249, 438);
            this.txSalario.Name = "txSalario";
            this.txSalario.Size = new System.Drawing.Size(380, 31);
            this.txSalario.TabIndex = 22;
            this.txSalario.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBox9_KeyPress);
            // 
            // Genero
            // 
            this.Genero.AutoSize = true;
            this.Genero.Location = new System.Drawing.Point(146, 503);
            this.Genero.Name = "Genero";
            this.Genero.Size = new System.Drawing.Size(69, 25);
            this.Genero.TabIndex = 23;
            this.Genero.Text = "Genero";
            // 
            // Correo
            // 
            this.Correo.AutoSize = true;
            this.Correo.Location = new System.Drawing.Point(154, 556);
            this.Correo.Name = "Correo";
            this.Correo.Size = new System.Drawing.Size(61, 25);
            this.Correo.TabIndex = 25;
            this.Correo.Text = "e-mail";
            // 
            // txCorreo
            // 
            this.txCorreo.Location = new System.Drawing.Point(249, 553);
            this.txCorreo.Name = "txCorreo";
            this.txCorreo.Size = new System.Drawing.Size(380, 31);
            this.txCorreo.TabIndex = 26;
            // 
            // Nacionalidad
            // 
            this.Nacionalidad.AutoSize = true;
            this.Nacionalidad.Location = new System.Drawing.Point(93, 619);
            this.Nacionalidad.Name = "Nacionalidad";
            this.Nacionalidad.Size = new System.Drawing.Size(115, 25);
            this.Nacionalidad.TabIndex = 27;
            this.Nacionalidad.Text = "Nacionalidad";
            // 
            // Hora_Entrada
            // 
            this.Hora_Entrada.AutoSize = true;
            this.Hora_Entrada.Location = new System.Drawing.Point(669, 380);
            this.Hora_Entrada.Name = "Hora_Entrada";
            this.Hora_Entrada.Size = new System.Drawing.Size(116, 25);
            this.Hora_Entrada.TabIndex = 29;
            this.Hora_Entrada.Text = "Hora Entrada";
            // 
            // txHora_Entrada
            // 
            this.txHora_Entrada.Location = new System.Drawing.Point(812, 374);
            this.txHora_Entrada.Name = "txHora_Entrada";
            this.txHora_Entrada.Size = new System.Drawing.Size(225, 31);
            this.txHora_Entrada.TabIndex = 30;
            this.txHora_Entrada.TextChanged += new System.EventHandler(this.txHora_Entrada_TextChanged);
            // 
            // Hora_Salida
            // 
            this.Hora_Salida.AutoSize = true;
            this.Hora_Salida.Location = new System.Drawing.Point(669, 441);
            this.Hora_Salida.Name = "Hora_Salida";
            this.Hora_Salida.Size = new System.Drawing.Size(103, 25);
            this.Hora_Salida.TabIndex = 31;
            this.Hora_Salida.Text = "Hora Salida";
            // 
            // txHora_Salida
            // 
            this.txHora_Salida.Location = new System.Drawing.Point(812, 438);
            this.txHora_Salida.Name = "txHora_Salida";
            this.txHora_Salida.Size = new System.Drawing.Size(225, 31);
            this.txHora_Salida.TabIndex = 32;
            this.txHora_Salida.TextChanged += new System.EventHandler(this.txHora_Salida_TextChanged);
            // 
            // cbGenero
            // 
            this.cbGenero.FormattingEnabled = true;
            this.cbGenero.Location = new System.Drawing.Point(249, 500);
            this.cbGenero.Name = "cbGenero";
            this.cbGenero.Size = new System.Drawing.Size(380, 33);
            this.cbGenero.TabIndex = 33;
            this.cbGenero.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // cbPuesto
            // 
            this.cbPuesto.FormattingEnabled = true;
            this.cbPuesto.Location = new System.Drawing.Point(248, 232);
            this.cbPuesto.Name = "cbPuesto";
            this.cbPuesto.Size = new System.Drawing.Size(380, 33);
            this.cbPuesto.TabIndex = 34;
            // 
            // cbProfesion
            // 
            this.cbProfesion.FormattingEnabled = true;
            this.cbProfesion.Location = new System.Drawing.Point(248, 278);
            this.cbProfesion.Name = "cbProfesion";
            this.cbProfesion.Size = new System.Drawing.Size(380, 33);
            this.cbProfesion.TabIndex = 35;
            this.cbProfesion.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.comboBox3_KeyPress);
            // 
            // cbSucursal
            // 
            this.cbSucursal.FormattingEnabled = true;
            this.cbSucursal.Location = new System.Drawing.Point(249, 372);
            this.cbSucursal.Name = "cbSucursal";
            this.cbSucursal.Size = new System.Drawing.Size(380, 33);
            this.cbSucursal.TabIndex = 36;
            // 
            // cbNacionalidad
            // 
            this.cbNacionalidad.FormattingEnabled = true;
            this.cbNacionalidad.Location = new System.Drawing.Point(248, 616);
            this.cbNacionalidad.Name = "cbNacionalidad";
            this.cbNacionalidad.Size = new System.Drawing.Size(380, 33);
            this.cbNacionalidad.TabIndex = 37;
            // 
            // New_Empleado
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1143, 750);
            this.Controls.Add(this.cbNacionalidad);
            this.Controls.Add(this.cbSucursal);
            this.Controls.Add(this.cbProfesion);
            this.Controls.Add(this.cbPuesto);
            this.Controls.Add(this.cbGenero);
            this.Controls.Add(this.txHora_Salida);
            this.Controls.Add(this.Hora_Salida);
            this.Controls.Add(this.txHora_Entrada);
            this.Controls.Add(this.Hora_Entrada);
            this.Controls.Add(this.Nacionalidad);
            this.Controls.Add(this.txCorreo);
            this.Controls.Add(this.Correo);
            this.Controls.Add(this.Genero);
            this.Controls.Add(this.txSalario);
            this.Controls.Add(this.Salario);
            this.Controls.Add(this.rxS_Apellido);
            this.Controls.Add(this.s_Apellido);
            this.Controls.Add(this.txS_Nombre);
            this.Controls.Add(this.s_Nombre);
            this.Controls.Add(this.id_tienda);
            this.Controls.Add(this.monthCalendar1);
            this.Controls.Add(this.Calendario);
            this.Controls.Add(this.txTelefono);
            this.Controls.Add(this.Telefono);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.Profesion);
            this.Controls.Add(this.Puesto);
            this.Controls.Add(this.Apellido);
            this.Controls.Add(this.Nombre);
            this.Controls.Add(this.txP_Apellido);
            this.Controls.Add(this.txP_Nombre);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "New_Empleado";
            this.Text = "Nuevo Empleado";
            this.Load += new System.EventHandler(this.New_Empleado_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private TextBox txP_Nombre;
        private TextBox txP_Apellido;
        private Label Nombre;
        private Label Apellido;
        private Label Puesto;
        private Label Profesion;
        private Button button1;
        private Button button2;
        private Label Telefono;
        private TextBox txTelefono;
        private Label Calendario;
        private MonthCalendar monthCalendar1;
        private Label id_tienda;
        private Label s_Nombre;
        private TextBox txS_Nombre;
        private Label s_Apellido;
        private TextBox rxS_Apellido;
        private Label Salario;
        private MenuStrip menuStrip1;
        private TextBox txSalario;
        private Label Genero;
        private Label Correo;
        private TextBox txCorreo;
        private Label Nacionalidad;
        private Label Hora_Entrada;
        private TextBox txHora_Entrada;
        private Label Hora_Salida;
        private TextBox txHora_Salida;
        private ComboBox cbGenero;
        private ComboBox cbPuesto;
        private ComboBox cbProfesion;
        private ComboBox cbSucursal;
        private ComboBox cbNacionalidad;
    }
}