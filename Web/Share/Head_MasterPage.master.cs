using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Share_Head_MasterPage : System.Web.UI.MasterPage
{
    public int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Session["account"]!=null)
            {
                GetMessages(Session["account"].ToString());
            }
            else
            {
                GetMessages("000000");
            }
        }
    }
    public void GetMessages(string account)
    {
        count =qgzx.BLL.UserBusiness.GetMessagesCount(account);
        //messagescount.Text = count.ToString();
    }
    public void Button1_Click(object sender, EventArgs e)
    {
        
    }
}
