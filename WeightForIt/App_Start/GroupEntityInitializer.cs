using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WeightForIt.Models;

namespace WeightForIt.Models
{
    public class GroupEntityInitializer : DropCreateDatabaseAlways<GroupEntity>
    {
        protected override void Seed(GroupEntity context)
        {
            new List<Food>
            {
                new Food { FoodId = 1, RefValue = "Abricot", unit = "Unité", calories = 14, proteins = 0, glucides = 3, lipids = 0 },
                new Food { FoodId = 2, RefValue = "Ananas", unit = "dag (100g)", calories = 50, proteins = 0, glucides = 12, lipids = 0 },
                new Food { FoodId = 3, RefValue = "Banane", unit = "Unité", calories = 116, proteins = 1, glucides = 27, lipids = 0 },
                new Food { FoodId = 4, RefValue = "Cerise", unit = "dag (100g)", calories = 77, proteins = 1, glucides = 17, lipids = 0 },
                new Food { FoodId = 5, RefValue = "Clémentine", unit = "dag (100g)", calories = 40, proteins = 1, glucides = 9, lipids = 0 },
                new Food { FoodId = 6, RefValue = "Fraise", unit = "dag (100g)", calories = 36, proteins = 1, glucides = 7, lipids = 0 },
                new Food { FoodId = 7, RefValue = "Kiwi", unit = "dag (100g)", calories = 53, proteins = 2, glucides = 11, lipids = 0 },
                new Food { FoodId = 8, RefValue = "Melon", unit = "dag (100g)", calories = 30, proteins = 1, glucides = 6, lipids = 0 }
            }.ForEach(i => context.Foods.Add(i));
        }
    }
}