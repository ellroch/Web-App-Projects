using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ch03FutureValueBootstrap
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                for (int i = 50; i <= 500; i += 50)
                    ddlMonthlyInvestment.Items.Add(i.ToString());
            lblMessage.Text = "Enter the Price and Discount Amount, and click Calculate";
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int monthlyInvestment = Convert.ToInt32(ddlMonthlyInvestment.SelectedValue);
                decimal yearlyInterestRate = Convert.ToDecimal(txtInterestRate.Text);
                int years = Convert.ToInt32(txtYears.Text);

                decimal futureValue = this.CalculateFutureValue(monthlyInvestment,
                    yearlyInterestRate, years);

                lblFutureValue.Text = futureValue.ToString("c");

                Session["monthlyInvestment"] = monthlyInvestment;
                Session["yearlyInterestRate"] = yearlyInterestRate;
                Session["years"] = years;
                Session["futureValue"] = futureValue;

            }
        }

        protected decimal CalculateFutureValue(int monthlyInvestment,
        decimal yearlyInterestRate, int years)
        {
            int months = years * 12;
            decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;
            decimal futureValue = 0;
            for (int i = 0; i < months; i++)
            {
                futureValue = (futureValue + monthlyInvestment)
                    * (1 + monthlyInterestRate);
            }
            return futureValue;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlMonthlyInvestment.SelectedIndex = 0;
            txtInterestRate.Text = "";
            txtYears.Text = "";
            lblFutureValue.Text = "";
            Session["monthlyInvestment"] = null;
            Session["yearlyInterestRate"] = null;
            Session["years"] = null;
            Session["futureValue"] = null;
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (Session["futureValue"] == null)
            {
                lblMessage.Text = "you must calculate first before confirming.";
            }
            else
            {
                Response.Redirect("Confirm.aspx");
            }
        }

        
    }
}