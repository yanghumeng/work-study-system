using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Mail;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Forget_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_repassword_Click(object sender, EventArgs e)
    {
        string studentid = forget_txt_student_id.Text.Trim();
        string newpassword = forget_txt_password.Text.Trim();
        string renewpassword = re_forget_txt_password.Text.Trim();
        string email = forget_txt_email.Text.Trim();
        string yzm = forget_txt_yzm.Text.Trim();
        if (studentid != "" && newpassword != "" && renewpassword != "" && email != "")
        {
            if (System.Web.HttpContext.Current.Request.Cookies["verCode"] == null)
            {
                qgzx.Utility.JavaScript.Alert("验证码已经失效，请重新获取", this);
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
                        ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('" + "修改成功，前往登录页面" + "');window.location.href ='Login.aspx'</script>");
                    }
                    else
                    {
                        qgzx.Utility.JavaScript.Alert("修改失败，请重试！", this);
                    }
                }
                else
                {
                    qgzx.Utility.JavaScript.Alert("验证码错误", this);
                }
            }
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("信息有误，请检查后重试", this);
        }

    }
   
    /// <summary>
    /// 验证码
    /// </summary>
    /// <returns></returns>

    [WebMethod]
    public static string QQ_email(string Email)
    {
        try
        {
            string verCode = "";
            Random random = new Random();
            for (int i = 0; i < 6; i++)
            {
                verCode += random.Next(10).ToString();
            }
            SmtpClient smtp = new SmtpClient();
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
            smtp.Host = "smtp.qq.com";
            smtp.Port = 25;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("1830720944@qq.com", "gyihrygrzcmlegbc");
            System.Net.Mail.MailMessage mailMsg = new System.Net.Mail.MailMessage("1830720944@qq.com", Email);
            mailMsg.Subject = "密码修改验证（勤工助学）";
            mailMsg.Body = "验证码为：<span style='color:red'>" + verCode + "</span>";
            mailMsg.IsBodyHtml = true;
            mailMsg.BodyEncoding = Encoding.UTF8;
            mailMsg.Priority = System.Net.Mail.MailPriority.Normal;
            smtp.Send(mailMsg);
            System.Web.HttpContext.Current.Response.Cookies["verCode"].Value = verCode;
            System.Web.HttpContext.Current.Response.Cookies["verCode"].Expires = DateTime.Now.AddSeconds(60);
            
            return "1";
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
            return "0";
        }
    }

}