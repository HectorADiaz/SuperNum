using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace SuperNumero.Models.ViewModel
{
    public class NumeroViewModel
    {
        public string numero { get; set; }
        public int resultado { get; set; }

        public string detalle { get; set; }

        
       // [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "0:yyyy/MM/dd}")]
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime? fechayhora { get; set; }

        public DateTime? fechaNueva { get; set; }

        public int? idUsuario { get; set; }

    }
}