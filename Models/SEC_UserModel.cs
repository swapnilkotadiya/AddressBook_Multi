using Microsoft.Build.Framework;
using System.ComponentModel;

namespace AdminPanel.Models
{
    public class SEC_UserModel
    {

        public int UserID { get; set; }
        [Required]
        [DisplayName("User Name")]
        public string UserName { get; set; }
        [Required]
        [DisplayName("Password")]
        public string Password { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? EmailAddress { get; set; }

        public string? PhotoPath { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
