using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_postdetail_edit : System.Web.UI.Page
{
    static string id=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                id = Request.QueryString["id"];
                PostDetail postdetail = qgzx.BLL.PostDetailBusiness.GetPostDetailByID(Convert.ToInt32(id));
                txt_neednumber.Text = postdetail.NeedNumber.ToString();
                txt_postdetail_location.Text = postdetail.PostLocation.ToString();
                txt_postdetailname.Text = postdetail.PostName.ToString();
                txt_requirement.Text = postdetail.Requirement.ToString();
                txt_workcontent.Text = postdetail.PostContent.ToString();
                txt_worktime.Text = postdetail.WorkTime.ToString();
                sel_wages.Text = Convert.ToString(postdetail.Wages);
                chb_toenable.Checked = postdetail.Toenable;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    [WebMethod]
    public static bool Editpostdetail(string postname, string postlocation, string postcontent, string neednumber,
        string worktime, string requirement, int wages, bool toenable)
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
        if (qgzx.BLL.ManagerBusiness.EditPostdetail(postdetail,Convert.ToInt32(id)))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}