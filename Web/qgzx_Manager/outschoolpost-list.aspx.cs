using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qgzx_Manager_outschoolpost_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                //GetDataOutschool();
                bindData("0", "1");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }//删除岗位
    [WebMethod]
    public static bool Deloutschoolpost(string ID)
    {

        if (qgzx.BLL.ManagerBusiness.DelOutSchoolPost(Convert.ToInt32(ID)))
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
    public static bool EditOutSchoolPostStatus(int ID, string Toenable)
    {

        if (qgzx.BLL.ManagerBusiness.EditOutSchoolPostStatus(Convert.ToInt32(ID), Convert.ToInt32(Toenable)))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    [WebMethod]
    public static bool DelAlloutschoolpost(string idlist)
    {
        bool b = false;
        string[] sArray = idlist.Split(',');
        foreach (string id in sArray)
        {
            if (qgzx.BLL.ManagerBusiness.DelOutSchoolPost(Convert.ToInt32(id)))
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
        List<OutSchoolPost> list = qgzx.BLL.PostDetailBusiness.GetAllOutSchoolPost(Toenable, Toenable2);
        outschoolpost_list.DataSource = list;
        outschoolpost_list.DataBind();
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