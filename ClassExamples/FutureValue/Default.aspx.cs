using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Images_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {
            for(int i=50; i<=1000; i = i + 50)
            {
                ddlMonthlyInvestment.Items.Add(i.ToString());
            }
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlMonthlyInvestment.SelectedIndex = 0;
        txtInterest.Text = "";
        txtYears.Text= "";
        lblFutureValue.Text = "";
    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        int monthlyInvestment = Convert.ToInt32(ddlMonthlyInvestment.SelectedValue);
        decimal yearlyInterestRate = Convert.ToDecimal(txtInterest.Text);
        int years = Convert.ToInt32(txtYears.Text);

        int month = years * 12;
        decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;
        decimal futureValue = 0;

        for (int i=0; i<month; i++)
        {
            futureValue = (futureValue + monthlyInvestment) * (1 + monthlyInterestRate);
        }
        lblFutureValue.Text = futureValue.ToString("c");
    }
}