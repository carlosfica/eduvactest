<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Escanearqr.aspx.cs" Inherits="EntregaTress.vistas.Escanearqr" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script src="../sources/Scripts/vue.min.js"></script>
    <script src="../sources/Scripts/instacam.min.js"></script>
    <script src="../sources/Scripts/adapter.min.js"></script>--%>

    <script src="../Scripts/jsQR/adapter.min.js"></script>
    <script src="../Scripts/jsQR/instacam.min.js"></script>
   <%-- <script src="../Scripts/jsQR/qrcode.js"></script>--%>
    <script src="../Scripts/jsQR/vue.min.js"></script>

    <br/>
     <br/>
    
  <div class="jumbotron">

        <h3>Escanear QR</h3>

    <div class="container">
  <div class="row gx-3 justify-content-center">

    <div class="col-md-6">

          <video id="preview" width="400" height="400"></video>

    </div>

    <div class="col-md-6">
        <label>Escaneo de Qr</label>
        
        <br />

        
        <input type="text" name="text" id="text" readonly=""  class="form-control" />
    

    </div>

  </div>

         <br />
         <br />
         <br />

<div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Salas Disponibles"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSalas" CssClass="form-control" runat="server" Width="288px" 
                        DataTextField="Seleccione una Sala">

                    </asp:DropDownList>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" 
                        ErrorMessage="This field is Required !" ControlToValidate="ddlSalas" InitialValue="0">

                    </asp:RequiredFieldValidator>
                </div>
            </div>

        <br />
         <br />
        <br />

            <div class="row">
                <div class="col-md-4">
                
                       <%-- <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6"> --%>                  
                    <asp:Button runat="server" ID="btnConfirmar" class="btn btn-success" text="Confirmar" width="170px" OnClick="btnConfirmar_Click"    />
                          
                  <%--  </div>  --%>                 
                </div>

                <div class="col-md-7">               
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">                   
                       <asp:Button ID="btnRefrescar" runat="server" CssClass="form-control btn btn-warning" text="Refrescar" Width="168px" OnClick="btnRefrescar_Click"  />
                            
                    </div>
                </div>          

            </div>

             <div class="col-xs-11 space-vert">           
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>

          <%--<asp:HiddenField ID="txtQRHide"  runat="server" />--%>
</div>


        <script>
            let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
            Instascan.Camera.getCameras().then(function (cameras) {
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                    console.log(scanner);
                } else {
                    alert('No hay Camaras');
                }
            }).catch(function (e) {
                console.error(e);
            });
            scanner.addListener('scan', function (c) {
                document.getElementById('text').value = c;

                document.getElementById("MainContent_txtQRHide").value = c;
                document.getElementById("txtQRHide").value = c;
                //  $("#textQR").val = c
                scanner.stop();

                //document.forms[0].submit();

            });
        </script>
      </div>

     <asp:HiddenField ID="txtQRHide"  runat="server" />
</asp:Content>
