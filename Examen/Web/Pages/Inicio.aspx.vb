
Public Class Inicio
    Inherits System.Web.UI.Page
    Private db As New CAISAExamenEntities()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnAcceso_Click(sender As Object, e As EventArgs) Handles btnAcceso.Click
        Dim _usuario As String
        Dim _Pass As String
        Dim usuario As New Tbl_Usuarios()

        _usuario = HelperPage.Encriptar(txtUsuario.Text)
        _Pass = HelperPage.Encriptar(txtContrasenia.Text)

        Dim usuarioTbl = db.sps_ObtenerUsuarioPorUsuario(_usuario).ToList()
        If usuarioTbl.Count > 0 Then
            usuario = usuarioTbl.Select(Function(x) New Tbl_Usuarios() With {.IdUsuario = x.IdUsuario,
                                                                             .Correo = x.Correo,
                                                                             .Usuario = x.Usuario,
                                                                             .Password = x.Password,
                                                                             .Nombre = x.Nombre,
                                                                             .ApellidoPaterno = x.ApellidoPaterno,
                                                                             .ApellidoMaterno = x.ApellidoMaterno,
                                                                             .FechaNacimiento = x.FechaNacimiento,
                                                                             .Edad = x.Edad,
                                                                             .Direccion = x.Direccion,
                                                                             .Telefono = x.Telefono}).First()
        Else lblResultado.Visible = True
            Return
        End If

        If usuario.Password = _Pass Then
            Session("Usuario") = usuario
            Response.Redirect("Default.aspx")
        Else lblResultado.Visible = True
            Return
        End If
    End Sub

    Protected Sub btnRestablecer_Click(sender As Object, e As EventArgs) Handles btnRestablecer.Click
        Response.Redirect("RecuperarContrasenia.aspx")
    End Sub

    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        Response.Redirect("Registrar.aspx")
    End Sub
End Class