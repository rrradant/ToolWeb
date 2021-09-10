<%@ Page Title="ToolWeb™ Portal Spec Sheet" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="SpecSheetSimple.aspx.vb" Inherits="SimpleSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ObjectDataSource ID="SelectedSpecSheetSummary" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_SpecSheetSummaryTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="SSID" QueryStringField="SSID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="SelectedSpecSheetInfo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_SpecSheetInfoTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="SSID" QueryStringField="SSID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="SSID" DataSourceID="SelectedSpecSheetInfo" Height="50px" 
        HeaderText="Spec Sheet Information" GridLines="None">
        <FieldHeaderStyle Font-Bold="True" HorizontalAlign="Right" Wrap="False" />
        <Fields>
            <asp:BoundField DataField="ItemNumber" HeaderText="ItemNumber: " 
                SortExpression="ItemNumber" />
            <asp:BoundField DataField="Description" HeaderText="Description: " 
                SortExpression="Description" />
<asp:BoundField DataField="ProdDwg" HeaderText="Product Dwg: " SortExpression="ProdDwg">
            <ItemStyle BorderStyle="None" BorderWidth="10px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProdLine" HeaderText="Product Line: " 
                SortExpression="ProdLine" />
            <asp:BoundField DataField="Equipment" HeaderText="Equipment: " 
                SortExpression="Equipment" />
            <asp:BoundField DataField="Created" HeaderText="Created: " 
                SortExpression="Created" />
        </Fields>
        <HeaderStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Left" 
            Wrap="False" Font-Underline="True" />
        <RowStyle Wrap="False" />
    </asp:DetailsView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="SSID" DataSourceID="SelectedSpecSheetInfo" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Notes" HeaderText="Spec Sheet Notes" 
                SortExpression="Notes">
            <ControlStyle BorderStyle="None" />
            <HeaderStyle BorderStyle="None" HorizontalAlign="Left" VerticalAlign="Bottom" 
                Font-Underline="True" />
            <ItemStyle BorderStyle="None" HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SelectedSpecSheetSummary" Font-Bold="False" CellPadding="1">
        <Columns>
            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="DetID" 
                DataNavigateUrlFormatString="~/ToolDetail.aspx?DetID={0}" 
                DataTextField="DwgDet" HeaderText="Drawing &amp; Detail" 
                NavigateUrl="~/ToolDetail.aspx" />
            <asp:BoundField DataField="DwgName" HeaderText="Tool Name" 
                SortExpression="DwgName">
            </asp:BoundField>
            <asp:BoundField DataField="ToolType" HeaderText="Type" 
                SortExpression="ToolType">
            </asp:BoundField>
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                SortExpression="Remarks" />
        </Columns>
        <EmptyDataTemplate>
            There are no line items to display.
        </EmptyDataTemplate>
        <HeaderStyle Font-Bold="True" Font-Size="Small" BorderStyle="None" 
            Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Bottom" />
        <RowStyle Font-Size="Small" Wrap="False" HorizontalAlign="Left" 
            VerticalAlign="Top" />
    </asp:GridView>
    </asp:Content>

