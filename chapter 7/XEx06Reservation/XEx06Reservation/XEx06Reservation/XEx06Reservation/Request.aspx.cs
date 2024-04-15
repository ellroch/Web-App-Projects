using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx06Reservation
{
    public partial class Request : System.Web.UI.Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();
        private string currentYear = DateTime.Today.Year.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtDeparturDate.Text = currentDate;
            txtArrivalDate.Text = currentDate;
            rblBedType.SelectedIndex = 0;
            lblYear.Text = currentYear;
            ddlNumOfPeople.SelectedIndex = 0;
            ddlPrefferedMethod.SelectedIndex = 0;
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtSpecialRequests.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Submission Recieved, Thank you for your time.";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDeparturDate.Text = currentDate;
            txtArrivalDate.Text = currentDate;
            rblBedType.SelectedIndex = 0;
            lblYear.Text = currentYear;
            ddlNumOfPeople.SelectedIndex = 0;
            ddlPrefferedMethod.SelectedIndex = 0;
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtSpecialRequests.Text = "";
        }
    }
}