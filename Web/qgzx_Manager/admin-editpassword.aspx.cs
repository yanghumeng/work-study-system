using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_admin_editpassword : System.Web.UI.Page
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
    public static string UpdatePassword(string oldpassword, string newpassword)
    {
        string maccount=HttpContext.Current.Session["maccount"].ToString();
        
            if(oldpassword==HttpContext.Current.Session["mpassword"].ToString())
            {
                if(qgzx.BLL.ManagerBusiness.ChangeManagerPassword(maccount,newpassword))
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                return "oldpassworderror";
            }
        
    }
}