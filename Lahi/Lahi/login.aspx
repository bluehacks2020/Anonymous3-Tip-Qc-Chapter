<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Lahi.login" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="~/Styles/Site.css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:TextBox CssClass="customtextbox" ID="email" runat="server" placeholder="email"></asp:TextBox><br />
        <asp:TextBox CssClass="customtextbox" ID="password" runat="server" placeholder="password"></asp:TextBox><br />
        <asp:Button CssClass="" ID="logbtn" runat="server" Text="Login" 
    onclick="logbtn_Click" />
</asp:Content>
