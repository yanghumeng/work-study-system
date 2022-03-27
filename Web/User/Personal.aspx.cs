using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Personal : System.Web.UI.Page
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
        Account account = qgzx.BLL.UserBusiness.GetAccountMessage(Session["Account"].ToString());
        txt_Email.Text = account.Email;
        txt_Lastlogin.Text = Session["LastLoginTime"].ToString();
        txt_Location.Text = account.Location;
        txt_Phonenum.Text = account.PhoneNum;
        txt_Studentid.Text = account.StudentID;
        txt_CreditDegree.Text = account.CreditDegree+"%";
        txt_Workposition.Text = account.WorkPosition;
    }
    /// <summary>
    /// 修改账号信息
    /// </summary>
    /// <param name="email"></param>
    /// <param name="phonenum"></param>
    /// <param name="location"></param>
    /// <returns></returns>
    [WebMethod]
    public static string ChangeAccountMessage(string email, string phonenum, string location)
    {
        string studentid = HttpContext.Current.Session["account"].ToString();
        if (qgzx.BLL.UserBusiness.ChangeAccountMessage(studentid, phonenum, email, location))
        {
            return "1";
        }
        else
        {
            return "0";
        }

    }
    [WebMethod]
    public static string ChangePassword(string yzm, string newpassword, string email)
    {
        string studentid = HttpContext.Current.Session["account"].ToString();
        if (System.Web.HttpContext.Current.Request.Cookies["verCode"] == null)
        {
            return "2";//验证码失效
        }
        else
        {
            string verCode = System.Web.HttpContext.Current.Request.Cookies["verCode"].Value;
            if (verCode == yzm)
            {
                bool csp = qgzx.BLL.UserBusiness.ChangeStudentPassword(studentid, newpassword, email);
                if (csp == true)
                {
                    ///---提示操作成功
                    System.Web.HttpContext.Current.Response.Cookies.Remove("verCode");
                    return "1";
                }
                else
                {
                    return "0";
                }
            }
            else
            {
                return "3";//验证码错误
            }
        }
    }
}