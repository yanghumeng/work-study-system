using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_order_add : System.Web.UI.Page
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
    public static bool Addpostdetail(string postname,string postlocation,string postcontent,string neednumber,
        string worktime,string requirement,int wages,bool toenable)
    {
        PostDetail postdetail = new PostDetail();
        postdetail.PostName = postname;
        postdetail.PostLocation = postlocation;
        postdetail.PostContent = postcontent;
        postdetail.NeedNumber = Convert.ToInt32(neednumber);
        postdetail.WorkTime = worktime;
        postdetail.Requirement = requirement;
        postdetail.Wages = wages;
        postdetail.Toenable = toenable;
        if(qgzx.BLL.ManagerBusiness.AddPostdetail(postdetail))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}