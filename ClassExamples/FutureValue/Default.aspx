<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Images_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Future Value Calculator</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 693px;
        }
    </style>
</head>
<body>
    <img src="Images/MurachLogo.jpg" />
    <form id="form1" runat="server"><h1>401K Future Investment Calculator</h1>
&nbsp;<div>
    
            
    
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Monthly Investment</td>
                    <td>
                        <asp:DropDownList ID="ddlMonthlyInvestment" runat="server">
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                            <asp:ListItem>150</asp:ListItem>
                            <asp:ListItem>200</asp:ListItem>
                            <asp:ListItem>250</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Annual Interest Rate</td>
                    <td>
                        <asp:TextBox ID="txtInterest" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Number of Years</td>
                    <td>
                        <asp:TextBox ID="txtYears" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Future Value</td>
                    <td>
                        <asp:Label ID="lblFutureValue" runat="server" style="font-weight: 700" Text="[lblFutureValue]"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInterest" ErrorMessage="Interest Rate is Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtInterest" ErrorMessage="Must be between 3 and 30" MaximumValue="30" MinimumValue="3" Type="Integer"></asp:RangeValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYears" ErrorMessage="Number of Years is Reuired"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtYears" ErrorMessage="Must be between 5 and 45" MaximumValue="45" MinimumValue="5" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
    
            
    
    </div>
    </form>
</body>
</html>
