﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="XEx21BackButton.Confirmation" %>

<asp:Content ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1>Confirmation</h1>
    <div class="form-group">
        <div class="col-xs-12">
            <asp:Label ID="lblConfirm" runat="server"></asp:Label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-12">
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                    PostBackUrl="~/Order.aspx" CssClass="btn" />
        </div>
    </div>
</asp:Content>
