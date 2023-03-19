using Microsoft.Build.Framework;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = Microsoft.Build.Framework.RequiredAttribute;

namespace AdminPanel.Areas.CON_Contact.Models
{
    public class CON_ContactModel
    {
        public int ContactID { get; set; }
        [Required]
        [DisplayName("Country Name")]
        public int CountryID { get; set; }
        [Required]
        [DisplayName("State Name")]
        public int StateID { get; set; }
        [Required]
        [DisplayName("City Name")]
        public int CityID { get; set; }
        [Required]
        [DisplayName("Category Name")]
        public int ContactCategoryID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Name { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [StringLength(10, MinimumLength = 10)]
        public string MobileNo { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 10)]
        public string Address { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Profession { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string CompanyName { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Designation { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public IFormFile File { get; set; }
        public string PhotoPath { get; set; }

    }

    public class CON_Contact_SearchModel
    {
        public string? CountryName { get; set; }

        public string? StateName { get; set; }

        public string? CityName { get; set; }

        public string? Category { get; set; }

        public string? Name { get; set; }

        public string? Email { get; set; }

        public string? Mobile { get; set; }
    }
}
