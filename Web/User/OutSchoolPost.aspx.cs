using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_OutSchoolPost : System.Web.UI.Page
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
        List<OutSchoolPost> list = qgzx.BLL.PostDetailBusiness.GetOutSchoolPost();
        if (list != null)
        {
            OutSchoolPostRepeater.DataSource = list;
            OutSchoolPostRepeater.DataBind();
        }
    }
    [WebMethod]
    public static string GetOutSchoolPostByID(string id)
    {
        OutSchoolPost outschoolpost = qgzx.BLL.PostDetailBusiness.GetOutSchoolPostByID(Convert.ToInt32(id));
        string json = Newtonsoft.Json.JsonConvert.SerializeObject(outschoolpost);
        return json;
    }
}