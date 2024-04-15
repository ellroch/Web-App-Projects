using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace XEx19HalloweenStore
{
    public partial class CheckOut2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var customer = (Customer)Session["Customer"];
                customer.ShippingMethod = rblShipping.SelectedValue;
                customer.CardType = ddlCardType.SelectedValue;
                customer.CardNumber = txtCardNumber.Text;
                customer.ExpirationDate = txtExpiration.Text;
                Session.Remove("Cart");
                Response.Redirect("~/Confirmation.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Session.Remove("Customer");
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string url = ConfigurationManager.AppSettings["UnsecurePath"] + "Order.aspx";
            Response.Redirect(url);
        }
    }
}