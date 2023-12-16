<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorRegisterForm.aspx.cs" Inherits="webASP.AdvisorRegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Advisor Register Form<br />
            <br />
            Name<br />
            <asp:TextBox ID="advisor_name" runat="server" Width="211px"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="advisor_password" runat="server" Width="211px"></asp:TextBox>
            <br />
            Email<br />
            <asp:TextBox ID="advisor_email" runat="server" Width="211px"></asp:TextBox>
            <br />
            Office<br />
            <asp:TextBox ID="advisor_office" runat="server" Width="211px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="BTN_Create_New_Advisor_Account" runat="server" OnClick="BTN_Create_New_Advisor_Account_onClick" Text="Create New Advisor Account" Width="223px" />
            <br />
            <asp:Button ID="BTN_I_Have_One" runat="server" OnClick="BTN_I_Have_One_onClick" Text="I Have One" Width="223px" />            
        </div>
    </form>
</body>
</html>
