using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace db_connectivity.Models
{
    public class CRUD
    {
        public static string connectionString = "data source=DESKTOP-MS9UKFA\\NIMCOMPOOP;Initial Catalog=CP;Integrated Security=true;";


        ///////////////////////////////////////////  Usman Bhai  ///////////////////////////////////////////



        public static List<PreferencePageModel> getAllTeams()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayTeams", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PreferencePageModel> list = new List<PreferencePageModel>();
                while (rdr.Read())
                {
                    PreferencePageModel team = new PreferencePageModel();

                    team.userId = rdr["Team_ID"].ToString();
                    team.name = rdr["Team_Name"].ToString();
                    team.ImgUrl = rdr["Flag"].ToString();
                    list.Add(team);
                }
                rdr.Close();
                con.Close();

                return list;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("Hey there error occurred here----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static Users getUserInfo(String username, String password)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("GetUserByCred", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 20).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 10).Value = password;

                SqlDataReader rdr = cmd.ExecuteReader();
                Users user = new Users();

                while (rdr.Read())
                {
                    user.user_id = (int)rdr["User_ID"];
                    user.first_name = rdr["First_Name"].ToString() + " ";
                    user.last_name = rdr["Last_Name"].ToString();
                    user.username = rdr["User_Name"].ToString();
                    user.password = rdr["Password"].ToString();
                    user.data_of_birth = rdr["DOB"].ToString();
                    user.team_pref = rdr["Team_Name"].ToString();
                    user.team_pref_img = rdr["Flag"].ToString();
                }
                rdr.Close();
                con.Close();
                if (user.data_of_birth == "")
                {
                    user.data_of_birth = "no DoB provided";
                }

                return user;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("Hey there error occurred here----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;

            }

        }
        public static List<LiveScoreModel> getLiveScore()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("liveScore", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();
                List<LiveScoreModel> livescores = new List<LiveScoreModel>();

                while (rdr.Read())
                {
                    LiveScoreModel live = new LiveScoreModel();

                    live.match_ID = (int)rdr["Match_ID"];
                    live.tounamentName = rdr["Tournnament Name"].ToString();
                    live.tournamentLocation = rdr["Location"].ToString();
                    live.matchDate = rdr["Match date"].ToString();
                    live.team1Name = rdr["Team1"].ToString();
                    live.team2Name = rdr["Team2"].ToString();
                    live.team1Flag = rdr["Team1_flag"].ToString();
                    live.team2Flag = rdr["Team2_flag"].ToString();
                    live.stadium = rdr["Stadium"].ToString();
                    livescores.Add(live);
                }
                rdr.Close();
                con.Close();

                return livescores;
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Hey there error occurred here----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return null;
            }
        }
        public static int setPref(String username, String password, String teamName)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {
                cmd = new SqlCommand("TEAM_PREF", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 20).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 10).Value = password;
                cmd.Parameters.Add("@T_PREF", SqlDbType.NVarChar, 50).Value = teamName;

                cmd.ExecuteNonQuery();
                result = 0;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int checkPref(String username, String password)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {
                cmd = new SqlCommand("CHECK_PREF", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 20).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 10).Value = password;


                cmd.Parameters.Add("@status", SqlDbType.Bit).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@status"].Value);

            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int Login(string nickname, string pass)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {
                cmd = new SqlCommand("login", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@nickname", SqlDbType.NVarChar, 50).Value = nickname;
                cmd.Parameters.Add("@pass", SqlDbType.NVarChar, 50).Value = pass;


                cmd.Parameters.Add("@output", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@output"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int SignUp(string userId, string firstname, string lastname, string password, string dateOfBirth)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {
                cmd = new SqlCommand("SIGNUP", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@username", SqlDbType.NVarChar, 20).Value = userId;
                cmd.Parameters.Add("@firstname", SqlDbType.NVarChar, 10).Value = firstname;
                cmd.Parameters.Add("@lastname", SqlDbType.NVarChar, 10).Value = lastname;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 10).Value = password;
                cmd.Parameters.Add("@DOB", SqlDbType.NVarChar, 20).Value = dateOfBirth;

                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@status"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }






        /////////////////////////////////////////////  Tayyab Bhai  ////////////////////////////////////////////////



        public static List<Tournament> GetTournaments(string opt)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("displayTournamentsWithCondition", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@status", SqlDbType.NVarChar, 20).Value = opt;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Tournament> list = new List<Tournament>();
                while (rdr.Read())
                {
                    Tournament user = new Tournament();
                    user.Tournament_id = Convert.ToInt32(rdr["ID"].ToString());
                    user.Tournament_Name = rdr["Tournament Name"].ToString();
                    user.Tournament_Location = rdr["Location"].ToString();
                    user.Tournament_Start_Date = rdr["Start date"].ToString();
                    user.Tournament_End_Date = rdr["End date"].ToString();
                    list.Add(user);
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
        //For MATCHES
        public static List<Taab_Matches> GetTaabMatches(int Tour_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Matches_In_Tournaments", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@tour_id", SqlDbType.Int, 8).Value = Tour_id;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Taab_Matches> list = new List<Taab_Matches>();
                while (rdr.Read())
                {
                    Taab_Matches user = new Taab_Matches();
                    user.Tournament_Name = rdr["Tournament_Name"].ToString();
                    user.match_id = Convert.ToInt32(rdr["Match_ID"].ToString());
                    user.Team1 = rdr["Team1"].ToString();
                    user.Team2 = rdr["Team2"].ToString();
                    user.match_date = rdr["Match date"].ToString();
                    list.Add(user);
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
        //For ScoreCard
        public static List<ScoreCard1> GetScoreCard(int match_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Scorecard1", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Match_id", SqlDbType.Int).Value = match_id;

                SqlDataReader rdr = cmd.ExecuteReader();
                List<ScoreCard1> list = new List<ScoreCard1>();

                ScoreCard1 user = new ScoreCard1();
                rdr.Read();

                user.Tournament_Name = rdr["Tournament_Name"].ToString();
                user.Loc = rdr["Loc"].ToString();
                user.Team1 = rdr["Team1"].ToString();
                user.Team2 = rdr["Team2"].ToString();
                user.Winner_Team = rdr["Winner_Team"].ToString();
                user.Stadium_Name = rdr["Stadium_Name"].ToString();
                user.MOM = rdr["MOM"].ToString();
                user.Match_Date = rdr["Match_Date"].ToString();
                list.Add(user);

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
        //Team 1 stats
        public static List<ScoreCard2> GetScoreCard1(int match_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Scorecard2", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Match_id", SqlDbType.Int).Value = match_id;

                SqlDataReader rdr = cmd.ExecuteReader();
                List<ScoreCard2> list = new List<ScoreCard2>();


                while (rdr.Read())
                {
                    ScoreCard2 user = new ScoreCard2();
                    user.Match_ID = rdr["Match_ID"].ToString();
                    user.Player_ID = rdr["Player_ID"].ToString();
                    user.Runs_scored = rdr["Runs_scored"].ToString();
                    user.Balls_Faced = rdr["Balls_Faced"].ToString();
                    user.Sixes = rdr["Sixes"].ToString();
                    user.Wickets_Taken = rdr["Wickets_Taken"].ToString();
                    user.Runs_Conceded = rdr["Runs_Conceded"].ToString();
                    user.Total_Overs_Bowled = rdr["Total_Overs_Bowled"].ToString();
                    user.Player_Name = rdr["Player_Name"].ToString();
                    user.P_ID = rdr["Player_ID"].ToString();
                    list.Add(user);
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
        //Team 2 stats
        public static List<ScoreCard2> GetScoreCard2(int match_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Scorecard3", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Match_id", SqlDbType.Int).Value = match_id;

                SqlDataReader rdr = cmd.ExecuteReader();
                List<ScoreCard2> list = new List<ScoreCard2>();


                while (rdr.Read())
                {
                    ScoreCard2 user = new ScoreCard2();

                    user.Match_ID = rdr["Match_ID"].ToString();
                    user.Player_ID = rdr["Player_ID"].ToString();
                    user.Runs_scored = rdr["Runs_scored"].ToString();
                    user.Balls_Faced = rdr["Balls_Faced"].ToString();
                    user.Sixes = rdr["Sixes"].ToString();
                    user.Wickets_Taken = rdr["Wickets_Taken"].ToString();
                    user.Runs_Conceded = rdr["Runs_Conceded"].ToString();
                    user.Total_Overs_Bowled = rdr["Total_Overs_Bowled"].ToString();
                    user.Player_Name = rdr["Player_Name"].ToString();
                    user.P_ID = rdr["Player_ID"].ToString();
                    list.Add(user);
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
        public static List<ScoreCard4> GetScoreCard4(int match_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Scorecard4", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Match_id", SqlDbType.Int).Value = match_id;

                SqlDataReader rdr = cmd.ExecuteReader();



                List<ScoreCard4> list = new List<ScoreCard4>();


                while (rdr.Read())
                {
                    ScoreCard4 user = new ScoreCard4();

                    user.Team1 = rdr["Team1"].ToString();
                    user.Team2 = rdr["Team2"].ToString();
                    user.Runs_Scored1 = rdr["Runs_Scored1"].ToString();
                    user.Wickets_Taken1 = rdr["Wickets_Taken1"].ToString();
                    user.Overs_Bowled1 = rdr["Overs_Bowled1"].ToString();
                    user.Runs_Scored2 = rdr["Runs_Scored2"].ToString();
                    user.Wickets_Taken2 = rdr["Wickets_Taken2"].ToString();
                    user.Overs_Bowled2 = rdr["Overs_Bowled2"].ToString();
                    list.Add(user);
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




        ///////////////////////////////////////////////// PANDA LEAGUE ////////////////////////////////////////////




        public static int PCL_User_ID_GET(string id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("pcl_get_user_id", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = id;

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                int res   = Convert.ToInt32(cmd.Parameters["@flag"].Value);

             
            

              
                con.Close();

                return res;

            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -1;

            }

        }
        public static int PCL_Tournament_ID_GET(int id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("pcl_Tournament_ID", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
             
                cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = id;

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                int res = Convert.ToInt32(cmd.Parameters["@flag"].Value);


                con.Close();

                return res;

            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -1;

            }

        }
        public static List<Panda_Team_Players> getAllPlayers(int t1,int t2)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Team_Viewer", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter();
                p1.ParameterName = "@User_ID";
                p1.Value = t1;
                cmd.Parameters.Add(p1);

                SqlParameter p2 = new SqlParameter();
                p2.ParameterName = "@Tournament_ID";
                p2.Value = t2;
                cmd.Parameters.Add(p2);


                SqlDataReader rdr = cmd.ExecuteReader();

                List<Panda_Team_Players> list = new List<Panda_Team_Players>();
                while (rdr.Read())
                {
                    Panda_Team_Players user = new Panda_Team_Players();
                    user.Player_ID = Convert.ToInt32(rdr["Player_ID"].ToString());
                    user.Player_Name = rdr["Player_Name"].ToString();
                    user.Player_Pts = Convert.ToInt32(rdr["Player_Pts"].ToString());
                    user.Player_Role = rdr["Player_Role"].ToString();
                    user.Team_ID = Convert.ToInt32(rdr["Team_ID"].ToString());
                    user.Team_Name = rdr["Team_Name"].ToString();
                    user.Tournament_ID = Convert.ToInt32(rdr["Tournament_ID"].ToString());

                    list.Add(user);
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
        public static List<PCL_leaderBoard> PCL_User_list(int number)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {

                cmd = new SqlCommand("Leader_board", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = number;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_leaderBoard> list = new List<PCL_leaderBoard>();
                while (rdr.Read())
                {
                    PCL_leaderBoard user = new PCL_leaderBoard();

                    user.SCORE = Convert.ToInt32(rdr["SCORE"].ToString());
                    user.User_ID = Convert.ToInt32(rdr["User_ID"].ToString());
                    user.User_Name = rdr["User_Name"].ToString();
                    list.Add(user);
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

        public static List<Current_Tournament> PCL_Current_Tournament()
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Current_Tournament", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<Current_Tournament> list = new List<Current_Tournament>();
                while (rdr.Read())
                {
                    Current_Tournament user = new Current_Tournament();

                    user.Tournamnet_ID = Convert.ToInt32(rdr["Tournamnet_ID"].ToString());
                    user.Tournament_Name = rdr["Tournament_Name"].ToString();
                    list.Add(user);
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
        public static int PCL_Login(int t)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {

                cmd = new SqlCommand("pcl_user_check", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = t;

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@flag"].Value);

            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static List<User> getAllUsers()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("ViewUsers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<User> list = new List<User>();
                while (rdr.Read())
                {
                    User user = new User();

                    user.userId = rdr["userId"].ToString();
                    user.password = rdr["password"].ToString();
                    user.dateOfBirth = rdr["dateOfBirth"].ToString();
                    list.Add(user);
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
        public static List<PCL_Player> get_PCL_Wicket_Keeper(int t1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Team_View_For_Selection_Wicket", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = t1;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_Player> list = new List<PCL_Player>();
                while (rdr.Read())
                {
                    PCL_Player user = new PCL_Player();

                    user.Player_ID =  Convert.ToInt32( rdr["Player_ID"].ToString());
                    user.Player_Name = rdr["Player_Name"].ToString();
                  
                    list.Add(user);
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
        public static List<PCL_Player> get_PCL_Bowlers(int t1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Team_View_For_Selection_Bowler", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = t1;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_Player> list = new List<PCL_Player>();
                while (rdr.Read())
                {
                    PCL_Player user = new PCL_Player();

                    user.Player_ID = Convert.ToInt32(rdr["Player_ID"].ToString());
                    user.Player_Name = rdr["Player_Name"].ToString();

                    list.Add(user);
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
        public static List<PCL_Player> get_PCL_Batsman(int t1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Team_View_For_Selection_Batsman", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = t1;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_Player> list = new List<PCL_Player>();
                while (rdr.Read())
                {
                    PCL_Player user = new PCL_Player();

                    user.Player_ID = Convert.ToInt32(rdr["Player_ID"].ToString());
                    user.Player_Name = rdr["Player_Name"].ToString();

                    list.Add(user);
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
        public static List<PCL_Player> get_PCL_All_Rounders(int t1)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("Team_View_For_Selection_All", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = t1;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_Player> list = new List<PCL_Player>();
                while (rdr.Read())
                {
                    PCL_Player user = new PCL_Player();

                    user.Player_ID = Convert.ToInt32(rdr["Player_ID"].ToString());
                    user.Player_Name = rdr["Player_Name"].ToString();

                    list.Add(user);
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
        public static int Team_Name_Authentication_2(string userId)
        {

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
            int result = 0;

            try
            {
                cmd = new SqlCommand("user_name_check", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@User_Name", SqlDbType.NVarChar, 50).Value = userId;


                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                result = Convert.ToInt32(cmd.Parameters["@flag"].Value);



            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                result = -1; //-1 will be interpreted as "error while connecting with the database."
            }
            finally
            {
                con.Close();
            }
            return result;

        }
        public static int Post_team_players(int user_id,int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8, int p9, int p10, int p11, int c, int vc, int T_id,string T_name)
        {


            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("ADD_USERS_IN_PCL", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@User_ID", SqlDbType.Int).Value = user_id;
                cmd.Parameters.Add("@Team_Name", SqlDbType.VarChar, 50).Value = T_name;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = T_id;
                cmd.Parameters.Add("@Player1_ID", SqlDbType.Int).Value = p1;
                cmd.Parameters.Add("@Player2_ID", SqlDbType.Int).Value = p2;
                cmd.Parameters.Add("@Player3_ID", SqlDbType.Int).Value = p3;
                cmd.Parameters.Add("@Player4_ID", SqlDbType.Int).Value = p4;
                cmd.Parameters.Add("@Player5_ID", SqlDbType.Int).Value = p5;
                cmd.Parameters.Add("@Player6_ID", SqlDbType.Int).Value = p6;
                cmd.Parameters.Add("@Player7_ID", SqlDbType.Int).Value = p7;
                cmd.Parameters.Add("@Player8_ID", SqlDbType.Int).Value = p8;
                cmd.Parameters.Add("@Player9_ID", SqlDbType.Int).Value = p9;
                cmd.Parameters.Add("@Player10_ID", SqlDbType.Int).Value = p10;
                cmd.Parameters.Add("@Player11_ID", SqlDbType.Int).Value = p11;
                cmd.Parameters.Add("@Cap_ID", SqlDbType.Int).Value = c;
                cmd.Parameters.Add("@Vice_Cap_ID", SqlDbType.Int).Value = vc;

                cmd.ExecuteNonQuery();
                con.Close();

                return 1;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -1;

            }
        }
        public static int PCL_Review_Check(string Email, string Subject, string Message)
        {
          
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;

            try
            {
                cmd = new SqlCommand("PCL_add_response", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = Email ;
                cmd.Parameters.Add("@Subject", SqlDbType.NVarChar, 50).Value = Subject;
                cmd.Parameters.Add("@Message", SqlDbType.NVarChar, 500).Value = Message;
                
               
                cmd.ExecuteNonQuery();
                con.Close();

                return 1;


            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -1;

            }
        }
        public static int Get_PCL_Tournament_Users(int T_id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd;
           


            try
            {
                cmd = new SqlCommand("Get_PCL_User", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = T_id;

                SqlDataReader rdr = cmd.ExecuteReader();

                List<PCL_users> list = new List<PCL_users>();
                while (rdr.Read())
                {
                    PCL_users user = new PCL_users();

                    user.User_ID = Convert.ToInt32( rdr["User_ID"].ToString());
                  
                    list.Add(user);
                }
                rdr.Close();


                foreach (PCL_users user1 in list)
                {

                    SqlCommand cmd2;
                    cmd2 = new SqlCommand("SET_POINTS", con);
                    cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd2.Parameters.Add("@User_ID", SqlDbType.Int).Value = user1.User_ID;
                    cmd2.Parameters.Add("@Tournament_ID", SqlDbType.Int).Value = T_id;
                   
                    cmd2.ExecuteNonQuery();
                    cmd2.Dispose();

                }

                con.Close();
                return 1;
            }

            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
                return -1;

            }

        }

    }


}


namespace CricPanda.Models
{
    public class CRUD
    {
        public static string connectionString = "data source=DESKTOP-MS9UKFA\\NIMCOMPOOP;Initial Catalog=CP;Integrated Security=true;";



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

                    M.Team1 = rdr["T1"].ToString();
                    M.TeamFlag1 = rdr["T1F"].ToString();
                    M.Team2 = rdr["T2"].ToString();
                    M.TeamFlag2 = rdr["T2F"].ToString();
                    M.Date = rdr["Match_Date"].ToString();
                    M.Stadium = rdr["Stadium_City"].ToString();
                    M.Tournament = rdr["Tournament_Name"].ToString();
                    M.Match_ID = Convert.ToInt32(rdr["Match_ID"].ToString());
                   
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




