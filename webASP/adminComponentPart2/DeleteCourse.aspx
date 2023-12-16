<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteCourse.aspx.cs" Inherits="webASP.DeleteCourse" %>

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
         <br />
        TO DELETE COURSE<br />
        <br />
        <asp:Label ID="Course" runat="server" Text="Enter CourseID:"></asp:Label>
        <div>
            <asp:TextBox ID="CourseID" runat="server" Height="16px" style="margin-bottom: 0px"></asp:TextBox>
        </div>
        <p>
        <asp:Button ID="delete_course" runat="server" OnClick="delete" Text="Delete" Width="74px" />
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
