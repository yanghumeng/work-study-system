using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qgzx_Manager_Notice : System.Web.UI.Page
{
    //static string account = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
               // string account = Session["maccount"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    [WebMethod]
    public static bool Issue(string content)
    {
        return true;

    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        try
        {
            if (qgzx.BLL.ManagerBusiness.IssueNewNotice(Session["maccount"].ToString(), this.txtEditorContents.Text, DateTime.Now.ToString()))
            {
                qgzx.Utility.JavaScript.Alert("layer.alert('发布成功', { icon: 6 }, function () {var index = parent.layer.getFrameIndex(window.name);parent.layer.close(index);});", this);
            }
        }
        catch
        {
            qgzx.Utility.JavaScript.Alert("系统出错", this);
        }
    }
}