using AdminPanel.Areas.LOC_City.Models;
using AdminPanel.Areas.LOC_Country.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;
using AdminPanel.BAL;
using AdminPanel.Areas.LOC_State.Models;

namespace AdminPanel.DAL
{
    public class LOC_DALBase:DALHelper
    {

        #region "Country"
        public DataTable dbo_PR_LOC_Country_SelectAll(int UserID)
        {
            try 
            { 
              SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
              DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_SelectAll");
                sqlDB.AddInParameter(dbCmd, "UserID", SqlDbType.Int, UserID);
                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCmd))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch(Exception ex) 
            {
                return null;
            }
        }
        public DataTable dbo_PR_LOC_Country_SelectByPK(int CountryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_SelectByPK");
                sqlDB.AddInParameter(dbCmd, "CountryID", SqlDbType.Int,CountryID);
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

        public DataTable dbo_PR_LOC_Country_Insert( string CountryCode, string CountryName, DateTime CreationDate, DateTime ModifiedDate,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_Insert");
                sqlDB.AddInParameter(dbCMD, "CountryName", SqlDbType.NVarChar, CountryName);
                sqlDB.AddInParameter(dbCMD, "CountryCode", SqlDbType.NVarChar, CountryCode);              
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, CreationDate);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, ModifiedDate);
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

        public DataTable dbo_PR_LOC_Country_DeleteByPK(int CountryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);

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

        public DataTable dbo_PR_LOC_Country_UpdateByPK( int CountryID, string CountryCode, string CountryName, DateTime ModifiedDate,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_UpdateByPK");
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);
                sqlDB.AddInParameter(dbCMD, "CountryCode", SqlDbType.NVarChar, CountryCode);
                sqlDB.AddInParameter(dbCMD, "CountryName", SqlDbType.NVarChar, CountryName);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, ModifiedDate);
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

        public DataTable LOC_Country_Search(string connectionString, LOC_Country_SearchModel country_SearchModel, int userID)
        {
            try
            {
                SqlDatabase database = new SqlDatabase(connectionString);
                DbCommand command = database.GetStoredProcCommand("[dbo].[PR_LOC_Country_SelectPage]");

                database.AddInParameter(command, "@CountryName", DbType.String, country_SearchModel.CountryName);
                database.AddInParameter(command, "@CountryCode", DbType.String, country_SearchModel.CountryCode);
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


        #endregion

        #region "State"
        public DataTable dbo_PR_LOC_State_SelectAll(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_SelectAll");
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
        

        public DataTable dbo_PR_LOC_State_Insert( string StateCode, string StateName, int CountryID, DateTime CreationDate, DateTime ModifiedDate,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_Insert");
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);
                sqlDB.AddInParameter(dbCMD, "StateName", SqlDbType.NVarChar, StateName);
                sqlDB.AddInParameter(dbCMD, "StateCode", SqlDbType.NVarChar, StateCode);                              
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, CreationDate);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, ModifiedDate);
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
        public DataTable dbo_PR_LOC_State_SelectByPK(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);

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

        public DataTable dbo_PR_LOC_State_DeleteByPK(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);

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

        public DataTable dbo_PR_LOC_State_UpdateByPK(int StateID, string StateCode, string StateName, int CountryID, DateTime ModifiedDate,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);
                sqlDB.AddInParameter(dbCMD, "StateCode", SqlDbType.NVarChar, StateCode);
                sqlDB.AddInParameter(dbCMD, "StateName", SqlDbType.NVarChar, StateName);
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, ModifiedDate);
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

        public DataTable db_PR_LOC_State_DropdownByCountryID(int CountryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_State_DropdownByCountryID");
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);
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

        public DataTable db_PR_LOC_City_DropdownByStateID(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_DropdownByStateID");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);
                DataTable dt = new DataTable();
                using(IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public DataTable dbo_PR_LOC_Country_SelectByDropdownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_Country_Dropdown");

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

     

        public DataTable LOC_State_Search(LOC_State_SearchModel state_SearchModel, int userID)
        {
            try
            {
                SqlDatabase database = new SqlDatabase(myConnectionString);
                DbCommand command = database.GetStoredProcCommand("[dbo].[PR_LOC_State_SelectPage]");

                database.AddInParameter(command, "@CountryName", DbType.String, state_SearchModel.CountryName);
                database.AddInParameter(command, "@StateName", DbType.String, state_SearchModel.StateName);
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

        #endregion
      

        #region "City"
        public DataTable dbo_PR_LOC_City_SelectAll(int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_SelectAll");
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

        public DataTable dbo_PR_LOC_City_Insert(LOC_CityModel modelLOC_City,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_Insert");

                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, modelLOC_City.CountryID);
                sqlDB.AddInParameter(dbCMD, "CityName", SqlDbType.NVarChar, modelLOC_City.CityName);
                sqlDB.AddInParameter(dbCMD, "CityCode", SqlDbType.NVarChar, modelLOC_City.CityCode);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.Date, modelLOC_City.CreationDate);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelLOC_City.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelLOC_City.StateID);
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

        public DataTable dbo_PR_LOC_City_DeleteByPK(int CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, CityID);

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

        public DataTable dbo_PR_LOC_City_UpdateByPK(LOC_CityModel modelLOC_City,int UserID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_UpdateByPK");

                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelLOC_City.CityID);
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, modelLOC_City.CountryID);
                sqlDB.AddInParameter(dbCMD, "CityName", SqlDbType.NVarChar, modelLOC_City.CityName);
                sqlDB.AddInParameter(dbCMD, "CityCode", SqlDbType.NVarChar, modelLOC_City.CityCode);
                sqlDB.AddInParameter(dbCMD, "ModifiedDate", SqlDbType.Date, modelLOC_City.ModifiedDate);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelLOC_City.StateID);
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

        public DataTable dbo_PR_LOC_City_SelectByPK(int CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCmd = sqlDB.GetStoredProcCommand("dbo.PR_LOC_City_SelectByPK");
                sqlDB.AddInParameter(dbCmd, "CityID", SqlDbType.Int, CityID);


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

        public DataTable LOC_City_Search(LOC_City_SearchModel city_SearchModel, int userID)
        {
            try
            {
                SqlDatabase database = new SqlDatabase(myConnectionString);
                DbCommand command = database.GetStoredProcCommand("[dbo].[PR_LOC_City_SelectPage]");

                database.AddInParameter(command, "@CountryName", DbType.String, city_SearchModel.CountryName);
                database.AddInParameter(command, "@StateName", DbType.String, city_SearchModel.StateName);
                database.AddInParameter(command, "@CityName", DbType.String, city_SearchModel.CityName);
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
        #endregion


    }
}
