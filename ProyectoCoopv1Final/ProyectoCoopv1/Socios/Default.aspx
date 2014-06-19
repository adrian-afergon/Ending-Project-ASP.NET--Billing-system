<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoCoopv1.Socios.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Socios</h2><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="COD_CLI" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" 
                CancelText="&lt;i class=&quot;fa fa-reply&quot;&gt;&lt;/i&gt;" 
                EditText="&lt;i class=&quot;fa fa-pencil-square-o&quot;&gt;&lt;/i&gt;" 
                UpdateText="&lt;i class=&quot;fa fa-floppy-o&quot;&gt;&lt;/i&gt;" />
            <asp:BoundField DataField="COD_CLI" HeaderText="COD_CLI" ReadOnly="True" 
                SortExpression="COD_CLI" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                SortExpression="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" 
                SortExpression="Apellidos" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" 
                SortExpression="Telefono" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" 
                SortExpression="Direccion" />
            <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
            <asp:BoundField DataField="DNI_AS1" HeaderText="DNI_AS1" 
                SortExpression="DNI_AS1" />
            <asp:BoundField DataField="DNI_AS2" HeaderText="DNI_AS2" 
                SortExpression="DNI_AS2" />
            <asp:BoundField DataField="DNI_AS3" HeaderText="DNI_AS3" 
                SortExpression="DNI_AS3" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DB_FACTURACIONConnectionString %>" 
        DeleteCommand="DELETE FROM [TB_Clientes] WHERE [COD_CLI] = @COD_CLI" 
        InsertCommand="INSERT INTO [TB_Clientes] ([Nombre], [Apellidos], [Telefono], [Direccion], [DNI], [DNI_AS1], [DNI_AS2], [DNI_AS3]) VALUES (@Nombre, @Apellidos, @Telefono, @Direccion, @DNI, @DNI_AS1, @DNI_AS2, @DNI_AS3)" 
        ProviderName="<%$ ConnectionStrings:DB_FACTURACIONConnectionString.ProviderName %>" 
        SelectCommand="SELECT [COD_CLI], [Nombre], [Apellidos], [Telefono], [Direccion], [DNI], [DNI_AS1], [DNI_AS2], [DNI_AS3] FROM [TB_Clientes]" 
        UpdateCommand="UPDATE [TB_Clientes] SET [Nombre] = @Nombre, [Apellidos] = @Apellidos, [Telefono] = @Telefono, [Direccion] = @Direccion, [DNI] = @DNI, [DNI_AS1] = @DNI_AS1, [DNI_AS2] = @DNI_AS2, [DNI_AS3] = @DNI_AS3 WHERE [COD_CLI] = @COD_CLI">
        <DeleteParameters>
            <asp:Parameter Name="COD_CLI" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellidos" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="DNI" Type="String" />
            <asp:Parameter Name="DNI_AS1" Type="String" />
            <asp:Parameter Name="DNI_AS2" Type="String" />
            <asp:Parameter Name="DNI_AS3" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellidos" Type="String" />
            <asp:Parameter Name="Telefono" Type="String" />
            <asp:Parameter Name="Direccion" Type="String" />
            <asp:Parameter Name="DNI" Type="String" />
            <asp:Parameter Name="DNI_AS1" Type="String" />
            <asp:Parameter Name="DNI_AS2" Type="String" />
            <asp:Parameter Name="DNI_AS3" Type="String" />
            <asp:Parameter Name="COD_CLI" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
