<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseRequest.aspx.cs" Inherits="webASP.CourseRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="CourseID:"></asp:Label>
        </div>
        <asp:TextBox ID="CourseID" runat="server"></asp:TextBox>
        <br />
        <br />
        Type:<br />
        <asp:TextBox ID="TypeID" runat="server"></asp:TextBox>
        <br />
        <br />
        Comment:<br />
        <asp:TextBox ID="CommentID" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Request" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return" />
    </form>
</body>
</html>
