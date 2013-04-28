using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WeightForIt.Models
{
    public class GroupEntity : DbContext
    {
        public DbSet<Food> Foods { get; set; }
    }
}