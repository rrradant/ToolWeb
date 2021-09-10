<%@ Page Title="ToolWeb™ Portal Tool Information" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ToolPage.aspx.vb" Inherits="ToolPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:ObjectDataSource ID="DrawingDetails" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="ToolingDBTableAdapters.View_DrawingDetailsTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DrawingInfo" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="ToolingDBTableAdapters.View_DrawingInfoTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DrawingEquip" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="ToolingDBTableAdapters.View_DrawingEquipTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="DetailLabels" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="ToolingDBTableAdapters.View_DetailLabelsTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DwgID" QueryStringField="DwgID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="DrawingInfo" Height="50px" CaptionAlign="Left" 
            BorderStyle="None" GridLines="None" 
            HeaderText="Tool Information" style="margin-left: 30px">
            <FieldHeaderStyle BorderStyle="None" Font-Bold="True" Font-Size="Medium" 
                HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="DwgNum" HeaderText="Drawing #:" 
                    SortExpression="DwgNum" />
                <asp:BoundField DataField="DwgName" HeaderText="Name:" 
                    SortExpression="DwgName" />
                <asp:BoundField DataField="RevLevel" HeaderText="Revision:" 
                    SortExpression="RevLevel" />
                <asp:BoundField DataField="ToolType" HeaderText="Tool Type:" 
                    SortExpression="ToolType" />
                <asp:BoundField DataField="Details" HeaderText="Details:" 
                    SortExpression="Details" />
            </Fields>
            <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Font-Underline="True" />
            <RowStyle Font-Size="Medium" />
        </asp:DetailsView>
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
            DataKeyNames="DwgID" DataSourceID="DrawingInfo" GridLines="None" Height="16px" 
            style="margin-left: 49px" Width="125px">
            <Fields>
                <asp:HyperLinkField DataNavigateUrlFields="DwgID" 
                    DataNavigateUrlFormatString="~/XRefAllDetails.aspx?DwgID={0}" 
                    NavigateUrl="~/XRefAllDetails.aspx" Text="Cross Reference" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="DrawingEquip" 
            style="margin-left: 30px">
            <HeaderStyle Font-Bold="True" Font-Size="Medium" Font-Underline="True" />
            <HeaderTemplate>
                Equipment:
            </HeaderTemplate>
            <ItemStyle Font-Size="Medium" Wrap="False" />
            <ItemTemplate>
                <asp:Label ID="EquipmentLabel" runat="server" Text='<%# Eval("Equipment") %>' />
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="DetailLabels" 
            Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" Visible="False">
            <ItemTemplate>
                Var01Name:
                <asp:Label ID="Var01NameLabel" runat="server" Text='<%# Eval("Var01Name") %>' />
                <br />
                Var02Name:
                <asp:Label ID="Var02NameLabel" runat="server" Text='<%# Eval("Var02Name") %>' />
                <br />
                Var03Name:
                <asp:Label ID="Var03NameLabel" runat="server" Text='<%# Eval("Var03Name") %>' />
                <br />
                Var04Name:
                <asp:Label ID="Var04NameLabel" runat="server" Text='<%# Eval("Var04Name") %>' />
                <br />
                Var05Name:
                <asp:Label ID="Var05NameLabel" runat="server" Text='<%# Eval("Var05Name") %>' />
                <br />
                Var06Name:
                <asp:Label ID="Var06NameLabel" runat="server" Text='<%# Eval("Var06Name") %>' />
                <br />
                Var07Name:
                <asp:Label ID="Var07NameLabel" runat="server" Text='<%# Eval("Var07Name") %>' />
                <br />
                Var08Name:
                <asp:Label ID="Var08NameLabel" runat="server" Text='<%# Eval("Var08Name") %>' />
                <br />
                Var09Name:
                <asp:Label ID="Var09NameLabel" runat="server" Text='<%# Eval("Var09Name") %>' />
                <br />
                Var10Name:
                <asp:Label ID="Var10NameLabel" runat="server" Text='<%# Eval("Var10Name") %>' />
                <br />
                Var11Name:
                <asp:Label ID="Var11NameLabel" runat="server" Text='<%# Eval("Var11Name") %>' />
                <br />
                Var12Name:
                <asp:Label ID="Var12NameLabel" runat="server" Text='<%# Eval("Var12Name") %>' />
                <br />
                Var13Name:
                <asp:Label ID="Var13NameLabel" runat="server" Text='<%# Eval("Var13Name") %>' />
                <br />
                Var14Name:
                <asp:Label ID="Var14NameLabel" runat="server" Text='<%# Eval("Var14Name") %>' />
                <br />
                Var15Name:
                <asp:Label ID="Var15NameLabel" runat="server" Text='<%# Eval("Var15Name") %>' />
                <br />
                Var16Name:
                <asp:Label ID="Var16NameLabel" runat="server" Text='<%# Eval("Var16Name") %>' />
                <br />
                Var17Name:
                <asp:Label ID="Var17NameLabel" runat="server" Text='<%# Eval("Var17Name") %>' />
                <br />
                Var18Name:
                <asp:Label ID="Var18NameLabel" runat="server" Text='<%# Eval("Var18Name") %>' />
                <br />
                Var19Name:
                <asp:Label ID="Var19NameLabel" runat="server" Text='<%# Eval("Var19Name") %>' />
                <br />
                Var20Name:
                <asp:Label ID="Var20NameLabel" runat="server" Text='<%# Eval("Var20Name") %>' />
                <br />
                Var21Name:
                <asp:Label ID="Var21NameLabel" runat="server" Text='<%# Eval("Var21Name") %>' />
                <br />
                Var22Name:
                <asp:Label ID="Var22NameLabel" runat="server" Text='<%# Eval("Var22Name") %>' />
                <br />
                Var23Name:
                <asp:Label ID="Var23NameLabel" runat="server" Text='<%# Eval("Var23Name") %>' />
                <br />
                Var24Name:
                <asp:Label ID="Var24NameLabel" runat="server" Text='<%# Eval("Var24Name") %>' />
                <br />
                Var25Name:
                <asp:Label ID="Var25NameLabel" runat="server" Text='<%# Eval("Var25Name") %>' />
                <br />
                Var27Name:
                <asp:Label ID="Var27NameLabel" runat="server" Text='<%# Eval("Var27Name") %>' />
                <br />
                Var26Name:
                <asp:Label ID="Var26NameLabel" runat="server" Text='<%# Eval("Var26Name") %>' />
                <br />
                Var28Name:
                <asp:Label ID="Var28NameLabel" runat="server" Text='<%# Eval("Var28Name") %>' />
                <br />
                Var29Name:
                <asp:Label ID="Var29NameLabel" runat="server" Text='<%# Eval("Var29Name") %>' />
                <br />
                Var30Name:
                <asp:Label ID="Var30NameLabel" runat="server" Text='<%# Eval("Var30Name") %>' />
                <br />
                Var31Name:
                <asp:Label ID="Var31NameLabel" runat="server" Text='<%# Eval("Var31Name") %>' />
                <br />
                Var32Name:
                <asp:Label ID="Var32NameLabel" runat="server" Text='<%# Eval("Var32Name") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
    </p>
    <strong>Drawing Specific Details:</strong><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="DetID" DataSourceID="DrawingDetails" CellPadding="1">
            <Columns>
                <asp:HyperLinkField Text="Select" DataNavigateUrlFields="DetID" 
                    DataNavigateUrlFormatString="~/ToolDetail.aspx?DetID={0}" 
                    NavigateUrl="~/ToolDetail.aspx">
                <ItemStyle Font-Size="Small" Wrap="False" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="DetID" HeaderText="DetID" ReadOnly="True" 
                    SortExpression="DetID" Visible="False" />
                <asp:BoundField DataField="DetailNum" HeaderText="Detail #" 
                    SortExpression="DetailNum" >
                <ItemStyle Font-Size="Small" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="PrimeSize" HeaderText="Primary Size" 
                    SortExpression="PrimeSize" >
                <ItemStyle Font-Size="Small" HorizontalAlign="Left" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Var01" HeaderText="Var01" 
                    SortExpression="Var01" >
                <ItemStyle Font-Size="Small" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Var02" HeaderText="Var02" SortExpression="Var02" />
                <asp:BoundField DataField="Var03" HeaderText="Var03" 
                    SortExpression="Var03" />
                <asp:BoundField DataField="Var04" HeaderText="Var04" SortExpression="Var04" />
                <asp:BoundField DataField="Var05" HeaderText="Var05" 
                    SortExpression="Var05" />
                <asp:BoundField DataField="Var06" HeaderText="Var06" SortExpression="Var06" />
                <asp:BoundField DataField="Var07" HeaderText="Var07" SortExpression="Var07" />
                <asp:BoundField DataField="Var08" HeaderText="Var08" SortExpression="Var08" />
                <asp:BoundField DataField="Var09" HeaderText="Var09" SortExpression="Var09" />
                <asp:BoundField DataField="Var10" HeaderText="Var10" SortExpression="Var10" />
                <asp:BoundField DataField="Var11" HeaderText="Var11" SortExpression="Var11" />
                <asp:BoundField DataField="Var12" HeaderText="Var12" SortExpression="Var12" />
                <asp:BoundField DataField="Var13" HeaderText="Var13" SortExpression="Var13" />
                <asp:BoundField DataField="Var14" HeaderText="Var14" SortExpression="Var14" />
                <asp:BoundField DataField="Var15" HeaderText="Var15" SortExpression="Var15" />
                <asp:BoundField DataField="Var16" HeaderText="Var16" SortExpression="Var16" />
                <asp:BoundField DataField="Var17" HeaderText="Var17" SortExpression="Var17" />
                <asp:BoundField DataField="Var18" HeaderText="Var18" SortExpression="Var18" />
                <asp:BoundField DataField="Var19" HeaderText="Var19" SortExpression="Var19" />
                <asp:BoundField DataField="Var20" HeaderText="Var20" SortExpression="Var20" />
                <asp:BoundField DataField="Var21" HeaderText="Var21" SortExpression="Var21" />
                <asp:BoundField DataField="Var22" HeaderText="Var22" SortExpression="Var22" />
                <asp:BoundField DataField="Var23" HeaderText="Var23" SortExpression="Var23" />
                <asp:BoundField DataField="Var24" HeaderText="Var24" SortExpression="Var24" />
                <asp:BoundField DataField="Var25" HeaderText="Var25" SortExpression="Var25" />
                <asp:BoundField DataField="Var26" HeaderText="Var26" SortExpression="Var26" />
                <asp:BoundField DataField="Var27" HeaderText="Var27" SortExpression="Var27" />
                <asp:BoundField DataField="Var28" HeaderText="Var28" SortExpression="Var28" />
                <asp:BoundField DataField="Var29" HeaderText="Var29" SortExpression="Var29" />
                <asp:BoundField DataField="Var30" HeaderText="Var30" SortExpression="Var30" />
                <asp:BoundField DataField="Var31" HeaderText="Var31" SortExpression="Var31" />
                <asp:BoundField DataField="Var32" HeaderText="Var32" SortExpression="Var32" />
            </Columns>
            <EmptyDataTemplate>
                No Details are available for this Drawing.
            </EmptyDataTemplate>
            <HeaderStyle Font-Bold="True" Font-Size="Small" HorizontalAlign="Center" 
                VerticalAlign="Bottom" Wrap="False" />
            <RowStyle Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Top" />
        </asp:GridView>
    </asp:Content>

