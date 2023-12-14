<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorUpdateExpectedGPDateForm.aspx.cs" Inherits="webASP.AdvisorUpdateExpectedGPDateForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
         <asp:Label ID="Title_Label_id" runat="server" Text="Update expected graduation date in a certain graduation plan"></asp:Label>
                     <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />
    
         <div>          
                 Expected Graduation Date <asp:TextBox ID="date_textboxID" runat="server"></asp:TextBox>     
                 (Like : YY-MM-DD)</div>
             <div>     
             <div>          
                 Student ID <asp:TextBox ID="studentID_textboxID" runat="server" ></asp:TextBox>     
             </div>
                        
     </div>
     <asp:Button ID="BTN_Update_expected_graduation_date" runat="server" Text="Update expected graduation date" OnClick="BTN_Update_expected_graduation_date_OnClick" />
    </form>
</body>
</html>
