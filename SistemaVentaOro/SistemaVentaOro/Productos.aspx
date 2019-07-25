<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="SistemaVentaOro.advanced" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                      <label for="">IDProducto*</label>
                        <asp:TextBox cssclass="form-control" ID="txtIDProducto" runat="server"></asp:TextBox>
<%--                      <input type="password"  id="nombres" placeholder="Password">--%>
                    </div>
                    <div class="form-group">
                      <label for="">Descripcion*</label>
                        <asp:TextBox cssclass="form-control" ID="txtDescripcion" runat="server"></asp:TextBox>
<%--                      <input type="password"  id="nombres" placeholder="Password">--%>
                    </div>
                      <div class="form-group">
                      <label for="">Precio*</label>
                          <asp:TextBox cssclass="form-control" ID="txtPrecio" runat="server"></asp:TextBox>
                     <%-- <input type="password" class="form-control" id="apellidos" placeholder="Password">--%>
                    </div>
                      <div class="form-group">
                      <label for="">Stock</label>
                          <asp:TextBox cssclass="form-control" ID="txtStock" runat="server"></asp:TextBox>
                      <%--<input type="password" class="form-control" id="direccion" placeholder="Password">--%>
                    </div>
                      <div>
                          <asp:TextBox cssclass="textarea" ID="txtNotas" runat="server" TextMode="MultiLine"></asp:TextBox>
                      <%--<textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>--%>
                    </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                      <br />
                      <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                      <br />
                      <asp:Button cssclass="btn btn-primary" ID="btnConsultar"  runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
                    <%--<button type="submit" class="btn btn-primary">Consultar</button>--%>
                       &nbsp;
                      <asp:Button cssclass="btn btn-primary" ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                      <%-- <button type="submit" class="btn btn-primary">Nuevo</button>--%>
                      &nbsp;
                      <asp:Button cssclass="btn btn-primary" ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
                       <%--<button type="submit" class="btn btn-primary">Modificar</button>--%>
                      &nbsp;
                      <asp:Button cssclass="btn btn-primary" ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                       <%--<button type="submit" class="btn btn-primary">Eliminar</button>--%>
                      &nbsp;
                      <asp:Button cssclass="btn btn-primary" ID="btnLimpiar" runat="server" Text="Limpiar" OnClick="btnLimpiar_Click" />
                       <%--<button type="submit" class="btn btn-primary">Limpiar</button>--%>
                  </div>
                  </div>
                </div>
                </div>
                <asp:GridView ID="GVProductos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDProducto" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." Width="525px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="IDProducto" HeaderText="ID Producto" ReadOnly="True" SortExpression="IDProducto" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock">
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Notas" HeaderText="Notas" SortExpression="Notas" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Facturacion1ConnectionString1 %>" DeleteCommand="DELETE FROM [Producto] WHERE [IDProducto] = @IDProducto" InsertCommand="INSERT INTO [Producto] ([IDProducto], [Descripcion], [Precio], [Stock], [Notas]) VALUES (@IDProducto, @Descripcion, @Precio, @Stock, @Notas)" ProviderName="<%$ ConnectionStrings:Facturacion1ConnectionString1.ProviderName %>" SelectCommand="SELECT [IDProducto], [Descripcion], [Precio], [Stock], [Notas] FROM [Producto]" UpdateCommand="UPDATE [Producto] SET [Descripcion] = @Descripcion, [Precio] = @Precio, [Stock] = @Stock, [Notas] = @Notas WHERE [IDProducto] = @IDProducto">
                    <DeleteParameters>
                        <asp:Parameter Name="IDProducto" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDProducto" Type="String" />
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Precio" Type="Decimal" />
                        <asp:Parameter Name="Stock" Type="Int32" />
                        <asp:Parameter Name="Notas" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Descripcion" Type="String" />
                        <asp:Parameter Name="Precio" Type="Decimal" />
                        <asp:Parameter Name="Stock" Type="Int32" />
                        <asp:Parameter Name="Notas" Type="String" />
                        <asp:Parameter Name="IDProducto" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />

        </section><!-- /.content -->

          </form>
</asp:Content>
