using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaVentaOro
{
    public partial class editors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFecha.Text = "" + DateTime.Now;
            ActualizaTotales();
        }

        private void ActualizaTotales()
        {
            txtTotalCantidad.Text = "" + ClassLibrary1.CADDetalleFacturaTmp.GetTotalCantidad();
            txtTotalValor.Text = "" + ClassLibrary1.CADDetalleFacturaTmp.GetTotalValor();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //Validamos Datos
            if (txtCantidad.Text == "")
            {
                lblMensaje.Text = "Debe ingresar una cantidad";
                txtCantidad.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtCantidad.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en cantidad";
                txtCantidad.Focus();
                return;
            }
            int cantidad = Convert.ToInt32(txtCantidad.Text);
            if (cantidad <= 0)
            {
                lblMensaje.Text = "Debe ingresar un valor mayor a cero (0) en cantidad ";
                txtCantidad.Focus();
                return;
            }
            //Buscamos el precio del prod
            decimal precio = ClassLibrary1.CADProducto.GetPrecio(cmbProducto.SelectedValue.ToString());
            //Agregamos el Mensaje
            lblMensaje.Text = ClassLibrary1.CADDetalleFacturaTmp.AgregarDetalle(cmbProducto.SelectedValue.ToString(), cmbProducto.SelectedItem.ToString(), precio, cantidad);
            GVDetalle.DataBind();
            ActualizaTotales();

            //Inicializamos Cantidad
            txtCantidad.Text = "";
            cmbProducto.Focus();

        }

        protected void btnBorrarTodo_Click(object sender, EventArgs e)
        {
            ClassLibrary1.CADDetalleFacturaTmp.BorrarTodo();
            GVDetalle.DataBind();
            ActualizaTotales();
            cmbProducto.Focus();
        }

        protected void btnGrabarFactura_Click(object sender, EventArgs e)
        {
            //Validamos que haya detalles
            if (txtTotalCantidad.Text == "" || txtTotalCantidad.Text == "0")
            {
                lblMensaje.Text = "Debe ingresar detalle para poder grabar la Factura";
                cmbProducto.Focus();
                return;
            }
            //Obtener el numero de Factura  
            int NumFac = ClassLibrary1.CADFactura.SiguienteFactura();

            //Grabamos encabezado de la Factura
            ClassLibrary1.CADFactura.NuevaFactura(NumFac, cmbCliente.SelectedValue.ToString(), DateTime.Now);

            //Grabamos el detalle de la Factura
            ClassLibrary1.DSFacturacion.DetalleFacturaTmpDataTable miDetalle = ClassLibrary1.CADDetalleFacturaTmp.GetDetalle();
            foreach (DataRow row in miDetalle.Rows)
            {
                ClassLibrary1.CADDetalleFactura.NuevoDetalle(NumFac, row["IDProducto"].ToString(), row["Descripcion"].ToString(),
                    Convert.ToInt32(row["Precio"]), Convert.ToInt32(row["Cantidad"]));
            }

            //Borramos la tabla de DetalleFacturaTmp
            ClassLibrary1.CADDetalleFacturaTmp.BorrarTodo();
            GVDetalle.DataBind();
            ActualizaTotales();
            cmbProducto.Focus();

            //Colocamos Mensaje
            lblMensaje.Text = "Factura numero" + NumFac + "Grabamos con Exito";
        }
    }
}