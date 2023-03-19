using AdminPanel.Areas.LOC_Country.Models;
using AdminPanel.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using AdminPanel.BAL;

namespace AdminPanel.Areas.LOC_Country.Controllers
{
    [CheckAccess]
    [Area("LOC_Country")]
    [Route("LOC_Country/[controller]/[action]")]
    public class LOC_CountryController : Controller
    {
        LOC_DAL dalLOC = new LOC_DAL();
        private IConfiguration Configuration;
        public LOC_CountryController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #region "SelectAll"
        public IActionResult Index(LOC_CountryModel modelLOC_Country)
        {
            //string str = this.Configuration.GetConnectionString("myConnetionString");
            //LOC_DAL dalLOC= new LOC_DAL();
            //DataTable dt = dalLOC.dbo_PR_LOC_Country_SelectAll(str);
            //return View("LOC_CountryList", dt);
            string str = Configuration.GetConnectionString("myConnetionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();


            if (modelLOC_Country.CountryName == null && modelLOC_Country.CountryCode == null)
            {

                cmd.CommandText = "dbo.PR_LOC_Country_SelectAll";
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = CV.UserID();
            }
            else
            {
                cmd.CommandText = "dbo.PR_LOC_Country_SelectBYCountryNameCode";

                if (modelLOC_Country.CountryName == null)
                {
                    cmd.Parameters.AddWithValue("@CountryName", DBNull.Value);
                }
                else
                {
                    cmd.Parameters.Add("@CountryName", SqlDbType.NVarChar).Value = modelLOC_Country.CountryName;

                }

                if (modelLOC_Country.CountryCode != null)
                {
                    cmd.Parameters.Add("@CountryCode", SqlDbType.NVarChar).Value = modelLOC_Country.CountryCode;
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CountryCode", DBNull.Value);
                }

            }

            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            conn.Close();


            SqlConnection conn2 = new SqlConnection(str);
            conn2.Open();
            SqlCommand objcmd2 = conn2.CreateCommand();
            objcmd2 = conn2.CreateCommand();
            objcmd2.CommandType = CommandType.StoredProcedure;
            objcmd2.CommandText = "dbo.PR_LOC_Country_Dropdown";
            DataTable dt2 = new DataTable();
            SqlDataReader sdr2 = objcmd2.ExecuteReader();
            dt2.Load(sdr2);

            List<LOC_Country_DropDownModel> countryDropdownList = new List<LOC_Country_DropDownModel>();
            foreach (DataRow dr1 in dt2.Rows)
            {
                LOC_Country_DropDownModel vlst = new LOC_Country_DropDownModel();
                vlst.CountryName = dr1["CountryName"].ToString();
                countryDropdownList.Add(vlst);
            }
            ViewBag.CountryList = countryDropdownList;
            conn2.Close();



            return View("LOC_CountryList", dt);

        }
        #endregion

        #region "Delete"
        public IActionResult Delete(int CountryID)
        {
            
            
            DataTable dt = dalLOC.dbo_PR_LOC_Country_DeleteByPK(CountryID);
           
            return RedirectToAction("Index");

        }
        #endregion

        #region "Add"
        public IActionResult Add(int CountryID)
        {
            if (CountryID != null)
            {
                             
                DataTable dt = dalLOC.dbo_PR_LOC_Country_SelectByPK(CountryID);
                //SqlConnection conn = new SqlConnection(str);
                //conn.Open();
                //SqlCommand cmd = conn.CreateCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "PR_LOC_Country_SelectByPK";
                //cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
                //DataTable dt = new DataTable();
                //SqlDataReader objSDR = cmd.ExecuteReader();
                //dt.Load(objSDR);
                if (dt.Rows.Count > 0)
                {
                    LOC_CountryModel modelLOC_Country = new LOC_CountryModel();
                    foreach (DataRow dr in dt.Rows)
                    {

                        modelLOC_Country.CountryID = Convert.ToInt32(dr["CountryID"]);
                        modelLOC_Country.CountryName = (string)dr["CountryName"];
                        modelLOC_Country.CountryCode = (string)dr["CountryCode"];
                        modelLOC_Country.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelLOC_Country.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);
                    }

                    return View("LOC_CountryAddEdit", modelLOC_Country);
                }
            }
            return View("LOC_CountryAddEdit");
        }
        #endregion

        #region "Insert"
        public IActionResult Save(LOC_CountryModel modelLOC_Country, string conn, int CountryID, DateTime CreationDate, string CountryName, string CountryCode, DateTime ModifiedDate,int UserID)
        {
           
            

            if (modelLOC_Country.CountryID == 0)
            {
                DataTable dt = dalLOC.dbo_PR_LOC_Country_Insert(CountryCode, CountryName, CreationDate, ModifiedDate,UserID);
                TempData["CountryInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalLOC.dbo_PR_LOC_Country_UpdateByPK(CountryID, CountryCode, CountryName, ModifiedDate,UserID);
                TempData["CountryUpdateMsg"] = "Record Updated Successfully";
            }



            return View("LOC_CountryAddEdit");

        }

        #endregion

        #region "Search"
        public IActionResult Search()
        {
            string connectionString = this.Configuration.GetConnectionString("myConnetionString");

            LOC_Country_SearchModel country_SearchModel = new LOC_Country_SearchModel();

            country_SearchModel.CountryName = HttpContext.Request.Form["CountryName"].ToString();
            country_SearchModel.CountryCode = HttpContext.Request.Form["CountryCode"].ToString();

            int userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));

            ViewBag.CountryName = country_SearchModel.CountryName;
            ViewBag.CountryCode = country_SearchModel.CountryCode;

            return View("../LOC_Country/LOC_CountryList", dalLOC.LOC_Country_Search(connectionString, country_SearchModel, userID));
        }

        #endregion

    }
}
