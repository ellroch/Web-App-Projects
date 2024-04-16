<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Expired.aspx.cs" Inherits="XEx21BackButton.Expired" %>

<asp:Content ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1 class="text-danger">A problem has occurred</h1>
    <div class="alert alert-danger">
        <p>The page you are trying to access has expired. To view an updated page, click the
           Refresh button below.</p>
    </div>
    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" 
        PostBackUrl="~/Cart.aspx" CssClass="btn btn-danger" />
</asp:Content>
