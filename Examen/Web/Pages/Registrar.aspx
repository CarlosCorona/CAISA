<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Pages/Site.Master" CodeBehind="Registrar.aspx.vb" Inherits="Web.Registrar" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/jquery-ui-1.12.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/Datepicker.es.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.mask.js" type="text/javascript"></script>
    <script>
        $(function () {
            if ($("#MainContent_hfIdioma").val() == "es-MX") {
                $.datepicker.setDefaults($.datepicker.regional['es']);
            } else {
                $.datepicker.setDefaults($.datepicker.regional['']);
            }

            $("#MainContent_txtEdad").attr('readonly', 'readonly');
            $("#MainContent_txtFechaNacimiento").mask('00/00/0000');
            $("#MainContent_txtTelefono").mask('(00) 0000-0000');
            $("#MainContent_txtFechaNacimiento").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '1900:2150',
                dateFormat: 'dd/mm/yy',
                maxDate: new Date(),
                inline: true,

                onSelect: function () {
                    var birthDay = $("#MainContent_txtFechaNacimiento").val();

                    var dia = birthDay.substring(0, 2);
                    var mes = birthDay.substring(3, 5);
                    var ano = birthDay.substring(6, 10);

                    var fecha_hoy = new Date();
                    var ahora_ano = fecha_hoy.getYear();
                    var ahora_mes = fecha_hoy.getMonth() + 1;
                    var ahora_dia = fecha_hoy.getDate();

                    edad = (ahora_ano + 1900) - ano;

                    if (ahora_mes < mes) {
                        edad--;
                    }
                    if ((mes == ahora_mes) && (ahora_dia < dia)) {
                        edad--;
                    }
                    if (edad > 1900) {
                        edad -= 1900;
                    }

                    $("#MainContent_txtEdad").val(edad);
                }
            });

        });

        function MuestraDialogo() {
            $(function () {
                $("#dialog-confirm").dialog({
                    resizable: false,
                    height: "auto",
                    width: 400,
                    modal: true,
                    buttons: {
                        Acept: function () {
                            $(this).dialog("close");
                            window.location.href = '/Pages/RecuperarContrasenia.aspx'
                        },
                        Cancel: function () {
                            $(this).dialog("close");
                        }
                    }
                });
            }).dialog("open");
        }
    </script>
    <div>
        <asp:HiddenField ID="hfIdioma" runat="server" />
        <table style="width: 100%;">
            <tr style="height: 50px;">
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 30%;">&nbsp;</td>
                <td style="width: 40%;">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2" class="text-center">
                                <h1>
                                    <asp:Label ID="lblTitulo" class="form-label" runat="server" Text="Label" meta:resourcekey="lblTituloResource1"></asp:Label></h1>
                                <asp:Label ID="lblResultado" class="form-label text-danger" runat="server" meta:resourcekey="lblResultadoResource1" Visible="false"></asp:Label>
                                <asp:Label ID="lblResultadoBien" class="form-label text-success" runat="server" meta:resourcekey="lblResultadoBienResource1" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCorreo" class="form-label" runat="server" Text="Label" meta:resourcekey="lblCorreoResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCorreo" class="form-control" runat="server" meta:resourcekey="txtCorreoResource1" TextMode="Email"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtCorreo" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtCorreo" meta:resourcekey="rfvtxtCorreoResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtxtCorreo" runat="server" class="text-danger" Display="Dynamic"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ValidationGroup="Registrar"
                                    ErrorMessage="RegularExpressionValidator" meta:resourcekey="revtxtCorreoResource1"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUsuario" class="form-label" runat="server" Text="Label" meta:resourcekey="lblUsuarioResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsuario" class="form-control" runat="server" meta:resourcekey="txtUsuarioResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtUsuario" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtUsuario" meta:resourcekey="rfvtxtUsuarioResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContrasenia" class="form-label" runat="server" Text="Label" meta:resourcekey="lblContraseniaResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContrasenia" class="form-control" runat="server" meta:resourcekey="txtContraseniaResource1" TextMode="Password"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtContrasenia" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtContrasenia" meta:resourcekey="rfvtxtContraseniaResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblConfirmar" class="form-label" runat="server" Text="Label" meta:resourcekey="lblConfirmarResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmar" class="form-control" runat="server" meta:resourcekey="txtConfirmarResource1" TextMode="Password"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtConfirmar" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtConfirmar" meta:resourcekey="rfvtxtConfirmarResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvtxtContrasenia" runat="server" class="text-danger" Display="Dynamic" ControlToValidate="txtContrasenia"
                                    ControlToCompare="txtConfirmar" Operator="Equal" Type="String" meta:resourcekey="cvtxtContraseniaResource1" ValidationGroup="Registrar"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNombre" class="form-label" runat="server" Text="Label" meta:resourcekey="lblNombreResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNombre" class="form-control" runat="server" meta:resourcekey="txtNombreResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtNombre" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtNombre" meta:resourcekey="rfvtxtNombreResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblApellidoPaterno" class="form-label" runat="server" Text="Label" meta:resourcekey="lblApellidoPaternoResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtApellidoPaterno" class="form-control" runat="server" meta:resourcekey="txtApellidoPaternoResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtApellidoPaterno" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtApellidoPaterno" meta:resourcekey="rfvtxtApellidoPaternoResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblApellidoMaterno" class="form-label" runat="server" Text="Label" meta:resourcekey="lblApellidoMaternoResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtApellidoMaterno" class="form-control" runat="server" meta:resourcekey="txtApellidoMaternoResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtApellidoMaterno" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtApellidoMaterno" meta:resourcekey="rfvtxtApellidoMaternoResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFechaNacimiento" class="form-label" runat="server" Text="Label" meta:resourcekey="lblFechaNacimientoResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFechaNacimiento" class="form-control" runat="server" meta:resourcekey="txtFechaNacimientoResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtFechaNacimiento" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtFechaNacimiento" meta:resourcekey="rfvtxtFechaNacimientoResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEdad" class="form-label" runat="server" Text="Label" meta:resourcekey="lblEdadResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEdad" class="form-control" runat="server" Text="0" meta:resourcekey="txtEdadResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtEdad" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtEdad" meta:resourcekey="rfvtxtEdadResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvtxtEdad" runat="server" class="text-danger" Display="Dynamic" ControlToValidate="txtEdad" MinimumValue="1"
                                    MaximumValue="200" Type="Integer" ErrorMessage="RangeValidator" meta:resourcekey="rvtxtEdadResource1" ValidationGroup="Registrar"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDireccion" class="form-label" runat="server" Text="Label" meta:resourcekey="lblDireccionResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDireccion" class="form-control" runat="server" meta:resourcekey="txtDireccionResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtDireccion" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtDireccion" meta:resourcekey="rfvtxtDireccionResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblTelefono" class="form-label" runat="server" Text="Label" meta:resourcekey="lblTelefonoResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTelefono" class="form-control" runat="server" meta:resourcekey="txtTelefonoResource1"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="rfvtxtTelefono" runat="server" class="text-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    ControlToValidate="txtTelefono" meta:resourcekey="rfvtxtTelefonoResource1" ValidationGroup="Registrar"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Button ID="btnRegistrar" class="btn btn-primary" ValidationGroup="Registrar" runat="server" Text="Boton" meta:resourcekey="btnRegistrarResource1" />
                                <asp:Button ID="btnCancelar" class="btn btn-primary" CausesValidation="false" runat="server" Text="Boton" meta:resourcekey="btnCancelarResource1" />
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
        <div id="dialog-confirm" title="" style="display: none;">
            <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;"></span>
                <asp:Label ID="lblDialogo" runat="server" Text="Label" meta:resourcekey="lblDialogoResource1"></asp:Label></p>
        </div>
    </div>
</asp:Content>
