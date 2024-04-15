<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx13CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblState" for="ddlState" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a state:</label>
                <div class="col-xs-8 col-sm-5">
                    <%-- state drop-down goes here --%>
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateCode"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]"></asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                    <%-- customer data list goes here --%>   
                    <asp:DataList ID="dlCustomers" CssClass="table table-bordered  table-striped table-condensed" runat="server" DataKeyField="Email" DataSourceID="SqlDataSource2">
                        <HeaderStyle CssClass="bg-halloween"/>
                        <HeaderTemplate>
                            <span class="col-xs-3">Last Name</span>
                            <span class="col-xs-3 text-right">First Name</span>
                            <span class="col-xs-5 text-right">Email</span>
                            <span class="col-xs-1 text-right">State</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LastNameLabel" CssClass="col-xs-3" runat="server" Text='<%# Eval("LastName") %>' />
                            <asp:Label ID="FirstNameLabel" CssClass="col-xs-3 text-right" runat="server" Text='<%# Eval("FirstName") %>' />
                            <asp:Label ID="EmailLabel" CssClass="col-xs-5 text-right" runat="server" Text='<%# Eval("Email") %>' />
                            <asp:Label ID="StateLabel" CssClass="col-xs-1 text-right" runat="server" Text='<%# Eval("State") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Email], [LastName], [FirstName], [State] FROM [Customers] WHERE ([State] = @State) ORDER BY [LastName], [FirstName]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>