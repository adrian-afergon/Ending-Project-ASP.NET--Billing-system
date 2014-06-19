<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoCoopv1.Facturacion.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/CSS/facturacion.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="elementos">
        <h2>Artículos:</h2>
            <div id="formIzquierdo">
                <asp:Label ID="Label5" runat="server" Text="Indique el facturador:"></asp:Label>
                <br />
                <asp:DropDownList ID="ddFacturador" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddFacturador_SelectedIndexChanged" 
                    CssClass="inputSelect">
                </asp:DropDownList>
                <br />
            <asp:Label ID="lbltxtCliente" runat="server" Text="Número de socio:" 
                    Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtNumeroSocio" runat="server" Visible="False" 
                    CssClass="inputText"></asp:TextBox>
                <br />
                <asp:Button ID="Validar" runat="server" onclick="Validar_Click" 
                    Text="Validar" Visible="False" CssClass="button" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtNumeroSocio" ErrorMessage="RegularExpressionValidator" 
                    ForeColor="Red" ValidationExpression="[0-9]*">*</asp:RegularExpressionValidator>
                <br />
                <br />
            </div>
            <div id="formDerecho">
                <asp:Label ID="lblBusFamilia" runat="server" Text="Busque el artículo por familia:" 
                    Visible="False"></asp:Label>
                <br />
        <asp:DropDownList ID="ddFamilia" runat="server" 
            DataSourceID="SqlDataSourceStock" DataTextField="Familia" 
            DataValueField="Familia" AutoPostBack="True" 
            onselectedindexchanged="ddFamilia_SelectedIndexChanged" Visible="False" 
                    CssClass="inputSelect">
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSourceStock" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DB_FACTURACIONConnectionString %>" 
            SelectCommand="SELECT DISTINCT [Familia] FROM [TB_Stock]"></asp:SqlDataSource>
                <br />
            <asp:Label ID="lblNomArticulo" runat="server" Text="Busque el artículo por nombre:" 
                    Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="txtBusNombre" runat="server" Visible="False" CssClass="inputText"></asp:TextBox>
        <asp:Label ID="lblCampoNombreError" runat="server" ForeColor="Red"></asp:Label>
        <br />
                <asp:Label ID="lblArtCod" runat="server" Text="Busque el artículo por código:" 
                    Visible="False"></asp:Label>
                <br />
            <asp:TextBox ID="txtBusCodigo" runat="server" Visible="False" CssClass="inputText"></asp:TextBox>
            &nbsp;<asp:Label ID="lblCampoCodigoError" runat="server" ForeColor="Red"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
            runat="server" ControlToValidate="txtBusCodigo" ErrorMessage="*" 
            ForeColor="Red" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                <br />
            
            </div>
            <br />
            <asp:Button ID="ButBuscar" runat="server" Text="Buscar" 
            onclick="ButBuscar_Click" Visible="False" CssClass="button" />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblCantidad" runat="server" Text="Indique una cantidad:" 
                    Visible="False"></asp:Label>
        <br />
        <asp:TextBox ID="txtCantidad" runat="server" Visible="False" 
            CssClass="inputText">1</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="txtCantidad" ErrorMessage="*" ForeColor="Red" 
            ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
        <br />
            <br />
            <label>Seleccione el artículo:<br />
        </label>
        <asp:GridView ID="GridView1" runat="server" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField SelectText="&lt;i class=&quot;fa fa-shopping-cart&quot;&gt;&lt;/i&gt;" 
                    ShowSelectButton="True"/>
                <asp:BoundField DataField="COD_PRO" HeaderText="Código" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Casa" HeaderText="Casa" />
                <asp:BoundField DataField="Familia" HeaderText="Familia" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            </Columns>
        </asp:GridView>
        <br/>


    </div>
    <div id="factura">
        <h2>Factura:</h2>
        <asp:Label ID="Label8" runat="server" Text="Vendido a:"></asp:Label>
        <br />
        <asp:Label ID="lblCliente" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Facturado por:"></asp:Label>
        <br />
        <asp:Label ID="lblVendedor" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Teléfono:"></asp:Label>
        <br />
        <asp:Label ID="lblTelefono" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridViewFactura" runat="server" 
            onselectedindexchanged="GridViewFactura_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="&lt;i class=&quot;fa fa-eraser&quot;&gt;&lt;/i&gt;" 
                    ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblTotal" runat="server" Text="Total:" Visible="False"></asp:Label>
        <asp:TextBox ID="txtTotal" runat="server" Enabled="False" Visible="False" 
            CssClass="inputText"></asp:TextBox>
        <asp:Label ID="lblMoney" runat="server" Text="€" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnImprimir" runat="server" onclick="btnImprimir_Click" 
            Text="Imprimir" Visible="False" CssClass="button" />
        <asp:Label ID="lblImpreso" runat="server" ForeColor="#66FF33" Text="&lt;i class=&quot;fa fa-check-square-o&quot;&gt;&lt;/i&gt;" 
            Visible="False"></asp:Label>
        <br />
    </div>
    <div id="separador"></div>
</asp:Content>
