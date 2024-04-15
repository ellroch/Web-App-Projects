using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx11Reservation
{
    public partial class Request : System.Web.UI.Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            Response.Redirect("Confirm.aspx");
        }
    }
}