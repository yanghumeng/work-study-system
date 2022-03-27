using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_admin_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    [WebMethod]
    public static bool Addmanager(string username, string phonenum, string email, string role,
        string remark, string pass)
    {
        if (qgzx.BLL.ManagerBusiness.ManagerIsExist(phonenum))
        {
            return false;
        }
        else
        {
            Manager manager = new Manager();
            manager.Account = phonenum;
            manager.Email = email;
            manager.ManagerName = username;
            manager.Password = pass;
            manager.PhoneNum = phonenum;
            manager.Remark = remark;
            manager.Type = role;
            manager.LastLoginTime = DateTime.Now.ToString();
            try
            {
                if (qgzx.BLL.ManagerBusiness.Addmanager(manager))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }
        
    }
}