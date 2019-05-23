Imports System.Globalization
Imports System.Threading

Public Class EditarUsuario
    Inherits System.Web.UI.Page
    Private db As New CAISAExamenEntities()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfIdioma.Value = Thread.CurrentThread.CurrentCulture.Name

        If Not IsPostBack Then
            Dim usuario As New Tbl_Usuarios()

            If Not Session("Usuario") Is Nothing Then
                usuario = Session("Usuario")
                hfIdUsuario.Value = usuario.IdUsuario
                txtCorreo.Text = usuario.Correo
                txtNombre.Text = HelperPage.Desencriptar(usuario.Nombre)
                txtApellidoPaterno.Text = HelperPage.Desencriptar(usuario.ApellidoPaterno)
                txtApellidoMaterno.Text = HelperPage.Desencriptar(usuario.ApellidoMaterno)
                txtFechaNacimiento.Text = usuario.FechaNacimiento.Value.ToString("dd/MM/yyyy")
                txtEdad.Text = usuario.Edad.ToString()
                txtDireccion.Text = usuario.Direccion
                txtTelefono.Text = usuario.Telefono

                Me.Master.InicioUsuario = HelperPage.Desencriptar(usuario.Nombre) & " " &
                                          HelperPage.Desencriptar(usuario.ApellidoPaterno) & " " & HelperPage.Desencriptar(usuario.ApellidoMaterno)
                Me.Master.InicioEdad = Resources.Correo.Edad & usuario.Edad.ToString() & Resources.Correo.Anios
            Else
                Session.Contents.RemoveAll()
                Response.Redirect("Inicio.aspx")
            End If
        End If
    End Sub

    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click

        Try
            db.spu_ActualizarUsuario(Convert.ToInt32(hfIdUsuario.Value),
                                     txtCorreo.Text,
                                     HelperPage.Encriptar(txtNombre.Text),
                                     HelperPage.Encriptar(txtApellidoPaterno.Text),
                                     HelperPage.Encriptar(txtApellidoMaterno.Text),
                                     DateTime.ParseExact(txtFechaNacimiento.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                                     Convert.ToInt32(txtEdad.Text),
                                     txtDireccion.Text,
                                     txtTelefono.Text)

            Me.Master.InicioUsuario = txtNombre.Text & " " & txtApellidoPaterno.Text & " " & txtApellidoMaterno.Text
            Me.Master.InicioEdad = Resources.Correo.Edad & txtEdad.Text & Resources.Correo.Anios
            lblResultadoBien.Visible = True
        Catch ex As Exception
            lblResultado.Visible = True
            lblResultado.Text = "Error"
            lblResultadoBien.Visible = False
        End Try
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        Try
            db.spd_EliminarUsuario(Convert.ToInt32(hfIdUsuario.Value))
            Response.Redirect("Inicio.aspx")
        Catch ex As Exception
            lblResultado.Visible = True
            lblResultadoBien.Visible = False
        End Try
    End Sub
End Class