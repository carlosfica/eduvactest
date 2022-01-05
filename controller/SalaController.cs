using EntregaTress.modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntregaTress.controller
{
    public class SalaController
    {

        private static EduVacEntities dbc = new EduVacEntities();
        public static int agregarSalas(int numero, string nombre, int foro)
        {

            SALAS sala = new SALAS()
            {

                numero_sala = numero,
                nombre_sala = nombre,
                aforo_sala = foro
             

            };

            dbc.SALAS.Add(sala);
            dbc.SaveChanges();

            var resp = sala.cod_sala;

            return resp;//  "Agregado a la Base de Datos";

        }

        public List<SalaDTO> ListadoSalas()
        {

            List<SalaDTO> buscaSala = new List<SalaDTO>();
          
            try
            {

                using (EduVacEntities db = new EduVacEntities())
                {
                    buscaSala = (from t1 in db.SALAS
                                   where t1.cod_sala > 0
                                   select new SalaDTO
                                   {
                                       CodigoSala = t1.cod_sala,
                                       NombreSala = t1.nombre_sala                                     
                                   }).ToList();
                    


                }

            }
            catch (Exception ex)
            {

            }

            return buscaSala.ToList();
        }

        public List<SalaDTO> GetAsistenciaBySalaId(int idSala)
        {

            List<SalaDTO> buscaSala = new List<SalaDTO>();

            try
            {

                using (EduVacEntities db = new EduVacEntities())
                {
                    buscaSala = (from t1 in db.SALAS
                                 join se in db.QRENTRADA on t1.cod_sala equals se.fk_sala
                                 join qe in db.ENVIOCODIGOQR on se.fk_qr equals qe.cod_codigo
                                 join al in db.ALUMNOS on qe.fk_alumno equals al.cod_alumno
                                 where t1.cod_sala == idSala
                                 select new SalaDTO
                                 {
                                     CodigoSala = t1.cod_sala,
                                     NombreSala = t1.nombre_sala,
                                     FechaEntrada = se.fecha_entrada,
                                     NombreAlumno = al.nombre_alumno + " " + al.apellido_alumno

                                 }).ToList();



                }

            }
            catch (Exception ex)
            {

            }

            return buscaSala.ToList();
        }


        public List<SALAS> ListarTodasSalas()
        {
            var uResp = new List<SALAS>();

            // bool logueado = false;
            var userData = dbc.SALAS.Where(a => a.cod_sala > 0).ToList();
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


    public  class SalaDTO
    {
        public int CodigoSala { get; set; }
        public string NombreSala { get; set; }
        public string NombreAlumno { get; set; }
        public DateTime FechaEntrada { get; set; }


}
}