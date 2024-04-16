<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="XEx21HandleErrors.Error" %>

<asp:Content ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1 class="text-danger">An error has occurred</h1>
    <div class="alert alert-danger">
        <p><asp:Label ID="lblError" runat="server"></asp:Label></p>
    </div>
    <asp:Button ID="btnReturn" runat="server" Text="Return to Order Page" 
        PostBackUrl="~/Order.aspx" CssClass="btn btn-danger" />
</asp:Content>
