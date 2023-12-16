<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPart2Main.aspx.cs" Inherits="webASP.AdminPart2Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><p>WELCOME TO ADMIN PART 2</p></center>
        </div>

        <center>
            <div>
        <asp:Button ID="Button1" runat="server" Text="To Delete Course" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="To Delete Slot" OnClick="Button2_Click" Width="140px" />
        <asp:Button ID="Button3" runat="server" Text="To Add MakeUp Exam" OnClick="Button3_Click" Width="156px" />
        <asp:Button ID="Button4" runat="server" Text="View Student Payements" OnClick="Button4_Click" Width="183px" />
        <asp:Button ID="Button5" runat="server" Text="To Issue Installments" Width="183px" OnClick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="To Update Student Status" Width="179px" />
                <asp:Button ID="Button7" runat="server" Text="Active Student Details" Width="181px" OnClick="Button7_Click"/>
            </div>
        </center>

        <center>
            <p>
                <asp:Button ID="Button8" runat="server" Text="Graduation Plans Along With Their Initiated Advisors" Width="375px" OnClick="Button8_Click" />
                <asp:Button ID="Button9" runat="server" Text="Students Transcript Details" OnClick="Button9_Click" />
                <asp:Button ID="Button10" runat="server" Text="Semesters Along With Their Offered Courses" OnClick="Button10_Click" Width="358px" />
                </p>
        </center>
    </form>
</body>
</html>
