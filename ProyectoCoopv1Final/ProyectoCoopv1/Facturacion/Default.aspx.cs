using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Añadimos:
using System.Data.SqlClient;
using System.Data;

namespace ProyectoCoopv1.Facturacion
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem Defecto = new ListItem();
                Defecto.Value = "-1";
                Defecto.Text = "Elija uno";
                ddFacturador.Items.Add(Defecto);
                //Definimos la estructura de la tabla:
                DataTable tablaFactura = crearDataTable();
                //Almacenamos en la variable de aplicacion la tabla vacia.
                Application["Factura"] = tablaFactura;
                //Carga el dropDown
                DataView vistaVendedores = cargaVistaVendedores();
                ddFacturador.DataSource = vistaVendedores;
                ddFacturador.DataValueField = "COD_VEN";
                ddFacturador.DataTextField = "Nombre";
                ddFacturador.DataBind();
                ddFacturador.Items.Add(Defecto);
                ddFacturador.SelectedValue = "-1";
            }
        }

    /*Funciones básicas que se llaman desde el código*/

        /*Este procedimiento pone los labels de error a nulo*/
        protected void limpiarLablesError()
        {
            lblError.Text = "";
            lblCampoCodigoError.Text = "";
            lblCampoNombreError.Text = "";
        }

        /*Este procedimiento limpia los textbox donde ponemos valores*/
        protected void limpiarTextBox()
        {
            txtBusCodigo.Text = "";
            txtBusNombre.Text = "";
        }

        /*visualizarElementos nos hará visibles (o ocultará) los distintos elementos del formulario*/
        protected void visualizarElementos(bool condicion)
        {
            ddFamilia.Visible = condicion;
            lblNomArticulo.Visible = condicion;
            txtBusNombre.Visible = condicion;
            lblBusFamilia.Visible = condicion;
            lblArtCod.Visible = condicion;
            txtBusCodigo.Visible = condicion;
            lblCantidad.Visible = condicion;
            txtCantidad.Visible = condicion;
            ButBuscar.Visible = condicion;
        }

        /*Esta función es la encargada de en MODO DESCONECTADO, cargar los vendedores de la BD
         *y devolvernos un DataView que manipularemos a posteriori*/
        protected DataView cargaVistaVendedores()
        {
            SqlConnection conexion;
            DataSet dataSet;
            String sentencia;
            SqlDataAdapter dataAdapterVendedor;
            DataView dataViewVendedor = new DataView();
            SqlCommandBuilder comandBuilderVendedor;
            string cadenaConexion = System.Configuration.ConfigurationManager.ConnectionStrings["DB_FACTURACION"].ConnectionString;
            conexion = new SqlConnection(cadenaConexion);
            sentencia = "SELECT COD_VEN,Nombre,Telefono FROM TB_Vendedor";
            dataAdapterVendedor = new System.Data.SqlClient.SqlDataAdapter(sentencia, conexion);
            dataAdapterVendedor.TableMappings.Add("Table", "Vendedor");
            comandBuilderVendedor = new System.Data.SqlClient.SqlCommandBuilder(dataAdapterVendedor);
            comandBuilderVendedor.QuotePrefix = "[";
            comandBuilderVendedor.QuoteSuffix = "]";
            comandBuilderVendedor.RefreshSchema();
            dataSet = new System.Data.DataSet();
            try
            {
                conexion.Open();
                dataAdapterVendedor.Fill(dataSet);
                conexion.Close();
                dataViewVendedor.Table = dataSet.Tables["Vendedor"];
            }
            catch (SqlException)
            {
                lblError.Text = "Los datos no se han cargado correctamente";
            }
            return dataViewVendedor;
        }

        /*Esta función es la encargada de definir la estructura de nuestro DataTable y devolverla
         *la hemos definido por comididad y porque esta función se utiliza varias veces*/
        protected DataTable crearDataTable()
        {
            DataTable tablaFactura = new DataTable();
            tablaFactura.Columns.Add("id", typeof(Int32));
            tablaFactura.Columns.Add("nombre", typeof(String));
            tablaFactura.Columns.Add("cantidad", typeof(Int32));
            tablaFactura.Columns.Add("precio", typeof(Double));
            tablaFactura.Columns.Add("Precio Total", typeof(Double));
            return tablaFactura;
        }

        /*Esta función es la encargada de en MODO DESCONECTADO, cargar el Stock de la BD
        *y devolvernos un DataView que manipularemos a posteriori*/
        protected DataView cargaVistaStock()
        {
            limpiarLablesError();
            SqlConnection conexion;
            DataSet dataSet;
            String sentencia;
            SqlDataAdapter dataAdapterStock;
            DataView dataViewStock = new DataView();
            SqlCommandBuilder comandBuilderStock;
            string cadenaConexion = System.Configuration.ConfigurationManager.ConnectionStrings["DB_FACTURACION"].ConnectionString;
            conexion = new SqlConnection(cadenaConexion);
            sentencia = "SELECT COD_PRO,Casa,Nombre,Descripcion,Familia,Precio,Imagen,Cantidad,CantidadMin FROM TB_Stock";
            dataAdapterStock = new System.Data.SqlClient.SqlDataAdapter(sentencia, conexion);
            dataAdapterStock.TableMappings.Add("Table", "Stock");
            comandBuilderStock = new System.Data.SqlClient.SqlCommandBuilder(dataAdapterStock);
            comandBuilderStock.QuotePrefix = "[";
            comandBuilderStock.QuoteSuffix = "]";
            comandBuilderStock.RefreshSchema();
            dataSet = new System.Data.DataSet();
            try
            {
                conexion.Open();
                dataAdapterStock.Fill(dataSet);
                conexion.Close();
                dataViewStock.Table = dataSet.Tables["Stock"];
            }
            catch (SqlException)
            {
                lblError.Text = "Los datos no se han cargado correctamente";
            }
            return dataViewStock;
        }

    /*Funciones del formulario*/

        /*Cuando elegimos un facturador, revisamos que es correcto y de serlo, realizaremos una consulta
         a la base de datos para obtener los datos de ese vendedor desde el DataView*/
        protected void ddFacturador_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddFacturador.SelectedValue == "-1")//Comprobamos que no es el valor por defecto
            {
                lblError.Text = "Valor no permitido";
                lblVendedor.Text = "";
                lblTelefono.Text = "";
            }
            else
            {
                DataView vistaVendedores = cargaVistaVendedores();//Obtenemos los vendedores y los almacenamos en una vista
                vistaVendedores.RowFilter = "cod_ven = " + ddFacturador.SelectedValue.ToString();//filtramos por el codigo de nuestro vendedor
                DataTable tableVednedor = vistaVendedores.ToTable();//Almacenamos dichos valores en un datatable

                lblVendedor.Text = tableVednedor.Rows[0][1].ToString();//del datatable obtenemos el nombre
                lblTelefono.Text = tableVednedor.Rows[0][2].ToString();//y el apellido
                lbltxtCliente.Visible = true;//visualizamos el label del cliente
                txtNumeroSocio.Visible = true;//el textbox
                Validar.Visible = true;//y el boton validar
                
            }
        }

        /*Cuando hacemos click en validar, comprobamos que es valido y de ser así cargará sus datos en la factura*/
        protected void Validar_Click(object sender, EventArgs e)
        {
            if (txtNumeroSocio.Text == "")//Comprobamos que son válidos
            {
                lblError.Text = "No se ha rellenado número de socio";
                Session["cod_cli"] = "";
                lblCliente.Text = "";
                visualizarElementos(false);//De ser incorrecto oculta los valores si ya se había introducido uno correcto previamente
            }
            else
            {
                string s = System.Configuration.ConfigurationManager.ConnectionStrings["DB_Facturacion"].ConnectionString;
                SqlConnection conexion = new SqlConnection(s);

                SqlCommand comando = new SqlCommand("select nombre, apellidos from TB_Clientes WHERE COD_CLI = @cod_cli;", conexion);
                comando.Parameters.Add("@cod_cli", System.Data.SqlDbType.Int);//definimos el parámetro cod_cli
                comando.Parameters["@cod_cli"].Value = txtNumeroSocio.Text;//le decimos que es el número de socio introducido
                conexion.Open();
                SqlDataReader registro = comando.ExecuteReader();//Leemos los datos obtenidos

                while (registro.Read())
                {
                    lblCliente.Text = registro["apellidos"].ToString() + " " + registro["nombre"].ToString();//Visualziamos sus apellidos y nombre
                }
                conexion.Close();
                Session["cod_cli"] = txtNumeroSocio.Text;//almacenamos ese código en una variable de sesion
                limpiarLablesError();//limpiamos los errores
                visualizarElementos(true);//visualizamos los elementos de consulta
            }
        }

        /*El hacer click en el boton buscar revisará que existen elementos en nombre o en código y 
         * realizará una busqueda por uno de ellos, primando el código*/
        protected void ButBuscar_Click(object sender, EventArgs e)
        {
            limpiarLablesError();//Limpiamos los posibles errores por pantalla
            DataView dataViewStock = new DataView();//Definimos la vista del stock
            dataViewStock = cargaVistaStock();//Cargamos la vista del stock

            if (txtBusCodigo.Text == "")//Si el codigo esta vacio
            {
                if (txtBusCodigo.Text == "" && txtBusNombre.Text == "")//Verifica que los dos esten vacios
                {
                    lblCampoCodigoError.Text = "*";
                    lblCampoNombreError.Text = "*";
                    lblError.Text = "Error no se introdujo ningun parámetro de búsqueda";
                }
                else//De no ser así, el nombre estará rellenado
                {
                    dataViewStock.RowFilter = "Nombre Like '%"+txtBusNombre.Text+"%'";//realizamos un filtro por ese nombre
                    GridView1.DataSource = dataViewStock;//cargamos la tabla
                    GridView1.DataBind();//bindeamos
                    limpiarTextBox();//eliminamos los posibles errores
                }
            }
            else//De haber puesto un código
            {
                try
                {
                    dataViewStock.RowFilter = "COD_PRO = " + txtBusCodigo.Text;//filtra por ese código
                    GridView1.DataSource = dataViewStock;
                    GridView1.DataBind();
                    limpiarTextBox();
                }
                catch (SqlException)
                {
                    lblError.Text = "Los datos no se han cargado correctamente";
                }
            }
        }

        /*Cuando cambiamos el indice de una familia de Articulos, nos mostrará los artículos de esa familia*/
        protected void ddFamilia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dataViewStock = new DataView();//Creamos el dataview
            dataViewStock = cargaVistaStock();//lo cargamos
            try
            {
                dataViewStock.RowFilter = "Familia = '" + ddFamilia.SelectedValue.ToString() + "'";//realizamos un filtro
                GridView1.DataSource = dataViewStock;
                GridView1.DataBind();
                limpiarTextBox();
            }
            catch (SqlException)
            {
                lblError.Text = "Los datos no se han cargado correctamente";
            }
        }

        /*Cuando elegimos un articulo para añadirlo a la factura realizamos ciertas comprobaciones antes 
         * y después lo añadimos*/
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*Creamos unas constantes faciles de modificar, que hacen referencia a las posiciones de las celdas*/
            int posCod_PRO = 1;
            int posNombre = 2;//Es una fila oculta ubicada al final de todo
            int posCantidad = 6;
            int posPrecio = 5;
            limpiarLablesError();//limpiamos los errores
            bool encontrado = false;//inicializamos la variable
            int posicion = -1;//inicializamos la posición
            if (Convert.ToInt32(txtCantidad.Text) <= Convert.ToInt32(GridView1.SelectedRow.Cells[posCantidad].Text))//Comprobamos que la cantidad que queremos es menor que la que hemos seleccionado
            {
                //Definimos la estructura de la tabla:
                DataTable tablaFactura = crearDataTable();
                //Rellenamos la Tabla con la variable de aplicacion (De ser la primera vez estará vacia)
                tablaFactura = (DataTable)Application["Factura"];
                /*A partir de aquí miramos si el elemento añadido ya existe en la tabla o es nuevo*/
                for (int i = 0; i < (tablaFactura.Rows.Count) && encontrado == false; i++)
                {
                    int valorCodTabla = Convert.ToInt32(tablaFactura.Rows[i][0]);
                    if (valorCodTabla == Convert.ToInt32(GridView1.SelectedRow.Cells[posCod_PRO].Text))
                    {
                        encontrado = true;
                        posicion = i;
                    }
                }
                if (encontrado == true)//Si ya existe
                {
                    int cantidad = Convert.ToInt32(tablaFactura.Rows[posicion][2].ToString());
                    /*Comprobamos que al valor que va a aumentar no supera el que hay en almacén*/
                    if ((cantidad + Convert.ToInt32(txtCantidad.Text)) <= Convert.ToInt32(GridView1.SelectedRow.Cells[posCantidad].Text))
                    {
                        cantidad = cantidad + Convert.ToInt32(txtCantidad.Text);
                        tablaFactura.Rows[posicion][2] = cantidad;
                        tablaFactura.Rows[posicion][4] = Convert.ToDouble(tablaFactura.Rows[posicion][3]) * Convert.ToInt32(tablaFactura.Rows[posicion][2]);
         
                    }
                    else
                    {
                        lblError.Text = "No hay tanto Stock";
                    }
                }
                else//Si no existe añadimos un nuevo registro a la factura
                {
                    //Creamos una nueva fila que añadiremos a nuestro dataTable
                    DataRow nuevaRow = tablaFactura.NewRow();
                    nuevaRow["id"] = Convert.ToInt32(GridView1.SelectedRow.Cells[posCod_PRO].Text);
                    nuevaRow["nombre"] = GridView1.SelectedRow.Cells[posNombre].Text;
                    nuevaRow["cantidad"] = Convert.ToInt32(txtCantidad.Text);
                    nuevaRow["precio"] = Convert.ToDouble(GridView1.SelectedRow.Cells[posPrecio].Text);
                    nuevaRow["Precio Total"] = Convert.ToDouble(GridView1.SelectedRow.Cells[posPrecio].Text) * Convert.ToInt32(txtCantidad.Text);
                    tablaFactura.Rows.Add(nuevaRow);
                }
                //Rellenamos el GridView:
                GridViewFactura.DataSource = tablaFactura;
                GridViewFactura.DataBind();
                calcularTotal();
                //Actualizamos la variable de aplicación:
                Application["Factura"] = tablaFactura;
                limpiarLablesError();
                btnImprimir.Visible = true;
            }
            else
            {
                lblError.Text = "No hay tanto Stock";
            }
        }

        /*Referente a la factura*/

        /*esta función calcula el total de la factura*/
        protected void calcularTotal()
        {
            double resultado = 0;
            int longitud = GridViewFactura.Rows.Count;
            for (int i = 0; i < longitud;i++ )
            {
                resultado += Convert.ToDouble(GridViewFactura.Rows[i].Cells[5].Text);
            }
            txtTotal.Text = resultado.ToString();
            lblTotal.Visible = true;
            txtTotal.Visible = true;
            lblMoney.Visible = true;
        }

        /*Cuando hacemos click en imprimir, debemos generar una nueva factura en TB_Facturas, 
         luego, a esa factura, vincularle los artículos en la tabla TB_ART_FAC, y posteriormente
         modificar la cantidad de artículos en el almacen*/
        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            /*Crear el elemento factura en la tabla facturas*/
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["DB_Facturacion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand insertarFactura = new
            SqlCommand("insert into TB_Facturas(Fecha, COD_CLI,COD_VEN, Total) values("
            + "@Fecha,@COD_CLI,@COD_VEN,@Total)SELECT @@IDENTITY", conexion);
            insertarFactura.Parameters.Add("@Fecha", System.Data.SqlDbType.DateTime);
            insertarFactura.Parameters.Add("@COD_CLI", System.Data.SqlDbType.Int);
            insertarFactura.Parameters.Add("@COD_VEN", System.Data.SqlDbType.Int);
            insertarFactura.Parameters.Add("@Total", System.Data.SqlDbType.Money);
            insertarFactura.Parameters["@Fecha"].Value = DateTime.Now;
            insertarFactura.Parameters["@COD_CLI"].Value = Session["cod_cli"];
            insertarFactura.Parameters["@COD_VEN"].Value = ddFacturador.SelectedValue.ToString();
            insertarFactura.Parameters["@Total"].Value = Convert.ToDouble(txtTotal.Text);

            try
            {
                int cod_factura = Convert.ToInt32(insertarFactura.ExecuteScalar());//Recogemos el id generado de la factura
                for (int i = 0; i < GridViewFactura.Rows.Count; i++)//Recorremos la Factura cogiendo el codigo de los artículos
                {
                    /*Definimos unas constantes de la posicion en la tabla*/
                    int cod_pro = 1;
                    int cantidad = 3;
                    //Insertar
                    SqlCommand insertarArtFac = new
                    SqlCommand("insert into TB_ART_FAC(COD_FAC, COD_PRO,Cantidad_PRO) values("
                    + "@cod_fac,@cod_pro,@cantidad_pro)", conexion);
                    insertarArtFac.Parameters.Add("@cod_fac", System.Data.SqlDbType.Int);
                    insertarArtFac.Parameters.Add("@cod_pro", System.Data.SqlDbType.Int);
                    insertarArtFac.Parameters.Add("@cantidad_pro", System.Data.SqlDbType.Int);
                    insertarArtFac.Parameters["@cod_fac"].Value = cod_factura;
                    insertarArtFac.Parameters["@cod_pro"].Value = Convert.ToInt32(GridViewFactura.Rows[i].Cells[cod_pro].Text);
                    insertarArtFac.Parameters["@cantidad_pro"].Value = Convert.ToInt32(GridViewFactura.Rows[i].Cells[cantidad].Text);
                    insertarArtFac.ExecuteScalar();
                    //Modificar
                    SqlCommand actualizarArticulos = new
                    SqlCommand("UPDATE TB_STOCK set cantidad = (cantidad - @cantidad) WHERE cod_pro = @cod_pro", conexion);
                    actualizarArticulos.Parameters.Add("@cantidad", System.Data.SqlDbType.Int);
                    actualizarArticulos.Parameters.Add("@cod_pro", System.Data.SqlDbType.Int);
                    actualizarArticulos.Parameters["@cod_pro"].Value = Convert.ToInt32(GridViewFactura.Rows[i].Cells[cod_pro].Text);
                    actualizarArticulos.Parameters["@cantidad"].Value = Convert.ToInt32(GridViewFactura.Rows[i].Cells[cantidad].Text);
                    actualizarArticulos.ExecuteScalar();
                    lblImpreso.Visible = true;
                }
            }
            catch (SqlException)
            {
                lblError.Text = "Se produjo un error inesperado al crear factura";
            }
            conexion.Close();
        }
       
        /*Cuando seleccionamos un valor de la factura, debe borrarlo de ella*/
        protected void GridViewFactura_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable facturaTemporal = crearDataTable();
            facturaTemporal = (DataTable)Application["Factura"];
            facturaTemporal.Rows[GridViewFactura.SelectedIndex].Delete();
            GridViewFactura.DataSource = facturaTemporal;
            GridViewFactura.DataBind();
        }
    }
}