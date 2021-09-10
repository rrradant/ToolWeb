<%@ Page Title="ToolWeb™ Portal Main Page" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <asp:ObjectDataSource ID="ProductLine" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetProductLine" 
        TypeName="ToolingDBTableAdapters.View_ProductLineTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Equipment" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetEquipment" 
        TypeName="ToolingDBTableAdapters.View_EquipmentTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProductLine_per_Equipment" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetProductLine_per_Equipment" 
        TypeName="ToolingDBTableAdapters.View_ProductLine_per_EquipmentTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_Equipment" Name="EquipID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Equipment_per_ProductLine" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetEquipment_per_ProductLine" 
        TypeName="ToolingDBTableAdapters.View_Equipment_per_ProductLineTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DDL_ProductLine" Name="PLID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="DrawingList" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ToolingDBTableAdapters.View_DrawingListTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DwgBox" ConvertEmptyStringToNull="False" 
                Name="DwgTxt" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <strong><em>Select the appropriate Product Line and Equipment Type:</em></strong><br />
&nbsp;&nbsp;&nbsp; Product Line:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Equipment Type:<br />
&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DDL_ProductLine" runat="server" AutoPostBack="True" 
        DataSourceID="ProductLine" DataTextField="ProdLine" DataValueField="PLID" 
        Width="150px">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DDL_Equipment" runat="server" AutoPostBack="True" 
        DataSourceID="Equipment" DataTextField="Equipment" 
        DataValueField="EquipID" Width="150px">
    </asp:DropDownList>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="SubmitButton" runat="server" Enabled="False" Text="Submit" 
        Width="75px" UseSubmitBehavior="False" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ResetButton" runat="server" Text="Reset" 
        Width="75px" UseSubmitBehavior="False" />
    <br />
    <hr />
    <br />
    <strong><em>Enter Query Text (Product Item Number, Product Drawing, or Description):</em></strong><br />
    &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="QtextBox" runat="server" Width="100px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="SubmitButton2" runat="server" Text="Submit" Width="75px" 
        UseSubmitBehavior="False" />
    <br />
    <hr />
    <br />
    <em><strong>Enter Tool Drawing Number or select from List:</strong></em><br />
&nbsp;&nbsp;&nbsp; Filter by:&nbsp;<asp:TextBox ID="DwgBox" runat="server" 
    Width="110px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="SubmitButton4" runat="server" Text="Apply" Width="75px" 
        UseSubmitBehavior="False" />
    <br />
<br />
&nbsp;&nbsp;&nbsp;
    Drawing:&nbsp;<asp:DropDownList ID="DDL_Drawing" runat="server" 
        DataSourceID="DrawingList" DataTextField="Drawing" DataValueField="DwgID" 
        Height="22px" Width="300px">
    </asp:DropDownList>
    <br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="SubmitButton5" runat="server" Text="Submit" Width="75px" 
        UseSubmitBehavior="False" Height="26px" />
    <br />
    <br />
    </asp:Content>


