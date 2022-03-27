using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_PostDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"] != null)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    public void GetData()
    {
        List<PostDetail> list = qgzx.BLL.UserBusiness.GetPostDetail();
        if(list!=null)
        {
            PostDetailRepeater.DataSource = list;
            PostDetailRepeater.DataBind();
        }

    }
}