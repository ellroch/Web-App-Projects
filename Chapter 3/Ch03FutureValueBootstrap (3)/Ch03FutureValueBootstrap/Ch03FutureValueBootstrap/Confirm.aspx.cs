using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx04Quotation
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblMonthlyInvestment.Text=Convert.ToInt32(Session["monthlyInvestment"]).ToString("c");
            lblInterest.Text=(Convert.ToDecimal(Session["yearlyInterestRate"])/100).ToString("P");
            lblYears.Text=Convert.ToInt32(Session["years"]).ToString();
            lblFutureValue.Text=Convert.ToDecimal(Session["futureValue"]).ToString("c");

            /* I was having troubles getting ToString to print the strings as currency didnt think to convert them from
             * objects to ints / decimals and then go from those to a string,
             * 
            string MonthlyInvestment.Text=Session["monthlyInvestment"].ToString();
            lblMonthlyInvestment.Text = String.Format("{0:C2}", MonthlyInvestment);
            string Interest=Session["yearlyInterestRate"].ToString();
            lblInterest.Text= String.Format("%{0)", Interest);
            string Years=Session["years"].ToString();
            lblYears.Text= String.Format("{0}", Years);
            string FutureValue=Session["futureValue"].ToString();
            lblFutureValue.Text= String.Format("{0:C2}", FutureValue);
            */
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session["monthlyInvestment"] = null;
            Session["yearlyInterestRate"] = null;
            Session["years"] = null;
            Session["futureValue"] = null;
        }

        protected void btnSendQuotation_Click(object sender, EventArgs e)
        {
            if (validateEmail.IsValid && validateName.IsValid)
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                lblMessage.Text = String.Format("Quotation sent to {0} at {1}", name, email);
            }

        }
    }
}
 