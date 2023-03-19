using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Text;
using AdminPanel.DAL;
using System.Security.Cryptography.X509Certificates;
using AdminPanel.Areas.LOC_Country.Models;
using AdminPanel.Areas.LOC_State.Models;
using AdminPanel.BAL;

namespace AdminPanel.Areas.LOC_State.Controllers
{
    [CheckAccess]
    [Area("LOC_State")]
    [Route("LOC_State/[controller]/[action]")]
    public class LOC_StateController : Controller
    {
        LOC_DAL dalLOC = new LOC_DAL();
        private IConfiguration Configuration;
        public LOC_StateController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #region "SelectAll"
        public IActionResult Index(int UserID,LOC_CountryModel modelLOC_Country, LOC_StateModel modelLOC_State)
        {
          
            DataTable dt = dalLOC.dbo_PR_LOC_State_SelectAll(UserID);
            return View("LOC_StateList", dt);
        }
        #endregion

        #region "Delete"
        public IActionResult Delete(int StateID)
        {
            
           
            DataTable dt = dalLOC.dbo_PR_LOC_State_DeleteByPK(StateID);
            
            return RedirectToAction("Index");

        }
        #endregion

        #region "Add"
        public IActionResult Add(int StateID)
        {
            
            DataTable dt1 = dalLOC.dbo_PR_LOC_Country_SelectByDropdownList();

            List<LOC_Country_DropDownModel> list = new List<LOC_Country_DropDownModel>();
            foreach (DataRow dr in dt1.Rows)
            {
                LOC_Country_DropDownModel vlst = new LOC_Country_DropDownModel();
                vlst.CountryID = Convert.ToInt32(dr["CountryID"]);
                vlst.CountryName = (string)dr["CountryName"];
                list.Add(vlst);
            }
            ViewBag.CountryList = list;



            if (StateID != null)
            {
                
                DataTable dt = dalLOC.dbo_PR_LOC_State_SelectByPK(StateID);
               
                if (dt.Rows.Count > 0)
                {
                    LOC_StateModel modelLOC_State = new LOC_StateModel();
                    foreach (DataRow dr in dt.Rows)
                    {
                        modelLOC_State.StateID = Convert.ToInt32(dr["StateID"]);
                        modelLOC_State.CountryID = Convert.ToInt32(dr["CountryID"]);
                        modelLOC_State.StateName = (string)dr["StateName"];
                        modelLOC_State.StateCode = (string)dr["StateCode"];
                        modelLOC_State.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelLOC_State.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);
                    }
                    
                    return View("LOC_StateAddEdit", modelLOC_State);
                }
            }
            return View("LOC_StateAddEdit");
        }
        #endregion

        #region "Save"
        public IActionResult Save(LOC_StateModel modelLOC_State, string conn, int StateID, DateTime CreationDate, string StateName, string StateCode, int CountryID, DateTime ModifiedDate,int UserID)
        {
            
            


            if (modelLOC_State.StateID == 0)
            {
                DataTable dt = dalLOC.dbo_PR_LOC_State_Insert( StateCode, StateName, CountryID, CreationDate, ModifiedDate,UserID);
                TempData["Msg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalLOC.dbo_PR_LOC_State_UpdateByPK( StateID, StateCode, StateName, CountryID, ModifiedDate,UserID);
                TempData["Msg"] = "Record Updated Successfully";
            }


            return RedirectToAction("Add");

        }
        #endregion

        #region "Search"

        public IActionResult Search()
        {
           // string connectionString = this.Configuration.GetConnectionString(myConnectionString);

            LOC_State_SearchModel state_SearchModel = new LOC_State_SearchModel();

            state_SearchModel.CountryName = HttpContext.Request.Form["CountryName"].ToString();
            state_SearchModel.StateName = HttpContext.Request.Form["StateName"].ToString();

            int userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));

            ViewBag.CountryName = state_SearchModel.CountryName;
            ViewBag.StateName = state_SearchModel.StateName;

            return View("../LOC_State/LOC_StateList", dalLOC.LOC_State_Search(state_SearchModel, userID));
        }

        #endregion
    }
}
