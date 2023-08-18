namespace TiendaRopa_V1.Ventanas
{
    partial class EmpleadoVentas
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
            this.VentasEmpleado = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.Buscar = new System.Windows.Forms.Button();
            this.Cancelar = new System.Windows.Forms.Button();
            this.cbEmpleado = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.VentasEmpleado)).BeginInit();
            this.SuspendLayout();
            // 
            // VentasEmpleado
            // 
            this.VentasEmpleado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.VentasEmpleado.Location = new System.Drawing.Point(54, 155);
            this.VentasEmpleado.Name = "VentasEmpleado";
            this.VentasEmpleado.RowHeadersWidth = 62;
            this.VentasEmpleado.RowTemplate.Height = 33;
            this.VentasEmpleado.Size = new System.Drawing.Size(1096, 666);
            this.VentasEmpleado.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(54, 65);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(215, 32);
            this.label1.TabIndex = 2;
            this.label1.Text = "Numero Empleado";
            // 
            // Buscar
            // 
            this.Buscar.Location = new System.Drawing.Point(895, 68);
            this.Buscar.Name = "Buscar";
            this.Buscar.Size = new System.Drawing.Size(112, 34);
            this.Buscar.TabIndex = 3;
            this.Buscar.Text = "Buscar";
            this.Buscar.UseVisualStyleBackColor = true;
            this.Buscar.Click += new System.EventHandler(this.Buscar_Click);
            // 
            // Cancelar
            // 
            this.Cancelar.Location = new System.Drawing.Point(1041, 68);
            this.Cancelar.Name = "Cancelar";
            this.Cancelar.Size = new System.Drawing.Size(112, 34);
            this.Cancelar.TabIndex = 4;
            this.Cancelar.Text = "Cancelar";
            this.Cancelar.UseVisualStyleBackColor = true;
            this.Cancelar.Click += new System.EventHandler(this.Cancelar_Click);
            // 
            // cbEmpleado
            // 
            this.cbEmpleado.FormattingEnabled = true;
            this.cbEmpleado.Location = new System.Drawing.Point(275, 68);
            this.cbEmpleado.Name = "cbEmpleado";
            this.cbEmpleado.Size = new System.Drawing.Size(182, 33);
            this.cbEmpleado.TabIndex = 5;
            // 
            // EmpleadoVentas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1256, 895);
            this.Controls.Add(this.cbEmpleado);
            this.Controls.Add(this.Cancelar);
            this.Controls.Add(this.Buscar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.VentasEmpleado);
            this.Name = "EmpleadoVentas";
            this.Text = "EmpleadoVentas";
            this.Load += new System.EventHandler(this.EmpleadoVentas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.VentasEmpleado)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DataGridView VentasEmpleado;
        private Label label1;
        private Button Buscar;
        private Button Cancelar;
        private ComboBox cbEmpleado;
    }
}