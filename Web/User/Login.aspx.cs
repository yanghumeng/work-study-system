using qgzx.BLL;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["account"] = null;
            Response.Cookies["studentid"].Expires = DateTime.Now.AddDays(-1);

        }
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        string studentid = txt_student_id.Text.Trim();
        string password = txt_password.Text.Trim();
        if (studentid != string.Empty && password != string.Empty)
        {
            if (qgzx.BLL.UserBusiness.StudentIsExist(studentid))
            {
                if (qgzx.BLL.UserBusiness.Login(studentid, password))
                {
                    Account account = UserBusiness.GetAccountMessage(studentid);
                    Session["LastLoginTime"] = account.LastLogin;
                    Session["CreditDegree"] = account.CreditDegree;
                    Session["WorkPosition"] = account.WorkPosition;
                    qgzx.BLL.UserBusiness.ChangeUserLastLoginTime(studentid);
                    Session["account"] = studentid;
                    FormsAuthentication.SetAuthCookie(txt_student_id.Text.Trim(), false);
                    Response.Redirect("main.aspx");
                }
                else
                {
                    qgzx.Utility.JavaScript.Alert("学号或密码错误，请检查并重试！", this);
                }
            }
            else
            {
                qgzx.Utility.JavaScript.Alert("学号不存在", this);
            }
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("账号或密码不能为空！", this);
        }
    }
}