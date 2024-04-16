using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx21SendEmail
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
            MailMessage msg = new MailMessage("halloween@murach.com", customer.EmailAddress);
            msg.Subject = "Order Confirmation";
            msg.Body = body;
            msg.To.Add(new MailAddress("orders@murach.com"));
            
            string html = "<html><head><title>Order Confirmation</title></head>"
                + "</body><h1>Thank you for your order! </h1>"
                + "<p>" + body + "</p></body></html>";
            AlternateView view = AlternateView.CreateAlternateViewFromString(html, null, "text/html");
            msg.AlternateViews.Add(view);

            SmtpClient client = new SmtpClient("localhost");
            client.Send(msg);

        }
    }
}