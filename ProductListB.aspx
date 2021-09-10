<%@ Page Title="ToolWeb™ Portal Product List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductListB.aspx.vb" Inherits="ProductListB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="Product_Filtered" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_ProductQtextTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="Qtext" 
                QueryStringField="Qtext" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Product_Filtered_SpecSheet" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_ProductQtext_SpecSheetTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="Qtext" QueryStringField="Qtext" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    The Table below lists Products that have a Tool Spec Sheet for the Products 
    containing the query text in either their Item Number, Product Drawing, or 
    Description. Click on the &#39;select&#39; field to see the Spec Sheets for the desired 
    product.<br />
    <br />
    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" ReadOnly="True" 
        style="font-weight: 700; margin-left: 31px" Width="400px" Wrap="False">Products matching the search criteria: `´</asp:TextBox>
    <br />
    <br />
    <asp:GridView ID="GridView_ProductListB" runat="server" 
        AutoGenerateColumns="False" DataSourceID="Product_Filtered" AllowSorting="True" 
        CellPadding="2" style="margin-left: 30px" DataKeyNames="ProdID" 
        Width="80%">
        <Columns>
            <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" 
                SortExpression="ProdID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ProdID" 
                DataNavigateUrlFormatString="~/SpecSheetList.aspx?ProdID={0}" Text="Select">
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="40px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" 
                SortExpression="ItemNumber" >
            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing" 
                SortExpression="ProdDwg" >
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Left" Wrap="False" Width="110px" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" >
            <ItemStyle HorizontalAlign="Left" Wrap="True" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Notes_Product" HeaderText="Product Notes" 
                SortExpression="Notes" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No Products matched the search criteria.
        </EmptyDataTemplate>
        <HeaderStyle Wrap="False" VerticalAlign="Bottom" Font-Size="Small" />
        <RowStyle Wrap="True" Font-Size="Small" VerticalAlign="Top" />
    </asp:GridView>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" ReadOnly="True" 
        style="font-weight: 700; margin-left: 31px" Width="400px" Wrap="False">Products matching the search criteria: `´</asp:TextBox>
    <br />
    <br />
    <asp:GridView ID="GridView_ProductList_SpecSheet" runat="server" 
        AutoGenerateColumns="False" DataSourceID="Product_Filtered_SpecSheet" AllowSorting="True" 
        CellPadding="2" style="margin-left: 30px" DataKeyNames="SSID" Width="80%">
        <Columns>
            <asp:BoundField DataField="SSID" HeaderText="SSID" ReadOnly="True" 
                SortExpression="SSID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="SSID" 
                DataNavigateUrlFormatString="~/SpecSheetSimple.aspx?SSID={0}" Text="Select">
            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="40px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" 
                SortExpression="ItemNumber" >
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing" 
                SortExpression="ProdDwg" >
            <ItemStyle Width="110px" Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" >
            <ItemStyle HorizontalAlign="Left" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Notes_SpecSheet" HeaderText="Spec Sheet Notes" 
                SortExpression="Notes_SpecSheet">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No Spec Sheets matched the search criteria.
        </EmptyDataTemplate>
        <HeaderStyle Wrap="False" VerticalAlign="Bottom" Font-Size="Small" />
        <RowStyle Wrap="True" Font-Size="Small" VerticalAlign="Top" />
    </asp:GridView>
    </asp:Content>

