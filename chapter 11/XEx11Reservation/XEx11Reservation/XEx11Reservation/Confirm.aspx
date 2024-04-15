<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="XEx11Reservation.Confirm" 
    MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
    <h1>Request Confirmation</h1>
    <div class="row">
        <div class="col-sm-offset-1 col-sm-5">
            <h3>Personal data</h3>
         </div>
        </div>   

    <!-- buttons -->
    <div class="form-group">
        <div class="col-sm-12">
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Request" 
                CssClass="btn btn-primary" OnClick="btnConfirm_Click" />
            <asp:Button ID="btnModify" runat="server" Text="Modify Request" 
                CssClass="btn btn-primary" PostBackUrl="~/Request.aspx" />
        </div>
    </div>

    <!-- message label -->
    <div class="form-group">
        <div class="col-sm-12">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
        </div>
    </div>
</asp:Content>
