using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WeightForIt.Models;

namespace WeightForIt.Models
{
    public class WfiEntitiesInitializer : DropCreateDatabaseAlways<WfiEntities>
    {
        protected override void Seed(WfiEntities context)
        {
            new List<Food>
            {
                // Fruits
                new Food { FoodId = 1, RefValue = "Abricot", unit = "Unité", calories = 14, proteins = 0, glucides = 3, lipids = 0 },
                new Food { FoodId = 2, RefValue = "Ananas", unit = "dag (100g)", calories = 50, proteins = 0, glucides = 12, lipids = 0 },
                new Food { FoodId = 3, RefValue = "Banane", unit = "Unité", calories = 116, proteins = 1, glucides = 27, lipids = 0 },
                new Food { FoodId = 4, RefValue = "Cerise", unit = "dag (100g)", calories = 77, proteins = 1, glucides = 17, lipids = 0 },
                new Food { FoodId = 5, RefValue = "Clémentine", unit = "dag (100g)", calories = 40, proteins = 1, glucides = 9, lipids = 0 },
                new Food { FoodId = 6, RefValue = "Fraise", unit = "dag (100g)", calories = 36, proteins = 1, glucides = 7, lipids = 0 },
                new Food { FoodId = 7, RefValue = "Kiwi", unit = "dag (100g)", calories = 53, proteins = 2, glucides = 11, lipids = 0 },
                new Food { FoodId = 8, RefValue = "Melon", unit = "dag (100g)", calories = 30, proteins = 1, glucides = 6, lipids = 0 },
                new Food { FoodId = 9, RefValue = "Mandarine", unit = "Unité", calories = 45, proteins = 1, glucides = 11, lipids = 0 },
                new Food { FoodId = 10, RefValue = "Mangue", unit = "dag (100g)", calories = 63, proteins = 0, glucides = 15, lipids = 0 },
                new Food { FoodId = 11, RefValue = "Myrtilles", unit = "dag (100g)", calories = 71, proteins = 1, glucides = 16, lipids = 0 },
                new Food { FoodId = 12, RefValue = "Orange", unit = "dag (100g)", calories = 45, proteins = 1, glucides = 9, lipids = 0 },
                new Food { FoodId = 13, RefValue = "Pamplemousse", unit = "dag (100g)", calories = 66, proteins = 1, glucides = 16, lipids = 0 },
                new Food { FoodId = 14, RefValue = "Pêche", unit = "dag (100g)", calories = 46, proteins = 1, glucides = 11, lipids = 0 },
                new Food { FoodId = 15, RefValue = "Poire", unit = "Unité", calories = 107, proteins = 1, glucides = 26, lipids = 0 },
                new Food { FoodId = 16, RefValue = "Pomme", unit = "Unité", calories = 80, proteins = 0, glucides = 19, lipids = 0 },
                new Food { FoodId = 17, RefValue = "Prune", unit = "dag (100g)", calories = 52, proteins = 1, glucides = 12, lipids = 0 },
                new Food { FoodId = 18, RefValue = "Pruneaux", unit = "dag (100g)", calories = 234, proteins = 2, glucides = 54, lipids = 0 },
                new Food { FoodId = 19, RefValue = "Raisin", unit = "dag (100g)", calories = 69, proteins = 1, glucides = 15, lipids = 1 },
                new Food { FoodId = 20, RefValue = "Rhubarbe", unit = "dag (100g)", calories = 18, proteins = 0, glucides = 4, lipids = 0 }
            }.ForEach(i => context.Foods.Add(i));
        }
    }
}