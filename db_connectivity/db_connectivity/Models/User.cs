using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace db_connectivity.Models
{
    public class User
    {
        public string userId;
        public string password;
        public string dateOfBirth;
    }

    public class Users
    {
        public int user_id { get; set; }

        public string first_name { get; set; }

        public string last_name { get; set; }

        public string username { get; set; }

        public string password { get; set; }

        public string data_of_birth { get; set; }

        public string team_pref_img { get; set; }

        public string team_pref { get; set; }
    }



    public class PCL_users {
        public int User_ID;
    }


    public class Panda_Team_Players
    {
        public int User_ID { get; set; } = 0;
        public int Tournament_ID { get; set; } = 0;
        public int Player_ID { get; set; } = 0;

        public string Player_Name;

        public string Player_Role;

        public int Player_Pts { get; set; } = 0;
        public int Team_ID { get; set; } = 0;

        public string Team_Name;


    }

    public class Current_Tournament
    {
        public int Tournamnet_ID;

        public string Tournament_Name;

    }


    public class PCL_leaderBoard
    {
        public int SCORE { get; set; } = 0;
        public int User_ID { get; set; } = 0;

        public string User_Name { get; set; }
    }

    public class PCL_Player
    {
        public int Player_ID ;

        public string Player_Name { get; set; } 

    }

 

}
