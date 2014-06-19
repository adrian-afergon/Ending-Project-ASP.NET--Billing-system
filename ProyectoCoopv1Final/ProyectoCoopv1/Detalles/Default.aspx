<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoCoopv1.Detalles.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="btnEditar" runat="server" onclick="btnEditar_Click" 
        Text="Editar" CssClass="button" />
    <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
        Text="Guardar" Visible="False" CssClass="button" />
    <br />
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
    <br />
    <asp:Image ID="imgProducto" runat="server" Height="150px" Width="150px" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Código del Producto: "></asp:Label>
    <br />
    <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtCodigo" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Casa:"></asp:Label>
    <br />
    <asp:TextBox ID="txtCasa" runat="server" Enabled="False" CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtCasa" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Familia:"></asp:Label>
    <br />
    <asp:TextBox ID="txtFamilia" runat="server" Enabled="False" 
        CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="txtFamilia" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:FileUpload ID="FileUploadImg" runat="server" Visible="False" />
    <br />
    <br />
    <asp:Label ID="Label9" runat="server" Text="Precio:"></asp:Label>
    <br />
    <asp:TextBox ID="txtPrecio" runat="server" Enabled="False" CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtPrecio" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Cantidad:"></asp:Label>
    <br />
    <asp:TextBox ID="txtCantidad" runat="server" Enabled="False" 
        CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="txtCantidad" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Cantidad Mínima:"></asp:Label>
    <br />
    <asp:TextBox ID="txtCantidadMin" runat="server" Enabled="False" 
        CssClass="inputText"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="txtCantidadMin" ErrorMessage="RequiredFieldValidator" 
        ForeColor="Red">*</asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Descripción:"></asp:Label>
    <br />
    <asp:Literal ID="ltDescripcion" runat="server"></asp:Literal>
</asp:Content>
