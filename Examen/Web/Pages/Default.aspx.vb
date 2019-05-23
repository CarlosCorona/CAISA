Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim usuario As New Tbl_Usuarios()

            If Not Session("Usuario") Is Nothing Then
                usuario = Session("Usuario")
                Me.Master.InicioUsuario = HelperPage.Desencriptar(usuario.Nombre) & " " &
                                          HelperPage.Desencriptar(usuario.ApellidoPaterno) & " " & HelperPage.Desencriptar(usuario.ApellidoMaterno)
                Me.Master.InicioEdad = Resources.Correo.Edad & usuario.Edad.ToString() & Resources.Correo.Anios
            End If
        End If
    End Sub

End Class