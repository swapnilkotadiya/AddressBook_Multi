using Microsoft.Build.Framework;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = Microsoft.Build.Framework.RequiredAttribute;

namespace AdminPanel.Areas.LOC_City.Models
{
    public class LOC_CityModel
    {

        [Required]
        [DisplayName("CountryName")]
        public int CountryID { get; set; }
        [Required]
        [DisplayName("StateName")]
        public int StateID { get; set; }
        public int CityID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string CityName { get; set; }
        [Required]
        public string CityCode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
    public class LOC_City_DropDownModel
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
    }
    public class LOC_City_SearchModel
    {
        public string? CountryName { get; set; }

        public string? StateName { get; set; }

        public string? CityName { get; set; }
    }
}
