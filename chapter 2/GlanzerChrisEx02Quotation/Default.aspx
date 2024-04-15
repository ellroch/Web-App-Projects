<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
    <title>Price Quotation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
        <main class="container">
            <div class="jumbotron">
            <h1>Price Quotation</h1>
             </div>
                   <form id="form1" runat="server" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-3 control-label">
                            <label for="txtPrice">Sales Price</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox class="bold" ID="txtPrice" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:RequiredFieldValidator ID="RequiredValidatorPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*required" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidatorPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*must be betweein 10 and 1000" CssClass="text-danger" ForeColor="Red" MaximumValue="1000" MinimumValue="10" Type="Double"></asp:RangeValidator>
                        </div>
                        <br/>
                    </div>
                    <div class="form-group">
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label">
                            <label for="txtDiscount">Discount Percent</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtDiscount" class="bold" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <asp:RequiredFieldValidator ID="RequiredValidatordiscount" runat="server" ControlToValidate="txtDiscount" ErrorMessage="*required" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RangeValidator ID="RangeValidatorDiscount" runat="server" ControlToValidate="txtDiscount" ErrorMessage="*must be between 10 and 50" CssClass="text-danger" ForeColor="Red" MaximumValue="50" MinimumValue="10" Type="Double"></asp:RangeValidator>
                        <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label">
                        <label for="lblDiscount">Discount Amount</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="lblDiscount" cass="bold" runat="server" Font-Bold="True" Text="[discount]"></asp:Label>
                        </div>
                        <br />
                    </div>
                    <div class="form-group">
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label">
                            <label for="lblTotal">Total Price</label>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="lblTotal" class="bold" runat="server" Font-Bold="True" Text="[total]"></asp:Label>
                        </div>
                        <br />
                    </div>
                    <div class="form-group">
                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <asp:Button ID="btnCalc" runat="server" OnClick="btnCalc_Click" Text="Calculate" cssClass="btn btn-primary"/>
                        </div>
                    </div>
            </form>
        </main>
</body>
</html>
