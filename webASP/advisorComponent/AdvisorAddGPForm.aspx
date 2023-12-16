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
            <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />

        </div>
        <div>          
            Semester Code <asp:TextBox ID="semCode_textboxID" runat="server"></asp:TextBox>     
        &nbsp;&nbsp;&nbsp; (Like : W19 or S23R1)</div>
        <div>          
            Expected Graduation Date <asp:TextBox ID="date_textboxID" runat="server"></asp:TextBox>     
            (Like : YY-MM-DD)</div>
        <div>          
            Semester Credit Hours <asp:TextBox ID="CH_textboxID" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Advisor ID <asp:TextBox ID="advisorID_textboxID" runat="server"></asp:TextBox>     
        </div>
        <div>          
            Student ID <asp:TextBox ID="studentID_textboxID" runat="server" ></asp:TextBox>     
        </div>
        <asp:Button ID="BTN_Insert_graduation_plan" runat="server" OnClick="InsertGraduationPlan_OnClick" Text="Insert graduation plan" />
    </form>
</body>
</html>
