using ClassLibrary1.DSFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class CADFactura
    {
        private static FacturaTableAdapter adapter = new FacturaTableAdapter();

        public static int SiguienteFactura()
        {
            return Convert.ToInt32(adapter.MaximaFactura()) + 1;
        }

        public static void NuevaFactura(int IDFactura, string IDCliente, DateTime Fecha)
        {
            adapter.Insert(IDFactura, IDCliente, Fecha);

        }

    }
}