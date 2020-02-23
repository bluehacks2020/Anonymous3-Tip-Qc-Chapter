<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Lahi._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p>Welcome:</p><asp:Label ID="acc_email" runat="server" Text=""></asp:Label>
    <asp:Button ID="manage" runat="server" Text="Manage Posts" 
        onclick="manage_Click" />
    <asp:Button ID="logout" runat="server" Text="Logout" onclick="logout_Click" />


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>      
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <p>Top Topics:</p>
        <asp:Label ID="authorlbl" runat="server" Text=""></asp:Label>
        <asp:Label ID="titlelbl" runat="server" Text=""></asp:Label>
        <asp:Label ID="postlbl" runat="server" Text=""></asp:Label>
        <asp:Label ID="datelbl" runat="server" Text=""></asp:Label>

    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers> 
    </asp:UpdatePanel>
    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
        AllowPaging="True">
        <EditItemTemplate>
            author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            post:
            <asp:TextBox ID="postTextBox" runat="server" Text='<%# Bind("post") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" 
                Text='<%# Bind("priority") %>' />
            <br />
            date_published:
            <asp:TextBox ID="date_publishedTextBox" runat="server" 
                Text='<%# Bind("date_published") %>' />
            <br />
            post_id:
            <asp:Label ID="post_idLabel1" runat="server" Text='<%# Eval("post_id") %>' />
            <br />
            image:
            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
					ImageUrl='<%# "data:Image/png;base64,"
					+ Convert.ToBase64String((byte[])Eval("image")) %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            post:
            <asp:TextBox ID="postTextBox" runat="server" Text='<%# Bind("post") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" 
                Text='<%# Bind("priority") %>' />
            <br />
            date_published:
            <asp:TextBox ID="date_publishedTextBox" runat="server" 
                Text='<%# Bind("date_published") %>' />
            <br />

            image:
            <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            author:
            <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("author") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
            <br />
            post:
            <asp:Label ID="postLabel" runat="server" Text='<%# Bind("post") %>' />
            <br />
            priority:
            <asp:Label ID="priorityLabel" runat="server" Text='<%# Bind("priority") %>' />
            <br />
            date_published:
            <asp:Label ID="date_publishedLabel" runat="server" 
                Text='<%# Bind("date_published") %>' />
            <br />
            post_id:
            <asp:Label ID="post_idLabel" runat="server" Text='<%# Eval("post_id") %>' />
            <br />
            image:<br />
            <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
					ImageUrl='<%# "data:Image/png;base64,"
					+ Convert.ToBase64String((byte[])Eval("image")) %>' />
            <br /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringdb %>" 
        SelectCommand="SELECT * FROM [posts]"></asp:SqlDataSource>

</asp:Content>
