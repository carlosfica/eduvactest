<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EntregaTress.Login" %>






<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
     <br/>
    
  <div class="jumbotron">


        <h3>Acceso al Portal</h3>
     
         
             <hr />
     <br />
        <br />
      <h5 class="row justify-content-center">Ingrese datos de inicio.</h5>
     <hr />
    <div class="row">

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="txtCorreo" class="font-weight-bold">Correo</label>
                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                          &nbsp;<asp:TextBox ID="txtCorreo" runat="server" Width="342px" TextMode="Email"></asp:TextBox>
                    </div>
                </div>              
            </div>          

                   

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtPassword" class="font-weight-bold">Contrasena</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtPassword" runat="server" Width="332px" MaxLength="20" TextMode="Password"></asp:TextBox>
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
                    <asp:Button runat="server" ID="btnLogin" class="btn btn-success" text="Ingresar" width="170px" OnClick="btnLogin_Click"    />
                          
                    </div>                   
                </div>

                <div class="col-md-7">
               
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="form-control btn btn-warning" text="Regresar" Width="168px" OnClick="btnCancelar_Click"  />
                                   

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



<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <div class="col-5">
            <div class="form-control card card-body algin-items-center h3">
                <asp:Label runat="server" Text="Inicio Sesión" Font-Size="Larger"></asp:Label>
                </div>
            <br />
            <div class="input-group">
                    <asp:TextBox runat="server" CssClass="form-control" placeholder="correo" ID="txtCorreo" TextMode="Email"></asp:TextBox>
            </div>
            <br />
            <div class="input-group">
                   <asp:TextBox runat="server" CssClass="form-control" placeholder="contraseña" ID="txtPass" TextMode="Password"></asp:TextBox>
        </div>
            <br />
            <div class="input-group">
                <asp:Button runat="server" CssClass="form-control btn btn-dark" Text="Ingresar" ></asp:Button>
            </div>
            <br />
            <br />
            <div>
                <asp:Label runat="server" ID="lbError" class="alert-danger"></asp:Label>
            <br />
                <asp:Label runat="server" Text="Recuperar Contraseña"></asp:Label>
                <asp:LinkButton runat="server" Text="Recuperar" ID="lkRecuperar"></asp:LinkButton>
                </div>
            </div>

</asp:Content>--%>
