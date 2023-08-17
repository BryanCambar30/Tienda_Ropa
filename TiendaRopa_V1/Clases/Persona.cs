using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaRopa_V1.Clases
{
    internal class Persona
    {
        int lugarNacimiento, id_genero;
        string P_nombre, S_nombre, P_apellido, S_apellido, correo;
        DateOnly fecha_nacimineto;

        public int LugarNacimiento { get => lugarNacimiento; set => lugarNacimiento = value; }
        public int Id_genero { get => id_genero; set => id_genero = value; }
        public string P_nombre1 { get => P_nombre; set => P_nombre = value; }
        public string S_nombre1 { get => S_nombre; set => S_nombre = value; }
        public string P_apellido1 { get => P_apellido; set => P_apellido = value; }
        public string S_apellido1 { get => S_apellido; set => S_apellido = value; }
        public string Correo { get => correo; set => correo = value; }
        public DateOnly Fecha_nacimineto { get => fecha_nacimineto; set => fecha_nacimineto = value; }
    }
}
