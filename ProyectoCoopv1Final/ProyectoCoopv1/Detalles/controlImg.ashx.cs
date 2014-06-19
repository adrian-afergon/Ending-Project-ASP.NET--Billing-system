using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace ProyectoCoopv1.Detalles
{
    /// <summary>
    /// Descripción breve de controlImg
    /// </summary>
    public class controlImg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                Int32 empno;
                /*Comprobamos que recibe un id como parámetro*/
                if (context.Request.QueryString["id"] != null)
                    empno = Convert.ToInt32(context.Request.QueryString["id"]);
                else
                    throw new ArgumentException("No parameter specified");
                //definimos el tipo de dato con el que vamos a responder
                context.Response.ContentType = "image/jpeg";
                //leemos la imagen de la Base de Datos
                Stream strm = ShowEmpImage(empno);
                //hacemos la lectura por trozos
                byte[] buffer = new byte[4096];
                int byteSeq = strm.Read(buffer, 0, 4096);
                while (byteSeq > 0)
                {
                    //enviamos un trozo de la imagen vía http response
                    context.Response.OutputStream.Write(buffer, 0, byteSeq);
                    byteSeq = strm.Read(buffer, 0, 4096);
                }
            }
            catch(Exception)
            {

            }
        }

        public Stream ShowEmpImage(int empno)
        {
            //conectamos con la Base de Datos
            string conn = ConfigurationManager.ConnectionStrings["DB_Facturacion"].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);
            //preparamos el select
            string sql = "SELECT imagen FROM TB_Stock WHERE cod_pro = @ID";
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", empno);
            connection.Open();
            //ejecutamos el select, guardando el resultado en un objeto
            object img = cmd.ExecuteScalar();
            try
            {
                //devolvemos el objeto en un conjunto de bytes
                return new MemoryStream((byte[])img);
            }
            catch
            {
                return null;
            }
            finally
            {
                connection.Close();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}