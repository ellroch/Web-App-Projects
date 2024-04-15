using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCalc_Click(object sender, EventArgs e)
    {
        decimal price= Convert.ToDecimal(txtPrice.Text);
        decimal discount= Convert.ToDecimal(txtDiscount.Text);
        decimal discountAmt = price*(discount/100);
        decimal total = price-discountAmt;

        lblDiscount.Text = discountAmt.ToString("c");
        lblTotal.Text = total.ToString("c");
    }
}