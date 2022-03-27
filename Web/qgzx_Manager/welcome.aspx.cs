using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {  
            if (Session["maccount"] != null)
            {
                if (qgzx.BLL.ApplymessageBusiness.GetOpenApplyStatus())
                {
                    ApplyStatus.Text = "开启";
                }
                else
                {
                    ApplyStatus.Text = "关闭";
                }
                Manager m = qgzx.BLL.ManagerBusiness.GetManager(Session["maccount"].ToString());
                ManagerID.Text = m.ManagerID;
                managername.Text = m.ManagerName;
                mManagerName.Text = m.ManagerName;
                PhoneNum.Text = m.PhoneNum;
                Remark.Text = m.Remark;
                Email.Text = m.Email;
                Type.Text = m.Type;
                LastLoginTime.Text = Convert.ToString(Session["lastlogintime"]);
                newapply.Text =Convert.ToString( qgzx.BLL.ApplymessageBusiness.GetAllApplyMessageCount());
                newfeedback.Text = Convert.ToString(qgzx.BLL.ManagerBusiness.GetFeedBackCount());
                newpostapply.Text = Convert.ToString(qgzx.BLL.PostDetailBusiness.GetOutSchoolPostCount());
                postnum.Text = Convert.ToString(qgzx.BLL.PostDetailBusiness.GetPostDetailCount());
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
    [WebMethod]
    public static string EditPassstatus(string b)
    {
        if(qgzx.BLL.ManagerBusiness.EditPassstatus(Convert.ToInt32(b)))
        {
            return "1";
        }
        else
        {
            return "0";
        }
        
    }
}