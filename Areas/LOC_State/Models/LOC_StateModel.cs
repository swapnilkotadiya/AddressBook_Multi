using Microsoft.Build.Framework;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = Microsoft.Build.Framework.RequiredAttribute;

namespace AdminPanel.Areas.LOC_State.Models
{
    public class LOC_StateModel
    {
        public int StateID { get; set; }
        [Required]
        [DisplayName("Country Name")]
        public int CountryID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string StateName { get; set; }
        [Required]
        public string StateCode { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public int? UserID { get; set; }


    }

    public class LOC_State_DropDownModel
    {
        public int StateID { get; set; }
        public int CountryID { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }
    }
    public class LOC_State_SearchModel
    {
        public string? CountryName { get; set; }

        public string? StateName { get; set; }
    }
}
