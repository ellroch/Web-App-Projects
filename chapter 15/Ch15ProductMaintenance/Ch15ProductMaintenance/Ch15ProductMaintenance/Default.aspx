<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ch15ProductMaintenance.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Product Maintenance</title>
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
        <form id="form1" runat="server">

            <div class="col-sm-6 table-responsive">
                <asp:GridView ID="grdProducts" runat="server" SelectedIndex="0"
                    AutoGenerateColumns="False" DataKeyNames="ProductID" 
                    DataSourceID="SqlDataSource1" AllowPaging="True" 
                    CssClass="table table-bordered table-striped table-condensed" 
                    OnPreRender="grdProducts_PreRender">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <ItemStyle CssClass="col-xs-6" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryID" HeaderText="Category"> 
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Link" ShowSelectButton="true"> 
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagerStyle" 
                        BackColor="#8c8c8c" HorizontalAlign="Center" />
                    <SelectedRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    SelectCommand="SELECT [ProductID], [Name], [CategoryID], 
                        [UnitPrice], [OnHand] FROM [Products] ORDER BY [Name]">
                </asp:SqlDataSource>    
            </div>  

            <div class="col-sm-6">
                <asp:DetailsView ID="dvProduct" runat="server" 
                    DataSourceID="SqlDataSource2" DataKeyNames="ProductID" 
                    AutoGenerateRows="False"  
                    CssClass="table table-bordered table-condensed" 
                    OnItemDeleted="dvProduct_ItemDeleted" 
                    OnItemDeleting="dvProduct_ItemDeleting" 
                    OnItemInserted="dvProduct_ItemInserted" 
                    OnItemUpdated="dvProduct_ItemUpdated">
                    <Fields>
                        <asp:TemplateField HeaderText="Product ID">
                            <EditItemTemplate>
                                <asp:Label runat="server" ID="lblProductID"
                                    Text='<%# Eval("ProductID") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtProductID" 
                                        Text='<%# Bind("ProductID") %>' MaxLength="10" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvProductID" runat="server" 
                                    ControlToValidate="txtProductID" CssClass="text-danger"
                                    ErrorMessage="ProductID is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblProductID" 
                                    Text='<%# Bind("ProductID") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtName"
                                        Text='<%# Bind("Name") %>' MaxLength="50" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" CssClass="text-danger"
                                    ErrorMessage="Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtName" 
                                        Text='<%# Bind("Name") %>' MaxLength="50" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" CssClass="text-danger"
                                    ErrorMessage="Name is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblName"
                                    Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Short Description">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtShortDesc" 
                                        Text='<%# Bind("ShortDescription") %>' MaxLength="250"
                                        TextMode="MultiLine" Rows="4"   
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" 
                                    ControlToValidate="txtShortDesc" CssClass="text-danger"
                                    ErrorMessage="Short Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtShortDesc" 
                                        Text='<%# Bind("ShortDescription") %>' MaxLength="250"
                                        TextMode="MultiLine" Rows="4"  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" 
                                    ControlToValidate="txtShortDesc" CssClass="text-danger"
                                    ErrorMessage="Short Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblShortDesc" 
                                    Text='<%# Bind("ShortDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Long Description">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtLongDesc" 
                                        Text='<%# Bind("LongDescription") %>' MaxLength="2000"
                                        TextMode="MultiLine" Rows="4" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLongDesc" runat="server" 
                                    ControlToValidate="txtLongDesc" CssClass="text-danger"
                                    ErrorMessage="Long Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtLongDesc" 
                                        Text='<%# Bind("LongDescription") %>' MaxLength="2000"
                                        TextMode="MultiLine" Rows="4" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvLongDesc" runat="server" 
                                    ControlToValidate="txtLongDesc" CssClass="text-danger"
                                    ErrorMessage="Long Description is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblLongDesc" 
                                    Text='<%# Bind("LongDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="LongName" DataValueField="CategoryID" 
                                        SelectedValue='<%# Bind("CategoryID") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        DataSourceID="SqlDataSource3" 
                                        DataTextField="LongName" DataValueField="CategoryID" 
                                        SelectedValue='<%# Bind("CategoryID") %>'
                                        CssClass="form-control"></asp:DropDownList>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblCategory" 
                                    Text='<%# Bind("CategoryID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ImageFile">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtImageFile" 
                                        Text='<%# Bind("ImageFile") %>' MaxLength="30" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtImageFile" 
                                        Text='<%# Bind("ImageFile") %>' MaxLength="30" 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblImageFile" 
                                    Text='<%# Bind("ImageFile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unit Price">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtUnitPrice" 
                                        Text='<%# Bind("UnitPrice") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    ErrorMessage="Unit Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" Type="Double" Operator="GreaterThan" 
                                    ErrorMessage="Unit Price must be a decimal value greater than 0." Text="*" 
                                    CssClass="text-danger" ValueToCompare="0.00"></asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtUnitPrice" 
                                        Text='<%# Bind("UnitPrice") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    ErrorMessage="Unit Price is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvUnitPrice" runat="server" 
                                    ControlToValidate="txtUnitPrice" CssClass="text-danger"
                                    Type="Currency" Operator="DataTypeCheck" 
                                    ErrorMessage="Unit Price must be numeric." Text="*">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblUnitPrice" 
                                    Text='<%# Bind("UnitPrice", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="On Hand">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox runat="server" ID="txtOnHand" 
                                        Text='<%# Bind("OnHand") %>' 
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    ErrorMessage="On Hand is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    Type="Integer" Operator="DataTypeCheck" 
                                    ErrorMessage="On Hand must be numeric." Text="*">
                                </asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <div class="col-xs-11 col-insert">
                                    <asp:TextBox runat="server" ID="txtOnHand" 
                                        Text='<%# Bind("OnHand") %>'  
                                        CssClass="form-control"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    ErrorMessage="On Hand is a required field." Text="*">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvOnHand" runat="server" 
                                    ControlToValidate="txtOnHand" CssClass="text-danger"
                                    Type="Integer" Operator="DataTypeCheck" 
                                    ErrorMessage="On Hand must be numeric." Text="*">
                                </asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblOnHand"
                                    Text='<%# Bind("OnHand") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Link" 
                            ShowDeleteButton="true" 
                            ShowEditButton="true" 
                            ShowInsertButton="true" />
                    </Fields>
                    <RowStyle BackColor="#e7e7e7" />
                    <CommandRowStyle BackColor="#8c8c8c" ForeColor="white" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [ProductID], [Name], [ShortDescription], 
                            [LongDescription], [CategoryID], [ImageFile], 
                            [UnitPrice], [OnHand] 
                        FROM [Products] 
                        WHERE ([ProductID] = @ProductID)" 
                    DeleteCommand="DELETE FROM [Products] 
                        WHERE [ProductID] = @original_ProductID 
                          AND [Name] = @original_Name 
                          AND [ShortDescription] = @original_ShortDescription 
                          AND [LongDescription] = @original_LongDescription 
                          AND [CategoryID] = @original_CategoryID 
                          AND (([ImageFile] = @original_ImageFile) 
                           OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL))
                          AND [UnitPrice] = @original_UnitPrice 
                          AND [OnHand] = @original_OnHand" 
                    InsertCommand="INSERT INTO [Products] ([ProductID], [Name], 
                          [ShortDescription], [LongDescription], [CategoryID], 
                          [ImageFile], [UnitPrice], [OnHand]) 
                        VALUES (@ProductID, @Name, @ShortDescription, 
                          @LongDescription, @CategoryID, @ImageFile,  
                          @UnitPrice, @OnHand)" 
                    UpdateCommand="UPDATE [Products] SET [Name] = @Name, 
                          [ShortDescription] = @ShortDescription, 
                          [LongDescription] = @LongDescription, 
                          [CategoryID] = @CategoryID, 
                          [ImageFile] = @ImageFile, 
                          [UnitPrice] = @UnitPrice, 
                          [OnHand] = @OnHand 
                        WHERE [ProductID] = @original_ProductID 
                          AND [Name] = @original_Name 
                          AND [ShortDescription] = @original_ShortDescription 
                          AND [LongDescription] = @original_LongDescription
                          AND [CategoryID] = @original_CategoryID 
                          AND (([ImageFile] = @original_ImageFile) 
                           OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL))
                          AND [UnitPrice] = @original_UnitPrice 
                          AND [OnHand] = @original_OnHand">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdProducts" Name="ProductID" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProductID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_ShortDescription" Type="String" />
                        <asp:Parameter Name="original_LongDescription" Type="String" />
                        <asp:Parameter Name="original_CategoryID" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_OnHand" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="ShortDescription" Type="String" />
                        <asp:Parameter Name="LongDescription" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="String" />    
                        <asp:Parameter Name="ImageFile" Type="String" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="OnHand" Type="Int32" />
                        <asp:Parameter Name="original_ProductID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_ShortDescription" Type="String" />
                        <asp:Parameter Name="original_LongDescription" Type="String" />
                        <asp:Parameter Name="original_CategoryID" Type="String" />
                        <asp:Parameter Name="original_ImageFile" Type="String" />
                        <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="original_OnHand" Type="Int32" />
                    </UpdateParameters>
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
                </asp:SqlDataSource>  
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
                    SelectCommand="SELECT [CategoryID], [LongName] 
                        FROM [Categories] ORDER BY [LongName]">
                </asp:SqlDataSource> 

                <p><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        CssClass="text-danger" />
                <p><asp:Label ID="lblError" runat="server" 
                    EnableViewState="false" CssClass="text-danger"></asp:Label></p>

            </div>

        </form>
    </main>
</div>
</body>
</html>