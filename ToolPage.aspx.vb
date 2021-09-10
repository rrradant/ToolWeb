
Partial Class ToolPage
    Inherits System.Web.UI.Page

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PreRender
        Dim strHead As String
        Dim strLab As String
        Dim i As Integer

        Dim booDetails As Boolean

        booDetails = DetailsView1.Rows(4).Cells(1).Text

        If booDetails = True Then
            DetailsView1.Rows(4).Cells(1).Text = "See Below"
            GridView1.Visible = True
        Else
            DetailsView1.Rows(4).Cells(1).Text = "None"
            GridView1.Visible = False
            Exit Sub
        End If


        If GridView1.Rows.Count >= 1 Then
            GridView1.SelectRow(0)
            DataList1.SelectedIndex = 0

            'This sets visibility
            For i = 1 To 32
                If i < 10 Then
                    strLab = "Var0" & CStr(i) & "NameLabel"
                Else
                    strLab = "Var" & CStr(i) & "NameLabel"
                End If
                strHead = CType(DataList1.SelectedItem.FindControl(strLab), Label).Text
                If strHead = "" Then
                    GridView1.Columns(i + 3).Visible = False
                Else
                    GridView1.Columns(i + 3).Visible = True
                End If
            Next i

            'This assigns names
            For i = 1 To 32
                If i < 10 Then
                    strLab = "Var0" & CStr(i) & "NameLabel"
                Else
                    strLab = "Var" & CStr(i) & "NameLabel"
                End If
                strHead = CType(DataList1.SelectedItem.FindControl(strLab), Label).Text
                If Not strHead = "" Then
                    GridView1.HeaderRow.Cells(i + 3).Text = strHead
                End If
            Next i

        End If
    End Sub
End Class
