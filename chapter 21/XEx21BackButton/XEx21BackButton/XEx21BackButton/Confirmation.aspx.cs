﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx21BackButton
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var customer = (Customer)Session["Customer"];
            var date = DateTime.Today.AddDays(1).ToShortDateString();
            lblConfirm.Text = $"Thank you for your order, {customer.FirstName}! It will be shipped on {date}.";
        }
    }
}