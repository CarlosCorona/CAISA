Public Class Principal
    Inherits System.Web.UI.MasterPage

    Private m_Usuario As String
    Public Property InicioUsuario() As String
        Get
            Return m_Usuario
        End Get
        Set(ByVal value As String)
            m_Usuario = value
            Me.lblInicioUsuario.Text = value
        End Set
    End Property

    Private m_Edad As String
    Public Property InicioEdad() As String
        Get
            Return m_Edad
        End Get
        Set(ByVal value As String)
            m_Edad = value
            Me.lblInicioEdad.Text = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnEditar_Click(sender As Object, e As EventArgs) Handles btnEditar.Click
        Response.Redirect("EditarUsuario.aspx")
    End Sub

    Protected Sub btnCambiarContrasenia_Click(sender As Object, e As EventArgs) Handles btnCambiarContrasenia.Click
        Response.Redirect("ActualizarContrasenia.aspx")
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click
        Session.Contents.RemoveAll()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class