using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using AdminPanel.Areas.CON_Contact.Models;
using AdminPanel.Areas.CON_ContactCategory.Models;
using AdminPanel.BAL;

namespace AdminPanel.DAL
{
    public class CON_DALBase : DALHelper
    {
        #region "Contact"

        public DataTable dbo_PR_CON_Contact_SelectAll(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_CON_Contact_SelectAll");
                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, CV.UserID());
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable dbo_PR_CON_Contact_SelectByPK(int ContactID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_Contact_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "ContactID", SqlDbType.Int, ContactID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable dbo_PR_CON_Contact_Insert(CON_ContactModel modelCON_Contact,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_Contact_Insert");

                sqlDB.AddInParameter(dbCMD, "Name", SqlDbType.NVarChar, modelCON_Contact.Name);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelCON_Contact.Address);
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, modelCON_Contact.CountryID);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelCON_Contact.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelCON_Contact.CityID);
                sqlDB.AddInParameter(dbCMD, "Profession", SqlDbType.NVarChar, modelCON_Contact.Profession);
                sqlDB.AddInParameter(dbCMD, "CompanyName", SqlDbType.NVarChar, modelCON_Contact.CompanyName);
                sqlDB.AddInParameter(dbCMD, "Designation", SqlDbType.NVarChar, modelCON_Contact.Designation);
                sqlDB.AddInParameter(dbCMD, "MobileNo", SqlDbType.NVarChar, modelCON_Contact.MobileNo);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelCON_Contact.Email);
                sqlDB.AddInParameter(dbCMD, "ContactCategoryID", SqlDbType.Int, modelCON_Contact.ContactCategoryID);
                sqlDB.AddInParameter(dbCMD, "PhotoPath", SqlDbType.NVarChar, modelCON_Contact.PhotoPath);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, modelCON_Contact.CreationDate);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelCON_Contact.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CV.UserID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable dbo_PR_CON_Contact_UpdateByPK(CON_ContactModel modelCON_Contact,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_Contact_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "ContactID", SqlDbType.Int,modelCON_Contact.ContactID);
                sqlDB.AddInParameter(dbCMD, "Name", SqlDbType.NVarChar, modelCON_Contact.Name);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelCON_Contact.Address);
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, modelCON_Contact.CountryID);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelCON_Contact.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelCON_Contact.CityID);
                sqlDB.AddInParameter(dbCMD, "Profession", SqlDbType.NVarChar, modelCON_Contact.Profession);
                sqlDB.AddInParameter(dbCMD, "CompanyName", SqlDbType.NVarChar, modelCON_Contact.CompanyName);
                sqlDB.AddInParameter(dbCMD, "Designation", SqlDbType.NVarChar, modelCON_Contact.Designation);
                sqlDB.AddInParameter(dbCMD, "MobileNo", SqlDbType.NVarChar, modelCON_Contact.MobileNo);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelCON_Contact.Email);
                sqlDB.AddInParameter(dbCMD, "ContactCategoryID", SqlDbType.Int, modelCON_Contact.ContactCategoryID);
                sqlDB.AddInParameter(dbCMD, "PhotoPath", SqlDbType.NVarChar, modelCON_Contact.PhotoPath);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelCON_Contact.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CV.UserID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable dbo_PR_CON_Contact_DeleteByPK(int ContactID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_Contact_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "ContactID", SqlDbType.Int, ContactID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable dbo_PR_CON_ContactCategory_SelectByDropdownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_ContactCategory_Dropdown");

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion
        public DataTable dbo_PR_CON_ContactCategory_SelectAll(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("PR_CON_ContactCategory_SelectAll");
                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, CV.UserID());
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable dbo_PR_CON_ContactCategory_SelectByPK(int ContactCategoryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("PR_CON_ContactCategory_SelectByPK");
                sqlDB.AddInParameter(dbCmd, "ContactCategoryID", SqlDbType.Int,ContactCategoryID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable dbo_PR_CON_ContactCategory_Insert(CON_ContactCategoryModel modelCON_ContactCategory,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_CON_ContactCategory_Insert");

                sqlDB.AddInParameter(dbCMD, "ContactCategoryName", SqlDbType.NVarChar, modelCON_ContactCategory.ContactCategoryName);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, modelCON_ContactCategory.CreationDate);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelCON_ContactCategory.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CV.UserID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable dbo_PR_CON_ContactCategory_UpdateByPK(CON_ContactCategoryModel modelCON_ContactCategory,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_CON_ContactCategory_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "ContactCategoryID", SqlDbType.Int, modelCON_ContactCategory.ContactCategoryID);
                sqlDB.AddInParameter(dbCMD, "ContactCategoryName", SqlDbType.NVarChar, modelCON_ContactCategory.ContactCategoryName);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelCON_ContactCategory.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CV.UserID());


                DataTable dt = new DataTable();

                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);

                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable dbo_PR_CON_ContactCategory_DeleteByPK(int ContactCategoryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_CON_ContactCategory_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "ContactCategoryID", SqlDbType.Int, ContactCategoryID);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch (Exception e)
            {

                return null;

            }
        }

        public DataTable? CON_ContactCategory_Search( CON_ContactCategory_SearchModel contactCategory_SearchModel, int userID)
        {
            try
            {
                SqlDatabase database = new SqlDatabase(myConnectionString);
                DbCommand command = database.GetStoredProcCommand("[dbo].[PR_CON_ContactCategory_SelectPage]");

                database.AddInParameter(command, "@ContactCategory", DbType.String, contactCategory_SearchModel.ContactCategory);
                database.AddInParameter(command, "@UserID", SqlDbType.Int, userID);

                DataTable dt = new DataTable();

                using (IDataReader dataReader = database.ExecuteReader(command))
                {
                    dt.Load(dataReader);
                }
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
                return null;
            }
        }

        public DataTable? CON_Contact_Search(CON_Contact_SearchModel contact_SearchModel, int userID)
        {
            try
            {
                SqlDatabase database = new SqlDatabase(myConnectionString);
                DbCommand command = database.GetStoredProcCommand("[dbo].[PR_CON_Contact_SelectPage]");

                database.AddInParameter(command, "@CountryName", DbType.String, contact_SearchModel.CountryName);
                database.AddInParameter(command, "@StateName", DbType.String, contact_SearchModel.StateName);
                database.AddInParameter(command, "@CityName", DbType.String, contact_SearchModel.CityName);
                database.AddInParameter(command, "@ContactCategory", DbType.String, contact_SearchModel.Category);
                database.AddInParameter(command, "@Name", DbType.String, contact_SearchModel.Name);
                database.AddInParameter(command, "@Email", DbType.String, contact_SearchModel.Email);
                database.AddInParameter(command, "@Mobile", DbType.String, contact_SearchModel.Mobile);
                database.AddInParameter(command, "@UserID", SqlDbType.Int, userID);

                DataTable dt = new DataTable();

                using (IDataReader dataReader = database.ExecuteReader(command))
                {
                    dt.Load(dataReader);
                }
                return dt;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
                return null;
            }
        }




    }
}