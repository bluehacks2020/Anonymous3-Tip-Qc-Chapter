<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="Lahi.manage" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringdb %>" 
        
        SelectCommand="SELECT [author], [title], [post], [priority], [date_published], [image], [post_id] FROM [posts]">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="author" HeaderText="author" 
                SortExpression="author" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="post" HeaderText="post" SortExpression="post" />
            <asp:BoundField DataField="priority" HeaderText="priority" 
                SortExpression="priority" />
            <asp:BoundField DataField="date_published" HeaderText="date_published" 
                SortExpression="date_published" />
            <asp:BoundField DataField="post_id" HeaderText="post_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="post_id" />
            <asp:TemplateField HeaderText="image">
                    <ItemTemplate>
					<asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
					ImageUrl='<%# "data:Image/png;base64,"
					+ Convert.ToBase64String((byte[])Eval("image")) %>' />
					</ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <hr />
    <asp:TextBox ID="TextBox1" runat="server" placeholder="title"></asp:TextBox><br />
    <asp:TextBox ID="TextBox2" runat="server" placeholder="post"></asp:TextBox><br />
    <asp:FileUpload ID="fp1" runat="server" /><br />
    <asp:Button ID="Button1" runat="server" Text="Create post" 
        onclick="Button1_Click" /><br />
    <br />
    <hr />
    <asp:TextBox ID="edit1" runat="server" placeholder="id"></asp:TextBox><br />
    <asp:TextBox ID="edit2" runat="server" placeholder="title"></asp:TextBox><br />
    <asp:TextBox ID="edit3" runat="server" placeholder="post"></asp:TextBox><br />
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
    <asp:Button ID="editbtn" runat="server" Text="Edit post" 
        onclick="editbtn_Click" /><br />
    <br />
    <hr />
    <asp:TextBox ID="TextBox6" runat="server" placeholder="id"></asp:TextBox><br />
    <asp:Button ID="Button3" runat="server" Text="Delete post" 
        onclick="Button3_Click" /><br />

</asp:Content>
