using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaRopa_V1.Clases
{
    internal class Empleado
    {
        int id_empleado, id_puesto, id_profesion, id_tienda, telefono;
        TimeSpan horaEntrada = new TimeSpan();
        TimeSpan horaSalida = new TimeSpan();
        TimeSpan horasTrabajadas = new TimeSpan();
        Decimal Salario;

        public int Id_empleado { get => id_empleado; set => id_empleado = value; }
        public int Id_puesto { get => id_puesto; set => id_puesto = value; }
        public int Id_profesion { get => id_profesion; set => id_profesion = value; }
        public int Id_tienda { get => id_tienda; set => id_tienda = value; }
        public int Telefono { get => telefono; set => telefono = value; }
        public TimeSpan HoraEntrada { get => horaEntrada; set => horaEntrada = value; }
        public TimeSpan HoraSalida { get => horaSalida; set => horaSalida = value; }
        public TimeSpan HorasTrabajadas { get => horasTrabajadas; set => horasTrabajadas = value; }
        public decimal Salario1 { get => Salario; set => Salario = value; }
    }
}
/*id_empleado INTEGER PRIMARY KEY,
id_persona INTEGER NOT NULL,
id_puesto INTEGER NOT NULL,
id_profesion INTEGER NOT NULL,
id_tienda INTEGER NOT NULL,
telefono INTEGER NOT NULL,
horaEntrada TIME NOT NULL, --HH:MM:SS
horaSalida TIME NOT NULL,
horasTrabajas TIME NOT NULL, -- analizar el tipo de dato esta bien 
Salario DECIMAL(10, 2),*/