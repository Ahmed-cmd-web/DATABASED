<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainNav.aspx.cs" Inherits="webASP.MainNav" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            MAIN WEB FORM (TEAM 119)
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="44px" Text="Admin Component Part 1" Width="315px" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Height="44px" Text="Admin Component Part 2" Width="314px" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Height="44px" Text="Advisor Component" Width="314px" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Height="44px" Text="Student Component Part 1 and Part 2" Width="314px" OnClick="Button4_Click" />
        </div>
    </form>
</body>
</html>
