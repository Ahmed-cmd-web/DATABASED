<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorMainForm.aspx.cs" Inherits="webASP.AdvisorMainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="welcome_label" runat="server" Text="Welcome to the main form, Advisor " BackColor="White" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <asp:Button ID="logout" runat="server" OnClick="logout_onClick" Text="logout" Height="25px" Width="148px" />
        </div>


        <div>
            <asp:GridView 
                ID="GridView_table"
                OnRowDataBound="GridView_table_RowDataBound"
                runat="server"
                AutoGenerateColumns="False"
                CellPadding="10"
                BackColor="White"
                BorderColor="#CCCCCC"
                BorderStyle="None"
                BorderWidth="3px"
                Height="110px"
                OnSelectedIndexChanged="GridView_table_SelectedIndexChanged"
                OnRowCommand="GridView_table_RowCommand"
                >
                
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />

                <Columns>
                    <asp:TemplateField HeaderText="Student ID">
                        <ItemTemplate>
                            <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student First Name">
                        <ItemTemplate>
                            <asp:Label ID="student_f_name_col_label" runat="server" Text='<%# Eval("f_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Last Name">
                        <ItemTemplate>
                            <asp:Label ID="student_l_name_col_label" runat="server" Text='<%# Eval("l_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Advisor ID">
                        <ItemTemplate>
                            <asp:Label ID="advisor_id_col_label" runat="server" Text='<%# Eval("advisor_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Advisor Name">
                        <ItemTemplate>
                            <asp:Label ID="advisor_name_col_label" runat="server" Text='<%# Eval("advisor_name") %>'></asp:Label>
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


    </form>
</body>
</html>
