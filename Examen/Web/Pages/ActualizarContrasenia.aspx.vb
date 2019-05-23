Public Class ActualizarContrasenia
    Inherits System.Web.UI.Page
    Private db As New CAISAExamenEntities()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim usuario As New Tbl_Usuarios()

            If Not Session("Usuario") Is Nothing Then
                usuario = Session("Usuario")
                hfIdUsuario.Value = usuario.IdUsuario

                Me.Master.InicioUsuario = HelperPage.Desencriptar(usuario.Nombre) & " " &
                                          HelperPage.Desencriptar(usuario.ApellidoPaterno) & " " & HelperPage.Desencriptar(usuario.ApellidoMaterno)
                Me.Master.InicioEdad = Resources.Correo.Edad & usuario.Edad.ToString() & Resources.Correo.Anios
            Else
                Session.Contents.RemoveAll()
                Response.Redirect("Inicio.aspx")
            End If
        End If
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        Dim usuario As New Tbl_Usuarios()
        Dim contrasenias As New Tbl_BitacoraContrasenia()

        lblResultado.Visible = False
        lblResultadoBien.Visible = False
        lblResultadoError.Visible = False
        lblResultadoRepetido.Visible = False

        Dim usuarioTbl = db.sps_ObtenerUsuarioPorId(Convert.ToInt32(hfIdUsuario.Value)).ToList()
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
            If (usuario.Password = HelperPage.Encriptar(txtContraseniaAnt.Text)) Then
                Dim contraseniasTbl = db.sps_ObtenerContraseniasPorUsuario(Convert.ToInt32(hfIdUsuario.Value)).OrderByDescending(Function(x) x.Fecha).ToList().Take(3)
                For Each item In contraseniasTbl
                    If (item.Password = HelperPage.Encriptar(txtContrasenia.Text)) Then
                        lblResultadoRepetido.Visible = True
                        Return
                    End If
                Next

                Try
                    db.spu_ActualizarContrasenia(Convert.ToInt32(hfIdUsuario.Value), HelperPage.Encriptar(txtContrasenia.Text))
                    lblResultadoBien.Visible = True
                Catch ex As Exception
                    lblResultadoError.Visible = True
                End Try
            Else
                lblResultado.Visible = True
            End If
        End If
    End Sub

End Class