using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CricPanda.Models
{
    public class Tournaments
    {
        public int Tid { get; set; }
        public string Name { get; set; }
        public string loc { get; set; }
        public string s_date { get; set; }
        public string e_Date { get; set; }
    }
}