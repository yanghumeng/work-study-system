using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_outschoolpost_examine : System.Web.UI.Page
{
    static string id;
    static string studentid;
    static string reason;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                id = Request.QueryString["id"];
                GetData();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    public void GetData()
    {
        OutSchoolPost outschoolpost = qgzx.BLL.PostDetailBusiness.GetOutSchoolPostByID(Convert.ToInt32(id));
        txt_contactway.Text = outschoolpost.ContactWay;
        txt_neednumber.Text = outschoolpost.NeedNumber;
        txt_publishdate.Text = outschoolpost.PublishTime;
        txt_publisher.Text = outschoolpost.Publisher;
        txt_requirement.Text = outschoolpost.Requirement;
        txt_wagestandard.Text = outschoolpost.WageStandard;
        txt_workaddress.Text = outschoolpost.WorkAddress;
        txt_workcontent.Text = outschoolpost.WorkContent;
        txt_workname.Text = outschoolpost.WorkName;
        txt_worktime.Text = outschoolpost.WorkTime;
        studentid = outschoolpost.Publisher;
        string[] sArray = outschoolpost.PostImg.Split(',');
        foreach (string i in sArray)
        {
            if (i.Trim() != "")
            {
                Image imgs = new Image();
                imgs.ImageUrl = "../UploadFile/postpictures/" + i;
                img.Controls.Add(imgs);
            }
            
        }
        reason = txt_reason.Text;
    }
    [WebMethod]
    public static bool EditPublishStatus(string status)
    {
        try
        {
            string content = "";
            int toenable = 0;
            if (status == "1")
            {
                status = "已通过";
                toenable = 1;
                content = "恭喜，你发布的岗位已经通过审核了☺";
            }
            else if (status == "0")
            {
                status = "未通过";
                toenable = 0;
                content = "你发布的岗位没有通过审核，请根据要求修改正确后重新发布";
            }

            if (qgzx.BLL.ManagerBusiness.EditPublishStatus(Convert.ToInt32(id),reason, status,toenable))
            {
                if (qgzx.BLL.ManagerBusiness.SendMessage("管理员", studentid, content))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }
}