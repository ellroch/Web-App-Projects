﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="XEx04Quotation.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm quotation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">

        <main class="container">

            <h1 class="jumbotron">Quotation confirmation</h1>

            <div class="form-group">
                <label class="col-sm-3 control-label">MonthlyInvestment</label>
                <asp:Label ID="lblMonthlyInvestment" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Annual Interest</label>
                <asp:Label ID="lblInterest" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Number of Years</label>
                <asp:Label ID="lblYears" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div> 

            <div class="form-group">
                <label class="col-sm-3 control-label">Futurev Value</label>
                <asp:Label ID="lblFutureValue" runat="server" CssClass="col-sm-6 bold"></asp:Label>
            </div> 

            <div class="row">
                <h3 class="col-sm-offset-2 col-sm-10">Send confirmation to</h3>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Name</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="validateName" runat="server" ControlToValidate="txtName" 
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>  
            </div>  
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Email address</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="validateEmail" runat="server" ControlToValidate="txtEmail" 
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>  
            </div>  

            <%-- Quotation and Return buttons --%>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <%-- buttons go here --%>
                    <asp:Button ID="btnSendQuotation" runat="server" Text="Send Quotation" CssClass="btn btn-primary" OnClick="btnSendQuotation_Click"/>
                    <asp:Button ID="btnReturn" runat="server" Text="Return" CssClass="btn btn-primary" CausesValidation="False" OnClick="btnReturn_Click"/>
                </div>
            </div> 
            
            <%-- message label --%>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-11">
                    <%-- message label goes here --%>
                    <asp:Label ID="lblMessage" runat="server" Text="Click the Send Quotation button to send the quotation via email." CssClass="text-info"></asp:Label>
                </div>
            </div>

        </main>

    </form>
</body>
</html>