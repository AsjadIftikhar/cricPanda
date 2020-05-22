using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using db_connectivity.Models;
namespace db_connectivity.Controllers
{
    public class HomeController : Controller
    {


        ///////////////////////////////////////////  Usman Bhai  ///////////////////////////////////////////

        public ActionResult LandingPage()
        {

            return View();
        }
        public ActionResult PreferencePage()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            List<PreferencePageModel> teams = CRUD.getAllTeams();
            return View(teams);
        }
        public ActionResult LiveScore()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            List<LiveScoreModel> livescores = CRUD.getLiveScore();
            return View(livescores);
        }
        public ActionResult UserPage()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            String username = Session["username"].ToString();
            String password = Session["password"].ToString();
            Users user = CRUD.getUserInfo(username, password);
            return View(user);
        }
        [HttpPost]
        public ActionResult setPreference(String preference)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            String username = Session["username"].ToString();
            String password = Session["password"].ToString();
            int result = CRUD.setPref(username, password, preference);

            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("PreferencePage", (object)data);
            }
            Session["preference"] = preference;
            return RedirectToAction("LiveScore");
        }
        public ActionResult checkPreference()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            String username = Session["username"].ToString();
            String password = Session["password"].ToString();
            int result = CRUD.checkPref(username, password);
            if (result == 0)
            {
                return RedirectToAction("LiveScore");
            }
            return RedirectToAction("PreferencePage");
        }
        [HttpGet]
        public ActionResult Login()
        {
            if (Session["username"] != null)
            {
                return RedirectToAction("LiveScore");

            }

            return View();
        }
        public ActionResult SignUp()
        {
            if (Session["username"] != null)
            {
                return RedirectToAction("LiveScore");

            }

            return View();
        }
        public ActionResult authenticate(String nickname, String pass)
        {
            if (Session["username"] != null)
            {
                return RedirectToAction("LiveScore");

            }

            if (nickname == "admin123" && pass == "admin123")
            {
                Session["username"] = nickname;
                Session["password"] = pass;
                return RedirectToAction("../Users/Create");
            }
            else
            {
                int result = CRUD.Login(nickname, pass);

                if (result == -1)
                {
                    String data = "Something went wrong while connecting with the database.";
                    return View("Login", (object)data);
                }
                else if (result == -2)
                {

                    String data = "Incorrect Credentials";
                    return View("Login", (object)data);
                }
                else if (result == -3)
                {

                    String data = "Incorrect Username";
                    return View("Login", (object)data);
                }

                Session["username"] = nickname;
                Session["password"] = pass;
                return RedirectToAction("checkPreference");
            }
        }
        public ActionResult authsignup(String userId, String firstname, String lastname, String password, String dateOfBirth)
        {
            if (Session["username"] != null)
            {
                return RedirectToAction("LiveScore");

            }


            int result = CRUD.SignUp(userId, firstname, lastname, password, dateOfBirth);

            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("Signup", (object)data);
            }
            else if (result == -2)
            {

                String data = "UserId already present ";
                return View("Signup", (object)data);
            }
            else if (result == -3)
            {

                String data = "Choose a stronger Password ";
                return View("Signup", (object)data);
            }
            Session["username"] = userId;
            Session["password"] = password;
            return RedirectToAction("PreferencePage");

        }


        /////////////////////////////////////////////  Tayyab Bhai  ////////////////////////////////////////////////


        public ActionResult Index()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            return View();
        }
        public ActionResult Future()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            List<Tournament> users = CRUD.GetTournaments("Future");
            if (users == null)
            {
                RedirectToAction("../../Home/Index");
            }
            return View(users);
        }
        public ActionResult Concluded()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }


            List<Tournament> users = CRUD.GetTournaments("conducted");
            if (users == null)
            {
                RedirectToAction("../../Home/Index");
            }
            return View(users);
        }
        public ActionResult Current()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            List<Tournament> users = CRUD.GetTournaments("current");
            if (users == null)
            {
                RedirectToAction("../../Home/Index");
            }
            return View(users);
        }
        public ActionResult Taab_Matches(int Tour_id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            List<Taab_Matches> users = CRUD.GetTaabMatches(Tour_id);


            if (users == null)
            {
                RedirectToAction("Index");
            }
            return View(users);
        }
        public ActionResult Scorecard(int match_id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }


            List<ScoreCard1> users = CRUD.GetScoreCard(match_id);
            List<ScoreCard2> users1 = CRUD.GetScoreCard1(match_id);
            List<ScoreCard2> users2 = CRUD.GetScoreCard2(match_id);
            List<ScoreCard4> users3 = CRUD.GetScoreCard4(match_id);

            ViewBag.ScoreCard2 = users2;
            ViewBag.ScoreCard1 = users;
            ViewBag.ScoreCard4 = users3;
            if (users == null)
            {
                RedirectToAction("../../Home/Index");
            }
            return View(users1);
        }


        ///////////////////////////////////////////////// PANDA LEAGUE ////////////////////////////////////////////

        public ActionResult Sign_Out()
        {
            Session["username"] = null;
            return RedirectToAction("LandingPage");
        }
        public ActionResult PCL_Tournament_Selection_Create_Team()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
      
            if (Session["PCL_Team_Name"] == null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            List<Current_Tournament> users = CRUD.PCL_Current_Tournament();
            if( users.Count()==0)
            {
                String data1 = "Currently No Tournament Happening Yo! Come Back Later ";
                return View("Checking", (object)data1);
            }
            if (users == null)
            {
                String data1 = "Something went wrong while connecting with the database.";
                return View("Checking", (object)data1);
            }

            return View(users);

        }
      
        [HttpPost]
        
        public int PCL_Tournament_Selection_Create_Team_2(string number1)
        {
          

            Session["PCL_Tournament_Selection_Create_Team"] = number1;

            return 1;


        }
     
        public ActionResult PCL_Team_Name()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }


            int t1 = Convert.ToInt32(Session["PCL_User_ID"].ToString());

            int result = CRUD.PCL_Login(t1);

            if (result == -1)
            {
                String data1 = "Something went wrong while connecting with the database.";
                return View("Checking", (object)data1);
            }
            else if (result == 0)
            {
                return View();

            }
            else
            {
                
                String data = "You already have a team GO->Back_Home->View Your Team From Navbar";
                return View("Checking", (object)data);
            }
            
        }

        public ActionResult Team_Name_Authentication(String userId)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }


            int result = CRUD.Team_Name_Authentication_2(userId);

            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("PCL_Team_Name", (object)data);
            }
            else if (result == 0)
            {
                Session["PCL_Team_Name"] = userId;

                return RedirectToAction("PCL_Tournament_Selection_Create_Team");
                
            }
            else
            {
                String data = "Team Name Already Exists!";
                return View("PCL_Team_Name", (object)data);
            }


           

        }    
    
        public ActionResult PCL_Wicket_Keeper()
        {

            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"]==null )
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            int  t1=Convert.ToInt32(Session["PCL_Tournament_Selection_Create_Team"].ToString());
            List<PCL_Player> users = CRUD.get_PCL_Wicket_Keeper(t1);
            TempData["PCL_Player1"] = users;
            return View(users);
        }      
  
        [HttpPost]
        
        public int PCL_Wicket_Keeper_2(string number1)
        {
           
            List<PCL_Player> users = TempData["PCL_Player1"] as List<PCL_Player>;
            for (int i=0; i< users.Count();i++)
            {
                if(users[i].Player_ID==Convert.ToInt32(number1))
                {
                    Session["PCL_Wicket_Keeper_Name"] = users[i].Player_Name;
                }
            }
            string s = Session["PCL_Wicket_Keeper_Name"].ToString();
            Session["PCL_Wicket_Keeper"] = number1;

            return 1;


        }
       
        public ActionResult PCL_Bowler()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"] == null || Session["PCL_Wicket_Keeper"] == null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            int t1 = Convert.ToInt32(Session["PCL_Tournament_Selection_Create_Team"].ToString());

            List<PCL_Player> users = CRUD.get_PCL_Bowlers(t1);
            TempData["PCL_Player2"] = users;

            return View(users);
        }
     
        [HttpPost]
        
        public int PCL_Bowler_2(List<int> number1)
        {


            List<PCL_Player> users = TempData["PCL_Player2"] as List<PCL_Player>;
            
            for (int i = 0; i < users.Count(); i++)
            {
                if (users[i].Player_ID == Convert.ToInt32(number1[0]))
                {
                    Session["PCL_Bowler1_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[1]))
                {
                    Session["PCL_Bowler2_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[2]))
                {
                    Session["PCL_Bowler3_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[3]))
                {
                    Session["PCL_Bowler4_Name"] = users[i].Player_Name;
                }
            }
            
            Session["PCL_Bowler1"] = number1[0];
            Session["PCL_Bowler2"] = number1[1];
            Session["PCL_Bowler3"] = number1[2];
            Session["PCL_Bowler4"] = number1[3];

            return 1;


        }
  
        public ActionResult PCL_Batsman()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"] == null || Session["PCL_Wicket_Keeper"] == null || Session["PCL_Bowler1"] == null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            int t1 = Convert.ToInt32(Session["PCL_Tournament_Selection_Create_Team"].ToString());
            List<PCL_Player> users = CRUD.get_PCL_Batsman(t1);
            TempData["PCL_Player3"] = users;

            return View(users);
        }
    
        [HttpPost]
        public int PCL_Batsman_2(List<int> number1)
        {
            List<PCL_Player> users = TempData["PCL_Player3"] as List<PCL_Player>;

            for (int i = 0; i < users.Count(); i++)
            {
                if (users[i].Player_ID == Convert.ToInt32(number1[0]))
                {
                    Session["PCL_Batsman1_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[1]))
                {
                    Session["PCL_Batsman2_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[2]))
                {
                    Session["PCL_Batsman3_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[3]))
                {
                    Session["PCL_Batsman4_Name"] = users[i].Player_Name;
                }
            }

            Session["PCL_Batsman1"] = number1[0];
            Session["PCL_Batsman2"] = number1[1];
            Session["PCL_Batsman3"] = number1[2];
            Session["PCL_Batsman4"] = number1[3];

            return 1;

        }
      
        public ActionResult PCL_All_Rounder()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"] == null || Session["PCL_Wicket_Keeper"] == null || Session["PCL_Bowler1"] == null || Session["PCL_Batsman1"] == null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            int t1 = Convert.ToInt32(Session["PCL_Tournament_Selection_Create_Team"].ToString());
            List<PCL_Player> users = CRUD.get_PCL_All_Rounders(t1);
            TempData["PCL_Player4"] = users;

            return View(users);
        }
        [HttpPost]
        public int PCL_All_Rounder_2(List<int> number1)
        {

            List<PCL_Player> users = TempData["PCL_Player4"] as List<PCL_Player>;

            for (int i = 0; i < users.Count(); i++)
            {
                if (users[i].Player_ID == Convert.ToInt32(number1[0]))
                {
                    Session["PCL_All_Rounder1_Name"] = users[i].Player_Name;
                }
                else if (users[i].Player_ID == Convert.ToInt32(number1[1]))
                {
                    Session["PCL_All_Rounder2_Name"] = users[i].Player_Name;
                }
              
            }
            Session["PCL_All_Rounder1"] = number1[0];
            Session["PCL_All_Rounder2"] = number1[1];

            return 1;

        }
        
        public ActionResult PCL_Captain()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"] == null || Session["PCL_Wicket_Keeper"] == null || Session["PCL_Bowler1"] == null || Session["PCL_Batsman1"] == null ||  Session["PCL_All_Rounder1"]==null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }

            return View();
        }
   
        [HttpPost]
        
        public int PCL_Captain_2(string number1)
        {
            Session["PCL_Captain"] = number1;
            return 1;


        }
       
        public ActionResult PCL_Vice_Captain()
        {
            
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            if (Session["PCL_Team_Name"] == null || Session["PCL_Tournament_Selection_Create_Team"] == null || Session["PCL_Wicket_Keeper"] == null || Session["PCL_Bowler1"] == null || Session["PCL_Batsman1"] == null || Session["PCL_All_Rounder1"] == null || Session["PCL_Captain"]==null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);

            }
            return View();
        }
                
        [HttpPost]
        
        public int PCL_Vice_Captain_2(string number1)
        {
            Session["PCL_Vice_Captain"] = number1;

            int user_id = Convert.ToInt32(Session["PCL_User_ID"].ToString());
            int T_id = Convert.ToInt32(Session["PCL_Tournament_Selection_Create_Team"].ToString());
            string T_name = Session["PCL_Team_Name"].ToString();
            int vc = Convert.ToInt32(Session["PCL_Vice_Captain"].ToString());
            int c = Convert.ToInt32(Session["PCL_Captain"].ToString());
            int p10 = Convert.ToInt32(Session["PCL_All_Rounder1"].ToString());
            int p11 = Convert.ToInt32(Session["PCL_All_Rounder2"].ToString());
            int p1 = Convert.ToInt32(Session["PCL_Batsman1"].ToString());
            int p2 = Convert.ToInt32(Session["PCL_Batsman2"].ToString());
            int p3 = Convert.ToInt32(Session["PCL_Batsman3"].ToString());
            int p4 = Convert.ToInt32(Session["PCL_Batsman4"].ToString());
            int p5 = Convert.ToInt32(Session["PCL_Bowler1"].ToString());
            int p6 = Convert.ToInt32(Session["PCL_Bowler2"].ToString());
            int p7 = Convert.ToInt32(Session["PCL_Bowler3"].ToString());
            int p8 = Convert.ToInt32(Session["PCL_Bowler4"].ToString());
            int p9 = Convert.ToInt32(Session["PCL_Wicket_Keeper"].ToString());

           int result = CRUD.Post_team_players(user_id,p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, c, vc, T_id, T_name);

           return 1;


        }
      
        [HttpPost]
        public int Leader_Board_2(int number1)
        {
          

            Session["PCL_Tournament"] = number1;
            return 1;


        }

        public ActionResult Panda_Home()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }
            else
            {
                int t1 = CRUD.PCL_User_ID_GET(Session["username"].ToString());
                if (t1 == -1)
                {
                    String data = "Something went wrong while connecting with the database.";
                    return View("Checking", (object)data);
                }
                Session["PCL_User_ID"] = t1;

                int result = CRUD.PCL_Login(t1);
                if (result == -1)
                {
                    String data = "Something went wrong while connecting with the database.";
                    return View("Checking", (object)data);
                }

                if (result == 1)
                {
                    int number1 = 5;
                    Session["PCL_Tournament"] = number1;
                }

                return View();

            }

        }

        public ActionResult Pcl_User_Score_View()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Session["PCL_Tournament"]==null)
            {
                String data1 = "How come you here Dude -|- You are not supposed to be here go back home and start again ;-p ";
                return View("Checking", (object)data1);
            }

            int number = Convert.ToInt32(Session["PCL_Tournament"].ToString());
            int res = CRUD.Get_PCL_Tournament_Users(number);
            if (res == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("Checking", (object)data);
            }
            int t1 = Convert.ToInt32(Session["PCL_User_ID"].ToString());
            List<PCL_leaderBoard> users = CRUD.PCL_User_list(number);
         
                foreach (PCL_leaderBoard user in users)
                {
                    if (user.User_ID == t1)
                    {
                        ViewBag.Title = user.SCORE;
                    }
                }

                return View(users);

         

        }
 
        public ActionResult LeaderBoard_View()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            List<Current_Tournament> users = CRUD.PCL_Current_Tournament();

            return View(users);

        }

        public ActionResult Panda_authenticate2()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }


            int t1 = Convert.ToInt32(Session["PCL_User_ID"].ToString());

           
                int t2 = CRUD.PCL_Tournament_ID_GET(t1);
                if (t2 == -1)
                {
                String data = "Something went wrong while connecting with the database.";
                return View("Checking", (object)data);
                }

            Session["PCL_Tournament"] = t2;

                List<Panda_Team_Players> users = CRUD.getAllPlayers(t1, t2);

                return RedirectToAction("TeamPage", (object)users);

        }

        public ActionResult Panda_authenticate()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            int t1 = Convert.ToInt32(Session["PCL_User_ID"].ToString());

            int result = CRUD.PCL_Login(t1);

            if (result == -1)
            {
                String data = "Something went wrong while connecting with the database.";
                return View("Checking", (object)data);
            }
            else if (result == 0)
            {
                String data = "Panda Team Does not Exists! Please Create One First -.-";
                return View("Checking", (object)data);

            }
            else
            {
                int t2 = CRUD.PCL_Tournament_ID_GET(t1);

                Session["PCL_Tournament"] = t2;

                List<Panda_Team_Players> users = CRUD.getAllPlayers(t1,t2);

                return RedirectToAction("TeamPage", (object)users);

            }



        }

        public ActionResult TeamPage()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            int t1 =  Convert.ToInt32(Session["PCL_User_ID"].ToString());
            int t2 =  Convert.ToInt32(Session["PCL_Tournament"].ToString());

            List<Panda_Team_Players> users = CRUD.getAllPlayers(t1,t2);

            return View(users);

        }

        public ActionResult checking()
        {
            return View();
        }

        public ActionResult PCL_Review(string Email,string Subject,string Message)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("LandingPage");

            }

            if (Email.Length == 0 || Subject.Length == 0 || Message.Length == 0)
            {
                String data = "PLease Fill up all the fields first -.-";
                return View("Checking", (object)data);
            }
            else
            {
                int res = CRUD.PCL_Review_Check(Email, Subject, Message);
                if (res == -1)
                {
                    String data = "Something went wrong while connecting with the database.";
                    return View("Checking", (object)data);
                }
                else
                {
                    return RedirectToAction("Panda_Home");
                }
            }
           
        }
      



    }
}