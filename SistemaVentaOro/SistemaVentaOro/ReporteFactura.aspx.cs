using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Drawing;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;

namespace SistemaVentaOro
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cadena = ConfigurationManager.ConnectionStrings["Facturacion1ConnectionString1"].ToString();
            SqlConnection conexion = new SqlConnection(cadena);
            ClassLibrary1.DSFacturacion Datos = new ClassLibrary1.DSFacturacion();
            string sql = "SELECT dbo.Factura.Fecha, dbo.Factura.IDCliente, dbo.Cliente.Nombres + ' ' + dbo.Cliente.Apellidos "
                + "AS NombreCompleto, dbo.Factura.IDFactura, dbo.DetalleFactura.IDLinea, dbo.DetalleFactura.IDProducto,"
                + "dbo.DetalleFactura.Descripcion, dbo.DetalleFactura.Precio, dbo.DetalleFactura.Cantidad,"
                + "dbo.DetalleFactura.Precio* dbo.DetalleFactura.Cantidad AS Valor FROM dbo.Cliente INNER JOIN "
                + "dbo.Factura ON dbo.Cliente.IDCliente = dbo.Factura.IDCliente INNER JOIN"
                + "dbo.DetalleFactura ON dbo.Factura.IDFactura = dbo.DetalleFactura.IDFactura";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, conexion);
            adapter.Fill(Datos.ReporteFacturas);
            ReporteFacturas reporte = new ReporteFacturas();
            CrystalReportViewer1.ReportSource = reporte;
        }
    }
}