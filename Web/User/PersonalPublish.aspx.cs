using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_PersonalPublish : System.Web.UI.Page
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
        List<OutSchoolPost> list =qgzx.BLL.PostDetailBusiness.GetOutSchoolPostByStudentID(Session["account"].ToString());
        publishpost_list.DataSource = list;
        publishpost_list.DataBind();
    }
    [WebMethod]
    public static bool delpost(string id)
    {
        return qgzx.BLL.ManagerBusiness.DelOutSchoolPost(Convert.ToInt32(id));
    }
}