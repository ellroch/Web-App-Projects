using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SomethingBroke : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Exception ex = (Exception)Session["Exception"];
            if (ex.InnerException == null)
            {
                lblError.Text = ex.Message;
            }
            else
            {
                lblError.Text = ex.InnerException.Message;
            }
        }
    }
}