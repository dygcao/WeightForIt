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
    
    public partial class Food
    {
        public Food()
        {
            this.Consumptions = new HashSet<Consumption>();
        }
    
        public int FoodId { get; set; }
        public string RefValue { get; set; }
        public int unit { get; set; }
        public int calories { get; set; }
        public int proteins { get; set; }
        public int glucides { get; set; }
        public int lipids { get; set; }
    
        public virtual ICollection<Consumption> Consumptions { get; set; }
    }
}
