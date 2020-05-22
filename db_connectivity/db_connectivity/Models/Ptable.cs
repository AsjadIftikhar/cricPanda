using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CricPanda.Models
{
    public class Ptable
    {
        public int pos { get; set; }
        public string Team { get; set; }
        public string Flag { get; set; }
        public int Total { get; set; }
        public int Wins { get; set; }
        public int Lost { get; set; }
        public float Rating { get; set; }
    }
}