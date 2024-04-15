<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch13ProductList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Invoice Line Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 25%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblInvoice" for="ddlInvoice" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose an invoice:</label>
                <div class="col-xs-8 col-sm-5">
                    
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="InvoiceNumber" DataValueField="InvoiceNumber" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [InvoiceNumber] FROM [Invoices] WHERE ([Total] &gt; @Total)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="300" Name="Total" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" CssClass="table table-bordered table-striped table-condensed" DataSourceID="SqlDataSource2">
                        <HeaderStyle CssClass="bg-halloween"/>
                        <HeaderTemplate>
                            <span class="col-xs-3">Product</span>
                            <span class="col-xs-3 text-right"> Unit Price</span>
                            <span class="col-xs-3 text-right"> Quantity</span>
                            <span class="col-xs-3 text-right"> Extension</span>
                        </HeaderTemplate>

                        <ItemTemplate>
                            &nbsp;<asp:Label ID="ProductIDLabel" runat="server" CssClass="col-xs-3" Text='<%# Eval("ProductID") %>' />
                            
                            &nbsp;<asp:Label ID="UnitPriceLabel" runat="server" CssClass="col-xs-3 text-right" Text='<%# Eval("UnitPrice") %>' />
                            <br />
                            &nbsp;<asp:Label ID="QuantityLabel" runat="server" CssClass="col-xs-3 text-right" Text='<%# Eval("Quantity") %>' />
                            <br />
                            &nbsp;<asp:Label ID="ExtensionLabel" runat="server" CssClass="col-xs-3 text-right" Text='<%# Eval("Extension") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString2 %>" SelectCommand="SELECT [ProductID], [UnitPrice], [Quantity], [Extension] FROM [LineItems] WHERE ([InvoiceNumber] = @InvoiceNumber) ORDER BY [Quantity]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="InvoiceNumber" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-9">

                </div>  
            </div>
        </form>
    </main>
</div>
</body>
</html>