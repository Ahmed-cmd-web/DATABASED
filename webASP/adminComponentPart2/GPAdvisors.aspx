<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GPAdvisors.aspx.cs" Inherits="webASP.GPAdvisors" %>

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
                <br />
                <br />
            </div>
         </center>
    <center>
<div>
    <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />

         <Columns>
            <asp:TemplateField HeaderText="Plan ID">
                <ItemTemplate>
                    <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("plan_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Semester Code">
                <ItemTemplate>
                    <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("semester_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Semester Credit Hours">
                <ItemTemplate>
                    <asp:Label ID="major_col_label" runat="server" Text='<%# Eval("semester_credit_hours") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Expected Grad Date">
                <ItemTemplate>
                    <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("expected_grad_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Advisor ID">
             <ItemTemplate>
                 <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("advisor_id") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Student ID">
             <ItemTemplate>
                 <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="AdvisorID">
             <ItemTemplate>
                 <asp:Label ID="major_col_label" runat="server" Text='<%# Eval("advisor_id") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Advisor Name">
             <ItemTemplate>
                 <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("advisor_name") %>'></asp:Label>
             </ItemTemplate>
         </asp:TemplateField>

        </Columns>
                </asp:GridView>
            </div>
        </center>
    </form>
</body>
</html>
