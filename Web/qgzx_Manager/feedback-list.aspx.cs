using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_feedback_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                bindData("0","1");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    void bindData(string IsReply, string IsReply2)
    {
        List<Feedback> list;
        list = qgzx.BLL.ManagerBusiness.GetFeedBack(IsReply, IsReply2);
        feedback_list.DataSource = list;
        feedback_list.DataBind();
    }
    protected void search_Click(object sender, EventArgs e)
    {
        if (type.SelectedValue.Trim() == "全部")
            bindData("0", "1");
        else if (type.SelectedValue.Trim() == "已回复")
            bindData(null, "1");
        else if (type.SelectedValue.Trim() == "未回复")
            bindData("0", null);
    }
}