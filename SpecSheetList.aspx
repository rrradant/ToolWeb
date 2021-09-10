<%@ Page Title="ToolWeb™ Portal Spec Sheet List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SpecSheetList.aspx.vb" Inherits="SpecSheetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="ProductInfo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_ProductInfoTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProdID" QueryStringField="ProdID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="SpecSheets_Filtered" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSpecSheets" 
        TypeName="ToolingDBTableAdapters.View_SpecSheetsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProdID" QueryStringField="ProdID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    Below is a list of all the Spec Sheets available for the specified Product:<em><br />
    <br />
    </em><asp:DetailsView 
        ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="None" 
        DataKeyNames="ProdID" DataSourceID="ProductInfo" GridLines="None" 
        HeaderText="Product Information" Height="16px" style="margin-left: 30px" 
        Width="0px">
        <FieldHeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" 
            Wrap="False" />
        <Fields>
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number:" 
                SortExpression="ItemNumber" />
            <asp:BoundField DataField="Description" HeaderText="Description:" 
                SortExpression="Description" />
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing:" 
                SortExpression="ProdDwg" />
            <asp:BoundField DataField="Notes" HeaderText="Notes:" SortExpression="Notes" />
        </Fields>
        <HeaderStyle Font-Bold="True" Font-Underline="True" />
        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
    </asp:DetailsView>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Spec Sheets Available</strong><asp:GridView ID="GridView1" 
        runat="server" AutoGenerateColumns="False" 
        DataKeyNames="SSID" DataSourceID="SpecSheets_Filtered" CellPadding="1" 
        AllowSorting="True" style="margin-left: 30px">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="SSID" 
                DataNavigateUrlFormatString="~/SpecSheetSimple.aspx?SSID={0}" Text="Select" />
            <asp:HyperLinkField DataNavigateUrlFields="SSID" 
                DataNavigateUrlFormatString="~/SpecSheetSimple.aspx?SSID={0}" 
                DataTextField="SSID" HeaderText="Spec Sheed ID" Visible="False" >
            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Wrap="False" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="Equipment" HeaderText="Equipment" 
                SortExpression="Equipment" >
            <ItemStyle VerticalAlign="Top" Wrap="False" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Notes" HeaderText="Spec Sheet Notes" 
                SortExpression="Notes" >
            <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            No Spec Sheets exist for this product.
        </EmptyDataTemplate>
        <HeaderStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Center" 
            VerticalAlign="Bottom" />
        <RowStyle Font-Size="Small" VerticalAlign="Top" />
    </asp:GridView>
</asp:Content>

