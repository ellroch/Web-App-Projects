using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx11Reservation
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

       
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Thank you for your request.<br />" +
                              "We will get back to you within 24 hours.";
        }
    }
}