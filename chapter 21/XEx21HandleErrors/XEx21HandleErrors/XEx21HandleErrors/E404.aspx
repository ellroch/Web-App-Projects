<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="E404.aspx.cs" Inherits="XEx21HandleErrors.E404" %>

<asp:Content ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1 class="text-danger">An HTTP error has occurred</h1>
    <div class="alert alert-danger">
        <p>The file you requested could not be found.</p>
        <p><b>Please contact customer support.</b></p>
    </div>
</asp:Content>
