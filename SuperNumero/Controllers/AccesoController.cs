using SuperNumero.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SuperNumero.Controllers
{
    public class AccesoController : Controller
    {
     //   static string cadena = "Data Source=(DESKTOP-6LQMEUQ\SQLEXPRESS);Inital Catalog=SuperNumero;Integrated user id =sa pwd=123456";
        // GET: Acceso
        public ActionResult login()
        {
            return View();
        }

        public ActionResult Registrar(Usuario oUsuario) 
        {
            bool registrado;
            string mensaje;

            if (oUsuario.pass == oUsuario.confirmarPass)
            {

                oUsuario.pass = ConvertirSha256(oUsuario.pass);
            }
            else
            {
                ViewData["Mensaje"] = "Las contraseñas no coinciden";
                return View();
            }




            return View();
        }

        public static string ConvertirSha256(string texto)
        {
            //using System.Text;
            //USAR LA REFERENCIA DE "System.Security.Cryptography"

            StringBuilder Sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result)
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }
    }
}