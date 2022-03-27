using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_order_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                //GetDataInschool();
                //AspNetPager1_PageChanged(sender, e);
                bindData("0","1");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
  
    //删除岗位
    [WebMethod]
    public static bool Delpostdetail(string ID)
    {

        if (qgzx.BLL.ManagerBusiness.DelPostDetail(Convert.ToInt32(ID)))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    //是否启用岗位
    [WebMethod]
    public static bool EditPostDetailStatus(int ID, string Toenable)
    {

        if (qgzx.BLL.ManagerBusiness.EditPostDetailStatus(ID, Convert.ToInt32(Toenable)))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    [WebMethod]
    public static bool DelAllpostdetail(string idlist)
    {
        bool b = false;
        string[] sArray = idlist.Split(',');
        foreach (string id in sArray)
        {
            if (qgzx.BLL.ManagerBusiness.DelPostDetail(Convert.ToInt32(id)))
            {
                b = true;
            }
            else
            {
                b = false;
            }
        }
        return b;
    }
    public void bindData(string Toenable, string Toenable2)
    {
        List<PostDetail> list=qgzx.BLL.PostDetailBusiness.GetAllPostDetail(Toenable,Toenable2);
        postdetail_list.DataSource = list;
        postdetail_list.DataBind();
    }
  
    protected void search_Click(object sender, EventArgs e)
    {
        if (type.SelectedValue.Trim() == "全部")
            bindData("0", "1");
        else if (type.SelectedValue.Trim() == "使用中")
            bindData(null, "1");
        else if (type.SelectedValue.Trim() == "已停用")
            bindData("0", null);
    }
}