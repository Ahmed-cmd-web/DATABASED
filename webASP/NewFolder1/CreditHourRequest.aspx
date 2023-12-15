<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreditHourRequest.aspx.cs" Inherits="webASP.CreditHourRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Credit Hours:<br />
            <asp:TextBox ID="credit_hoursID" runat="server"></asp:TextBox>
            <br />
            <br />
            Type:<br />
            <asp:TextBox ID="TypeID2" runat="server"></asp:TextBox>
            <br />
            <br />
            Comment:<br />
            <asp:TextBox ID="CommentID2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Request" OnClick="Button1_Click" />
&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
