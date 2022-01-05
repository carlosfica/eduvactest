using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using QRCoder;
using EntregaTress.modelo;

namespace EntregaTress.controller
{
    public class QrController
    {
        private static EduVacEntities dbc = new EduVacEntities();

        public byte[] GenerateQRCode(string dataQRAlumno)
        {
            var codename = dataQRAlumno;
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;

            byte[] byteImage;

            using (MemoryStream ms = new MemoryStream())
            {
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(codename, QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                using (Bitmap bitMap = qrCode.GetGraphic(20))
                {
                    bitMap.Save(ms, ImageFormat.Png);
                    //  var CodeImage = "data:image/png;base64," + Convert.ToBase64String(ms.ToArray());
                  //  byte[] byteImage = ms.ToArray();
                   byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
              
            }

          //  return imgBarCode;
            return byteImage;
        }

        public int EnvioCodigoQR(int CodAlunmno)
        {
            ENVIOCODIGOQR envQR = new ENVIOCODIGOQR();
            envQR.fecha_envio = DateTime.Now;
            envQR.fk_alumno = CodAlunmno;

            dbc.ENVIOCODIGOQR.Add(envQR);
            dbc.SaveChanges();

            return envQR.cod_codigo;
        }


        public int GuardarEntradaSala(int CodEnvioQR, int CodSala)
        {
            QRENTRADA envQR = new QRENTRADA();
            envQR.fecha_entrada = DateTime.Now;
            envQR.fk_qr = CodEnvioQR;
            envQR.fk_sala = CodSala;

            dbc.QRENTRADA.Add(envQR);
            dbc.SaveChanges();

            var saved = envQR.cod_codigo2;

            return saved;
        }

        public ENVIOCODIGOQR GetCodigoEnvioByAluId(int codAlumno)
        {
            var uResp = new ENVIOCODIGOQR();

           
            var userData = dbc.ENVIOCODIGOQR.Where(a => a.fk_alumno == codAlumno).FirstOrDefault();
            if (userData != null)
            {
                uResp = userData;
            }
          

            return uResp;

        }



    }

   


}