<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateStudentStatus.aspx.cs" Inherits="webASP.UpdateStudentStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
             <div> 
                <asp:Button ID="Button2" runat="server" Text="HOME" BackColor="#000099" BorderColor="#CC3300" ForeColor="White" OnClick="Button2_Click" />
              </div>
        </center>
        <div>
            <br />
            To
            Update Student Status:
        </div>
        <br />
&nbsp;Enter StudentID:<br />
        <asp:TextBox ID="StudentID" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" />
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
