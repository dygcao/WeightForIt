//------------------------------------------------------------------------------
// <auto-generated>
//    Ce code a été généré à partir d'un modèle.
//
//    Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//    Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WeightForIt.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Program
    {
        public int ProgramId { get; set; }
        public string objective { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public byte privacy { get; set; }
        public int UserId { get; set; }
    
        public virtual UserProfile UserProfile { get; set; }
    }
}
