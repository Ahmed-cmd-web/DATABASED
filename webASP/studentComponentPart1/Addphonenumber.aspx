<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addphonenumber.aspx.cs" Inherits="webASP.Addphonenumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add your phone number:<br />
        </div>
        <asp:TextBox ID="phonenumberid" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="add" OnClick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="return" OnClick="Button2_Click" />
    </form>
</body>
</html>
