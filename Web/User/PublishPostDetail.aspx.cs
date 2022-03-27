using qgzx.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_PublishPoatDetail : System.Web.UI.Page
{
    string imgstr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["account"] == null || Session["account"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void publishpostdetail_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["CreditDegree"]) >= 50)
        {
            OutSchoolPost outschoolpost = new OutSchoolPost();
            outschoolpost.ContactWay = txt_ContactWay.Text.Trim();
            outschoolpost.Publisher = Session["account"].ToString();
            outschoolpost.PublishTime = DateTime.Now.ToString();
            outschoolpost.NeedNumber = txt_Neednumber.Text.Trim();
            outschoolpost.WageStandard = txt_Wagestandard.Text.Trim();
            outschoolpost.WorkAddress = txt_Workaddress.Text.Trim();
            outschoolpost.WorkContent = txt_Workcontent.Text.Trim();
            outschoolpost.WorkName = txt_Workname.Text.Trim();
            outschoolpost.WorkTime = txt_Worktime.Text.Trim();
            outschoolpost.Requirement = txt_Requirement.Text.Trim();
            Upload();
            
                outschoolpost.PostImg = imgstr;

                if (qgzx.BLL.UserBusiness.PublishPost(outschoolpost))
                {
                    qgzx.Utility.JavaScript.AlertAndRedirect("已经提交，需要等待半个工作日的审核时间", "PublishPostDetail.aspx", this);
                }
                else
                {
                    qgzx.Utility.JavaScript.Alert("提交失败，请重试！", this);
                }
           
        }
        else
        {
            qgzx.Utility.JavaScript.Alert("你的信用度不够，不能发布岗位", this);
        }
    }
    //上传图片
    public bool Upload()
    {
        if (fileupload.HasFile)
        {
            string newFileName = "";
            bool flag = true;
            string path = Server.MapPath("../UploadFile/postpictures/");
            HttpFileCollection upFiles = Request.Files;
            if (upFiles.Count > 0 && upFiles.Count < 5)
            {
                int i;
                for (i = 0; i < upFiles.Count; i++)
                {
                    var fileName = Path.GetFileName(upFiles[i].FileName);
                    newFileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + Path.GetExtension(fileName);
                    try
                    {
                        upFiles[i].SaveAs(Path.Combine(path, newFileName));
                        if (i == upFiles.Count - 1)
                        {
                            imgstr += newFileName;
                        }
                        else
                        {
                            imgstr += newFileName + ",";
                        }

                    }
                    catch
                    {
                        flag = false;
                    }
                }
                return flag;
            }
            else
            {
                qgzx.Utility.JavaScript.Alert("只能选择4张图片", this);
                return false;
            }
        }
        else
        {
            //qgzx.Utility.JavaScript.Alert("没有选择图片", this);
            return false;
        }
    }
}