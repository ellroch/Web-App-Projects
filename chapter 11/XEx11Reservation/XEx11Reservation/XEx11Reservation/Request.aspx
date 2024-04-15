<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="XEx11Reservation.Request" 
    MasterPageFile="~/Site.Master" %>

    <asp:Content runat="server" ContentPlaceHolderID="mainPlaceHolder">
        <h1>Reservation Request</h1>
        

        <%-- Submit and Clear buttons --%>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        CssClass="btn btn-primary" OnClick="btnSubmit_Click"  />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                        CssClass="btn btn-primary" />
            </div>
        </div> 
            
        <%-- message label --%>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-11">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
            </div>
        </div>
    </asp:Content>