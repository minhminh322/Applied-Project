<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showcase.aspx.cs" Inherits="AppliedProjectDB.Showcase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            text-align: left;
            visibility: inherit;
            overflow: auto;
            width: 1536px;
        }
        .auto-style5 {
            height: 565px;
            width: 1457px;
        }
        .auto-style6 {
            height: 484px;
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            text-align: left;
            height: 504px;
        }
        .auto-style9 {
            height: 2388px;
        }
        </style>
</head>
<body style="text-align: center; font-weight: 700; font-size: xx-large; height: 58px; width: 1460px;">
    <form id="form1" runat="server" class="auto-style9">
        <div>
            Applied Project Website</div>
        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" RenderingMode="Table" StaticSubMenuIndent="10px" Width="100%">
            <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#F7F6F3" />
            <DynamicSelectedStyle BackColor="#5D7B9D" />
            <Items>
                <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home" Value="Home"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Showcase.aspx" Text="Showcase" Value="Showcase"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Overview.aspx" Text="Overview" Value="Overview"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#5D7B9D" />
        </asp:Menu>
        <div class="auto-style4" style="display: inline;">
        </div>
        <div class="auto-style5">
            <div class="auto-style7">
                <asp:Label ID="Label3" runat="server" BorderStyle="Solid" Text="List all students with their faculty adviser and the project they worked on"></asp:Label>
                <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="query_1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Student_Name" HeaderText="Student_Name" ReadOnly="True" SortExpression="Student_Name" />
                    <asp:BoundField DataField="Faculty_Adviser" HeaderText="Faculty_Adviser" ReadOnly="True" SortExpression="Faculty_Adviser" />
                    <asp:BoundField DataField="Project" HeaderText="Project" SortExpression="Project" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="query_1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT (S.Std_Fname + ' ' + S.Std_LName) AS Student_Name, (FA.Fct_FName + ' ' + FA.Fct_LName) AS Faculty_Adviser, P.P_Name AS Project
From Student S JOIN Faculty_Advisor FA ON S.Fno = FA.Fct_Number
                JOIN Project P ON S.Pno = P.P_Number"></asp:SqlDataSource>
            <br />
        </div>
        <div class="auto-style6">
            <div class="auto-style7">
                <asp:Label ID="Label4" runat="server" BorderStyle="Solid" Text=" List project contact emails and project numbers of projects involving organizations in WA"></asp:Label>
                <br />
            </div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Contact,Project" DataSourceID="query_2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Contact" HeaderText="Contact" ReadOnly="True" SortExpression="Contact" />
                    <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                    <asp:BoundField DataField="Project" HeaderText="Project" ReadOnly="True" SortExpression="Project" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="query_2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Cnt_Email AS Contact, Cnt_Org AS Organization, P_Number AS Project
FROM Contact_Person, Project
WHERE Cnt_Email = P_ContactEmail AND Cnt_Org = ANY (SELECT O_Name FROM Organization WHERE O_State = 'WA')
GROUP BY P_Number, Cnt_Email, Cnt_Org;"></asp:SqlDataSource>
        </div>
        <div class="auto-style8">
            <asp:Label ID="Label1" runat="server" BorderStyle="Solid" Text="Select all the students who worked on"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Projects" DataTextField="P_Name" DataValueField="P_Name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Projects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Project]"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="query_3" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Std_Fname" HeaderText="Std_Fname" SortExpression="Std_Fname" />
                    <asp:BoundField DataField="Std_Lname" HeaderText="Std_Lname" SortExpression="Std_Lname" />
                    <asp:BoundField DataField="P_Name" HeaderText="P_Name" SortExpression="P_Name" />
                    <asp:BoundField DataField="P_Year" HeaderText="P_Year" SortExpression="P_Year" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="query_3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Std_Fname, Std_Lname, P_Name, P_Year
FROM Student, Project
WHERE P_Name =@P_Name AND Student.Pno = Project.P_Number
ORDER BY P_Year DESC;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="P_Name" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="auto-style7">
            <asp:Label ID="Label2" runat="server" Text="Selects oganization names and websites and student ID's for all students sorted by organization" BorderStyle="Solid"></asp:Label>
            <br />
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="O_Name,Std_ID" DataSourceID="query_4">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="O_Name" HeaderText="O_Name" ReadOnly="True" SortExpression="O_Name" />
                    <asp:BoundField DataField="O_Website" HeaderText="O_Website" SortExpression="O_Website" />
                    <asp:BoundField DataField="Std_ID" HeaderText="Std_ID" ReadOnly="True" SortExpression="Std_ID" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="query_4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT O.O_Name, O.O_Website, S.Std_ID
FROM Organization O
JOIN Student S ON
S.Pno = ANY (SELECT P_Number
            FROM Project, Contact_Person
            WHERE P_ContactEmail = Cnt_Email AND Cnt_Org = O.O_Name)
ORDER BY O.O_Name ASC;"></asp:SqlDataSource>
        </div>
    </form>
    <div>
    </div>
</body>
</html>
