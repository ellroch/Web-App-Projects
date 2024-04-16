using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx21BackButton
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsExpired())
            {
                Response.Redirect("~/Expired.aspx");
            }
            else
            {
                SaveTimeStamps();
            }

            cart = CartItemList.GetCart();
            if (!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                    //Response.Redirect("~/Cart.aspx");
                }
                else
                {
                    lblMessage.Text = "Please select the item you want to remove.";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }
        }

        private void SaveTimeStamps()
        {
            DateTime dtm = DateTime.Now;
            ViewState.Add("TimeStamp", dtm);
            Session.Add("CartTimeStamp", dtm);
        }

        private bool IsExpired()
        {
            if (Session["CartTimeStamp"] == null) {
                return false;
            }
            else if (ViewState["TimeStamp"] == null)
            {
                return false;
            }
            else if (Session["CartTimeStamp"].ToString() == ViewState["TimeStamp"].ToString())
            {
                return false;
            }
            else
                return true;

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Checkout1.aspx");
        }

    }
}