<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsActiveStudent.aspx.cs" Inherits="webASP.DetailsActiveStudent" %>

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
                <asp:TemplateField HeaderText="Student ID">
                    <ItemTemplate>
                        <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Student First Name">
                    <ItemTemplate>
                        <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("f_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Student Last Name">
                    <ItemTemplate>
                        <asp:Label ID="major_col_label" runat="server" Text='<%# Eval("l_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Gpa">
                 <ItemTemplate>
                     <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("gpa") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Faculty">
                 <ItemTemplate>
                     <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("faculty") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Email">
                 <ItemTemplate>
                     <asp:Label ID="major_col_label" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Major">
                 <ItemTemplate>
                     <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("major") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
                   <asp:TemplateField HeaderText="Financial Status">
                 <ItemTemplate>
                     <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("financial_status") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Semester">
                 <ItemTemplate>
                     <asp:Label ID="Student_name_col_label" runat="server" Text='<%# Eval("semester") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Acquired Hours">
                 <ItemTemplate>
                     <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("acquired_hours") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="Assigned Hours">
                 <ItemTemplate>
                     <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("assigned_hours") %>'></asp:Label>
                 </ItemTemplate>

             </asp:TemplateField>
                 <asp:TemplateField HeaderText="Advisor ID">
                 <ItemTemplate>
                     <asp:Label ID="Course_name_col_label" runat="server" Text='<%# Eval("advisor_id") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>

            </Columns>
                    </asp:GridView>
                </div>
            </center>
    </form>
</body>
</html>
