<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMakeupExam.aspx.cs" Inherits="webASP.AddMakeupExam" %>

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
            ADD MAKEUP EXAM<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COURSE ID :<br />
            <asp:TextBox ID="ExamType" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CourseID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Calendar ID="DateTime" runat="server"></asp:Calendar>
            <br />
            <asp:Button ID="Button1" runat="server"   OnClick="AddExam"   Text="Submit" />
            <br />
            <br />
        </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
