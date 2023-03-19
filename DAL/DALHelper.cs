namespace AdminPanel.DAL
{
    public class DALHelper
    {
        public static string myConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("myConnetionString");
    }
}
