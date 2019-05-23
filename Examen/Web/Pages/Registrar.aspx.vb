Imports System.Globalization
Imports System.Threading

Public Class Registrar
    Inherits System.Web.UI.Page
    Private db As New CAISAExamenEntities()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfIdioma.Value = Thread.CurrentThread.CurrentCulture.Name
        If Not IsPostBack Then
            txtFechaNacimiento.Text = Date.Today.ToString("dd/MM/yyyy")
            txtEdad.Text = "0"
        End If
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        Dim _usuario As String
        Dim usuario As New Tbl_Usuarios()

        _usuario = HelperPage.Encriptar(txtUsuario.Text)
        Dim usuarioTbl = db.sps_ObtenerUsuarioPorUsuario(_usuario).ToList()
        If usuarioTbl.Count = 0 Then
            Try
                db.spi_InsertarUsuario(txtCorreo.Text, _usuario,
                                       HelperPage.Encriptar(txtContrasenia.Text),
                                       HelperPage.Encriptar(txtNombre.Text),
                                       HelperPage.Encriptar(txtApellidoPaterno.Text),
                                       HelperPage.Encriptar(txtApellidoMaterno.Text),
                                       DateTime.ParseExact(txtFechaNacimiento.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                                       Convert.ToInt32(txtEdad.Text),
                                       txtDireccion.Text,
                                       txtTelefono.Text)

                txtCorreo.Text = ""
                txtUsuario.Text = ""
                txtContrasenia.Text = ""
                txtConfirmar.Text = ""
                txtNombre.Text = ""
                txtApellidoPaterno.Text = ""
                txtApellidoMaterno.Text = ""
                txtFechaNacimiento.Text = Date.Today.ToString("dd/MM/yyyy")
                txtEdad.Text = "0"
                txtDireccion.Text = ""
                txtTelefono.Text = ""
                lblResultadoBien.Visible = True
            Catch ex As Exception
                lblResultado.Visible = True
                lblResultadoBien.Visible = False
            End Try
        Else
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "Script", "MuestraDialogo();", True)
        End If
    End Sub
End Class