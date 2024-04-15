﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx15CategoryMaint.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch15: Category Maintenance</title>
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

            <div class="col-xs-12 table-responsive">
                <h1>Category Maintenance</h1>
                <asp:GridView ID="grdCategories" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="CategoryID"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdCategories_PreRender" 
                    OnRowDeleted="grdCategories_RowDeleted" 
                    OnRowUpdated="grdCategories_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="CategoryID" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Short Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridShortName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridShortName" runat="server" 
                                    ControlToValidate="txtGridShortName" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridShortName" runat="server" 
                                    Text='<%# Bind("ShortName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Long Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridLongName" runat="server" 
                                        MaxLength="50" CssClass="form-control"   
                                        Text='<%# Bind("LongName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridLongName" runat="server" 
                                    ControlToValidate="txtGridLongName" ValidationGroup="Edit" 
                                    Text="*" ErrorMessage="Long Name is a required field" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLongName" runat="server" 
                                    Text='<%# Bind("LongName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="True" 
                            ShowEditButton="True" ValidationGroup="Edit">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [CategoryID], [ShortName], [LongName] 
                        FROM [Categories]"
                    DeleteCommand="DELETE FROM [Categories] 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName" 
                    InsertCommand="INSERT INTO [Categories] 
                        ([CategoryID], [ShortName], [LongName]) 
                        VALUES (@CategoryID, @ShortName, @LongName)" 
                    UpdateCommand="UPDATE [Categories] 
                          SET [ShortName] = @ShortName, 
                              [LongName] = @LongName 
                        WHERE [CategoryID] = @original_CategoryID 
                          AND [ShortName] = @original_ShortName 
                          AND [LongName] = @original_LongName">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CategoryID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LongName" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>  
                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
            </div>





            <div class="col-xs-9">
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <asp:DetailsView ID="DetailsView1" runat="server" class="table table-bordered table-condensed" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                    <HeaderTemplate>
                <p>To create a new category, enter the information 
                    and click Insert</p>
                    </HeaderTemplate>
                    <Fields>
                        <asp:CommandField ButtonType="Button" ShowInsertButton="True"  />
                    </Fields>
                    <HeaderStyle CssClass="bg-halloween" />
                </asp:DetailsView>



                </div> 

        </form>
    </main>
</div>
</body>
</html>