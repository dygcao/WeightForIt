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
    
    public partial class UserProfile
    {
        public UserProfile()
        {
            this.Favorites = new HashSet<Favorite>();
            this.Menus = new HashSet<Menu>();
            this.Programs = new HashSet<Program>();
            this.Weights = new HashSet<Weight>();
        }
    
        public virtual ICollection<Favorite> Favorites { get; set; }
        public virtual ICollection<Menu> Menus { get; set; }
        public virtual ICollection<Program> Programs { get; set; }
        public virtual ICollection<Weight> Weights { get; set; }
    }
}
