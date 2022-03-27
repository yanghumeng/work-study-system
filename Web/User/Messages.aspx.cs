using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"] != null)
        {
            if (!IsPostBack)
            {
                GetMessages();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    public void GetMessages()
    {
        try
        {
            List<Message> messages = qgzx.BLL.UserBusiness.GetMessages(Session["account"].ToString());
            messageslist.DataSource = messages;
            messageslist.DataBind();
        }
        catch
        {
            qgzx.Utility.JavaScript.Alert("出现错误！", this);
        }
    }
    protected void AlreadyRead_Click(object sender, EventArgs e)
    {
        try
        {
            qgzx.BLL.UserBusiness.EditAlreadyRead(Session["account"].ToString());
            GetMessages();
        }
        catch
        {
            qgzx.Utility.JavaScript.Alert("出现错误！", this);
        }
    }
}