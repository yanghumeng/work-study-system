using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ApplyDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"] != null)
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
        Apply apply = qgzx.BLL.ApplymessageBusiness.GetApplymessageByID(Convert.ToInt32(Request.QueryString["applyid"]));
        photo.ImageUrl = "../UploadFile/personalphoto/" + apply.PersonerPhoto;
        txt_studentid.Text = apply.StudentID;
        txt_applicationReason.Text = apply.ApplicationReason;
        txt_apply_location.Text = apply.ApplyLocation;
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
}