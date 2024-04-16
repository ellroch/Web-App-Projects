<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="XEx20UserMaintenance.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Order Page</h1>
    (All users can access this page)

    <p>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                
                    you are not logged in
                
            </AnonymousTemplate>
            <LoggedInTemplate>
               
                    you are logged in
                
            </LoggedInTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="admin">
                    <ContentTemplate>
                    
                        you are logged in as an admin
                    
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        <%-- LoginView control goes here --%>
    </p>
</asp:Content>