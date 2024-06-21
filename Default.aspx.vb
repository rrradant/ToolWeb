Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DDL_ProductLine_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_ProductLine.DataBound
        DDL_ProductLine.Items.Insert(0, "")
    End Sub

    Protected Sub DDL_ProductLine_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_ProductLine.SelectedIndexChanged
        Call ClearQueryBox()
        'Call clearSSIDBox()
        Call ClearDwg()

        If DDL_ProductLine.DataSourceID = "ProductLine" Then
            If Not DDL_ProductLine.SelectedIndex = 0 Then
                DDL_Equipment.DataSourceID = "Equipment_per_ProductLine"
            Else
                DDL_Equipment.DataSourceID = "Equipment"
            End If
        End If
        If DDL_ProductLine.SelectedIndex = 0 Or DDL_Equipment.SelectedIndex = 0 Then
            SubmitButton.Enabled = False
            SetFocus(DDL_Equipment)
        Else
            SubmitButton.Enabled = True
            SetFocus(SubmitButton)
        End If

    End Sub

    Protected Sub DDL_Equipment_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Equipment.DataBound
        DDL_Equipment.Items.Insert(0, "")
    End Sub

    Protected Sub DDL_Equipment_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Equipment.SelectedIndexChanged
        Call ClearQueryBox()
        'Call clearSSIDBox()
        Call ClearDwg()

        If DDL_Equipment.DataSourceID = "Equipment" Then
            If Not DDL_Equipment.SelectedIndex = 0 Then
                DDL_ProductLine.DataSourceID = "ProductLine_per_Equipment"
            Else
                DDL_ProductLine.DataSourceID = "ProductLine"
            End If
        End If
        If DDL_ProductLine.SelectedIndex = 0 Or DDL_Equipment.SelectedIndex = 0 Then
            SubmitButton.Enabled = False
            SetFocus(DDL_ProductLine)
        Else
            SubmitButton.Enabled = True
            SetFocus(SubmitButton)
        End If

    End Sub

    Protected Sub ResetButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ResetButton.Click
        Call ClearQueryBox()
        'Call clearSSIDBox()
        Call ClearDwg()

        DDL_ProductLine.DataSourceID = "ProductLine"
        DDL_ProductLine.SelectedIndex = -1
        DDL_Equipment.DataSourceID = "Equipment"
        DDL_Equipment.SelectedIndex = -1
        SubmitButton.Enabled = False

    End Sub

    Protected Sub SubmitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton.Click
        Dim strQString As String

        Call ClearQueryBox()
        'Call clearSSIDBox()
        Call ClearDwg()

        If DDL_ProductLine.SelectedValue = "" Or DDL_Equipment.SelectedValue = "" Then Exit Sub

        strQString = "~/ProductListA.aspx?" & "PLID=" & DDL_ProductLine.SelectedValue
        strQString = strQString & "&EquipID=" & DDL_Equipment.SelectedValue

        Response.Redirect(strQString, True)

    End Sub

    Protected Sub SubmitButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton2.Click
        Dim strQString As String
        If Trim(QtextBox.Text) = "" Then
            QtextBox.Text = ""
            SetFocus(QtextBox)
            Beep()
            Exit Sub
        End If

        strQString = "~/ProductListB.aspx?" & "Qtext=" & Trim(QtextBox.Text)
        Response.Redirect(strQString, True)

    End Sub

    Protected Sub DDL_Drawing_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDL_Drawing.DataBound
        DDL_Drawing.Items.Insert(0, "")
    End Sub

    Sub ClearProdEquip()
        DDL_ProductLine.ClearSelection()
        DDL_Equipment.ClearSelection()
        SubmitButton.Enabled = False
    End Sub

    Sub ClearQueryBox()
        QtextBox.Text = ""
    End Sub

    Sub ClearDwg()
        DwgBox.Text = ""
        'DDL_Drawing.ClearSelection()
    End Sub

    Protected Sub SubmitButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton4.Click

        Call ClearProdEquip()
        Call ClearQueryBox()
        'Call clearSSIDBox()

        DwgBox.Text = Trim(DwgBox.Text)
        DDL_Drawing.ClearSelection()
        SetFocus(DDL_Drawing)
    End Sub

    Protected Sub SubmitButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton5.Click
        Dim strQString As String

        If Trim(DDL_Drawing.SelectedValue) = "" Then
            DwgBox.Text = ""
            SetFocus(DwgBox)
            Beep()
            Exit Sub
        End If

        strQString = "~/ToolPage.aspx?" & "DwgID=" & Trim(DDL_Drawing.SelectedValue)

        Response.Redirect(strQString, True)
    End Sub


End Class
