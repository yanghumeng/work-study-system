using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Reply : System.Web.UI.Page
{
    static string id=null;
    static string studentid = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                id = Request.QueryString["id"];
                studentid = Request.QueryString["name"];
                txt_Feedback_person.Text = studentid;
                txt_Feedback_content.Text=Request.QueryString["content"];
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    [WebMethod]
    public static bool Reply(string content)
    {
        if(id!=null&&studentid!=null)
        {
            if (qgzx.BLL.ManagerBusiness.SendMessage("管理员", studentid, content))
            {
                if(qgzx.BLL.ManagerBusiness.EditFeedbackIsreply(Convert.ToInt32(id)))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
}