<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="SistemaVentaOro.general" %>
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
                      <label for="">IDCliente*</label>
                        <asp:TextBox cssclass="form-control" ID="txtIDCliente" runat="server"></asp:TextBox>
<%--                      <input type="password"  id="nombres" placeholder="Password">--%>
                    </div>
                    <div class="form-group">
                      <label for="">NOMBRES*</label>
                        <asp:TextBox cssclass="form-control" ID="txtNombres" runat="server"></asp:TextBox>
<%--                      <input type="password"  id="nombres" placeholder="Password">--%>
                    </div>
                      <div class="form-group">
                      <label for="">Apellidos*</label>
                          <asp:TextBox cssclass="form-control" ID="txtApellidos" runat="server"></asp:TextBox>
                     <%-- <input type="password" class="form-control" id="apellidos" placeholder="Password">--%>
                    </div>
                      <div class="form-group">
                      <label for="">Direccion</label>
                          <asp:TextBox cssclass="form-control" ID="txtDireccion" runat="server"></asp:TextBox>
                      <%--<input type="password" class="form-control" id="direccion" placeholder="Password">--%>
                    </div>
                       <label for="exampleInputPassword1">Telefono</label>
                        <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-phone"></i>
                      </div>
                            <asp:TextBox cssclass="form-control" ID="txtTelefono" runat="server"></asp:TextBox>
                      <%--<input type="text" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask/>--%>
                    </div><!-- /.input group -->
                 <br />
                       <label for="">Email</label>
                     <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                         <asp:TextBox cssclass="form-control" ID="txtCorreo" runat="server"></asp:TextBox>
                  <%--  <input type="text" class="form-control" placeholder="Email">--%>
                  </div>
                      <br />
                       <label for="">Fecha de Nacimiento</label>
                    <div class="form-group">
                    <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                        <asp:TextBox cssclass="form-control fa fa-calendar" ID="calFechaNacimiento" runat="server"></asp:TextBox>
<%--                        calFechaNacimiento
                      <input type="text" class="form-control" data-inputmask="'alias': 'mm/dd/yyyy'" data-mask/>--%>
                    </div><!-- /.input group -->
                  </div><!-- /.form group -->
                      <br />
                       <label for="">Cupo</label>
                       <div class="input-group">
                           <asp:TextBox cssclass="form-control" ID="txtCupo" runat="server"></asp:TextBox>
<%--                    <input type="text" class="form-control">--%>
                    <span class="input-group-addon"><i class="fa fa-check"></i></span>
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

              </div><!-- /.box -->
               </div>   <!-- /.row -->
              <asp:GridView ID="GVClientes" runat="server" AutoGenerateColumns="False" DataKeyNames="IDCliente" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." AllowPaging="True" AllowSorting="True">
                  <Columns>
                      <asp:CommandField HeaderText="Operaciones" ShowDeleteButton="True" ShowEditButton="True" />
                      <asp:BoundField DataField="IDCliente" HeaderText="ID Cliente" ReadOnly="True" SortExpression="IDCliente" />
                      <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                      <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                      <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                      <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                      <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                      <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nacimiento" SortExpression="FechaNacimiento" >
                      <ItemStyle HorizontalAlign="Right" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Cupo" HeaderText="Cupo" SortExpression="Cupo" />
                  </Columns>
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Facturacion1ConnectionString1 %>" DeleteCommand="DELETE FROM [Cliente] WHERE [IDCliente] = @IDCliente" InsertCommand="INSERT INTO [Cliente] ([IDCliente], [Nombres], [Apellidos], [Direccion], [Telefono], [Correo], [FechaNacimiento], [Cupo]) VALUES (@IDCliente, @Nombres, @Apellidos, @Direccion, @Telefono, @Correo, @FechaNacimiento, @Cupo)" ProviderName="<%$ ConnectionStrings:Facturacion1ConnectionString1.ProviderName %>" SelectCommand="SELECT [IDCliente], [Nombres], [Apellidos], [Direccion], [Telefono], [Correo], [FechaNacimiento], [Cupo] FROM [Cliente]" UpdateCommand="UPDATE [Cliente] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Direccion] = @Direccion, [Telefono] = @Telefono, [Correo] = @Correo, [FechaNacimiento] = @FechaNacimiento, [Cupo] = @Cupo WHERE [IDCliente] = @IDCliente">
                  <DeleteParameters>
                      <asp:Parameter Name="IDCliente" Type="String" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="IDCliente" Type="String" />
                      <asp:Parameter Name="Nombres" Type="String" />
                      <asp:Parameter Name="Apellidos" Type="String" />
                      <asp:Parameter Name="Direccion" Type="String" />
                      <asp:Parameter Name="Telefono" Type="String" />
                      <asp:Parameter Name="Correo" Type="String" />
                      <asp:Parameter DbType="Date" Name="FechaNacimiento" />
                      <asp:Parameter Name="Cupo" Type="Int32" />
                  </InsertParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="Nombres" Type="String" />
                      <asp:Parameter Name="Apellidos" Type="String" />
                      <asp:Parameter Name="Direccion" Type="String" />
                      <asp:Parameter Name="Telefono" Type="String" />
                      <asp:Parameter Name="Correo" Type="String" />
                      <asp:Parameter DbType="Date" Name="FechaNacimiento" />
                      <asp:Parameter Name="Cupo" Type="Int32" />
                      <asp:Parameter Name="IDCliente" Type="String" />
                  </UpdateParameters>
              </asp:SqlDataSource>
              <br />
        </section><!-- /.content -->
     </form>
</asp:Content>
