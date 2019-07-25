using ClassLibrary1.DSFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class CADCliente
    {
        private static ClienteTableAdapter adapter = new ClienteTableAdapter();

        public static DSFacturacion.ClienteDataTable GetCliente(string IDCliente)
        {
            return adapter.GetCliente(IDCliente);
        }
        public static DSFacturacion.ClienteDataTable GetClientes()
        {
            return adapter.GetData();
        }


        public static bool ExisteCliente(String IDCliente)
        {
            return adapter.ExisteCliente(IDCliente) == 1;
        }

        public static string NuevoCliente(string IDCliente, string Nombres, string Apellidos, string Direccion, string Telefono, string Correo, DateTime FechaNacimiento, int Cupo)
        {
            int aux = adapter.Insert(IDCliente, Nombres, Apellidos, Direccion, Telefono, Correo, FechaNacimiento, Cupo);
            if (aux == 0) return "no se pudo insertar el registro ";
            else return "registro insertado correctamente";
        }

        public static string ActualizarCliente(string Nombres, string Apellidos, string Direccion, string Telefono,
            string Correo, string FechaNacimiento, int Cupo, string IDCliente)
        {
            int aux = adapter.ActualizarCliente(Nombres, Apellidos, Direccion, Telefono, Correo,
                        FechaNacimiento, Cupo, IDCliente);
            if (aux == 0) return "no se pudo Actualizar el registro ";
            else return "registro actualizado correctamente";
        }

        public static string BorrarCliente(string IDCliente)
        {
            int aux = adapter.BorrarCliente(IDCliente);
            if (aux == 0) return "no se pudo Borrar el registro ";
            else return "registro borrado correctamente";
        }
    }
}