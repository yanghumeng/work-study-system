using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_apply_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                bindData("已通过", "待审核", "未通过");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
   
    //删除申请
    [WebMethod]
    public static bool Delapply(string ID)
    {

        if (qgzx.BLL.ManagerBusiness.DelApplymessage(Convert.ToInt32(ID)))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    [WebMethod]
    public static bool DelAllapply(string idlist)
    {
        bool b = false;
        string[] sArray = idlist.Split(',');
        foreach (string id in sArray)
        {
            if (qgzx.BLL.ManagerBusiness.DelApplymessage(Convert.ToInt32(id)))
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
    void bindData(string ApplyStatus, string ApplyStatus2, string ApplyStatus3)
    {
        List<Apply> list;
        list = qgzx.BLL.ApplymessageBusiness.GetAllApplyMessage(ApplyStatus, ApplyStatus2, ApplyStatus3);
        apply_list.DataSource = list;
        apply_list.DataBind();
    }

    protected void search_Click(object sender, EventArgs e)
    {
        if (type.SelectedValue.Trim() == "全部")
            bindData("已通过", "待审核", "未通过");
        else
            bindData("", "", type.SelectedValue.Trim());
    }
}