using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaVentaOro
{
    public class Utilidades
    {
        public static bool isNumeric(string texto)
        {
            double num;
            return double.TryParse(texto.Trim(), out num);
        }
    }
}