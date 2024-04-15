<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch13ProductList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Product List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblCategory" for="ddlCategory" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a category:</label>
                <div class="col-xs-8 col-sm-5">
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="LongName" 
                        DataValueField="CategoryID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
                        <HeaderTemplate>
                            Product ID&nbsp; Name Price OnHand&nbsp;
                        </HeaderTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                            <br />
                            <strong>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                            </strong>
                            <br />
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>' />
<br />
                            <asp:Label ID="OnHandLabel" runat="server" Text='<%# Eval("OnHand") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand] FROM [Products] WHERE ([CategoryID] = @CategoryID) ORDER BY [UnitPrice], [ProductID]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="auto-style1">
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>