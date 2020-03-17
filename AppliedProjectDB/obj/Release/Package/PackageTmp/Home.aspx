<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AppliedProjectDB.Home" %>

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
        </style>
</head>
<body style="text-align: center; font-weight: 700; font-size: xx-large">
    <form id="form1" runat="server">
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
        <div>
            Choose a Project:<br />
            <asp:ListBox ID="ProjectList" runat="server" AutoPostBack="True" DataSourceID="Projects" DataTextField="P_Name" DataValueField="P_Number" Height="179px" Width="239px"></asp:ListBox>
            <asp:SqlDataSource ID="Projects" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Project]"></asp:SqlDataSource>
        </div>
        <div style="padding: 0px 0px 20px 0px">
            <asp:FormView ID="UrlView" runat="server" CellPadding="4" DataSourceID="UrlSource" ForeColor="#333333">
                <EditItemTemplate>
                    Website:
                    <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    Website:
                    <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Website:
                    <asp:Label ID="WebsiteLabel" runat="server" Text='<%# Bind("Website") %>' />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
            <asp:SqlDataSource ID="UrlSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P_URL Website FROM Project
WHERE Project.P_Number = @Pno">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProjectList" Name="Pno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="padding: 0px 0px 20px 0px">
            <asp:FormView ID="DescView" runat="server" CellPadding="4" DataSourceID="DescSource" ForeColor="#333333">
                <EditItemTemplate>
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
            <asp:SqlDataSource ID="DescSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P_Description Description FROM Project
WHERE Project.P_Number = @Pno">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProjectList" Name="Pno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="padding: 0px 0px 20px 0px">
            <asp:FormView ID="FaView" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="FaSource" GridLines="Vertical">
                <EditItemTemplate>
                    ContactEmailAt:
                    <asp:TextBox ID="ContactEmailAtTextBox" runat="server" Text='<%# Bind("ContactEmailAt") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    ContactEmailAt:
                    <asp:TextBox ID="ContactEmailAtTextBox" runat="server" Text='<%# Bind("ContactEmailAt") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ContactEmailAt:
                    <asp:Label ID="ContactEmailAtLabel" runat="server" Text='<%# Bind("ContactEmailAt") %>' />
                    <br />
                </ItemTemplate>
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            </asp:FormView>
            <asp:SqlDataSource ID="FaSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT P_ContactEmail ContactEmailAt FROM Project
WHERE Project.P_Number = @Pno">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProjectList" Name="Pno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:GridView ID="StudentView" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Std_ID" DataSourceID="StudentSource" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Std_Fname" HeaderText="Std_Fname" SortExpression="Std_Fname" />
                    <asp:BoundField DataField="Std_MI" HeaderText="Std_MI" SortExpression="Std_MI" />
                    <asp:BoundField DataField="Std_Lname" HeaderText="Std_Lname" SortExpression="Std_Lname" />
                    <asp:BoundField DataField="Std_ID" HeaderText="Std_ID" ReadOnly="True" SortExpression="Std_ID" />
                    <asp:BoundField DataField="Std_Phone" HeaderText="Std_Phone" SortExpression="Std_Phone" />
                    <asp:BoundField DataField="Std_UW_Email" HeaderText="Std_UW_Email" SortExpression="Std_UW_Email" />
                    <asp:BoundField DataField="Std_Degree" HeaderText="Std_Degree" SortExpression="Std_Degree" />
                    <asp:BoundField DataField="Std_Graduation" HeaderText="Std_Graduation" SortExpression="Std_Graduation" />
                    <asp:BoundField DataField="Pno" HeaderText="Pno" SortExpression="Pno" />
                    <asp:BoundField DataField="Fno" HeaderText="Fno" SortExpression="Fno" />
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
            <asp:SqlDataSource ID="StudentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Student] WHERE ([Pno] = @Pno)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProjectList" Name="Pno" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
