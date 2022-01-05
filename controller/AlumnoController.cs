using EntregaTress.modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntregaTress.controller
{
    public class AlumnoController
    {

        private static EduVacEntities dbc = new EduVacEntities();
        public static ALUMNOS agregarAlumno(string rut, string nombre, string apellido, string correo)
        {

            ALUMNOS alumno = new ALUMNOS()
            {

                rut_alumno = rut,
                nombre_alumno = nombre,
                apellido_alumno = apellido,
                correo_alumno = correo

            };

            dbc.ALUMNOS.Add(alumno);
            dbc.SaveChanges();

         //   var resp = alumno.cod_alumno;
         

            return alumno;//  "Agregado a la Base de Datos";

        }


        public List<ALUMNOS> ListadoAlumnos()
        {
            var uResp = new List<ALUMNOS>();
          
            // bool logueado = false;
            var userData = dbc.ALUMNOS.Where(a => a.cod_alumno > 0).ToList();
            if (userData.Count > 0)
            {
                uResp = userData;
            }
            //else
            //{
            //    logueado = false;
            //}

            return uResp;

        }

        


    }
}