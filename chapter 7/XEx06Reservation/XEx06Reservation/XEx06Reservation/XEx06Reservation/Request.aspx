﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="XEx06Reservation.Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 6: Reservations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header class="jumbotron">
            <img src="Images/logo.png" alt="Royal Inns and Suites" />
        </header>

        <main>
            <form id="form1" runat="server" class="form-horizontal">
                <h1>Reservation Request</h1>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means field is required" CssClass="text-danger" />
                <h3>Request data</h3>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Arrival Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArrivalDate" runat="server" TextMode="Date"
                             CssClass="form-control"></asp:TextBox>
                    </div>
<!--                 txtArrivalDate validator -->
                    <asp:RequiredFieldValidator ID="valArrivalDate" runat="server" Text="*" ControlToValidate="txtArrivalDate" CssClass="text-danger"></asp:RequiredFieldValidator>
                <!--    <asp:CompareValidator ID="valArrivalDate_isDate" runat="server" Text="Must be a valid date" ValueToCompare="^\d{1,2}\/\d{1,2}\/\d{4}$" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtArrivalDate"></asp:CompareValidator>
       -->         </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Departure Date</label>
                    <div class="col-sm-4">
                        <!-- text box -->
                        <asp:TextBox ID="txtDeparturDate" runat="server" TextMode="Date"
                             CssClass="form-control"></asp:TextBox>
                    </div>
<!--                 txtDeparturDate validator -->
                    <asp:RequiredFieldValidator ID="valDeparturDate" runat="server" Text="*" ControlToValidate="txtDeparturDate" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="valCompareDeparureToArrival" runat="server" Text="Must be after the Arrival Date" ControlToValidate="txtDeparturDate" ControlToCompare="txtArrivalDate" CssClass="text-danger" Type="Date" Operator="GreaterThan"></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Number of people</label>
                    <div class="col-sm-4">
                        <!-- drop-down -->
                        <asp:DropDownList CssClass="form-control" ID="ddlNumOfPeople" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:DropDownList>
                    </div>
<!--                 ddlNumOfPeople validator -->
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Bed type</label>
                    <div class="col-sm-9 bedtype">
                        <!-- radio buttons -->
                        <asp:RadioButtonList ID="rblBedType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="King" Text="King"></asp:ListItem>
                            <asp:ListItem Value="Two Queens" Text="Two Queens"></asp:ListItem>
                            <asp:ListItem Value="Single Queen" Text="Single Queen"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
<!--                 rblBedType validator -->
                </div>

                <h3>Special requests</h3>
                <div class="form-group">
                    <div class="col-sm-7">
                        <!-- multiline text box -->
                        <asp:TextBox ID="txtSpecialRequests" runat="server" TextMode="Multiline"
                             CssClass="form-control" Rows="4"></asp:TextBox>
                    </div>
<!--                txtSpecialRequests validator -->
                </div>

                <h3>Contact information</h3>
                <div class="form-group">
                    <label class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
<!--                txtFirstName validator -->
                    <asp:RequiredFieldValidator ID="valFirstName" runat="server" Text="*" ControlToValidate="txtFirstName" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-4">
                        <!-- text box -->
                        <asp:TextBox ID="txtLastName" runat="server"
                             CssClass="form-control"></asp:TextBox>
                    </div>
<!--                 txtLastName validator -->
                    <asp:RequiredFieldValidator ID="valLastName" runat="server" Text="*" ControlToValidate="txtLastName" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Email address</label>
                    <div class="col-sm-4">
                        <!-- text box -->
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                             CssClass="form-control"></asp:TextBox>
                    </div>
<!--                 txtEmail validator -->
                    <asp:RequiredFieldValidator ID="vaEmail" runat="server" Text="*" ControlToValidate="txtEmail" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valEmail_isEmail" runat="server" Text="Must be a valid email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ControlToValidate="txtEmail" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Telephone number</label>
                    <div class="col-sm-4">
                        <!-- text box -->
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"
                             CssClass="form-control"></asp:TextBox>
                    </div>
<!--                 txtPhone validator -->
                    <asp:RequiredFieldValidator ID="valPhone" runat="server" Text="*" ControlToValidate="txtPhone" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valPhone_isPhone" runat="server" Text="invalid Phone Number" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ControlToValidate="txtPhone" CssClass="text-danger"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Preferred method</label>
                    <div class="col-sm-4">
                        <!-- drop down -->
                        <asp:DropDownList CssClass="form-control" ID="ddlPrefferedMethod" runat="server">
                            <asp:ListItem>Email</asp:ListItem>
                            <asp:ListItem>Telephone</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <%-- Submit and Clear buttons --%>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                             CssClass="btn btn-primary" OnClick="btnSubmit_Click"  />
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                             CssClass="btn btn-primary" OnClick="btnClear_Click" CausesValidation="False"  />
                    </div>
                </div> 
            
                <%-- message label --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-11">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
                    </div>
                </div>

            </form>
        </main>

        <footer>
            <p>&copy; <asp:Label ID="lblYear" runat="server"></asp:Label> 
                Royal Inns and Suites</p>
        </footer>
    </div>
    
</body>
</html>