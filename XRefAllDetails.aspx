<%@ Page Title="ToolWeb™ Portal Tool Cross Reference" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="XRefAllDetails.aspx.vb" Inherits="XRefAllDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="DrawingInfo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_XRef_DwgSumTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DrawingXRef" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_XRef_AllDetailsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    Below is a list of all products that utilize the specified Tool Drawing.<br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="DrawingInfo" GridLines="None" Height="16px" Width="0px">
        <FieldHeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Right" />
        <Fields>
            <asp:BoundField DataField="DwgNum" HeaderText="Drawing Number:" 
                SortExpression="DwgNum" />
            <asp:BoundField DataField="DwgName" HeaderText="Drawing Name:" 
                SortExpression="DwgName" />
        </Fields>
        <RowStyle Wrap="False" />
    </asp:DetailsView>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Cross Reference Information</strong><asp:GridView 
        ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="1" DataSourceID="DrawingXRef" PageSize="40" 
        style="margin-left: 30px">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProdID" 
                DataNavigateUrlFormatString="~/SpecSheetList.aspx?ProdID={0}" 
                NavigateUrl="~/SpecSheetList.aspx" Text="Select" />
            <asp:BoundField DataField="DashNum" HeaderText="Detail #" ReadOnly="True" 
                SortExpression="DashNum"></asp:BoundField>
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" 
                SortExpression="ItemNumber"></asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description"></asp:BoundField>
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing" 
                SortExpression="ProdDwg"></asp:BoundField>
        </Columns>
        <EmptyDataTemplate>
            This Tool is not assigned to any products.
        </EmptyDataTemplate>
        <HeaderStyle Font-Size="Small" HorizontalAlign="Center" Wrap="False" />
        <PagerSettings Mode="NumericFirstLast" />
        <RowStyle Font-Size="Small" HorizontalAlign="Center" Wrap="False" />
    </asp:GridView>
</asp:Content>

