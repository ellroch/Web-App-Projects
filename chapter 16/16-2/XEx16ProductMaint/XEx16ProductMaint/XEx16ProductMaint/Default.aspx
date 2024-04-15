<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx16ProductMaint.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch16: Product Maintenance</title>
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
            <%-- error message label and validation summary controls --%>
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" 
                        EnableViewState="False" CssClass="text-danger" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        ValidationGroup="edit" CssClass="text-danger" />
                </div>
                <div class="col-sm-6">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        ValidationGroup="insert" CssClass="text-danger" />
                </div>
            </div>

            <%-- ListView control --%>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
               <EditItemTemplate>
                    <div style="" class="col-sm-6">
                        <ul class="list-group">
                            <li class="list-group-item bg-halloween">Edit Product</li>
                            <li class="list-group-item">
                                <table class="table">
                                    <tr>
                                        <td>&nbsp;
                                            ProductID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                        </td>
                                        <td>&nbsp
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            Name:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvNameEdit" ValidationGroup="edit" ControlToValidate="NameTextBox" Text="*" CssClass="text-danger" runat="server" ErrorMessage="Name is a required field"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ShortDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="ShortDescriptionTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ShortDescription") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvShortDescEdit" runat="server" Text="*" ControlToValidate="ShortDescriptionTextBox" CssClass="text-danger" ValidationGroup="edit" ErrorMessage="Short Description is required"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            LongDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="LongDescriptionTextBox" TextMode="MultiLine" Wrap="true" CssClass="form-control" runat="server" Text='<%# Bind("LongDescription") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvLongDescEdit" ControlToValidate="LongDescriptionTextBox" ValidationGroup="edit" Text="*" CssClass="text-danger" runat="server" ErrorMessage="Long Description is Required"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            CategoryID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:DropDownList ID="CategoryIDddl" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="LongName" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'/>
                                        </td>
                                        <td>&nbsp

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ImageFile:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="ImageFileTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ImageFile") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvImageEdit" ControlToValidate="ImageFileTextBox" ValidationGroup="edit" Text="*" CssClass="text-danger" runat="server" ErrorMessage="ImageFile is a required field."></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            UnitPrice:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="UnitPriceTextBox" CssClass="form-control" runat="server" Text='<%# Bind("UnitPrice") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvUnitPriceEdit" ControlToValidate="UnitPriceTextBox" ValidationGroup="edit" Text="*" CssClass="text-danger" runat="server" ErrorMessage="UnitPrice is a required field."></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangevalidatorUnitPriceEdit" ControlToValidate="UnitPriceTextBox" ValidationGroup="edit" Text="*" CssClass="text-danger" runat="server" ErrorMessage="UnitPrice must be a numeric value greater than 0" Type="Double" MinimumValue="0" MaximumValue="999999999"></asp:RangeValidator>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            OnHand:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="OnHandTextBox" CssClass="form-control" runat="server" Text='<%# Bind("OnHand") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvOnHandEdit" ValidationGroup="edit" ControlToValidate="OnHandTextBox" Text="*" CssClass="text-danger" runat="server" ErrorMessage="OnHand is a required field."></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidatoronHandEdit" ControlToValidate="OnHandTextBox" ValidationGroup="edit" Text="*" CssClass="text-danger" runat="server" ErrorMessage="OnHand must be an Integer value equal to or Greater than 0" Type="Integer" MinimumValue="0" MaximumValue="100000000"></asp:RangeValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp; 
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" ValidationGroup="edit" Text="Update" CssClass="btn btn-default" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default"/>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                    </div>
                    

                </EditItemTemplate>
                <InsertItemTemplate>
                    <div style="" class="col-sm-6">
                        <ul class="list-group">
                            <li class="list-group-item bg-halloween">Enter New Product</li>
                            <li class="list-group-item">
                                
                                <table class="table">
                                    <tr>
                                        <td>&nbsp;
                                            ProductID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="ProductIDTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("ProductID") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvInsertID" ValidationGroup="insert" runat="server" ControlToValidate="ProductIDTextBox2" ErrorMessage="Product ID is required." Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            Name:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="NameTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvNameInsert" ValidationGroup="insert" ControlToValidate="NameTextBox2" Text="*" CssClass="text-danger" runat="server" ErrorMessage="Name is a required field."></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ShortDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="ShortDescriptionTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("ShortDescription") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvShortDescInsert" runat="server" Text="*" ControlToValidate="ShortDescriptionTextBox2" CssClass="text-danger" ValidationGroup="insert" ErrorMessage="Short Description is required"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            LongDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="LongDescriptionTextBox2" TextMode="MultiLine" Wrap="true"  CssClass="form-control" runat="server" Text='<%# Bind("LongDescription") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvLongDescInsert" ControlToValidate="LongDescriptionTextBox2" ValidationGroup="insert" Text="*" CssClass="text-danger" runat="server" ErrorMessage="Long Description is Required"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            CategoryID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:DropDownList ID="CategoryIDddl2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="LongName" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID")%>'/>
                                        </td>
                                        <td>&nbsp
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ImageFile:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="ImageFileTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("ImageFile") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvImageInsert" ControlToValidate="ImageFileTextBox2" ValidationGroup="insert" Text="*" CssClass="text-danger" runat="server" ErrorMessage="ImageFile is a required field."></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            UnitPrice:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="UnitPriceTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("UnitPrice") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvUnitPriceInsert" ControlToValidate="UnitPriceTextBox2" ValidationGroup="insert" Text="*" CssClass="text-danger" runat="server" ErrorMessage="UnitPrice is a required field."></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangevalidatorUnitPriceInsert" ControlToValidate="UnitPriceTextBox2" ValidationGroup="insert" Text="*" CssClass="text-danger" runat="server" ErrorMessage="UnitPrice must be a numeric value greater than 0" Type="Double" MinimumValue="0" MaximumValue="999999999"></asp:RangeValidator>                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            OnHand:
                                        </td>
                                        <td>&nbsp;
                                            <asp:TextBox ID="OnHandTextBox2" CssClass="form-control" runat="server" Text='<%# Bind("OnHand") %>' />
                                        </td>
                                        <td>&nbsp
                                            <asp:RequiredFieldValidator ID="rfvOnHandInsert" ValidationGroup="insert" ControlToValidate="OnHandTextBox2" Text="*" CssClass="text-danger" runat="server" ErrorMessage="OnHand is a required field."></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidatoronHandInsert" ControlToValidate="OnHandTextBox2" ValidationGroup="insert" Text="*" CssClass="text-danger" runat="server" ErrorMessage="OnHand must be an Integer value equal to or Greater than 0" Type="Integer" MinimumValue="0" MaximumValue="100000000"></asp:RangeValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;
                                            <asp:Button ID="InsertButton2" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="insert" CssClass="btn btn-default"/>
                                            <asp:Button ID="CancelButton2" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-default"/>
                                        </td>
                                    </tr>
                                </table>
                                
                            </li>
                        </ul>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div style="" class="col-sm-6">
                        <ul class="list-group">
                            <li class="list-group-item bg-halloween">Enter New Product</li>
                            <li class="list-group-item">
                                
                                <table class="table">
                                    <tr>
                                        <td>&nbsp;
                                            ProductID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            Name:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ShortDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="ShortDescriptionLabel" runat="server" Text='<%# Eval("ShortDescription") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            LongDescription:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="LongDescriptionLabel" runat="server" Text='<%# Eval("LongDescription") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            CategoryID:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            ImageFile:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="ImageFileLabel" runat="server" Text='<%# Eval("ImageFile") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            UnitPrice:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# string.Format("{0:c}", Eval("UnitPrice")) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            OnHand:
                                        </td>
                                        <td>&nbsp;
                                            <asp:Label ID="OnHandLabel" runat="server" Text='<%# Eval("OnHand") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-default" />
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-default"/>
                                        </td>
                                    </tr>
                                </table>
                                
                            </li>
                        </ul>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="" class="row">
                        <span runat="server" id="itemPlaceholder"/>
                    </div>
                    <div style="" class="text-center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-default"/>
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (@ProductID, @Name, @ShortDescription, @LongDescription, @CategoryID, @ImageFile, @UnitPrice, @OnHand)" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductID]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [CategoryID] = @CategoryID, [ImageFile] = @ImageFile, [UnitPrice] = @UnitPrice, [OnHand] = @OnHand WHERE [ProductID] = @ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ShortDescription" Type="String" />
                    <asp:Parameter Name="LongDescription" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="String" />
                    <asp:Parameter Name="ImageFile" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="OnHand" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="ShortDescription" Type="String" />
                    <asp:Parameter Name="LongDescription" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="String" />
                    <asp:Parameter Name="ImageFile" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="OnHand" Type="Int32" />
                    <asp:Parameter Name="ProductID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories] ORDER BY [LongName]"></asp:SqlDataSource>
        </form>
    </main>
</div>
</body>
</html>