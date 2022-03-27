using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["maccount"]=null;
        Session["lastlogintime"]=null;
        Session["managerName"] = null;
        Session["mpassword"] = null;
    }
    protected void login_btn_Click(object sender, EventArgs e)
    {
        string account = ma_txt_account.Text.Trim();
        string password = ma_txt_password.Text.Trim();
        bool b=qgzx.BLL.ManagerBusiness.Login(account, password);
        if (b)
        {
            Session["maccount"] = account;
            qgzx.Model.Manager m = qgzx.BLL.ManagerBusiness.GetManager(account);
            Session["lastlogintime"] = m.LastLoginTime;
            Session["managerName"] = m.ManagerName;
            Session["mpassword"] = m.Password;
            qgzx.BLL.ManagerBusiness.ChangeManagerLastLoginTime(account);
            FormsAuthentication.SetAuthCookie(ma_txt_account.Text.Trim(), false);
            Response.Redirect("index.aspx");
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("账号或密码错误，请检查并重试！", this);
        }
    }
}