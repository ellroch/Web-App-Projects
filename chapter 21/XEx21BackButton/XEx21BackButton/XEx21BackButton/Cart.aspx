﻿<%@ Page Title="Your Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="XEx21BackButton.Cart" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <h1>Your Shopping Cart</h1>
    <div class="row"><%-- row 1 --%>
        <div class="col-sm-6"><%-- cart display column --%>
            <div class="form-group">
                <div class="col-sm-12"><asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox></div>
            </div>
        </div>
        <div class="col-sm-6"><%-- cart edit buttons column --%>
            <div class="form-group">
                <div class="col-sm-12"><asp:Button ID="btnRemove" runat="server" 
                    Text="Remove Item" onclick="btnRemove_Click" CssClass="btn" /></div>
                <div class="col-sm-12"><asp:Button ID="btnEmpty" runat="server" 
                    Text="Empty Cart" onclick="btnEmpty_Click" CssClass="btn" /></div>
            </div>
        </div>
    </div><%-- end of row 1 --%>
    <div class="row"><%-- row 2 --%>
        <div class="col-sm-12">
            <div class="form-group"><%-- message label --%>
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                    CssClass="text-info col-sm-12"></asp:Label>
            </div>
            <div class="form-group"><%-- buttons --%>
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server"
                        Text="Continue Shopping" CssClass="btn" OnClick="btnContinue_Click" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click"
                        CssClass="btn" />
                </div>
            </div>
        </div>
    </div><%-- end of row 2 --%>
</asp:Content>