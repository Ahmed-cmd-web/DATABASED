<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewoptionalcourses.aspx.cs" Inherits="webASP.viewoptionalcourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Semester Code:<br />
            <asp:TextBox ID="SemestercodeID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
&nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False">
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
                    <asp:TemplateField HeaderText="Course ID">
                        <ItemTemplate>
                            <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Name">
                        <ItemTemplate>
                            <asp:Label ID="student_f_name_col_label" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    

                    

                </Columns>

            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" />
            <br />
        </div>
    </form>
</body>
</html>
