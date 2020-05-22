using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;


namespace CricPanda.Models
{
    public class CRUD
    {

        public static string connectionString = "data source=DESKTOP-MS9UKFA\\NIMCOMPOOP;Initial Catalog=CricPanda;Integrated Security=true;";

        public static List<Team> getAllTeams()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayAllTeams", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Team> list = new List<Team>();

                //user.userId = rdr["userId"].ToString();
                while (rdr.Read())
                {
                    Team T = new Team();

                    T.Team_Name = rdr["Team_Name"].ToString();
                    T.Flag = rdr["Flag"].ToString();
                    T.Team_ID = Convert.ToInt32(rdr["Team_ID"]);

                    list.Add(T);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static Team getTeam(int Team_ID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("GetTeam", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@teamid", SqlDbType.Int).Value = Team_ID;

                SqlDataReader rdr = cmd.ExecuteReader();
                Team myTeam = new Team();
                if (rdr.Read())
                {
                    myTeam.Team_Name = rdr["Team_Name"].ToString();
                    myTeam.Flag = rdr["Flag"].ToString();
                    myTeam.Team_ID = Team_ID;
                }



                //user.userId = rdr["userId"].ToString();

                rdr.Close();
                con.Close();

                return myTeam;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

        public static String getTourn(int TID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("TournamentName", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                SqlDataReader rdr = cmd.ExecuteReader();
                String T_Name = null;
                if (rdr.Read())
                {
                    T_Name = rdr["Tournament_Name"].ToString();
                }



                //user.userId = rdr["userId"].ToString();

                rdr.Close();
                con.Close();

                return T_Name;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

        public static List<Players> getAllPlayers(int Team_ID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("DisplayPlayers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@teamid", SqlDbType.Int).Value = Team_ID;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Players> list = new List<Players>();

                //user.userId = rdr["userId"].ToString();
                while (rdr.Read())
                {
                    Players P = new Players();

                    P.Player_Name = rdr["Player_Name"].ToString();
                    P.Age = Convert.ToInt32(rdr["Age"]);
                    P.Player_Role = rdr["Player_Role"].ToString();

                    list.Add(P);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static List<Match> getFixtures(int Team_ID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayFixtures", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@teamid", SqlDbType.Int).Value = Team_ID;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Match> list = new List<Match>();

                //user.userId = rdr["userId"].ToString();
                while (rdr.Read())
                {
                    Match M = new Match();

                    M.Match_ID = Convert.ToInt32(rdr["Match_ID"].ToString());
                    M.Team1 = rdr["T1"].ToString();
                    M.TeamFlag1 = rdr["T1F"].ToString();
                    M.Team2 = rdr["T2"].ToString();
                    M.TeamFlag2 = rdr["T2F"].ToString();
                    M.Date = rdr["Match_Date"].ToString();
                    M.Stadium = rdr["Stadium_City"].ToString();
                    M.Tournament = rdr["Tournament_Name"].ToString();

                    list.Add(M);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static Stats getRecords(int TID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                string p1 = null, p2 = null, p3 = null, p4 = null, p5 = null, p6 = null, p7 = null, p8 = null, p9 = null;
                int r1 = 0, r2 = 0, r3 = 0, r5 = 0, c5 = 0, r6 = 0, r9 = 0;
                float r4 = 0.0F, r7 = 0.0F, r8 = 0.0F;

                cmd = new SqlCommand("MostRuns", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p1 = rdr["Player_Name"].ToString();
                    r1 = Convert.ToInt32(rdr["Runs"]);

                }
                cmd = new SqlCommand("MostFifties", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p2 = rdr["Player_Name"].ToString();
                    r2 = Convert.ToInt32(rdr["TALLY"]);

                }

                cmd = new SqlCommand("MostHundreds", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p3 = rdr["Player_Name"].ToString();
                    r3 = Convert.ToInt32(rdr["TALLY"]);

                }

                cmd = new SqlCommand("HIAVG", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p4 = rdr["Player_Name"].ToString();

                    r4 = float.Parse(rdr["Hav_g"].ToString());


                }

                cmd = new SqlCommand("TOPSCORE", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p5 = rdr["Player_Name"].ToString();
                    r5 = Convert.ToInt32(rdr["Runs_Scored"]);
                    c5 = Convert.ToInt32(rdr["Balls_Faced"]);
                }

                cmd = new SqlCommand("MOSTWICKETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p6 = rdr["Player_Name"].ToString();
                    r6 = Convert.ToInt32(rdr["wickets"]);

                }

                cmd = new SqlCommand("BESTECO", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Float).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p7 = rdr["Player_Name"].ToString();
                    r7 = float.Parse(rdr["Eco"].ToString());

                }

                cmd = new SqlCommand("BESTB_AVG", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Float).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p8 = rdr["Player_Name"].ToString();
                    r8 = float.Parse(rdr["BAVG"].ToString());

                }
                cmd = new SqlCommand("MOSTCATCHES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                rdr.Close();
                rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    p9 = rdr["Player_Name"].ToString();
                    r9 = Convert.ToInt32(rdr["Catches"]);

                }
                Stats S = new Stats();
                S.p1 = p1;
                S.p2 = p2;
                S.p3 = p3;
                S.p4 = p4;
                S.p5 = p5;
                S.p6 = p6;
                S.p7 = p7;
                S.p8 = p8;
                S.p9 = p9;

                S.r1 = r1; S.r2 = r2; S.r3 = r3; S.r4 = r4; S.r5 = r5; S.r6 = r6; S.r7 = r7; S.r8 = r8; S.r9 = r9; S.c5 = c5;



                rdr.Close();
                con.Close();
                return S;

            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

        public static List<Ptable> getPointTable(int TID)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("PT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = TID;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Ptable> list = new List<Ptable>();

                int i = 1;
                while (rdr.Read())
                {
                    Ptable M = new Ptable();

                    M.Team = rdr["Team"].ToString();
                    M.Flag = rdr["flag"].ToString();
                    M.Total = Convert.ToInt32(rdr["total"]);
                    M.Wins = Convert.ToInt32(rdr["Wins"]);
                    M.Rating = float.Parse(rdr["Rating"].ToString());
                    M.Lost = M.Total - M.Wins;
                    M.pos = i;

                    list.Add(M);

                    i++;
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

        public static List<Tournaments> getAllTournamnets()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayAllTournaments", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Tournaments> list = new List<Tournaments>();

                while (rdr.Read())
                {
                    Tournaments T = new Tournaments();
                    T.Tid = Convert.ToInt32(rdr["Tournament_ID"]);
                    T.Name = rdr["Tournament_Name"].ToString();
                    T.loc = rdr["Tournament_Location"].ToString();
                    T.s_date = rdr["Tournament_Start_Date"].ToString();
                    T.e_Date = rdr["Tournament_End_Date"].ToString();

                    list.Add(T);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

        //Admin:
        //Add:
        public static int Add_T(string Tname, string Tloc, string sdate, string edate)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = -2;
                cmd = new SqlCommand("C_TOURNA", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tname", SqlDbType.VarChar).Value = Tname;
                cmd.Parameters.Add("@Tloc", SqlDbType.VarChar).Value = Tloc;
                cmd.Parameters.Add("@sdate", SqlDbType.Date).Value = sdate;
                cmd.Parameters.Add("@edate", SqlDbType.Date).Value = edate;

                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -2;

            }

        }
        public static int Add_Team(string tname, string flag)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("ADDTEAM", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tname", SqlDbType.VarChar).Value = tname;
                cmd.Parameters.Add("@flag", SqlDbType.VarChar, 100).Value = flag;

                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return 0;

            }

        }
        public static int Add_TT(int Team, int Tourna)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("ADDTT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@teamid", SqlDbType.Int).Value = Team;
                cmd.Parameters.Add("@tid", SqlDbType.Int).Value = Tourna;

                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return 0;

            }

        }
        public static int Add_Player(string pname, string dob, string role, int Team)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("ADDPLAYER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = pname;
                cmd.Parameters.Add("@dob", SqlDbType.Date).Value = dob;
                cmd.Parameters.Add("@prole", SqlDbType.VarChar).Value = role;
                cmd.Parameters.Add("@teamid", SqlDbType.Int).Value = Team;


                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return 0;

            }

        }

        //Remove:
        public static int Remove_Player(string pname)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("R_PLAYER", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@pid", SqlDbType.VarChar).Value = pname;
               

                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return 0;

            }

        }
        public static int Remove_Stadium(string stadium)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("R_STADIUM", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@sid", SqlDbType.VarChar).Value = stadium;


                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return 0;

            }

        }
        //Update:
        public static int Update_Match(int mid, string mom)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                int result = 0;
                cmd = new SqlCommand("UP_MATCH", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@mid", SqlDbType.Int).Value = mid;
                cmd.Parameters.Add("@mom", SqlDbType.VarChar).Value = mom;


                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

                con.Close();

                return result;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -2;

            }

        }



        //Get functions
        public static Tuple<int, int> getBoth(string Team, string Tourna)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("getBoth", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@teamid", SqlDbType.VarChar).Value = Team;
                cmd.Parameters.Add("@tid", SqlDbType.VarChar).Value = Tourna;


                cmd.Parameters.Add("@OT1", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@OT2", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();

                int team = Convert.ToInt32(cmd.Parameters["@OT2"].Value);
                int tou = Convert.ToInt32(cmd.Parameters["@OT1"].Value);

                Tuple<int, int> P = new Tuple<int, int>(team, tou);

                con.Close();

                return P;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static List<Stadium> getStadium()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayStadiums", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Stadium> list = new List<Stadium>();

                //user.userId = rdr["userId"].ToString();
                while (rdr.Read())
                {
                    Stadium T = new Stadium();

                    T.city = rdr["Stadium_City"].ToString();


                    list.Add(T);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static List<Players> getAllPlayers()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayAllPlayers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
               

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Players> list = new List<Players>();

                while (rdr.Read())
                {
                    Players P = new Players();

                    P.Player_Name = rdr["Player_Name"].ToString();

                    list.Add(P);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static List<Match> getFixtures()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("display_Fixtures", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
               

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Match> list = new List<Match>();

                //user.userId = rdr["userId"].ToString();
                while (rdr.Read())
                {
                    Match M = new Match();

                    M.Match_ID = Convert.ToInt32(rdr["Match_ID"].ToString());
                    M.Team1 = rdr["T1"].ToString();
                    M.TeamFlag1 = rdr["T1F"].ToString();
                    M.Team2 = rdr["T2"].ToString();
                    M.TeamFlag2 = rdr["T2F"].ToString();
                    M.Date = rdr["Match_Date"].ToString();
                    M.Stadium = rdr["Stadium_City"].ToString();
                    M.Tournament = rdr["Tournament_Name"].ToString();


                    list.Add(M);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }

    }
}