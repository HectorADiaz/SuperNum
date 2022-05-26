using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SuperNumero.Models;
using SuperNumero.Models.ViewModel;


namespace SuperNumero.Models.ViewModel
{
    public class Usuario
    {
        public int idUsuario { get; set; }
        public string nombre { get; set; }
        public string pass { get; set; }
        public string confirmarPass { get; set; }

        public DateTime? creacionUsuario { get; set; }
        public int usuarioCreacion { get; set; }
    }
}