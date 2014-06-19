using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCoopv1.Articulos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*La función siguiente es la encargada de que cuando elijamos un Artículo nos redirija a su sección detalles*/
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/Detalles/Default.aspx?id="+GridView1.SelectedRow.Cells[1].Text);//Pasamos como parámetro el id del artículo seleccionado
        }
    }
}