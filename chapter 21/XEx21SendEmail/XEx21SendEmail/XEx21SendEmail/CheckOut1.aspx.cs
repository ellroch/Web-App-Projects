using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx21SendEmail
{
    public partial class CheckOut1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var customer = new Customer();
                customer.FirstName = txtFirstName.Text;
                customer.LastName = txtLastName.Text;
                customer.EmailAddress = txtEmail.Text;
                customer.Address = txtAddress.Text;
                customer.City = txtCity.Text;
                customer.State = txtState.Text;
                customer.Zip = txtZip.Text;
                customer.Phone = txtPhone.Text;
                Session["Customer"] = customer;
                Response.Redirect("~/CheckOut2.aspx");
            }  
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Response.Redirect("~/Order.aspx");
        }
    }
}