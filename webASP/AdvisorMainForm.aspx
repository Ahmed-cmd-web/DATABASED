<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorMainForm.aspx.cs" Inherits="webASP.AdvisorMainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="welcome_label" runat="server" Text="Welcome to the main form, Advisor " BackColor="White" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <asp:Button ID="logout" runat="server" OnClick="logout_onClick" Text="logout" Height="25px" Width="148px" />
        </div>



    </form>
</body>
</html>
