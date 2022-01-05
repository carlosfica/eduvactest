<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" 
    CodeBehind="ListadoAforo.aspx.cs" Inherits="EntregaTress.vistas.ListadoAforo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <br/>
     <%--<br/>--%>

    <div class="row">                
    
  <div class="jumbotron">
        <h3>Salas Asistencia</h3>
   <%-- <div class="container">--%>

         <br/>
     <br/>


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

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" 
                        ErrorMessage="This field is Required !" ControlToValidate="ddlSalas" InitialValue="0">

                    </asp:RequiredFieldValidator>

                    </div>
                </div>             

            </div>

        <br />
         <br />

     
<div class="row">  
     <div class="col-md-4">

<asp:GridView ID="gvListadoAforos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="675px">
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
      
          </div>
          </div>

      
</asp:Content>
