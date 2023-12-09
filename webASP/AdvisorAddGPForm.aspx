<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorAddGPForm.aspx.cs" Inherits="webASP.AdvisorAddGPForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="title_gp" runat="server" Text="Insert Graduation Plan"></asp:Label>
        </div>
        <div>          
            Semester Code <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Expected Graduation Date <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Semester Credit Hours <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Advisor ID <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Student ID <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>     
        </div>
    </form>
</body>
</html>
