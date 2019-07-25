using ClassLibrary1.DSFacturacionTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public class CADProducto
    {
        private static ProductoTableAdapter adapter = new ProductoTableAdapter();

        public static DSFacturacion.ProductoDataTable GetProducto(string IDProducto)
        {
            return adapter.GetProducto(IDProducto);
        }
        public static DSFacturacion.ProductoDataTable GetProductos()
        {
            return adapter.GetData();
        }

        public static bool ExisteProducto(String IDProducto)
        {
            return adapter.ExisteProducto(IDProducto) == 1;
        }

        public static string NuevoProducto(string IDProducto, string Descripcion, decimal Precio, int Stock, string Notas)
        {
            int aux = adapter.Insert(IDProducto, Descripcion, Precio, Stock, Notas);
            if (aux == 0) return "no se pudo insertar el registro ";
            else return "registro insertado correctamente";
        }

        public static string ActualizarProducto(string Descripcion, decimal Precio, int Stock, string Notas, string IDProducto)
        {
            int aux = adapter.ActualizarProducto(Descripcion, Precio, Stock, Notas, IDProducto);
            if (aux == 0) return "no se pudo Actualizar el registro ";
            else return "registro actualizado correctamente";
        }

        public static string BorrarProducto(string IDProducto)
        {
            int aux = adapter.BorrarProducto(IDProducto);
            if (aux == 0) return "no se pudo Borrar el registro ";
            else return "registro borrado correctamente";
        }
        public static decimal GetPrecio(string IDProducto)
        {
            return Convert.ToDecimal(adapter.GetPrecio(IDProducto));
        }
    }
}
