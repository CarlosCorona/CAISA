<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pages/Principal.Master" CodeBehind="ActualizarContrasenia.aspx.vb" Inherits="Web.ActualizarContrasenia" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ MasterType VirtualPath="~/Pages/Principal.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table style="width: 100%;">
            <tr style="height: 50px;">
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 30%;">&nbsp;</td>
                <td style="width: 40%;">
                    <asp:HiddenField ID="hfIdUsuario" runat="server" />
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2" class="text-center">
                                <h1><asp:Label ID="lblTitulo" class="form-label" runat="server" Text="Label" meta:resourcekey="lblTituloResource1"></asp:Label></h1>
                                <asp:Label ID="lblResultado" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoError" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoErrorResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoBien" class="form-label text-success" runat="server" meta:resourcekey="lblResultadoBienResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoRepetido" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoRepetidoResource1" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContraseniaAnt" class="form-label" runat="server" Text="Label" meta:resourcekey="lblContraseniaAntResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContraseniaAnt" class="form-control" runat="server" meta:resourcekey="txtContraseniaAntResource1" TextMode="Password"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtContraseniaAnt" runat="server" class="text-danger" Display="Dynamic" ControlToValidate="txtContraseniaAnt" meta:resourcekey="rfvtxtContraseniaAntResource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContrasenia" class="form-label" runat="server" Text="Label" meta:resourcekey="lblContraseniaResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContrasenia" class="form-control" runat="server" meta:resourcekey="txtContraseniaResource1" TextMode="Password"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtContrasenia" runat="server" class="text-danger" Display="Dynamic" ControlToValidate="txtContrasenia" meta:resourcekey="rfvtxtContraseniaResource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblConfirmar" class="form-label" runat="server" Text="Label" meta:resourcekey="lblConfirmarResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmar" class="form-control" runat="server" meta:resourcekey="txtConfirmarResource1" TextMode="Password"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtConfirmar" runat="server" Display="Dynamic" class="text-danger" ControlToValidate="txtConfirmar" meta:resourcekey="rfvtxtConfirmarResource1"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvtxtContrasenia" runat="server" Display="Dynamic" class="text-danger" controltovalidate="txtContrasenia" controltocompare="txtConfirmar" operator="Equal" type="String" meta:resourcekey="cvtxtContraseniaResource1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Button ID="btnActualizar" class="btn btn-primary" runat="server" Text="Boton" meta:resourcekey="btnActualizarResource1" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 30%;">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
