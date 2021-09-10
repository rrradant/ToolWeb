
Partial Class ProductListB
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim intRowCountProd As Integer = GridView_ProductListB.Rows.Count
        Dim intRowCountSS As Integer = GridView_ProductList_SpecSheet.Rows.Count

        Dim strProdID As String
        Dim strQString As String

        'For testing logging the User's activities
        Dim UserName As String
        Dim QText_TA As New ToolingDBTableAdapters.QtextLogTableAdapter
        'End practice code

        strQString = Me.ClientQueryString
        If Not strQString = "" Then
            strQString = UCase(strQString)
            strQString = Right(strQString, Len(strQString) - 6)
        End If

        'For testing logging the User's activities
        UserName = Request.ServerVariables("LOGON_USER")
        'UserName = User.Identity.Name.ToString Returns Blank
        'UserName = System.Environment.UserName.ToString Returns NETWORK SERVICE

        On Error Resume Next
        QText_TA.InsertQuery_NewSearch(UserName, strQString)
        On Error GoTo 0
        'End practice code

        TextBox1.Text = "Products matching the search criteria: `" & strQString & "´"
        TextBox2.Text = "Spec Sheets matching the search criteria: `" & strQString & "´"

        If intRowCountProd = 1 And intRowCountSS = 0 Then
            GridView_ProductListB.SelectRow(0)
            strProdID = GridView_ProductListB.DataKeys(0).Value
            Response.Redirect("~/SpecSheetList.aspx?ProdID=" & strProdID, True)
        End If

    End Sub
End Class
