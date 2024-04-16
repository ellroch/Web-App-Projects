<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="WebApplication1.Reservations" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    




    <div>
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <div class="form">
            <h1>Reserve a Room!</h1>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerName" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <InsertItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Your Name" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' CssClass="form-control" />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Submit Reservation" />
                </InsertItemTemplate>
            </asp:FormView>
            </div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CustomerInfo] WHERE [CustomerName] = @CustomerName" InsertCommand="INSERT INTO [CustomerInfo] ([CustomerName], [CheckIn], [CheckOut], [RoomNumber]) VALUES (@CustomerName, @CheckIn, @CheckOut, @RoomNumber)" SelectCommand="SELECT * FROM [CustomerInfo]" UpdateCommand="UPDATE [CustomerInfo] SET [CheckIn] = @CheckIn, [CheckOut] = @CheckOut, [RoomNumber] = @RoomNumber WHERE [CustomerName] = @CustomerName">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                    <asp:Parameter Name="CustomerName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="employee">
                <ContentTemplate>
                        <div>
        <div class="text-center">
            <h2>Roomage</h2>
        </div>
        <div class="col-sm-4 table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="RoomNumber" ItemType="WebApplication1.Models.ApplicationUser" 
                CssClass="table table-bordered table-striped table-condensed" >
                
                <Columns>
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room" ReadOnly="True" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="true" CausesValidation="false" ControlStyle-CssClass="btn btn-default" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" CausesValidation="false" ControlStyle-CssClass="btn btn-default"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Rooms] WHERE [RoomNumber] = @RoomNumber" InsertCommand="INSERT INTO [Rooms] ([RoomNumber], [Availability]) VALUES (@RoomNumber, @Availability)" SelectCommand="SELECT * FROM [Rooms]" UpdateCommand="UPDATE [Rooms] SET [Availability] = @Availability WHERE [RoomNumber] = @RoomNumber">
                <DeleteParameters>
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                    <asp:Parameter Name="Availability" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Availability" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
     <div>
        <div>
            <asp:GridView CssClass="col-sm-6 table table-bordered table-striped table-reactive table-condensed" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerName" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" ReadOnly="True" SortExpression="CustomerName" />
                    <asp:BoundField DataField="CheckIn" HeaderText="Check In Date" SortExpression="CheckIn" />
                    <asp:BoundField DataField="CheckOut" HeaderText="Check Out Date" SortExpression="CheckOut" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-default" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CustomerInfo] WHERE [CustomerName] = @CustomerName" InsertCommand="INSERT INTO [CustomerInfo] ([CustomerName], [CheckIn], [CheckOut], [RoomNumber]) VALUES (@CustomerName, @CheckIn, @CheckOut, @RoomNumber)" SelectCommand="SELECT * FROM [CustomerInfo] WHERE ([CheckOut] IS NULL)" UpdateCommand="UPDATE [CustomerInfo] SET [CheckIn] = @CheckIn, [CheckOut] = @CheckOut, [RoomNumber] = @RoomNumber WHERE [CustomerName] = @CustomerName">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                    <asp:Parameter Name="CustomerName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="admin">
                <ContentTemplate>
                        <div>
        <div class="text-center">
            <h2>Roomage</h2>
        </div>
        <div class="col-sm-4 table-responsive">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="RoomNumber" ItemType="WebApplication1.Models.ApplicationUser" 
                CssClass="table table-bordered table-striped table-condensed" >
                
                <Columns>
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room" ReadOnly="True" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="true" CausesValidation="false" ControlStyle-CssClass="btn btn-default" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" CausesValidation="false" ControlStyle-CssClass="btn btn-default"/>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Rooms] WHERE [RoomNumber] = @RoomNumber" InsertCommand="INSERT INTO [Rooms] ([RoomNumber], [Availability]) VALUES (@RoomNumber, @Availability)" SelectCommand="SELECT * FROM [Rooms]" UpdateCommand="UPDATE [Rooms] SET [Availability] = @Availability WHERE [RoomNumber] = @RoomNumber">
                <DeleteParameters>
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                    <asp:Parameter Name="Availability" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Availability" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div>
        <div >
            <asp:GridView CssClass="col-sm-6 table table-bordered table-striped table-reactive table-condensed" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerName" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" ReadOnly="True" SortExpression="CustomerName" />
                    <asp:BoundField DataField="CheckIn" HeaderText="Check In Date" SortExpression="CheckIn" />
                    <asp:BoundField DataField="CheckOut" HeaderText="Check Out Date" SortExpression="CheckOut" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                    <asp:CommandField buttonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-default" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CustomerInfo] WHERE [CustomerName] = @CustomerName" InsertCommand="INSERT INTO [CustomerInfo] ([CustomerName], [CheckIn], [CheckOut], [RoomNumber]) VALUES (@CustomerName, @CheckIn, @CheckOut, @RoomNumber)" SelectCommand="SELECT * FROM [CustomerInfo]  WHERE ([CheckOut] IS NULL)" UpdateCommand="UPDATE [CustomerInfo] SET [CheckIn] = @CheckIn, [CheckOut] = @CheckOut, [RoomNumber] = @RoomNumber WHERE [CustomerName] = @CustomerName">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CheckIn" Type="String" />
                    <asp:Parameter Name="CheckOut" Type="String" />
                    <asp:Parameter Name="RoomNumber" Type="Int32" />
                    <asp:Parameter Name="CustomerName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
        
    </asp:LoginView>
    </div>

</asp:Content>
