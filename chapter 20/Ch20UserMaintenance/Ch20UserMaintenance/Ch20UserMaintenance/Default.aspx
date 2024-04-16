<%@ Page Title="Ch20 Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch20UserMaintenance._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HyperLink runat="server" NavigateUrl="~/Order">Order a Product</asp:HyperLink><br />
        (All users including <br />anonymous users)<br /><br />

    <asp:HyperLink runat="server" NavigateUrl="~/Account/Manage">Edit My Account</asp:HyperLink><br />
        (All authenticated users)<br /><br />

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Maintenance">Maintain Users and Roles</asp:HyperLink><br />
        (Only users associated <br />with the Admin role)

</asp:Content>