<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="RegistrarSalas.aspx.cs" Inherits="EntregaTress.vistas.RegistrarSalas" %>






<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
     <br/>
    
  <div class="jumbotron">


        <h3>Registro de Salas</h3>
     
         
             <hr />
     <br />
        <br />
      <h5 class="row justify-content-center">Ingrese datos de la sala</h5>
     <hr />
    <div class="row">

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="txtNumero" class="font-weight-bold">Numero</label>
                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                          &nbsp;<asp:TextBox ID="txtNumero" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>              
            </div>          

                   

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtNombre" class="font-weight-bold">Nombre</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtNombre" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtForoSala" class="font-weight-bold">Aforo</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtForoSala" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


            

          


            <br />

                <br />
                <br />
             <hr />

              <div class="row">
                <div class="col-md-4">
                
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">                   
                    <asp:Button runat="server" ID="btnAgregar" class="btn btn-success" text="Guardar" width="170px" OnClick="btnAgregar_Click"   />
                          
                    </div>                   
                </div>

                <div class="col-md-7">
               
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">
                   
                       <asp:Button ID="btnBorrarDatos" runat="server" CssClass="form-control btn btn-warning" text="Borrar Datos" Width="168px"  />
                                   

                    </div>
                </div>             

            </div>

             <div class="col-xs-11 space-vert">
           
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
                        
            </div>
        </div>

     

     </div>



</asp:Content>


