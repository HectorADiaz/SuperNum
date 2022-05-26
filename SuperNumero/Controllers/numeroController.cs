using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SuperNumero.Models;
using SuperNumero.Models.ViewModel;
using SuperNumero;

namespace SuperNumero.Controllers
{
    public class numeroController : Controller
    {
        // GET: numero
        public ActionResult Index()
        {
            
                
         return View();
        }

        public ActionResult Listar()
        {
            List<NumeroViewModel> lst = null;
            using (var db = new superNumeroEntities())
            {
                lst = (from d in db.numeros
                     
                       select new NumeroViewModel
                       {
                           numero = d.numero,
                           
                           resultado = d.resultado,
                           detalle = d.detalle,
                           fechayhora = d.fechayhora  ,
                           idUsuario = d.idUsuario
                       }).ToList();

            }

            return Json(new { data=lst}, JsonRequestBehavior.AllowGet);
            
        }




        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(NumeroViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }


            using (var db = new superNumeroEntities())
            {
                string n = model.numero;
                char[] arrayNumeros = n.ToCharArray();
                int suma = 0;
                foreach (char nn in arrayNumeros)
                {
                    suma += int.Parse(nn.ToString());
                }


                numeros oNumeros = new numeros();
                oNumeros.numero = model.numero;
                oNumeros.resultado = suma;
                oNumeros.fechayhora = DateTime.Now;
                oNumeros.idUsuario = 3;

                db.numeros.Add(oNumeros);
                db.SaveChanges();
            }

            return Redirect(Url.Content("~/numero/"));


        }










        }
}