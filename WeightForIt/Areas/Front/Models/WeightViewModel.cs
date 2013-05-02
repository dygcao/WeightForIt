namespace WeightForIt.Models
{
    using System;
    using System.Collections.Generic;

    public class WeightViewModel
    {
        public List<Weight> Weights {get;set; }
        public Program Program { get; set; }

        public Nullable<double> weight1 { get; set; }
        public Nullable<int> UserId { get; set; }
        public System.DateTime date { get; set; }
        public Nullable<int> ProgramId { get; set; }
    }
}
