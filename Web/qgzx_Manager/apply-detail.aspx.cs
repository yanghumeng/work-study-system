using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_apply_detail : System.Web.UI.Page
{
    static string applyid=null;
    static string studentid = null;
    static string postname = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                applyid = Request.QueryString["applyid"];
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
        Apply apply = qgzx.BLL.ApplymessageBusiness.GetApplymessageByID(Convert.ToInt32(Request.QueryString["applyid"]));
        photo.ImageUrl = "../UploadFile/personalphoto/" + apply.PersonerPhoto;
        txt_studentid.Text = apply.StudentID;
        studentid = apply.StudentID;
        txt_applicationReason.Text = apply.ApplicationReason;
        txt_apply_location.Text = apply.ApplyLocation;
        postname = apply.ApplyLocation;
        txt_applydate.Text = apply.ApplyTime.ToString();
        txt_class.Text = apply.ClassNum;
        txt_deploy.Text = apply.Deploy;
        txt_familyaddress.Text = apply.FamilyAddress;
        txt_familynum.Text = apply.FamilyNum.ToString();
        txt_name.Text = apply.StudentName;
        txt_nation.Text = apply.Nation;
        txt_phonrnum.Text = apply.PhoneNum;
        txt_sex.Text = apply.Sex;
        txt_tuitionPaid.Text = apply.TuitionPaid.ToString();
        txt_tuitionPayable.Text = apply.TuitionPayable.ToString();
        txt_tuitionShortage.Text = apply.TuitionShortage.ToString();
    }
    [WebMethod]
    public static bool EditApplyStatus(string status)
    {
        try
        {
            string content="";
            if(status=="1")
            {
                status="已通过";
                content="恭喜，你申请已经通过审核，请等待部门通知安排工作☺";
                if (postname != null)
                {
                    if (!qgzx.BLL.ManagerBusiness.AddStudentPost(studentid,postname))
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else if(status=="0")
            {
                status="未通过";
                content="你申请没有通过审核，请不要泄气，下次还有机会哦";
            }

            if (qgzx.BLL.ManagerBusiness.EditApplyStatus(Convert.ToInt32(applyid), status))
            {
                if(qgzx.BLL.ManagerBusiness.SendMessage("管理员", studentid, content))
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