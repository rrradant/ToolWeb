<%@ Page Title="ToolWeb™ Portal Tool Cross Reference" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="XRefSingleDetail.aspx.vb" Inherits="XRefSingleDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="DetailInfo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_XRef_DwgDetSumTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DetID" QueryStringField="DetID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DetailXref" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_XRef_SingleDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DetID" QueryStringField="DetID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    Below is a list of all products that utilize the specified Tool Drawing and 
    Detail Number.<br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="DetailInfo" Height="16px" 
        style="margin-left: 0px" Width="0px" GridLines="None">
        <FieldHeaderStyle Font-Bold="True" HorizontalAlign="Right" Wrap="False" />
        <Fields>
            <asp:BoundField DataField="DwgDet" HeaderText="Drawing &amp; Detail:" ReadOnly="True" 
                SortExpression="DwgDet" />
            <asp:BoundField DataField="DwgName" HeaderText="Drawing Name:" 
                SortExpression="DwgName" />
        </Fields>
        <RowStyle HorizontalAlign="Left" Wrap="False" />
    </asp:DetailsView>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Cross Reference Information</strong><br />
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" 
        DataKeyNames="ProdID" DataSourceID="DetailXref" style="margin-left: 30px" 
        Font-Bold="False">
        <Columns>
            <asp:HyperLinkField Text="Select" DataNavigateUrlFields="ProdID" 
                DataNavigateUrlFormatString="~/SpecSheetList.aspx?ProdID={0}" 
                NavigateUrl="~/SpecSheetList.aspx" />
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" 
                SortExpression="ItemNumber" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing" 
                SortExpression="ProdDwg" />
        </Columns>
        <EmptyDataTemplate>
            This Tool is not assigned to any products.
        </EmptyDataTemplate>
        <HeaderStyle HorizontalAlign="Center" Font-Bold="False" Font-Size="Small" />
        <RowStyle HorizontalAlign="Center" Font-Size="Small" Wrap="False" />
    </asp:GridView>
</asp:Content>

