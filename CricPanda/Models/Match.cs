using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CricPanda.Models
{
    public class Match
    {
        public int Match_ID { get; set; }
        public string Team1 { get; set; }
        public string TeamFlag1 { get; set; }
        public string Team2 { get; set; }
        public string TeamFlag2 { get; set; }
        public string Date { get; set; }
        public string Stadium { get; set; }
        public string Tournament { get; set; }
    }
}