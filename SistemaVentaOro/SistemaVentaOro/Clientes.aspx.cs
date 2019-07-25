using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaVentaOro
{
    public partial class general : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            if (txtIDCliente.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Cliente";
                txtIDCliente.Focus();
                return;
            }

            if (!ClassLibrary1.CADCliente.ExisteCliente(txtIDCliente.Text))
            {
                lblMensaje.Text = "Cliente no existe";
                txtIDCliente.Focus();
                return;
            }

            ClassLibrary1.DSFacturacion.ClienteDataTable miCliente = ClassLibrary1.CADCliente.GetCliente(txtIDCliente.Text);
            foreach (DataRow row in miCliente.Rows)
            {
                txtNombres.Text = row["Nombres"].ToString();
                txtApellidos.Text = row["Apellidos"].ToString();
                txtDireccion.Text = row["Direccion"].ToString();
                txtTelefono.Text = row["Telefono"].ToString();
                txtCorreo.Text = row["Correo"].ToString();
                calFechaNacimiento.Text = row["FechaNacimiento"].ToString();
                txtCupo.Text = row["Cupo"].ToString();
            }
            lblMensaje.Text = "Cliente Consultada";
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            if (txtIDCliente.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Cliente";
                txtIDCliente.Focus();
                return;
            }

            if (ClassLibrary1.CADCliente.ExisteCliente(txtIDCliente.Text))
            {
                lblMensaje.Text = "Cliente ya existe";
                txtIDCliente.Focus();
                return;
            }
            if (txtNombres.Text == "")
            {
                lblMensaje.Text = "Debe ingresar Nombres de Cliente";
                txtNombres.Focus();
                return;
            }
            if (txtApellidos.Text == "")
            {
                lblMensaje.Text = "Debe ingresar Apellidos de Cliente";
                txtApellidos.Focus();
                return;
            }
            if (txtCupo.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un Cupo de Cliente";
                txtCupo.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtCupo.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Cupo de Cliente";
                txtCupo.Focus();
                return;
            }
            if (Convert.ToDouble(txtCupo.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un Cupo mayor que (0)";
                txtCupo.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADCliente.NuevoCliente(txtIDCliente.Text, txtNombres.Text,
            txtApellidos.Text, txtDireccion.Text, txtTelefono.Text, txtCorreo.Text,
            Convert.ToDateTime(calFechaNacimiento.Text), Convert.ToInt32(txtCupo.Text));
            //Para actualizar la cuadricula de clientes
            GVClientes.DataBind();

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtIDCliente.Text = "";
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtDireccion.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtCupo.Text = "";
            lblMensaje.Text = "";
            txtIDCliente.Focus();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtIDCliente.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Cliente";
                txtIDCliente.Focus();
                return;
            }

            if (!ClassLibrary1.CADCliente.ExisteCliente(txtIDCliente.Text))
            {
                lblMensaje.Text = "Cliente no existe";
                txtIDCliente.Focus();
                return;
            }
            if (txtNombres.Text == "")
            {
                lblMensaje.Text = "Debe ingresar Nombres de Cliente";
                txtNombres.Focus();
                return;
            }
            if (txtApellidos.Text == "")
            {
                lblMensaje.Text = "Debe ingresar Apellidos de Cliente";
                txtApellidos.Focus();
                return;
            }
            if (txtCupo.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un Cupo de Cliente";
                txtCupo.Focus();
                return;
            }
            if (!Utilidades.isNumeric(txtCupo.Text))
            {
                lblMensaje.Text = "Debe ingresar un valor numerico en el Cupo de Cliente";
                txtCupo.Focus();
                return;
            }
            if (Convert.ToDouble(txtCupo.Text) <= 0)
            {
                lblMensaje.Text = "Debe ingresar un Cupo mayor que (0)";
                txtCupo.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADCliente.ActualizarCliente(txtNombres.Text,
            txtApellidos.Text, txtDireccion.Text, txtTelefono.Text, txtCorreo.Text,
            calFechaNacimiento.Text, Convert.ToInt32(txtCupo.Text), txtIDCliente.Text);

            //Para actualizar la cuadricula de clientes
            GVClientes.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtIDCliente.Text == "")
            {
                lblMensaje.Text = "Debe ingresar un ID de Cliente";
                txtIDCliente.Focus();
                return;
            }

            if (!ClassLibrary1.CADCliente.ExisteCliente(txtIDCliente.Text))
            {
                lblMensaje.Text = "Cliente no existe";
                txtIDCliente.Focus();
                return;
            }
            lblMensaje.Text = ClassLibrary1.CADCliente.BorrarCliente(txtIDCliente.Text);

            //LimpiarForm de cliente
            txtIDCliente.Text = "";
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtDireccion.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtCupo.Text = "";

            //Para actualizar la cuadricula de clientes
            GVClientes.DataBind();


        }
    }
}