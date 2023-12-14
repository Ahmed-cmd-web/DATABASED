<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorSignupForm.aspx.cs" Inherits="webASP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            HI Advisor, Please Log In !<br />
            <br />
            ID<br />
            <asp:TextBox ID="advisor_ID" runat="server" Width="211px"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="advisor_password" runat="server" Width="211px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="BTN_login" runat="server" OnClick="BTN_login_onClick" Text="login" Width="223px" />
        </div>
        <p>
            <asp:Button ID="BTN_register" runat="server" OnClick="BTN_register_onClick" Text="register" Width="224px" />
        </p>
    </form>
</body>
</html>
