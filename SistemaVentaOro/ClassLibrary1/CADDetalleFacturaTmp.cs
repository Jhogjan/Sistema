using ClassLibrary1.DSFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class CADDetalleFacturaTmp
    {
        private static DetalleFacturaTmpTableAdapter adapter = new DetalleFacturaTmpTableAdapter();

        public static int GetTotalCantidad()
        {
            return Convert.ToInt32(adapter.TotalCantidad());
        }
        public static int GetTotalValor()
        {
            return Convert.ToInt32(adapter.TotalValor());
        }
        public static string AgregarDetalle(string IDProducto, string Descripcion, decimal Precio, int Cantidad)
        {
            int aux = adapter.Insert(IDProducto, Descripcion, Precio, Cantidad);
            if (aux == 0) return "No se pudo agregar el detalle";
            else return "Detalle Agregado correctamente";
        }

        public static void BorrarTodo()
        {
            adapter.BorrarTodo();
        }

        public static ClassLibrary1.DSFacturacion.DetalleFacturaTmpDataTable GetDetalle()
        {
            return adapter.GetData();
        }
    }
}