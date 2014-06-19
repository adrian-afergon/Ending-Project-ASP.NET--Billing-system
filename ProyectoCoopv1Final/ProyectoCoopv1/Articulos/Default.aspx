<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoCoopv1.Articulos.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Artículos</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="COD_PRO" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" 
        GridLines="None" AllowSorting="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" 
                DeleteText="&lt;i class=&quot;fa fa-eraser&quot;&gt;&lt;/i&gt;" 
                EditText="&lt;i class=&quot;fa fa-pencil-square-o&quot;&gt;&lt;/i&gt;" 
                SelectText="&lt;i class=&quot;fa fa-plus&quot;&gt;&lt;/i&gt;" 
                UpdateText="&lt;i class=&quot;fa fa-floppy-o&quot;&gt;&lt;/i&gt;" 
                CancelText="&lt;i class=&quot;fa fa-reply&quot;&gt;&lt;/i&gt;" />
            <asp:BoundField DataField="COD_PRO" HeaderText="Código" ReadOnly="True" 
                SortExpression="COD_PRO" />
            <asp:BoundField DataField="Casa" HeaderText="Casa" SortExpression="Casa" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" 
                SortExpression="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" 
                SortExpression="Descripcion" />
            <asp:BoundField DataField="Familia" HeaderText="Familia" 
                SortExpression="Familia" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" 
                SortExpression="Precio" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" 
                SortExpression="Cantidad" />
            <asp:BoundField DataField="CantidadMin" HeaderText="Cantidad Mínima" 
                SortExpression="CantidadMin" />
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
        DeleteCommand="DELETE FROM [TB_Stock] WHERE [COD_PRO] = @COD_PRO" 
        InsertCommand="INSERT INTO [TB_Stock] ([Casa], [Nombre], [Descripcion], [Familia], [Precio], [Cantidad], [CantidadMin]) VALUES (@Casa, @Nombre, @Descripcion, @Familia, @Precio, @Cantidad, @CantidadMin)" 
        ProviderName="<%$ ConnectionStrings:DB_FACTURACIONConnectionString.ProviderName %>" 
        SelectCommand="SELECT [COD_PRO], [Casa], [Nombre], [Descripcion], [Familia], [Precio], [Imagen], [Cantidad], [CantidadMin] FROM [TB_Stock]" 
        UpdateCommand="UPDATE [TB_Stock] SET [Casa] = @Casa, [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Familia] = @Familia, [Precio] = @Precio, [Cantidad] = @Cantidad, [CantidadMin] = @CantidadMin WHERE [COD_PRO] = @COD_PRO">
        <DeleteParameters>
            <asp:Parameter Name="COD_PRO" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Casa" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Familia" Type="String" />
            <asp:Parameter Name="Precio" Type="Decimal" />
            <asp:Parameter Name="Cantidad" Type="Int32" />
            <asp:Parameter Name="CantidadMin" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Casa" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Familia" Type="String" />
            <asp:Parameter Name="Precio" Type="Decimal" />
            <asp:Parameter Name="Cantidad" Type="Int32" />
            <asp:Parameter Name="CantidadMin" Type="Int32" />
            <asp:Parameter Name="COD_PRO" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>
