using Microsoft.Build.Framework;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = Microsoft.Build.Framework.RequiredAttribute;

namespace AdminPanel.Areas.CON_ContactCategory.Models
{
    public class CON_ContactCategoryModel
    {
        public int? ContactCategoryID { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 3)]
        public string ContactCategoryName { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
    public class CON_ContactCategory_DropDownModel
    {
        public int ContactCategoryID { get; set; }
        public string ContactCategoryName { get; set; }
    }
    public class CON_ContactCategory_SearchModel
    {
        public string? ContactCategory { get; set; }
    }
}
