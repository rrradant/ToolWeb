<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Test_Table_Page.aspx.vb" Inherits="Test_Table_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.Test_TableTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_TestID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TestText" Type="String" />
            <asp:Parameter Name="TestBoo" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TestText" Type="String" />
            <asp:Parameter Name="TestBoo" Type="Boolean" />
            <asp:Parameter Name="Original_TestID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="TestID" 
        DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                </td>
                <td>
                    <asp:Label ID="TestIDLabel" runat="server" Text='<%# Eval("TestID") %>' />
                </td>
                <td>
                    <asp:Label ID="TestTextLabel" runat="server" Text='<%# Eval("TestText") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TestBooCheckBox" runat="server" 
                        Checked='<%# Eval("TestBoo") %>' Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="TestIDLabel1" runat="server" Text='<%# Eval("TestID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TestTextTextBox" runat="server" 
                        Text='<%# Bind("TestText") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TestBooCheckBox" runat="server" 
                        Checked='<%# Bind("TestBoo") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TestTextTextBox" runat="server" 
                        Text='<%# Bind("TestText") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TestBooCheckBox" runat="server" 
                        Checked='<%# Bind("TestBoo") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                </td>
                <td>
                    <asp:Label ID="TestIDLabel" runat="server" Text='<%# Eval("TestID") %>' />
                </td>
                <td>
                    <asp:Label ID="TestTextLabel" runat="server" Text='<%# Eval("TestText") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TestBooCheckBox" runat="server" 
                        Checked='<%# Eval("TestBoo") %>' Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" 
                            style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    TestID</th>
                                <th runat="server">
                                    TestText</th>
                                <th runat="server">
                                    TestBoo</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                </td>
                <td>
                    <asp:Label ID="TestIDLabel" runat="server" Text='<%# Eval("TestID") %>' />
                </td>
                <td>
                    <asp:Label ID="TestTextLabel" runat="server" Text='<%# Eval("TestText") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="TestBooCheckBox" runat="server" 
                        Checked='<%# Eval("TestBoo") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />
    <br />
</asp:Content>

