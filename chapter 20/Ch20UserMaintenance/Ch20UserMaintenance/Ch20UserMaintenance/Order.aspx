<%@ Page Title="Ch20 Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Ch20UserMaintenance.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Order Page</h1>
    (All users can access this page)

    <p>
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                You are logged in<br />
            </LoggedInTemplate>
            <AnonymousTemplate>
                You are not logged in<br />
            </AnonymousTemplate>
        </asp:LoginView>
    </p>
</asp:Content>
