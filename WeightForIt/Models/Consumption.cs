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
    
    public partial class Consumption
    {
        public int ConsumptionId { get; set; }
        public Nullable<Single> quantity { get; set; }
        public int FoodId { get; set; }
        public int MenuId { get; set; }
    
        public virtual Food Food { get; set; }
        public virtual Menu Menu { get; set; }
    }
}
