<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueInstallments.aspx.cs" Inherits="webASP.IssueInstallments" %>

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
            To Issue Installments:<br />
        </div>
        
        <div>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PaymentID:<br />
            <asp:TextBox ID="PaymentID" runat="server"></asp:TextBox>
        </div>
           <br />
           <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
           <p>
               <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
           </p>
    </form>
</body>
</html>
