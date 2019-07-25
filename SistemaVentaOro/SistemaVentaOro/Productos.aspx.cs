using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaVentaOro
{
    public partial class advanced : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            if (txtIDProducto.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Producto";
                txtIDProducto.Focus();
                return;
            }

            if (!ClassLibrary1.CADProducto.ExisteProducto(txtIDProducto.Text))
            {
                lblMensaje.Text = "Producto no existe";
                txtIDProducto.Focus();
                return;
            }

            ClassLibrary1.DSFacturacion.ProductoDataTable miProducto = ClassLibrary1.CADProducto.GetProducto(txtIDProducto.Text);
            foreach (DataRow row in miProducto.Rows)
            {
                txtDescripcion.Text = row["Descripcion"].ToString();
                txtPrecio.Text = row["Precio"].ToString();
                txtStock.Text = row["Stock"].ToString();
                txtNotas.Text = row["Notas"].ToString();
            }
            lblMensaje.Text = "Producto Consultada";
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            if (txtIDProducto.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Producto";
                txtIDProducto.Focus();
                return;
            }

            if (ClassLibrary1.CADProducto.ExisteProducto(txtIDProducto.Text))
            {
                lblMensaje.Text = "Producto ya existe";
                txtIDProducto.Focus();
                return;
            }
            if (txtDescripcion.Text == "")
            {
                lblMensaje.Text = "Debe ingresar una Descripcion para el producto";
                txtDescripcion.Focus();
                return;
            }
            if (txtPrecio.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un precio para el Producto";
                txtPrecio.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtPrecio.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Precio del Producto";
                txtPrecio.Focus();
                return;
            }
            if (Convert.ToDouble(txtPrecio.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un Precio mayor que (0)";
                txtPrecio.Focus();
                return;
            }
            if (txtStock.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un stock para el Producto";
                txtStock.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtStock.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Stock del Producto";
                txtStock.Focus();
                return;
            }
            if (Convert.ToDouble(txtStock.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un stock positivo";
                txtStock.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADProducto.NuevoProducto(txtIDProducto.Text, txtDescripcion.Text,
                Convert.ToDecimal(txtPrecio.Text), Convert.ToInt32(txtStock.Text), txtNotas.Text);

            //Para actualizar la cuadricula de clientes
            GVProductos.DataBind();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtIDProducto.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Producto";
                txtIDProducto.Focus();
                return;
            }

            if (!ClassLibrary1.CADProducto.ExisteProducto(txtIDProducto.Text))
            {
                lblMensaje.Text = "Producto no existe";
                txtIDProducto.Focus();
                return;
            }
            if (txtDescripcion.Text == "")
            {
                lblMensaje.Text = "Debe ingresar una Descripcion para el producto";
                txtDescripcion.Focus();
                return;
            }
            if (txtPrecio.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un precio para el Producto";
                txtPrecio.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtPrecio.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Precio del Producto";
                txtPrecio.Focus();
                return;
            }
            if (Convert.ToDouble(txtPrecio.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un Precio mayor que (0)";
                txtPrecio.Focus();
                return;
            }
            if (txtStock.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un stock para el Producto";
                txtStock.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtStock.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Stock del Producto";
                txtStock.Focus();
                return;
            }
            if (Convert.ToDouble(txtStock.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un stock positivo";
                txtStock.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADProducto.ActualizarProducto(txtDescripcion.Text,
                Convert.ToDecimal(txtPrecio.Text), Convert.ToInt32(txtStock.Text), txtNotas.Text, txtIDProducto.Text);

            //Para actualizar la cuadricula de clientes
            GVProductos.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtIDProducto.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Producto";
                txtIDProducto.Focus();
                return;
            }

            if (!ClassLibrary1.CADProducto.ExisteProducto(txtIDProducto.Text))
            {
                lblMensaje.Text = "Producto no existe";
                txtIDProducto.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADProducto.BorrarProducto(txtIDProducto.Text);

            //LimpiarForm de cliente
            txtIDProducto.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            txtNotas.Text = "";


            //Para actualizar la cuadricula de clientes
            GVProductos.DataBind();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtIDProducto.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            txtNotas.Text = "";
            lblMensaje.Text = "";
            txtIDProducto.Focus();
        }
    }
}