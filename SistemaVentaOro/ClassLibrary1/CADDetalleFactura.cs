using ClassLibrary1.DSFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class CADDetalleFactura
    {
        private static DetalleFacturaTableAdapter adapter = new DetalleFacturaTableAdapter();

        public static void NuevoDetalle(int IDFactura, string IDProducto, string Descripcion, decimal Precio, int Cantidad)
        {
            adapter.Insert(IDFactura, IDProducto, Descripcion, Precio, Cantidad);
        }
    }
}
