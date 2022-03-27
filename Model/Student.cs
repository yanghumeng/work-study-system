using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    
   public class Student
    {
       /// <summary>
       /// 学号
       /// </summary>
       public string StudentID { get; set; }
       /// <summary>
       /// 姓名
       /// </summary>
       public string StudentName { get; set; }
       /// <summary>
       /// 性别
       /// </summary>
       public string Sex { get; set; }
       /// <summary>
       /// 身份证号码
       /// </summary>
       public string IDcard { get; set; }
       /// <summary>
       /// 民族
       /// </summary>
       public string Nation { get; set; }
       /// <summary>
       /// 籍贯
       /// </summary>
       public string NativePlace { get; set; }
       /// <summary>
       /// 政治面貌
       /// </summary>
       public string PoliticalStatus { get; set; }
       /// <summary>
       /// 出生年月
       /// </summary>
       public string DateOfBirth { get; set; }
       /// <summary>
       /// 入学日期
       /// </summary>
       public string DatesofAttendance { get; set; }
       /// <summary>
       /// 毕业日期
       /// </summary>
       public string DatesofGraduation { get; set; }
       /// <summary>
       /// 系部
       /// </summary>
       public string Department { get; set; }
       /// <summary>
       /// 专业
       /// </summary>
       public string Major { get; set; }
       /// <summary>
       /// 年级
       /// </summary>
       public string Grade { get; set; }
       /// <summary>
       /// 班级
       /// </summary>
       public string ClassNum { get; set; }
       /// <summary>
       /// 是否在校
       /// </summary>
       public string IsSchool { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string PassWord { get; set; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNum { get; set; }
        /// <summary>
        /// 电子邮件
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Location { get; set; }
    }
}
