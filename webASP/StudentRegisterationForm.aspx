<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegisterationForm.aspx.cs" Inherits="webASP.StudentRegisterationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Student registeration form:</p>
        <p>
            Please enter your first name:</p>
        <asp:TextBox ID="first_nameid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your last name:<br />
        <br />
        <asp:TextBox ID="last_nameid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your password:<br />
        <br />
        <asp:TextBox ID="passwordid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your faculty:<br />
        <br />
        <asp:TextBox ID="facultyid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your email:<br />
        <br />
        <asp:TextBox ID="emailid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your major:<br />
        <br />
        <asp:TextBox ID="majorid" runat="server"></asp:TextBox>
        <br />
        <br />
        Please enter your semester:<br />
        <br />
        <asp:TextBox ID="semesterid" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Registerid" runat="server" Height="51px" OnClick="Register" Text="Register" Width="153px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
