<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorViewStudentMajor.aspx.cs" Inherits="webASP.AdvisorViewStudentMajor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="welcome_label" runat="server" Text="students assigned from a certain major" BackColor="White" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />
    </div>


    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
 BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

            <Columns>
                <asp:TemplateField HeaderText="Student ID">
                    <ItemTemplate>
                        <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Student Name">
                    <ItemTemplate>
                        <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("Student_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Major">
                    <ItemTemplate>
                        <asp:Label ID="major_col_label" runat="server" Text='<%# Eval("major") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("Course_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/images/addCourseBtnIcon.png" runat="server" CommandName="add_course" PostBackUrl="AdvisorAddCourseForm.aspx" ToolTip="Add Course" Width="40px" Height="40px" />
                        <asp:ImageButton ImageUrl="~/images/addGpBtnIcon.png" runat="server" CommandName="add_gp" PostBackUrl="AdvisorAddGPForm.aspx" ToolTip="Add Graduation Plan" Width="40px" Height="40px" />
                        <asp:ImageButton ImageUrl="~/images/deleteCourseBtnIcon.png" runat="server" CommandName="delete_course" PostBackUrl="AdvisorDeleteCourseForm.aspx" ToolTip="Delete Course" Width="40px" Height="40px" />
                        <asp:ImageButton ImageUrl="~/images/updateDateGPBtnIcon.png" runat="server" CommandName="update_date_gp" PostBackUrl="AdvisorUpdateExpectedGPDateForm.aspx" ToolTip="Update Expected Graudation Plan Date" Width="40px" Height="40px" />
                    </ItemTemplate>
                    <EditItemTemplate>

                    </EditItemTemplate>

                </asp:TemplateField>

            </Columns>


        </asp:GridView>
    </div>

   <div>
        <asp:Label ID="Label1" runat="server" Text="major"></asp:Label>
        &nbsp;
        <asp:TextBox ID="major_textboxID" runat="server" style="margin-bottom: 0px"></asp:TextBox>       
        <asp:Button ID="BTN_filterID" runat="server" OnClick="filter_OnClick" Text="filter" />
    </div>
    </form>
</body>
</html>
