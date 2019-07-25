<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="NuevaFactura.aspx.cs" Inherits="SistemaVentaOro.editors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            border-radius: 0 !important;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: none;
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            border: 1px solid #d2d6de;
            padding: 6px 12px;
            background-color: #fff;
            background-image: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
     <section class="content-header">
          <h1>
            CLIENTES SISTEMA DE FACTURACION
            <small>JRCC</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">Formulario Cliente</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <!-- left column -->
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">Ingresar Datos del Formulario</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                  <div class="box-body">
  
                      <div class="form-group">
                      <label>Fecha</label>
                      <asp:TextBox cssclass="auto-style1" ID="txtFecha" runat="server" Enabled="False" Width="222px"></asp:TextBox>
                      <%--<input type="text" class="form-control" placeholder="Enter ..." disabled="">--%>
                    </div>
                    <div class="form-group">
                        <label for="">Cliente*</label>
                      <asp:DropDownList cssclass="auto-style1" ID="cmbCliente" runat="server" Height="35px" Width="384px" DataSourceID="SqlDataSource2" DataTextField="NombreFul" DataValueField="IDCliente">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Facturacion1ConnectionString1 %>" SelectCommand="SELECT IDCliente, Nombres + ' ' + Apellidos AS NombreFul FROM Cliente"></asp:SqlDataSource>
                    </div>
                      <div class="form-group">
                      <label for="">Producto</label>
                           <asp:DropDownList cssclass="auto-style1" ID="cmbProducto" runat="server" Height="35px" Width="384px" DataSourceID="SqlDataSource3" DataTextField="Descripcion" DataValueField="IDProducto">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Facturacion1ConnectionString1 %>" SelectCommand="SELECT IDProducto, Descripcion FROM Producto"></asp:SqlDataSource>
                    </div>
                      <div class="form-group">
                      <label for="">Cantidad</label>
                          <asp:TextBox cssclass="form-control" ID="txtCantidad" runat="server"></asp:TextBox>
                    </div>
                    
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                      <br />

                      <br />
            &nbsp;<asp:Button cssclass="btn btn-primary" ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                &nbsp;<asp:Button cssclass="btn btn-primary" ID="btnBorrarTodo" runat="server" Text="Borrar Todo" OnClientClick="return confirm('Esta Seguro de borrar todo?')" OnClick="btnBorrarTodo_Click" />
                &nbsp;<asp:Button cssclass="btn btn-primary" ID="btnGrabarFactura" runat="server" Text="Grabar Factura" OnClientClick="return confirm('Esta Seguro de grabar la Factura?')" OnClick="btnGrabarFactura_Click" />
                  </div>
                  </div>
                </div>
                 <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                <asp:GridView ID="GVDetalle" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDLinea" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." Width="616px">
                    <Columns>
                        <asp:CommandField HeaderText="Operaciones" ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="IDLinea" HeaderText="ID Linea" ReadOnly="True" SortExpression="IDLinea" />
                        <asp:BoundField DataField="IDProducto" HeaderText="ID Producto" SortExpression="IDProducto" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Facturacion1ConnectionString1 %>" DeleteCommand="DELETE FROM [DetalleFacturaTmp] WHERE [IDLinea] = @IDLinea" InsertCommand="INSERT INTO [DetalleFacturaTmp] ([IDProducto], [Descripcion], [Precio], [Cantidad]) VALUES (@IDProducto, @Descripcion, @Precio, @Cantidad)" ProviderName="<%$ ConnectionStrings:Facturacion1ConnectionString1.ProviderName %>" SelectCommand="SELECT [IDLinea], [IDProducto], [Descripcion], [Precio], [Cantidad] FROM [DetalleFacturaTmp]" UpdateCommand="UPDATE [DetalleFacturaTmp] SET [IDProducto] = @IDProducto, [Descripcion] = @Descripcion, [Precio] = @Precio, [Cantidad] = @Cantidad WHERE [IDLinea] = @IDLinea">
                  <DeleteParameters>
                      <asp:Parameter Name="IDLinea" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="IDProducto" Type="String" />
                      <asp:Parameter Name="Descripcion" Type="String" />
                      <asp:Parameter Name="Precio" Type="Decimal" />
                      <asp:Parameter Name="Cantidad" Type="Int32" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="IDProducto" Type="String" />
                      <asp:Parameter Name="Descripcion" Type="String" />
                      <asp:Parameter Name="Precio" Type="Decimal" />
                      <asp:Parameter Name="Cantidad" Type="Int32" />
                      <asp:Parameter Name="IDLinea" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
                <br />
              <table class="nav-justified" style="width: 74%">
         <tr>
            <td class="text-right" style="width: 208px">TOTALES&nbsp;</td>
            <td style="width: 180px" class="text-right">
                <asp:TextBox cssclass="form-control" ID="txtTotalValor" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 192px; text-align: right;">
                <asp:TextBox cssclass="form-control" ID="txtTotalCantidad" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
                </div>
        </section><!-- /.content -->
          </form>
</asp:Content>
