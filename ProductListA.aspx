<%@ Page Title="ToolWeb™ Portal Product List" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ProductListA.aspx.vb" Inherits="ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style6
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ObjectDataSource ID="SelectedProductLine" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.ProductLineTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="PLID" QueryStringField="PLID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    The Table below lists Products that have a Tool Spec Sheet for the selected 
    Product Line and Equipment combination. Click on the &#39;select&#39; field to see the 
    Spec Sheets for the desired product.<br />
    <br />
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<strong> <span class="style6">Selected Criteria:</span></strong><br />
    <asp:DataList ID="ProductLineDataList" runat="server" 
        DataSourceID="SelectedProductLine" style="margin-left: 30px">
        <ItemTemplate>
            <strong>Product Line:</strong>
            <asp:Label ID="ProdLineLabel" runat="server" Text='<%# Eval("ProdLine") %>' />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="SelectedEquipment" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.EquipmentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="EquipID" QueryStringField="EquipID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SelectedEquipment" 
        style="margin-left: 30px">
        <ItemTemplate>
            <strong>Equipment:</strong>
            <asp:Label ID="EquipmentLabel" runat="server" Text='<%# Eval("Equipment") %>' />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:ObjectDataSource ID="Product_Filtered" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetProduct" 
        TypeName="ToolingDBTableAdapters.View_ProductTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="PLID" 
                QueryStringField="PLID" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="" Name="EquipID" 
                QueryStringField="EquipID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Matching Products</strong><br />
    <asp:GridView ID="GridView_ProductFiltered" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="1" DataKeyNames="ProdID" 
        DataSourceID="Product_Filtered" style="margin-left: 30px">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ProdID" 
                DataNavigateUrlFormatString="~/SpecSheetList.aspx?ProdID={0}" 
                Text="Select" >
            <ItemStyle VerticalAlign="Top" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" 
                SortExpression="ProdID" Visible="False" />
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" 
                SortExpression="ItemNumber" >
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="ProdDwg" HeaderText="Product Drawing" 
                SortExpression="ProdDwg" >
            <HeaderStyle Wrap="False" />
            <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" >
            <HeaderStyle Wrap="False" />
            <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="Notes_Product" HeaderText="Notes" 
                SortExpression="Notes" >
            <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle Font-Size="Small" />
        <RowStyle Font-Size="Small" />
    </asp:GridView>
</asp:Content>

