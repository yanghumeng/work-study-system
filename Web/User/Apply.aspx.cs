using qgzx.BLL;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Apply : System.Web.UI.Page
{
    static string newFileName = "";
    static string studentid=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["account"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                studentid = Session["account"].ToString();
                string starttime = DateTime.Now.ToString("yyyy") + "-9-1 0:00:00";
                string arrivetime = Convert.ToInt32(DateTime.Now.ToString("yyyy")) + 1 + "-6-30 23:59:59";
                bool b = qgzx.BLL.UserBusiness.GetApplyMessageByTime(studentid, starttime, arrivetime);
                if (!qgzx.BLL.ApplymessageBusiness.GetOpenApplyStatus())
                {
                    qgzx.Utility.JavaScript.AlertAndRedirect("还没有到申请时间（请等待学校通知）！", "main.aspx", this);
                }
                else if (Session["WorkPosition"].ToString() != "" && Session["WorkPosition"].ToString() != "无")
                {
                    qgzx.Utility.JavaScript.AlertAndRedirect("你已经被录用了，不能再次申请", "main.aspx", this);
                }
                else if (b)
                {
                    qgzx.Utility.JavaScript.AlertAndRedirect("这一学年，你已经申请过了，请下一学年再来吧！", "main.aspx", this);
                }
                else
                {
                    string[] nation = new string[] { "汉族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "藏族","蒙古族", "布依族" , "侗族", "瑶族" , "朝鲜族" , "白族" , "哈尼族" ,"哈萨克族" , "黎族","傣族" ,
                    "畲族" , "僳僳族" ,"仡佬族" , "东乡族" ,"拉祜族", "水族","佤族"," 纳西族","羌族", "土族" ,"仫佬族","锡伯族","柯尔柯孜族", "达斡尔族","景颇族" ,"毛南族" ,"撒拉族",
                     "布朗族","塔吉克族" ,"阿昌族普米族" ,"鄂温克族","怒族", "京族","基诺族","德昂族", "保安族", "俄罗斯族","裕固族","乌孜别克族","门巴族","鄂伦春族","独龙族塔塔尔族","赫哲族","高山族","珞巴族" };
                    Select_nation.DataSource = nation;
                    Select_nation.DataBind();
                    Loadpostlist();
                }
            }

        }
    }

    protected void yes_Click(object sender, EventArgs e)
    {
        bool flag = UpLoadFile();
        if (flag)
        {
            if (apply_location.SelectedValue == "请选择")
            {
                qgzx.Utility.JavaScript.Alert("你还没有选择工作类型，请选择", this);
            }
            else
            {
                Apply message = new Apply();
                message.StudentID = studentid;
                message.StudentName = stu_name.Text.Trim();
                message.PhoneNum = phone_num.Text.Trim();
                message.ClassNum = stu_class.Text.Trim();
                message.FamilyNum = Convert.ToInt32(family_num.Text.Trim());
                message.PersonerPhoto = newFileName.Trim();
                message.FamilyAddress = family_address.Text.Trim();
                message.Sex = Sex_select.SelectedValue.Trim();
                message.Nation = Select_nation.SelectedValue.Trim();
                message.ApplyLocation = apply_location.SelectedValue.Trim();
                message.Deploy = deploy.SelectedValue.Trim();
                message.TuitionPayable = Convert.ToInt32(TuitionPayable.Text.Trim());
                message.TuitionPaid = Convert.ToInt32(TuitionPaid.Text.Trim());
                message.TuitionShortage = Convert.ToInt32(TuitionShortage.Text.Trim());
                message.ApplicationReason = ApplicationReason.Text.Trim();
                message.ApplyTime = DateTime.Now;
                if (qgzx.BLL.UserBusiness.ApplyMessage(message))
                {
                    ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('" + "提交成功，等待审核" + "');window.location.href ='main.aspx'</script>");
                }
                else
                {
                    qgzx.Utility.JavaScript.Alert("提交失败，请检查后重试！", this);
                }
            }
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("未选择头像，请选择", this);
        }



    }
    public bool UpLoadFile()
    {

        if (file.HasFile)
        {
            string path = Server.MapPath("../UploadFile/personalphoto/");
            var fileName = Path.GetFileName(file.FileName);
            newFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
            bool flag = true;
            try
            {
                file.SaveAs(Path.Combine(path, newFileName));
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        else
        {
            return false;
        }
    }
    protected void back_yes_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }
    //加载岗位
    public void Loadpostlist()
    {
        apply_location.DataSource = qgzx.BLL.PostDetailBusiness.GetPostDetailName();
        apply_location.DataBind();
    }
}