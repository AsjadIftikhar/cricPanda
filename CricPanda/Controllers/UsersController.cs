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
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        // GET: Users
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult SignUp()
        {
            return View();
        }
        //void connectionString()
        //{
        //    con.ConnectionString = "data source=NIMCOMPOOP; database=CricPanda; integrated security = SSPI;";
        //}
        //[HttpPost]
        //public ActionResult Verify(Users users)
        //{
        //    connectionString();
        //    con.Open();
        //    com.Connection = con;
        //    com.CommandText = "select * from Users" +
        //                       "where User_Name='" + users.username + "'and Password='" + users.password + "'";
        //    dr = com.ExecuteReader();

        //    if (dr.Read())
        //    {
        //        con.Close();
        //        return View();
        //    }
        //    else
        //    {
        //        con.Close();
        //        return View();
        //    }

        //}
    }
}