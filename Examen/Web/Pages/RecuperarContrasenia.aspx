<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pages/Site.Master" CodeBehind="RecuperarContrasenia.aspx.vb" Inherits="Web.RecuperarContrasenia" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table style="width: 100%;">
            <tr style="height: 150px;">
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 30%;">&nbsp;</td>
                <td style="width: 40%;">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2" class="text-center">
                                <h1><asp:Label ID="lblTitulo" class="form-label" runat="server" Text="Label" meta:resourcekey="lblTituloResource1"></asp:Label></h1>
                                <asp:Label ID="lblResultado" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoCorreo" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoCorreoResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoBien" class="form-label text-success" runat="server" meta:resourcekey="lblResultadoBienResource1" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUsuario" class="form-label" runat="server" Text="Label" meta:resourcekey="lblUsuarioResource1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtUsuario" class="form-control" runat="server" Width="100%" meta:resourcekey="txtUsuarioResource1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtUsuario" runat="server" class="text-danger" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsuario" meta:resourcekey="rfvtxtUsuarioResource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Button ID="btnEnviar" class="btn btn-primary" runat="server" Text="Boton" meta:resourcekey="btnEnviarResource1" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 30%;">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 150px;">&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
