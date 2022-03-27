using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ApplyHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"]!=null)
        {
            if (!IsPostBack)
            {
                GetData();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        
    }
    public void GetData()
    {
        Repeater1.DataSource =qgzx.BLL.UserBusiness.GetApplyMessageByStudentID(Session["account"].ToString());
        Repeater1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Btn = sender as Button;
        int commandArgument = Convert.ToInt32(Btn.CommandArgument.ToString());
        if (qgzx.BLL.UserBusiness.EditApplymessageStatus(commandArgument))
        {
            GetData();
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("删除失败", this);
        }
    }
    //筛选
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString()=="全部")
        {
            GetData();
        }
        else
        {
            Repeater1.DataSource = qgzx.BLL.UserBusiness.GetApplyMessageByApplystatus(Session["account"].ToString(), DropDownList1.SelectedValue);
            Repeater1.DataBind();
        }
    }
}