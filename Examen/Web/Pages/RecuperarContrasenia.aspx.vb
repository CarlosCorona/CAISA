Public Class RecuperarContrasenia
    Inherits System.Web.UI.Page
    Private db As New CAISAExamenEntities()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Dim _usuario As String
        Dim usuario As New Tbl_Usuarios()

        _usuario = HelperPage.Encriptar(txtUsuario.Text)

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

            Dim reinicioClave = HelperPage.GenerarContraseña(10, True)
            Dim nombre As String = HelperPage.Desencriptar(usuario.Nombre) & " " & HelperPage.Desencriptar(usuario.ApellidoPaterno) & " " & HelperPage.Desencriptar(usuario.ApellidoMaterno)
            Dim result As Boolean = HelperPage.EnviarCorreo(usuario.Correo, nombre, reinicioClave)

            Try
                db.spu_ActualizarContrasenia(usuario.IdUsuario, HelperPage.Encriptar(reinicioClave))
                lblResultadoBien.Visible = True
                txtUsuario.Text = ""
            Catch ex As Exception
                lblResultadoCorreo.Visible = True
                lblResultadoBien.Visible = False
            End Try
        Else lblResultado.Visible = True
            Return
        End If


    End Sub
End Class