using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CricPanda.Models;
using System.Data.SqlClient;


namespace CricPanda.Controllers
{
    public class UsersController : Controller
    {

      

        //AFter this are all my Pages
        public ActionResult Teams()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");

            }
            List<Team> Teams = CRUD.getAllTeams();

            return View(Teams);
        }
        public ActionResult TeamInfo(string id)

        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");


            }
            int Team_ID = Convert.ToInt32(id);
            Team myTeam = CRUD.getTeam(Team_ID);
            

            List<Players> players = CRUD.getAllPlayers(Team_ID);

            ViewBag.team = myTeam;

            return View(players);
        }
        public ActionResult TeamMatch(string id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");

            }
            int Team_ID = Convert.ToInt32(id);
            Team myTeam = CRUD.getTeam(Team_ID);

            List<Match> Matches = CRUD.getFixtures(Team_ID);
            ViewBag.MatchList = Matches;
            ViewBag.team = myTeam;

            return View();
        }
       
       
        public ActionResult SelectTournament()
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");


            }

            List<Tournaments> T = CRUD.getAllTournamnets();

            return View(T);
        }
        public ActionResult Stats(string id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");

            }
            int TID = Convert.ToInt32(id);

            Stats T = CRUD.getRecords(TID);
            string T_Name = CRUD.getTourn(TID);

            ViewBag.TID = TID;
            ViewBag.T_Name = T_Name;
            return View(T);
        }
        public ActionResult PTtable(string id)
        {
            if (Session["username"] == null)
            {
                return RedirectToAction("../home/LandingPage");


            }
            int TID = Convert.ToInt32(id);
            List<Ptable> P = CRUD.getPointTable(TID);
            string T_Name = CRUD.getTourn(TID);

            ViewBag.TID = TID;
            ViewBag.T_Name = T_Name;

            return View(P);
        }

        //Admin Panel
        //Create
        public ActionResult Create()
        {
            if(Session["username"].ToString()!="admin123" && Session["password"].ToString()!="admin123")
            {
                return RedirectToAction("../home/LiveScore");
            }
            List<Team> Teams = CRUD.getAllTeams();
            List<Tournaments> T = CRUD.getAllTournamnets();

            ViewBag.T = T;
            ViewBag.Teams = Teams;
            return View();
        }
        public ActionResult AddT(string Tname, String Tloc, string sdate, string edate)
        {
            int result = CRUD.Add_T(Tname, Tloc, sdate, edate);
            string message = null;
            if (result == 0)
            {
                message = "Tournament Added";
            }
            else if (result == -1)
            {
                message = "Tournament Location Invalid";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Team> Teams = CRUD.getAllTeams();
            List<Tournaments> T = CRUD.getAllTournamnets();

            ViewBag.T = T;
            ViewBag.Teams = Teams;

            return View("Create", (object)message);
        }
        public ActionResult AddTeam(string tname, String flag)
        {
            int result = CRUD.Add_Team(tname, flag);
            string message = null;
            if (result == 1)
            {
                message = "Team Added";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Team> Teams = CRUD.getAllTeams();
            List<Tournaments> T = CRUD.getAllTournamnets();

            ViewBag.T = T;
            ViewBag.Teams = Teams;

            return View("Create", (object)message);
        }
        public ActionResult AddTT(string Team, string Tourna)
        {
            Tuple<int, int> Both = CRUD.getBoth(Team, Tourna);

            int result = CRUD.Add_TT(Both.Item1, Both.Item2);
            string message = null;
            if (result == 1)
            {
                message = "Team Added to Tournament";
            }
            else if (result == -1)
            {
                message = "Team is already in Tournament";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Team> Teams = CRUD.getAllTeams();
            List<Tournaments> T = CRUD.getAllTournamnets();

            ViewBag.T = T;
            ViewBag.Teams = Teams;

            return View("Create", (object)message);
        }
        public ActionResult AddPlayer(string pname, String dob, string role, string Team)
        {
            string waste = CRUD.getTourn(1);
            Tuple<int, int> Both = CRUD.getBoth(Team, waste);

            int result = CRUD.Add_Player(pname, dob, role, Both.Item1);
            string message = null;
            if (result == 1)
            {
                message = "Player Added";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Team> Teams = CRUD.getAllTeams();
            List<Tournaments> T = CRUD.getAllTournamnets();

            ViewBag.T = T;
            ViewBag.Teams = Teams;

            return View("Create", (object)message);
        }
        //DELETE PART
        public ActionResult Delete()
        {
            if (Session["username"].ToString() != "admin123" && Session["password"].ToString() != "admin123")
            {
                return RedirectToAction("../home/LiveScore");
            }
            List<Players> Players = CRUD.getAllPlayers();
            List<Stadium> stadium = CRUD.getStadium();

            ViewBag.Players = Players;
            ViewBag.stadium = stadium;

            return View();
        }
        public ActionResult RemovePlayer(string pname)
        {
            int result = CRUD.Remove_Player(pname);
            string message = null;
            if (result == 1)
            {
                message = "Player Removed";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Players> Players = CRUD.getAllPlayers();
            List<Stadium> stadium = CRUD.getStadium();

            ViewBag.Players = Players;
            ViewBag.stadium = stadium;

            return View("Delete", (object)message);
        }
        public ActionResult RStadium(string stadium)
        {
            int result = CRUD.Remove_Stadium(stadium);
            string message = null;
            if (result == 1)
            {
                message = "Stadium Removed";
            }
            else
            {
                message = "Something Went Wrong";
            }
            List<Players> Players = CRUD.getAllPlayers();
            List<Stadium> s = CRUD.getStadium();

            ViewBag.Players = Players;
            ViewBag.stadium = s;

            return View("Delete", (object)message);
        }
        //Update Part:
        public ActionResult Update()
        {
            if (Session["username"].ToString() != "admin123" && Session["password"].ToString() != "admin123")
            {
                return RedirectToAction("../home/LiveScore");
            }
            List<Match> M = CRUD.getFixtures();
            List<Players> Players = CRUD.getAllPlayers();


            ViewBag.Players = Players;
            ViewBag.Fix = M;


            return View();
        }
        public ActionResult UpdateMatch(int MID, string pname)
        {
            int result = CRUD.Update_Match(MID, pname);
            string message = null;
            if (result == 1)
            {
                message = "Match Updated ";
            }
            else if (result == 0)
            {
                message = "Player did not play in that match";
            }
            else
            {
                message = "Winner couldn't be decided";
            }
            List<Match> M = CRUD.getFixtures();
            List<Players> Players = CRUD.getAllPlayers();


            ViewBag.Players = Players;
            ViewBag.Fix = M;

            return View("Update", (object)message);
        }

    }
}