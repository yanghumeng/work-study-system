using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_PersonalMessage : System.Web.UI.Page
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
        Student student = qgzx.BLL.UserBusiness.GetStudentMessage(Session["Account"].ToString());
        txt_ClassNum.Text = student.ClassNum.ToString()+"班";
        txt_DateOfBirth.Text = student.DateOfBirth;
        txt_DatesofAttendance.Text = student.DatesofAttendance;
        txt_DatesofGraduation.Text = student.DatesofGraduation;
        txt_Department.Text = student.Department;
        txt_IDcard.Text = student.IDcard;
        txt_IsSchool.Text = student.IsSchool;
        txt_Major.Text = student.Major;
        txt_Grade.Text = student.Grade;
        txt_Nation.Text = student.Nation;
        txt_NativePlace.Text = student.NativePlace;
        txt_PoliticalStatus.Text = student.PoliticalStatus;
        txt_Sex.Text = student.Sex;
        txt_studentid.Text = student.StudentID;
        txt_studentname.Text = student.StudentName;
        lab_studentname.Text = student.StudentName;
    }
}