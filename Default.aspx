<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EntregaTress._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>EduVac</h3>
       <%-- <p>&nbsp;</p>--%>
  <%--  </div>--%>

    <div class="row">
        <div class="col-md-4">
            <p>
                &nbsp;</p>
        </div>
    </div>

   <hr />

        <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtPassword" class="font-weight-bold">Salas Disponibles</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       <asp:DropDownList ID="ddlSalas" CssClass="form-control" runat="server" Width="288px" 
                        DataTextField="Seleccione una Sala" AutoPostBack="True" OnSelectedIndexChanged="ddlSalas_SelectedIndexChanged">

                    </asp:DropDownList>

                         <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" 
                        ErrorMessage="This field is Required !" ControlToValidate="ddlSalas" InitialValue="0">

                    </asp:RequiredFieldValidator>--%>

                    </div>
                </div>             

            </div>
    
        <br />
   <%--      <br />--%>

        <hr />

<div class="row">  
     <div class="col-md-4">
         <h4> Listado de alumno por salas.</h4>

<asp:GridView ID="gvListadoAforos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1085px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="CodigoSala" HeaderText="Codigo Sala" ItemStyle-Width = "90" >
        <HeaderStyle Font-Size="Larger" />
<ItemStyle Width="110px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="NombreSala" HeaderText="Nombre Sala" ItemStyle-Width = "150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="NombreAlumno" HeaderText="Nombre Alumno" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="FechaEntrada" HeaderText="FechaEntrada" ItemStyle-Width = "100" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>

   </div>
</div>
          <br />
    <hr />

    <div class="row">  
     <div class="col-md-10">
         <h4> Listado de alumnos.</h4>

<asp:GridView ID="gvListadoAlumnos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1085px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="cod_alumno" HeaderText="Codigo Alumno" ItemStyle-Width = "90" >
        <HeaderStyle Font-Size="Larger" />
<ItemStyle Width="110px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="rut_alumno" HeaderText="RUT" ItemStyle-Width = "150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="nombre_alumno" HeaderText="Nombre Alumno" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

           <asp:BoundField DataField="apellido_alumno" HeaderText="Apellido Alumno" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="correo_alumno" HeaderText="Correo Alumno" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
    </Columns>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>

   </div>
</div>
           <br />
    <hr />

        <div class="row">  
     <div class="col-md-4">
         <h4> Listado de salas.</h4>

<asp:GridView ID="gvListaSalas" runat="server" AutoGenerateColumns="False" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="1085px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
    <AlternatingRowStyle BackColor="#CCCCCC" />
    <Columns>
        <asp:BoundField DataField="cod_sala" HeaderText="Codigo Sala" ItemStyle-Width = "90" >
        <HeaderStyle Font-Size="Larger" />
<ItemStyle Width="110px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="numero_sala" HeaderText="Numero Sala" ItemStyle-Width = "150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="nombre_sala" HeaderText="Nombre Sala" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="aforo_sala" HeaderText="Aforo Sala" ItemStyle-Width = "100" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
    </Columns>
    <FooterStyle BackColor="#CCCCCC" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>

   </div>
</div>
          <br />
    <hr />




    <div class="row">  
     <div class="col-md-10">
         <h4> Listado de usuarios.</h4>

<asp:GridView ID="gvListadoUsuario" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1085px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="cod_usuario" HeaderText="Codigo" ItemStyle-Width = "90" >
        <HeaderStyle Font-Size="Larger" />
<ItemStyle Width="90px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="rut_usuario" HeaderText="RUT" ItemStyle-Width = "150" >
<ItemStyle Width="90px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre Usuario" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

           <asp:BoundField DataField="apellido_usuario" HeaderText="Apellido Usuario" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="correo_usuario" HeaderText="Correo Usuario" ItemStyle-Width = "150" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

         <asp:BoundField DataField="username" HeaderText="Nombre Usuario" ItemStyle-Width = "100" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>

    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
</asp:GridView>

   </div>
</div>
           <br />
    <hr />

<br />

             <div class="col-xs-11 space-vert">           
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>


          </div>

</asp:Content>
