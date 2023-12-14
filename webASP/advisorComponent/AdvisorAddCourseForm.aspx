<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorAddCourseForm.aspx.cs" Inherits="webASP.AdvisorAddCourseForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Title_Label_id" runat="server" Text="Insert courses for a specific graduation plan"></asp:Label>
            <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />

                <div>          
                    Student ID <asp:TextBox ID="studentID_textboxID" runat="server" ></asp:TextBox>     
                </div>

               <div>          
                   Semester Code <asp:TextBox ID="semCode_textboxID" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp; (Like : W19 or S23R1)
               </div>
             <div>          
                   Course Name <asp:TextBox ID="coursNameID" runat="server" ></asp:TextBox>     
             </div>
        </div>
        <asp:Button ID="BTN_Insert_course" runat="server" Text="Insert Course" OnClick="BTN_Insert_course_Click" />
    </form>
</body>
</html>
