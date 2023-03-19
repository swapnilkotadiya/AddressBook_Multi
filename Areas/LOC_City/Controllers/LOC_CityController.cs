using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using AdminPanel.DAL;
using AdminPanel.Areas.LOC_Country.Models;
using AdminPanel.Areas.LOC_State.Models;
using AdminPanel.Areas.LOC_City.Models;
using AdminPanel.BAL;

namespace AdminPanel.Areas.LOC_City.Controllers
{
    [CheckAccess]
    [Area("LOC_City")]
    [Route("LOC_City/[controller]/[action]")]
    public class LOC_CityController : Controller
    {
        LOC_DAL dalLOC = new LOC_DAL();
        private IConfiguration Configuration;
        public LOC_CityController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region "SelectAll"
        public IActionResult Index(int UserID)
        {
                    
            DataTable dt = dalLOC.dbo_PR_LOC_City_SelectAll(UserID);
            return View("LOC_CityList", dt);
        }
        #endregion

        #region "Delete"
        public IActionResult Delete(int CityID)
        {
            
           
            DataTable dt = dalLOC.dbo_PR_LOC_City_DeleteByPK(CityID);
            
            return RedirectToAction("Index");
        }
        #endregion

        #region "Add"
        public IActionResult Add(int CityID)
        {
            //string str = Configuration.GetConnectionString("myConnetionString");
            //DataTable dt1 = new DataTable();
            //SqlConnection conn1 = new SqlConnection(str);
            //conn1.Open();
            //SqlCommand cmd1 = conn1.CreateCommand();
            //cmd1.CommandType = CommandType.StoredProcedure;
            //cmd1.CommandText = "PR_LOC_Country_Dropdown";
            //SqlDataReader objSDR1 = cmd1.ExecuteReader();
            //dt1.Load(objSDR1);
            //conn1.Close();
            DataTable country = dalLOC.dbo_PR_LOC_Country_SelectByDropdownList();

            List<LOC_Country_DropDownModel> list = new List<LOC_Country_DropDownModel>();
            foreach (DataRow dr in country.Rows)
            {
                LOC_Country_DropDownModel vlst = new LOC_Country_DropDownModel();
                vlst.CountryID = Convert.ToInt32(dr["CountryID"]);
                vlst.CountryName = (string)dr["CountryName"];
                list.Add(vlst);
            }
            ViewBag.CountryList = list;

            List<LOC_State_DropDownModel> list1 = new List<LOC_State_DropDownModel>();
            ViewBag.StateList = list1;


            if (CityID != 0)
            {
                //LOC_DALBase dalLOC = new LOC_DALBase();
                //DataTable dt = dalLOC.dbo_PR_LOC_State_SelectByPK(str);
                //SqlConnection conn = new SqlConnection(str);
                //conn.Open();
                //SqlCommand cmd = conn.CreateCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "PR_LOC_City_SelectByPK";
                //cmd.Parameters.Add("@CityID", SqlDbType.Int).Value = CityID;
                //DataTable dt = new DataTable();
                //SqlDataReader objSDR = cmd.ExecuteReader();
                //dt.Load(objSDR);
                DataTable dt = dalLOC.dbo_PR_LOC_City_SelectByPK(CityID);
                 if (dt.Rows.Count > 0)
                {
                    LOC_CityModel modelLOC_City = new LOC_CityModel();
                    foreach (DataRow dr in dt.Rows)
                    {

                        modelLOC_City.CityID = Convert.ToInt32(dr["CityID"]);
                        modelLOC_City.CountryID = Convert.ToInt32(dr["CountryID"]);
                        modelLOC_City.StateID = Convert.ToInt32(dr["StateID"]);
                        modelLOC_City.CityName = (string)dr["CityName"];
                        modelLOC_City.CityCode = (string)dr["CityCode"];
                        modelLOC_City.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);
                        DropDownByCountry(Convert.ToInt32(dr["CountryId"]), list1);
                    }

                    return View("LOC_CityAddEdit", modelLOC_City);
                }
            }
            return View("LOC_CityAddEdit");
        }
        #endregion

        #region "Save"
        public IActionResult Save(LOC_CityModel modelLOC_City,int UserID)
        {

            

            

            if (modelLOC_City.CityID == 0)
            {
                DataTable dt = dalLOC.dbo_PR_LOC_City_Insert(modelLOC_City,UserID);
                TempData["CityInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalLOC.dbo_PR_LOC_City_UpdateByPK(modelLOC_City,UserID);
                TempData["CityUpdateMsg"] = "Record Updated Successfully";
            }
            

            return RedirectToAction("Add");

        }
        #endregion

        public IActionResult DropDownByCountry(int CountryID, List<LOC_State_DropDownModel> state_list)
        {
            string str = Configuration.GetConnectionString("myConnetionString");
            DataTable dt1 = new DataTable();
            SqlConnection conn1 = new SqlConnection(str);
            conn1.Open();
            SqlCommand cmd1 = conn1.CreateCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "PR_LOC_State_DropdownByCountryID";
            cmd1.Parameters.AddWithValue("@CountryID", CountryID);
            SqlDataReader objSDR1 = cmd1.ExecuteReader();
            dt1.Load(objSDR1);
            conn1.Close();

            List<LOC_State_DropDownModel> list1 = new List<LOC_State_DropDownModel>();
            foreach (DataRow dr in dt1.Rows)
            {
                LOC_State_DropDownModel vlst = new LOC_State_DropDownModel();
                vlst.StateID = Convert.ToInt32(dr["StateID"]);
                vlst.StateName = (string)dr["StateName"];
                state_list.Add(vlst);
            }
            var vModel = state_list;
            return Json(vModel);
        }

        #region "Search"

        public IActionResult Search()
        {
            //string connectionString = this.configuration.GetConnectionString("Default");

            LOC_City_SearchModel city_SearchModel = new LOC_City_SearchModel();

            city_SearchModel.CountryName = HttpContext.Request.Form["CountryName"].ToString();
            city_SearchModel.StateName = HttpContext.Request.Form["StateName"].ToString();
            city_SearchModel.CityName = HttpContext.Request.Form["CityName"].ToString();

            ViewBag.CountryName = city_SearchModel.CountryName;
            ViewBag.StateName = city_SearchModel.StateName;
            ViewBag.CityName = city_SearchModel.CityName;

            int userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));

            return View("../LOC_City/LOC_CityList", dalLOC.LOC_City_Search( city_SearchModel, userID));
        }

        #endregion
    }
}
