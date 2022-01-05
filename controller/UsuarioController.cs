using EntregaTress.modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace EntregaTress.controller
{
    public class UsuarioController
    {

        private EduVacEntities dbc = new EduVacEntities();
        public string agregarAlumno(string rut, string nombreUsuario, string nombre, string apellido, string correo,
            string contrasena, int tipoUsuario)
        {

            var PasswordEnc = encryption(contrasena);

            USUARIOS usuario = new USUARIOS()
            {

                rut_usuario = rut,
                nombre_usuario = nombre,
                apellido_usuario = apellido,
                correo_usuario = correo,
                pass_hash = PasswordEnc, // contrasena,
                usuario_admin = tipoUsuario,
                username = nombreUsuario

            };

            dbc.USUARIOS.Add(usuario);
            dbc.SaveChanges();

            return "Agregado a la Base de Datos";

        }


        public USUARIOS LoginUser(string correo, string contrasena)
        {
            var uResp = new USUARIOS();
            var PasswordEnc = encryption(contrasena);
            // bool logueado = false;
            var LoginU = dbc.USUARIOS.Where(a => a.correo_usuario == correo && a.pass_hash == PasswordEnc).FirstOrDefault();
            if (LoginU != null)
            {
                uResp = LoginU;
            }
            //else
            //{
            //    logueado = false;
            //}

            return uResp;

        }

        public string encryption(String password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            //encrypt the given password string into Encrypted data  
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            //Create a new string by using the encrypted data  
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString());
            }
            return encryptdata.ToString();
        }

        public List<USUARIOS> ListadoUsuarios()
        {
            var uResp = new List<USUARIOS>();

            // bool logueado = false;
            var userData = dbc.USUARIOS.Where(a => a.cod_usuario > 0).ToList();
            if (userData.Count > 0)
            {
                uResp = userData;
            }

            return uResp;

        }




    }
}