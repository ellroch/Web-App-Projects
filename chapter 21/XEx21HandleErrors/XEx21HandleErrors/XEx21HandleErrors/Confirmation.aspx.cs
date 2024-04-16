using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;

namespace XEx21HandleErrors
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var customer = (Customer)Session["Customer"];
            var date = DateTime.Today.AddDays(1).ToShortDateString();
            var text = $"Thank you for your order, {customer.FirstName}! It will be shipped on {date}.";

            lblConfirm.Text = text;
            SendConfirmation(customer, text);
        }

        private void SendConfirmation(Customer customer, string body)
        {
            //try
            //{
            MailMessage msg = new MailMessage("halloween@murach.com", customer.EmailAddress);
            msg.Subject = "Order Confirmation";
            msg.Body = body;

            string html = "<html><head><title>Order Confirmation</title></head>"
                        + "<body><h3>Thanks for your order!</h3>"
                        + "<p>" + body + "</p></body></html>";
            AlternateView view = AlternateView.CreateAlternateViewFromString(html, null, "text/html");
            msg.AlternateViews.Add(view);

            SmtpClient client = new SmtpClient("localhost");
            client.Send(msg);
            //}
            //catch (Exception ex)
            //{
            //    Session["Exception"] = ex;
            //    Response.Redirect("~/Error.aspx");
            //}

        }
        //protected void Page_Error(object sender, EventArgs e)
        //{
        //    Exception ex = Server.GetLastError();
        //    Session["Exception"] = ex;
        //    Response.Redirect("~/Error.aspx");
        //}
    }
}