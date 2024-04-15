<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx15CustMaintFormView.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Customer Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main class="row">
        <form id="form1" runat="server" class="form-horizontal">

            <%-- error message label and validation summary control --%>
            <div class="col-xs-12">
                <asp:Label ID="lblError" runat="server" EnableViewState="false" 
                    CssClass="text-danger"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Please correct the following errors:" CssClass="text-danger" />
            </div>

            <%-- GridView control --%>
            <div class="col-xs-6">
                <asp:GridView ID="grdCustomers" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="Email"
                    DataSourceID="SqlDataSource1" AllowPaging="true"
                    CssClass="table table-bordered table-condensed" SelectedIndex="0">
                    <Columns>
                        <asp:BoundField DataField="LastName" HeaderText="LastName">
                            <HeaderStyle CssClass="col-xs-6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                            <HeaderStyle CssClass="col-xs-6" />
                        </asp:BoundField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <SelectedRowStyle CssClass="warning" />
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <PagerStyle CssClass="bg-halloween" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    SelectCommand="SELECT [Email], [LastName], [FirstName] 
                                   FROM [Customers] ORDER BY [LastName]">
              </asp:SqlDataSource>  
            </div>

            <%-- FormView control --%>
            <div class="col-xs-6">
                <asp:FormView ID="fvCustomer" runat="server" DataKeyNames="Email" 
                    DataSourceID="SqlDataSource2" OnItemDeleted="fvCustomer_ItemDeleted" OnItemInserted="fvCustomer_ItemInserted" OnItemUpdated="fvCustomer_ItemUpdated">
                    <EditItemTemplate>
                        <div class="list-group">
                            <div class="list-group-item bg-halloween">
                                <p>Edit Selected Customer</p>
                            </div>                           
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Last Name:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="LastNameTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Last Name is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">First Name:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="FirstNameTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="First Name is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4"> Email:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' 
                                            MaxLength="25" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="EmailTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Address:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                            MaxLength="40" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="AddressTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">City:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' 
                                            MaxLength="30" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="CityTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">State:</div>
                                    <div class="col-sm-7">
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                            DataValueField="StateCode" CssClass="form-control" 
                                            SelectedValue='<%# Bind("State") %>'>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Zip Code:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' 
                                            MaxLength="9" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="ZipCodeTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Zip Code is a required field">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Phone:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="PhoneNumberTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item bg-halloween">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div> 
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="list-group">
                            <div class="list-group-item bg-halloween">
                                <p>New Customer</p>
                            </div>                           
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Last Name:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="LastNameTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Last Name is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">First Name:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="FirstNameTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="First Name is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4"> Email:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' 
                                            MaxLength="25" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="EmailTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Email is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Address:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                            MaxLength="40" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="AddressTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">City:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' 
                                            MaxLength="30" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="CityTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">State:</div>
                                    <div class="col-sm-7">
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                            DataValueField="StateCode" CssClass="form-control" 
                                            SelectedValue='<%# Bind("State") %>'>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Zip Code:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' 
                                            MaxLength="9" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="ZipCodeTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Zip Code is a required field">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-4">Phone:</div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                            MaxLength="20" CssClass="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="PhoneNumberTextBox" Display="Dynamic" CssClass="text-danger" 
                                        ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="list-group-item bg-halloween">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div> 
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div>
                            <div>
                                <p>Selected Customer</p>
                            </div>
                            
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">Last Name:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">First Name:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4"> Email:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">Address:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">City:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">State:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">Zip Code:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">Phone:</div>
                                    <div class="col-sm-8">
                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>

                <%-- data source controls --%>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber" 
                    InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE ([Email] = @Email)" 
                    UpdateCommand="UPDATE [Customers] SET [LastName] = @LastName, [FirstName] = @FirstName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdCustomers" Name="Email" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
                </asp:SqlDataSource>
            </div> 

        </form>
    </main>
</div>
</body>
</html>