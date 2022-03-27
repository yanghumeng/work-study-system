using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_admin_edit : System.Web.UI.Page
{
    static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                getdata();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    
    public void getdata()
    {
        id=Request.QueryString["mid"].Trim();
        Manager manager = qgzx.BLL.ManagerBusiness.GetManagerByID(Convert.ToInt32(id));
        username.Text = manager.ManagerName;
        phone.Text = manager.PhoneNum;
        L_email.Text = manager.Email;
        sel_role.SelectedValue = manager.Type;
        remark.Text = manager.Remark;

    }
    [WebMethod]
    public static bool Editmanager(string username, string phonenum, string email, string role,string remark)
    {
        Manager manager = new Manager();
        manager.Account = phonenum;
        manager.Email = email;
        manager.ManagerName = username;
        manager.PhoneNum = phonenum;
        manager.Remark = remark;
        manager.Type = role;
        manager.LastLoginTime = DateTime.Now.ToString();
        try
        {
            if (qgzx.BLL.ManagerBusiness.EditManagerByID(manager, Convert.ToInt32(id)))
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