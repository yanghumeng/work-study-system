using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qgzx_Manager_publishoutshoolpost_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                //GetDataOutschool();
                bindData("已通过", "待审核", "未通过");
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

    void bindData(string PublishStatus, string PublishStatus2, string PublishStatus3)
    {
        List<OutSchoolPost> list;
        list = qgzx.BLL.PostDetailBusiness.GetAllPublishPost(PublishStatus, PublishStatus2, PublishStatus3);
        outschoolpost_list.DataSource = list;
        outschoolpost_list.DataBind();
    }
    protected void search_Click(object sender, EventArgs e)
    {
        if (type.SelectedValue.Trim() == "全部")
            bindData("已通过", "待审核", "未通过");
        else
            bindData("", "", type.SelectedValue.Trim());

    }
}