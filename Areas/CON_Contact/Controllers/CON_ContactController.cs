using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using AdminPanel.DAL;
using AdminPanel.BAL;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Reflection;
using AdminPanel.Areas.LOC_Country.Models;
using AdminPanel.Areas.LOC_State.Models;
using AdminPanel.Areas.LOC_City.Models;
using AdminPanel.Areas.CON_Contact.Models;
using AdminPanel.Areas.CON_ContactCategory.Models;

namespace AdminPanel.Areas.CON_Contact.Controllers
{
    [CheckAccess]
    [Area("CON_Contact")]
    [Route("CON_Contact/[controller]/[action]")]
    public class CON_ContactController : Controller
    {
        CON_DAL dalCON = new CON_DAL();
        private IConfiguration Configuration;
        public CON_ContactController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region "SelectAll"
        public IActionResult Index(CON_ContactModel model,int UserID)
        {
                    
            DataTable dt = dalCON.dbo_PR_CON_Contact_SelectAll(UserID);
            return View("CON_ContactList", dt);

        }
        #endregion

        #region "Delete"
        public IActionResult Delete(int ContactID)
        {
            
            
            DataTable dt = dalCON.dbo_PR_CON_Contact_DeleteByPK(ContactID);
            
            return RedirectToAction("Index");

        }
        #endregion

        #region "Add"
        public IActionResult Add(int ContactID)
        {

            DataTable contactcategory = dalCON.dbo_PR_CON_ContactCategory_SelectByDropdownList();
            List<CON_ContactCategory_DropDownModel> list3 = new List<CON_ContactCategory_DropDownModel>();
            foreach (DataRow dr in contactcategory.Rows)
            {
                CON_ContactCategory_DropDownModel vlst = new CON_ContactCategory_DropDownModel();
                vlst.ContactCategoryID = Convert.ToInt32(dr["ContactCategoryID"]);
                vlst.ContactCategoryName = (string)dr["ContactCategoryName"];
                list3.Add(vlst);
            }
            ViewBag.ContactCategoryList = list3;



            LOC_DAL dalLOC = new LOC_DAL();
            DataTable country = dalLOC.dbo_PR_LOC_Country_SelectByDropdownList();

            List<LOC_Country_DropDownModel> list = new List<LOC_Country_DropDownModel>();
            foreach (DataRow dr in country.Rows)
            {
                LOC_Country_DropDownModel vlst = new LOC_Country_DropDownModel();
                vlst.CountryID = Convert.ToInt32(dr["CountryID"]);
                vlst.CountryName = dr["CountryName"].ToString();
                list.Add(vlst);
            }

            ViewBag.CountryList = list;

            List<LOC_State_DropDownModel> list1 = new List<LOC_State_DropDownModel>();
            ViewBag.StateList = list1;

            List<LOC_City_DropDownModel> list2 = new List<LOC_City_DropDownModel>();
            ViewBag.City1List = list2;

            if (ContactID != null)
            {              
                DataTable dt = dalCON.dbo_PR_CON_Contact_SelectByPK(ContactID);
                if (dt.Rows.Count > 0)
                {
                    CON_ContactModel modelCON_Contact = new CON_ContactModel();
                    foreach (DataRow dr in dt.Rows)
                    {
                        modelCON_Contact.ContactID = Convert.ToInt32(dr["ContactID"]);
                        modelCON_Contact.CountryID = Convert.ToInt32(dr["CountryID"]);
                        modelCON_Contact.PhotoPath = (string)dr["PhotoPath"];
                        modelCON_Contact.Name = (string)dr["Name"];
                        modelCON_Contact.Email = (string)dr["Email"];
                        modelCON_Contact.MobileNo = (string)dr["MobileNo"];
                        modelCON_Contact.Address = (string)dr["Address"];
                        modelCON_Contact.Profession = (string)dr["Profession"];
                        modelCON_Contact.CompanyName = (string)dr["CompanyName"];
                        modelCON_Contact.Designation = (string)dr["Designation"];
                        modelCON_Contact.StateID = Convert.ToInt32(dr["StateID"]);
                        modelCON_Contact.CityID = Convert.ToInt32(dr["CityID"]);
                        modelCON_Contact.ContactCategoryID = Convert.ToInt32(dr["ContactCategoryID"]);
                        modelCON_Contact.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                        modelCON_Contact.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);
                        DropDownByCountry(Convert.ToInt32(dr["CountryId"]), list1);
                        DropDownByState(Convert.ToInt32(dr["StateId"]), list2);
                    }

                    return View("CON_ContactAddEdit", modelCON_Contact);
                }
            }
            return View("CON_ContactAddEdit");
        }
        #endregion

