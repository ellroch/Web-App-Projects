<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ex03FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 3: Future Value</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" /><!-- must come before any other stylesheets, sets default-->
    <script src="Scripts/jquery-3.1.1.min.js"></script> <!--must come before bootstrap.js-->
    <script src="Scripts/bootstrap.js"></script>

</head>
<body>
    <div class="container">
        <header class="jumbotron">
            <img id="logo" alt="Murach Logo" src="Images/MurachLogo.jpg" />
        </header>
        <main>
            <h1>401K Future Value Calculator</h1>
            <form id="form1" runat="server" class="form-horizontal" role="form">

                <div class="form-group">
                <label for="ddlMonthlyInvestment" class="col-sm-3 control-label">Monthly Investment:</label>
                <div class="col-sm-3">
                <asp:DropDownList ID="ddlMonthlyInvestment" runat="server"></asp:DropDownList ><br />
                    </div>
                </div>

                <div class="form-group">
                <label for="txtInterestRate" class="col-sm-3 control-label">Annual interest rate:</label>
                    <div class="col-sm-3">
                <asp:TextBox ID="txtInterestRate" runat="server">3.0</asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                        runat="server" 
					    ErrorMessage="Interest rate is required." CssClass="text-danger"
                        ControlToValidate="txtInterestRate" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtInterestRate" Display="Dynamic" 
                        ErrorMessage="Interest rate must range from 1 to 20." CssClass="text-danger"
                        MaximumValue="20" MinimumValue="1" Type="Double">
                    </asp:RangeValidator><br />
                    </div>

                <div class="form-group">
                <label for="txtYears" class="col-sm-3 control-label">Number of years:</label>
                        <div class="col-sm-3">
                <asp:TextBox ID="txtYears" runat="server">10</asp:TextBox>
                            </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" 
					    ControlToValidate="txtYears" Display="Dynamic" 
                        ErrorMessage="Number of years is required." CssClass="text-danger"> 
                    </asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="txtYears" 
                        Display="Dynamic"  
                        ErrorMessage="Years must range from 1 to 45." CssClass="text-danger"
                        MaximumValue="45" MinimumValue="1" Type="Integer">
                    </asp:RangeValidator><br />
                    </div>

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                <label for="lblFutureValue" class="col-sm-3 control-label">Future Value:</label>
                <asp:Label ID="lblFutureValue" runat="server"></asp:Label><br />
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" 
                    onclick="btnCalculate_Click" CssClass="btn btn-Primary"/>
                <asp:Button ID="btnClear" runat="server" Text="Clear" 
                    onclick="btnClear_Click" 
                    CausesValidation="False" CssClass="btn btn-Primary"/>
                        </div>
                    </div>

            </form>
        </main>
    </div>
</body>
</html>
