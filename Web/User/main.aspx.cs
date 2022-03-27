using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断session里面是否存在管理员
        if (!IsPostBack)
        {
            if (Session["account"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                getnotice();
            }
            Session["IsAuthorized"] = "true";
        }

    }
    public void getnotice()
    {
        Notice notice = qgzx.BLL.UserBusiness.GetNewNotice();
        notice_content.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + notice.Content;
        notice_date.Text = notice.PublishDate.ToString("yyyy-MM-dd");
    }
    [WebMethod]
    public static string insertfeedback(string studentid,string depict)
    { 
        try
        {
            if(qgzx.BLL.UserBusiness.StudentIsExist(studentid))
            {
                if (depict == null && depict == "")
                {
                    return "3";
                }
                if (qgzx.BLL.UserBusiness.InsertFeedback(studentid, depict))
                {
                    return "0";
                }
                else
                {
                    return "1";
                }
            }
            else
            {
                return "2";
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
            return e.Message;
        }
    }
}