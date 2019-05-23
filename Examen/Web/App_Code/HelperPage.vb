Imports System.Net.Mail
Imports System.Web

Friend Class HelperPage
    Public Shared Function Encriptar(ByRef cadena As String) As String
        Dim resultado As String = String.Empty
        Dim encriptador As Byte()
        encriptador = Encoding.Unicode.GetBytes(cadena)
        resultado = Convert.ToBase64String(encriptador)
        Return resultado
    End Function

    Public Shared Function Desencriptar(ByRef cadena As String) As String
        Dim resultado As String = String.Empty
        Dim desencriptador As Byte()
        desencriptador = Convert.FromBase64String(cadena)
        resultado = Encoding.Unicode.GetString(desencriptador)
        Return resultado
    End Function
    Public Shared Function EnviarCorreo(ByRef email As String, ByRef usuario As String, ByRef contrasenia As String) As Boolean

        Dim mailMessage As MailMessage = New MailMessage(ConfigurationManager.AppSettings("EnvioCorreo"), email)
        Dim sbEmailBody As StringBuilder = New StringBuilder()

        sbEmailBody.Append(Resources.Correo.Saludo & usuario & ",<br/>")
        sbEmailBody.Append("<br/>")
        sbEmailBody.Append(Resources.Correo.Cuerpo & contrasenia)
        sbEmailBody.Append("<br/><br/>")
        sbEmailBody.Append("<b>" & Resources.Correo.Despedida & "</b>")
        mailMessage.IsBodyHtml = True
        mailMessage.Body = sbEmailBody.ToString()
        mailMessage.Subject = Resources.Correo.Asunto

        Dim smtpClient As SmtpClient = New SmtpClient(ConfigurationManager.AppSettings("ServidorCorreo"), Convert.ToInt32(ConfigurationManager.AppSettings("PuertoServidorCorreo")))
        smtpClient.Credentials = New System.Net.NetworkCredential() With {
        .UserName = ConfigurationManager.AppSettings("UsuarioCorreo"),
        .Password = ConfigurationManager.AppSettings("ClaveCorreo")
    }
        smtpClient.EnableSsl = True
        smtpClient.Send(mailMessage)
        Return True
    End Function

    Public Shared Function GenerarContraseña(ByVal Lenght As Integer, Optional ByVal Reset As Boolean = False) As String
        Dim resultado As String = String.Empty
        Dim rNum As New Random(DateTime.Now.Millisecond)
        Dim rLowerCase As New Random(DateTime.Now.Millisecond)
        Dim rUpperCase As New Random(DateTime.Now.Millisecond)
        Dim RandomSelect As New Random(DateTime.Now.Millisecond)

        Dim i As Integer
        Dim CNT(2) As Integer
        Dim Char_Sel(2) As String
        Dim iSel As Integer

        For i = 1 To Lenght
            CNT(0) = rNum.Next(48, 57)
            CNT(1) = rLowerCase.Next(65, 90)
            CNT(2) = rUpperCase.Next(97, 122)
            Char_Sel(0) = System.Convert.ToChar(CNT(0)).ToString
            Char_Sel(1) = System.Convert.ToChar(CNT(1)).ToString
            Char_Sel(2) = System.Convert.ToChar(CNT(2)).ToString
            iSel = RandomSelect.Next(0, 3)
            resultado &= Char_Sel(iSel)
            If Reset = True Then
                resultado.Replace(resultado, Char_Sel(iSel))
            End If
        Next
        Return resultado
    End Function
End Class