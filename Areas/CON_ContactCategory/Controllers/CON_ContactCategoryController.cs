using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using AdminPanel.DAL;
using AdminPanel.Areas.CON_ContactCategory.Models;
using AdminPanel.BAL;

namespace AdminPanel.Areas.CON_ContactCategory.Controllers
{
    [CheckAccess]
    [Area("CON_ContactCategory")]
    [Route("CON_ContactCategory/[controller]/[action]")]
    public class CON_ContactCategoryController : Controller
    {
        CON_DALBase dalCON = new CON_DALBase();
        private IConfiguration Configuration;
        public CON_ContactCategoryController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        public IActionResult Index(int UserID)
        {
            
            DataTable dt = dalCON.dbo_PR_CON_ContactCategory_SelectAll(UserID);
            return View("CON_ContactCategoryList", dt);
            

        }
        public IActionResult Delete(int ContactCategoryID)
        {
            
            DataTable dt = dalCON.dbo_PR_CON_ContactCategory_DeleteByPK(ContactCategoryID);
            return RedirectToAction("Index");

        }
        public IActionResult Add(int ContactCategoryID)
        {
            if (ContactCategoryID != null)
            {            
                DataTable dt = dalCON.dbo_PR_CON_ContactCategory_SelectByPK(ContactCategoryID);
                CON_ContactCategoryModel modelCON_ContactCategory = new CON_ContactCategoryModel();
                foreach (DataRow dr in dt.Rows)
                {
                    modelCON_ContactCategory.ContactCategoryID = Convert.ToInt32(dr["ContactCategoryID"]);
                    modelCON_ContactCategory.ContactCategoryName = (string)dr["ContactCategoryName"];
                    modelCON_ContactCategory.CreationDate = Convert.ToDateTime(dr["CreationDate"]);
                    modelCON_ContactCategory.ModifiedDate = Convert.ToDateTime(dr["ModifiedDate"]);
                }
                
                return View("CON_ContactCategoryAddEdit", modelCON_ContactCategory);
            }
            return View("CON_ContactCategoryAddEdit");
        }

        public IActionResult Save(CON_ContactCategoryModel modelCON_ContactCategory,int UserID)
        {
           
            if (modelCON_ContactCategory.ContactCategoryID == null)
            {
                DataTable dt = dalCON.dbo_PR_CON_ContactCategory_Insert(modelCON_ContactCategory,UserID);
                TempData["ContactCategoryInsertMsg"] = "Record Inserted Successfully";
            }
            else
            {
                DataTable dt = dalCON.dbo_PR_CON_ContactCategory_UpdateByPK(modelCON_ContactCategory,UserID);
                TempData["ContactCategoryUpdateMsg"] = "Record Updated Successfully";
            }
           

            return View("CON_ContactCategoryAddEdit");

        }
        #region SEARCH_BOX

        public IActionResult Search()
        {
            //string connectionString = this.Configuration.GetConnectionString("Default");

            CON_ContactCategory_SearchModel contactCategory_SearchModel = new CON_ContactCategory_SearchModel();
            contactCategory_SearchModel.ContactCategory = HttpContext.Request.Form["ContactCategory"].ToString();
            ViewBag.ContactCategory = contactCategory_SearchModel.ContactCategory;

            int userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));

            return View("../CON_ContactCategory/CON_ContactCategoryList", dalCON.CON_ContactCategory_Search(contactCategory_SearchModel, userID));
        }

        #endregion


    }
}