        #region "Save"
        public IActionResult Save(CON_ContactModel modelCON_Contact,int UserID)
        {
                     
            if (modelCON_Contact.File != null)
            {
                string FilePath = "wwwroot\\Upload";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, modelCON_Contact.File.FileName);
                modelCON_Contact.PhotoPath = FilePath.Replace("wwwroot\\", "/") + "/" + modelCON_Contact.File.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    modelCON_Contact.File.CopyTo(stream);
                }

            }
            
            if (modelCON_Contact.ContactID == 0)
            {
                DataTable dt = dalCON.dbo_PR_CON_Contact_Insert(modelCON_Contact,UserID);
                TempData["ContactInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalCON.dbo_PR_CON_Contact_UpdateByPK(modelCON_Contact,UserID);
                TempData["ContactUpdateMsg"] = "Record Updated Successfully";
            }

           

            return RedirectToAction("Add");

        }
        #endregion
        public IActionResult DropDownByCountry(int CountryID, List<LOC_State_DropDownModel> state_list)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable statelist = dalLOC.db_PR_LOC_State_DropdownByCountryID(CountryID);
            List<LOC_State_DropDownModel> list1 = new List<LOC_State_DropDownModel>();
            foreach (DataRow dr in statelist.Rows)
            {
                LOC_State_DropDownModel vlst = new LOC_State_DropDownModel();
                vlst.StateID = Convert.ToInt32(dr["StateID"]);
                vlst.StateName = (string)dr["StateName"];
                state_list.Add(vlst);
            }
            var vModel = state_list;
            return Json(vModel);
        }

        public IActionResult DropDownByState(int StateID, List<LOC_City_DropDownModel> city_list)
        {         
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable citylist = dalLOC.db_PR_LOC_City_DropdownByStateID(StateID);
            List<LOC_City_DropDownModel> list = new List<LOC_City_DropDownModel>();
            foreach (DataRow dr in citylist.Rows)
            {
                LOC_City_DropDownModel vlst = new LOC_City_DropDownModel();
                vlst.CityID = Convert.ToInt32(dr["CityID"]);
                vlst.CityName = (string)dr["CityName"];
                city_list.Add(vlst);
            }
            var vModel = city_list;
            return Json(vModel);
        }

        #region "Search"

        public IActionResult Search()
        {
            //string connectionString = this.Configuration.GetConnectionString("Default");

            CON_Contact_SearchModel contact_SearchModel = new CON_Contact_SearchModel();

            contact_SearchModel.CountryName = HttpContext.Request.Form["CountryName"].ToString();
            contact_SearchModel.StateName = HttpContext.Request.Form["StateName"].ToString();
            contact_SearchModel.CityName = HttpContext.Request.Form["CityName"].ToString();
            contact_SearchModel.Category = HttpContext.Request.Form["ContactCategory"].ToString();
            contact_SearchModel.Name = HttpContext.Request.Form["Name"].ToString();
            contact_SearchModel.Email = HttpContext.Request.Form["Email"].ToString();
            contact_SearchModel.Mobile = HttpContext.Request.Form["Mobile"].ToString();

            ViewBag.CountryName = contact_SearchModel.CountryName;
            ViewBag.StateName = contact_SearchModel.StateName;
            ViewBag.CityName = contact_SearchModel.CityName;
            ViewBag.Name = contact_SearchModel.Name;
            ViewBag.Email = contact_SearchModel.Email;
            ViewBag.ContactCategory = contact_SearchModel.Category;

            int userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));
            return View("../CON_Contact/CON_ContactList", dalCON.CON_Contact_Search(contact_SearchModel, userID));
        }

        #endregion
    }
}

