<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SomethingBroke.aspx.cs" Inherits="WebApplication1.SomethingBroke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <h1 class="text-danger">An error has occurred</h1>
    <div class="alert alert-danger">
        <p><asp:Label ID="lblError" runat="server"></asp:Label></p>
    </div>
<!---
<div class="text-danger"> 
    <h1>Exception Caught!</h1> 
    <p>
        Or maybe it was an error!?
    </p>
</div>
<div>
    <p>
        <asp:Label id="lblError" runat="server" Text="Some Non-Programatic error occured... (e.g. "404)"></asp:Label>
    </p>
</div>
     --->

</asp:Content>
