using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Añadimos
using System.Data.SqlClient;
using System.Data;

namespace ProyectoCoopv1.Detalles
{
    public partial class Default : System.Web.UI.Page
    {
        /*Cuando se carga la página, recoje el id pasado como QueryString y carga los datos*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCodigo.Text = Request.QueryString["id"];
                cargaVistaStock();
            }
        }
        
        /*cargaVistaStock es llamada desde el PageLoad, es el encargado de hacer la conexión con la base de datos
         y realizar la carga de ese artículo*/
        protected void cargaVistaStock()
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["DB_Facturacion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            SqlCommand seleccion = new SqlCommand("SELECT COD_PRO,Casa,Nombre,Descripcion,Imagen,Familia,Precio,Cantidad,CantidadMin FROM TB_Stock "
                + "where COD_PRO = @codigo", conexion);
            seleccion.Parameters.Add("@codigo", System.Data.SqlDbType.Int);//Definimos el parámetro código
            seleccion.Parameters["@codigo"].Value = Request.QueryString["id"];//Le decimos que es el que recibió como parámetro
            try
            {
                conexion.Open();
                SqlDataReader registro = seleccion.ExecuteReader();
                while (registro.Read())//Recorre los elementos devueltos(en este caso solo uno ya que el id es único)
                {
                    txtCodigo.Text = registro["COD_PRO"].ToString();
                    lblNombre.Text = registro["Nombre"].ToString();
                    txtCasa.Text = registro["Casa"].ToString();
                    txtFamilia.Text = registro["Familia"].ToString();
                    txtPrecio.Text = registro["Precio"].ToString();
                    txtCantidad.Text = registro["Cantidad"].ToString();
                    txtCantidadMin.Text = registro["CantidadMin"].ToString();
                    ltDescripcion.Text = registro["Descripcion"].ToString();
                    imgProducto.ImageUrl = "controlImg.ashx?id=" + txtCodigo.Text;
                }
                conexion.Close();
            }
            catch (Exception)
            {
                lblError.Text ="No se cargo correctamente";
            }
        }

        /*Esta función recibe como parametro una variable booleana, por lo que dependiendo de una cosa u otra
         nos habilitará o desabilitará ciertos elementos*/
        protected void activarEdicion(bool activar)
        {
            btnGuardar.Visible = activar;
            FileUploadImg.Visible = activar;
            txtCasa.Enabled = activar;
            txtFamilia.Enabled = activar;
            txtPrecio.Enabled = activar;
            txtCantidad.Enabled = activar;
            txtCantidadMin.Enabled = activar;
            btnEditar.Visible = !activar;
        }

        /*Al pulsar el boton editar comprobamos que hay un código un codigo 
         * (y por lo tanto existe ese artículo)*/
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
                lblError.Text = "No se puede editar";
            else
                activarEdicion(true);//De tener un valor, habilitará los elementos de edición
        }

        /*Cuando hacemos click en guardar llama a la funcion actualizar y deshabilita los botones de edición*/
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
                ActualizarRegistro();
                activarEdicion(false);
        }

        /*Esta función es la encargada de coger los valores que hay en la plantilla y actualizar el registro*/
        protected void ActualizarRegistro()
        {
            SqlConnection connection = null;
            try
            {
                FileUpload img = (FileUpload)FileUploadImg;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)//comprueba existencia del fichero
                {
                    //crea fichero enviable mediante POST
                    HttpPostedFile File = FileUploadImg.PostedFile;
                    //Crea un array de Byte del tamaño de la longitud del archivo
                    imgByte = new Byte[File.ContentLength];
                    //se sube el archivo
                    File.InputStream.Read(imgByte, 0, File.ContentLength);
                }
                // preparamos la conexión con la BD
                string conn = System.Configuration.ConfigurationManager.ConnectionStrings["DB_Facturacion"].ConnectionString;
                connection = new SqlConnection(conn);
                Double precio = Convert.ToDouble(txtPrecio.Text);
                int cantidad = Convert.ToInt32(txtCantidad.Text);
                connection.Open();
                //definimos el Insert con parámetros
                string sql = "UPDATE TB_Stock set casa = @casa, familia =@familia,precio=@precio, cantidad=@cantidad, cantidadMin=@cantidadMin, Imagen=@imagen WHERE cod_pro = @cod_pro ";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@casa", txtCasa.Text);
                cmd.Parameters.AddWithValue("@familia", txtFamilia.Text);
                cmd.Parameters.AddWithValue("@precio", Convert.ToDouble(txtPrecio.Text));
                cmd.Parameters.AddWithValue("@cantidad", Convert.ToInt32(txtCantidad.Text));
                cmd.Parameters.AddWithValue("@cantidadMin", Convert.ToInt32(txtCantidadMin.Text));
                cmd.Parameters.AddWithValue("@cod_pro", txtCodigo.Text);
                cmd.Parameters.AddWithValue("@imagen", imgByte);//parámetro imagen
                cmd.ExecuteScalar();//Ejecutamos la sentencia
                //Le decimos que la URL de la imagen nos hace referencia al controlador y un código asociado
                imgProducto.ImageUrl = "controlImg.ashx?id=" + txtCodigo.Text;
                //mandamos a mostrar lo generado en la pantalla
            }
            catch
            {
                lblError.Text = "Hubo un error en el proceso";
            }
            finally
            {
                connection.Close();
            }
        }        
    }
}