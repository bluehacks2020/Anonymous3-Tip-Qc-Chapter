<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Lahi.register" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:TextBox ID="fullname" CssClass="form-control" runat="server" placeholder="fullname"></asp:TextBox><br />
        <asp:TextBox ID="address" CssClass="form-control" runat="server" placeholder="address"></asp:TextBox><br />
        <asp:TextBox ID="contact" CssClass="form-control" runat="server" placeholder="contact"></asp:TextBox><br />
        <asp:TextBox ID="email" CssClass="form-control" runat="server" placeholder="email"></asp:TextBox><br />
        <asp:TextBox ID="password" CssClass="form-control" runat="server" placeholder="password"></asp:TextBox><br />
        <asp:Button ID="regbtn" CssClass="btn-default" runat="server" Text="Register" 
    onclick="regbtn_Click" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringdb %>" 
    SelectCommand="SELECT * FROM [accounts]"></asp:SqlDataSource>
<br />
</asp:Content>
