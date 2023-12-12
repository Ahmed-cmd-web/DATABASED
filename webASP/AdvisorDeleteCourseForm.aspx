<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorDeleteCourseForm.aspx.cs" Inherits="webASP.AdvisorDeleteCourseForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:Label ID="Title_Label_id" runat="server" Text="Delete course from a certain graduation plan in a certain semester"></asp:Label>
            <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />
          <div>          
              Student ID <asp:TextBox ID="studentID_textboxID" runat="server" ></asp:TextBox>     
          </div>
          <div>          
             Semester Code <asp:TextBox ID="semCode_textboxID" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp; (Like : W19 or S23R1)
         </div>      
          <div>          
              Course ID <asp:TextBox ID="CourseID_TextBoxID" runat="server" ></asp:TextBox>     
          </div>             
  </div>
  <asp:Button ID="BTN_Delete_course" runat="server" Text="Delete course" OnClick="BTN_Delete_course_OnClick" />
    </form>
</body>
</html>
