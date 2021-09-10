
Partial Class SpecSheetList
    Inherits System.Web.UI.Page



    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim intRowCount As Integer = GridView1.Rows.Count
        Dim strSSID As String

        If intRowCount = 1 Then
            GridView1.SelectRow(0)
            strSSID = GridView1.DataKeys(0).Value
            Response.Redirect("~/SpecSheetSimple.aspx?SSID=" & strSSID, True)
        End If
    End Sub
End Class
