
Partial Class ToolDetail
    Inherits System.Web.UI.Page

    Protected Sub DetailsView2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView2.PreRender
        Dim strHead As String
        Dim strLab As String
        Dim i As Integer

        DataList2.SelectedIndex = 0

        For i = 1 To 32
            If i < 10 Then
                strLab = "Var0" & CStr(i) & "NameLabel"
            Else
                strLab = "Var" & CStr(i) & "NameLabel"
            End If
            strHead = CType(DataList2.SelectedItem.FindControl(strLab), Label).Text
            If strHead = "" Then
                DetailsView2.Rows(i + 1).Visible = False
                If i = 1 Then
                    DetailsView2.HeaderRow.Visible = False
                    DetailsView2.Rows(0).Visible = False
                    DetailsView2.Rows(1).Visible = False
                End If
            Else
                DetailsView2.Rows(i + 1).Visible = True
                DetailsView2.Rows(i + 1).Cells(0).Text = strHead & " ="
            End If
        Next i

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
