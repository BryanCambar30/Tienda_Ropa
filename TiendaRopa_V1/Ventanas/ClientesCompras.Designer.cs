namespace TiendaRopa_V1.Ventanas
{
    partial class ClientesCompras
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
            this.cbCliente = new System.Windows.Forms.ComboBox();
            this.Buscar = new System.Windows.Forms.Button();
            this.Cancelar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.ComprasClientes = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.ComprasClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // cbCliente
            // 
            this.cbCliente.FormattingEnabled = true;
            this.cbCliente.Location = new System.Drawing.Point(183, 185);
            this.cbCliente.Name = "cbCliente";
            this.cbCliente.Size = new System.Drawing.Size(182, 33);
            this.cbCliente.TabIndex = 0;
            // 
            // Buscar
            // 
            this.Buscar.Location = new System.Drawing.Point(795, 186);
            this.Buscar.Name = "Buscar";
            this.Buscar.Size = new System.Drawing.Size(112, 34);
            this.Buscar.TabIndex = 1;
            this.Buscar.Text = "Buscar";
            this.Buscar.UseVisualStyleBackColor = true;
            this.Buscar.Click += new System.EventHandler(this.Buscar_Click);
            // 
            // Cancelar
            // 
            this.Cancelar.Location = new System.Drawing.Point(964, 186);
            this.Cancelar.Name = "Cancelar";
            this.Cancelar.Size = new System.Drawing.Size(112, 34);
            this.Cancelar.TabIndex = 2;
            this.Cancelar.Text = "Cancelar";
            this.Cancelar.UseVisualStyleBackColor = true;
            this.Cancelar.Click += new System.EventHandler(this.Cancelar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(36, 180);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(103, 38);
            this.label1.TabIndex = 3;
            this.label1.Text = "Cliente";
            // 
            // ComprasClientes
            // 
            this.ComprasClientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ComprasClientes.Location = new System.Drawing.Point(36, 257);
            this.ComprasClientes.Name = "ComprasClientes";
            this.ComprasClientes.RowHeadersWidth = 62;
            this.ComprasClientes.RowTemplate.Height = 33;
            this.ComprasClientes.Size = new System.Drawing.Size(1040, 427);
            this.ComprasClientes.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(417, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(296, 48);
            this.label2.TabIndex = 5;
            this.label2.Text = "Compras Clientes";
            // 
            // ClientesCompras
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1108, 718);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ComprasClientes);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Cancelar);
            this.Controls.Add(this.Buscar);
            this.Controls.Add(this.cbCliente);
            this.Name = "ClientesCompras";
            this.Text = "ClientesCompras";
            this.Load += new System.EventHandler(this.ClientesCompras_Load);
            ((System.ComponentModel.ISupportInitialize)(this.ComprasClientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ComboBox cbCliente;
        private Button Buscar;
        private Button Cancelar;
        private Label label1;
        private DataGridView ComprasClientes;
        private Label label2;
    }
}