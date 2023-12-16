<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteSlots.aspx.cs" Inherits="webASP.DeleteSlots" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <div> 
                    <asp:Button ID="Button2" runat="server" Text="HOME" BackColor="#000099" BorderColor="#CC3300" ForeColor="White" OnClick="Button2_Click" />
                </div>
            </center>

            <br />
            <br />
            TO DELETE SLOT<br />
            <br />
            <asp:Label ID="curr_semester" runat="server" Text="Enter Current Semester :"></asp:Label>
            <br />
            <asp:TextBox ID="Current_Semester" runat="server" Height="16px" Width="147px"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="delete_slot" runat="server" OnClick="DeleteSlot" Text="Delete" Width="72px" />
        </p>
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
