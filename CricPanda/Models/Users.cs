using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CricPanda.Models
{
    public class Users
    {
        public string first_name { get; set; }

        public string last_name { get; set; }

        public string username { get; set; }

        public string password { get; set; }

        public string data_of_birth { get; set; }

        public string team_pref { get; set; }
    }
}