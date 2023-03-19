using System.ComponentModel.DataAnnotations;

namespace AdminPanel.Areas.LOC_Country.Models
{
    public class LOC_CountryModel
    {
        public int CountryID { get; set; }
        public int UserID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string CountryName { get; set; }
        [Required]
        public string CountryCode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }



    }
    public class LOC_Country_DropDownModel
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }

    }
    public class LOC_Country_SearchModel
    {
        public string? CountryName { get; set; }

        public string? CountryCode { get; set; }
    }
}
