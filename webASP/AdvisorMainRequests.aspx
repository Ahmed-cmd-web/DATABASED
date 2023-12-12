<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorMainRequests.aspx.cs" Inherits="webASP.AdvisorMainRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="welcome_label" runat="server" Text="View all requests" BackColor="White" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <asp:Button ID="BTN_backToMain_ID" runat="server" OnClick="backToMain_onClick" Text="Back To Main" Height="25px" Width="148px" />
        <asp:Button ID="BTN_ViewPending_ID" runat="server" OnClick="ViewPending_onClick" Text="View Pending" Height="25px" Width="148px" />
    </div>
            <div>
        <asp:GridView 
            ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            BackColor="White"
            BorderColor="#336666"
            BorderStyle="Double"
            BorderWidth="5px"
            CellPadding="4"
            GridLines="Both"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowCommand="GridView1_RowCommand"
            >
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />

            <Columns>

                 <asp:TemplateField HeaderText="Request ID">
                     <ItemTemplate>
                         <asp:Label ID="request_id_col_label" runat="server" Text='<%# Eval("request_id") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Type">
                     <ItemTemplate>
                         <asp:Label ID="type_col_label" runat="server" Text='<%# Eval("type") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Comment">
                     <ItemTemplate>
                         <asp:Label ID="comment_col_label" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Status">
                     <ItemTemplate>
                         <asp:Label ID="status_col_label" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

 
                 <asp:TemplateField HeaderText="Credit Hours">
                     <ItemTemplate>
                         <asp:Label ID="credit_hours_col_label" runat="server" Text='<%# Eval("credit_hours") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

 
                 <asp:TemplateField HeaderText="Course ID">
                     <ItemTemplate>
                         <asp:Label ID="course_id_col_label" runat="server" Text='<%# Eval("course_id") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

 
                 <asp:TemplateField HeaderText="Student ID">
                     <ItemTemplate>
                         <asp:Label ID="student_id_col_label" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

                 <asp:TemplateField HeaderText="Advisor ID">
                     <ItemTemplate>
                         <asp:Label ID="advisor_id_col_label" runat="server" Text='<%# Eval("advisor_id") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

                
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>

                        <asp:ImageButton 
                            ImageUrl="~/images/approve-rejectBtnIcon.png"
                            runat="server"
                            ToolTip="Approve/Reject Request"
                            Width="60px"
                            Height="60px"                           
                        />
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                </asp:TemplateField>


            </Columns>


        </asp:GridView>
    </div>
        <div>
                <asp:Label ID="Request_ID" runat="server" Text="Request ID"></asp:Label>  
                <asp:TextBox ID="Request_ID_TextBox" runat="server"></asp:TextBox>
        </div>
        <div>
                <asp:Label ID="Current_Semester_Code" runat="server" Text="Current Semester Code"></asp:Label>  
                <asp:TextBox ID="curr_sem_code_TextBox_ID" runat="server"></asp:TextBox>
        </div>
        <div>
                <asp:Button ID="BTN_AcceptRejectCH_ID" runat="server" Text="Take Action for Credit Hours Request" OnClick="BTN_AcceptRejectCH_ID_Click" />
                            <asp:Button ID="BTN_AcceptRejectC_ID" runat="server" Text="Take Action for Course Request" OnClick="BTN_AcceptRejectC_ID_Click" />

        </div>
    </form>
</body>
</html>
