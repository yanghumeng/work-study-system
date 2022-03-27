using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace qgzx.DAL
{
    public class UserDataAccess
    {
        /// <summary>
        /// 学生登录
        /// </summary>
        /// <param name="account">学号</param>
        /// <param name="password">密码</param>
        /// <returns>bool类型</returns>
        public static bool Login(string studentid, string password)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid),
                                new MySqlParameter("@sPassword",password)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "StudentLogin", p));
            return i > 0;
        }
        /// <summary>
        /// 得到公告
        /// </summary>
        /// <returns></returns>
        public static Notice GetNewNotice()
        {
            MySqlParameter[] p ={};
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetNewNotice", p);
            Notice notice = new Notice();
            if (mdr.Read())
            {
                notice.Content = Convert.ToString(mdr["Content"]);
                notice.PublishDate = Convert.ToDateTime(mdr["PublishDate"]);         
            }
            mdr.Close();
            return notice;
        }
        /// <summary>
        /// 判断学生是否存在
        /// </summary>
        /// <param name="account">学号</param>
        /// <returns>bool类型</returns>
        public static bool StudentIsExist(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "StudentIsExist", p));
            return i > 0;
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <param name="newpassword">新密码</param>
        /// <param name="Email">邮箱</param>
        /// <returns>bool类型</returns>
        public static bool ChangeStudentPassword(string studentid,string newpassword,string email)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid),
                                new MySqlParameter("@NewPassword",newpassword),
                                new MySqlParameter("@Email",email)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ChangeStudentPassword", p));
            return i > 0;
        }
        /// <summary>
        /// 学生对象
        /// </summary>
        /// <param name="account">学号</param>
        /// <returns>User对象</returns>
        public static Student GetStudentMessage(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetStudentMessage", p);
            Student u = new Student();
            if(mdr.Read())
            {
                u.StudentID = Convert.ToString(mdr["StudentID"]);
                u.StudentName = Convert.ToString(mdr["StudentName"]);
                u.Sex = Convert.ToString(mdr["Sex"]);
                u.Nation = Convert.ToString(mdr["Nation"]);
                u.DateOfBirth = Convert.ToString(mdr["DateOfBirth"]);
                u.NativePlace = Convert.ToString(mdr["NativePlace"]);
                u.PoliticalStatus = Convert.ToString(mdr["PoliticalStatus"]);
                u.IDcard = Convert.ToString(mdr["IDcard"]);
                u.DatesofAttendance = Convert.ToDateTime(mdr["DatesofAttendance"]).ToString("yyyy-MM-dd");
                u.DatesofGraduation = Convert.ToDateTime(mdr["DatesofGraduation"]).ToString("yyyy-MM-dd");
                u.Department = Convert.ToString(mdr["Department"]);
                u.Major = Convert.ToString(mdr["Major"]);
                u.Grade = Convert.ToString(mdr["Grade"]);
                u.ClassNum = Convert.ToString(mdr["ClassNum"]);
                u.IsSchool = Convert.ToString(mdr["IsSchool"]);
            }
            mdr.Close();
            return u;
        }
        /// <summary>
        /// 学生账号信息
        /// </summary>
        /// <param name="account">学号</param>
        /// <returns>User对象</returns>
        public static Account GetAccountMessage(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAccountMessage", p);
            Account account = new Account();
            if (mdr.Read())
            {
                account.StudentID = Convert.ToString(mdr["StudentID"]);
                account.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                account.Email = Convert.ToString(mdr["Email"]);
                account.Location = Convert.ToString(mdr["Location"]);
                account.LastLogin = Convert.ToDateTime(mdr["LastLogin"]).ToString("yyyy-MM-dd HH:mm:ss");
                account.WorkPosition = Convert.ToString(mdr["WorkPosition"]);
                account.CreditDegree = Convert.ToString(mdr["CreditDegree"]);
            }
            mdr.Close();
            return account;
        }
        /// <summary>
        /// 申请
        /// </summary>
        /// <param name="message">信息对象</param>
        /// <returns>bool类型</returns>
        public static bool AddApply(Apply message)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",message.StudentID),
                                new MySqlParameter("@StudentName",message.StudentName),
                                new MySqlParameter("@Phonenum",message.PhoneNum),
                                new MySqlParameter("@Classnum",message.ClassNum),
                                new MySqlParameter("@Familynum",message.FamilyNum),
                                new MySqlParameter("@PersonerPhoto",message.PersonerPhoto),
                                new MySqlParameter("@FamilyAddress",message.FamilyAddress),
                                new MySqlParameter("@Sex",message.Sex),
                                new MySqlParameter("@Nation",message.Nation),
                                new MySqlParameter("@ApplyLocation",message.ApplyLocation),
                                new MySqlParameter("@Deploy",message.Deploy),
                                new MySqlParameter("@TuitionPayable",message.TuitionPayable),
                                new MySqlParameter("@TuitionPaid",message.TuitionPaid),
                                new MySqlParameter("@TuitionShortage",message.TuitionShortage),
                                new MySqlParameter("@ApplicationReason",message.ApplicationReason),
                                new MySqlParameter("@ApplyTime",message.ApplyTime),
                                new MySqlParameter("@ApplyStatus","待审核"),
                                new MySqlParameter("@UserVisible",1)
                            };
            int i = MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ApplicationMessage", p);
            return i > 0;
        }
        /// <summary>
        /// 通过学号得到申请信息列表
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>信息列表</returns>
        public static List<Apply> GetApplyMessageByStudentID(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid)
                                };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetApplyMessageByStudentID", p);
            List<Apply> list = new List<Apply>();
            while (mdr.Read())
            {
                Apply n = new Apply();
                n.ID = Convert.ToInt32(mdr["ID"]);
                n.ApplyTime = Convert.ToDateTime(mdr["ApplyTime"]);
                n.ClassNum = Convert.ToString(mdr["ClassNum"]);
                n.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                n.Sex = Convert.ToString(mdr["Sex"]);
                n.ApplyLocation = Convert.ToString(mdr["ApplyLocation"]);
                n.ApplyStatus = Convert.ToString(mdr["ApplyStatus"]);
                n.StudentID = Convert.ToString(mdr["StudentID"]);
                n.StudentName = Convert.ToString(mdr["StudentName"]);
                list.Add(n);
            }
            mdr.Close();
            return list;
        }
        /// <summary>
        /// 得到岗位详情列表
        /// </summary>
        /// <returns>列表</returns>
        public static List<PostDetail> GetPostDetail()
        {
            MySqlParameter[] p ={};
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetPostDetail", p);
            List<PostDetail> list=new List<PostDetail>();
            while (mdr.Read())
            {
                PostDetail pd=new PostDetail();
                pd.ID = Convert.ToInt32(mdr["ID"]);
                pd.NeedNumber = Convert.ToInt32(mdr["NeedNumber"]);
                pd.PostContent = Convert.ToString(mdr["PostContent"]);
                pd.PostLocation = Convert.ToString(mdr["PostLocation"]);
                pd.PostName = Convert.ToString(mdr["PostName"]);
                pd.Requirement = Convert.ToString(mdr["Requirement"]);
                pd.Wages = Convert.ToInt32(mdr["Wages"]);
                pd.WorkTime = Convert.ToString(mdr["WorkTime"]);
                pd.Toenable = Convert.ToBoolean(mdr["Toenable"]);
                list.Add(pd);
            }
            
            return list;
        }
        /// <summary>
        /// 根据id删除记录
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns>bool类型</returns>
        public static bool EditApplymessageStatus(int id)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@ID",id)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditApplymessageStatus", p));
            return i>0;
        }
        
        /// <summary>
        /// 根据申请状态筛选
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns>bool类型</returns>
        public static List<Apply> GetApplyMessageByApplystatus(string studentid, string applystatus)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@studentID",studentid),
                                new MySqlParameter("@ApplyStatus",applystatus)
                                };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetApplyMessageByApplystatus", p);
            List<Apply> list = new List<Apply>();
            while (mdr.Read())
            {
                Apply n = new Apply();
                n.ID = Convert.ToInt32(mdr["ID"]);
                n.ApplyTime = Convert.ToDateTime(mdr["ApplyTime"]);
                n.ClassNum = Convert.ToString(mdr["ClassNum"]);
                n.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                n.Sex = Convert.ToString(mdr["Sex"]);
                n.ApplyLocation = Convert.ToString(mdr["ApplyLocation"]);
                n.ApplyStatus = Convert.ToString(mdr["ApplyStatus"]);
                n.StudentID = Convert.ToString(mdr["StudentID"]);
                n.StudentName = Convert.ToString(mdr["StudentName"]);
                list.Add(n);
            }
            mdr.Close();
            return list;
        }
        /// <summary>
        /// 改变学生最后一次登录时间
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>bool类型</returns>
        public static bool ChangeUserLastLoginTime(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid),
                                new MySqlParameter("@UserLastTime",DateTime.Now)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ChangeUserLastLoginTime", p));
            return i>0;
        }
        /// <summary>
        /// 发送反馈
        /// </summary>
        /// <param name="studentid">账号</param>
        /// <param name="depict">内容</param>
        /// <returns></returns>
        public static bool InsertFeedback(string studentid, string depict)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@StudentID",studentid),
                                new MySqlParameter("@Depict",depict),
                                new MySqlParameter("@FeedDate",DateTime.Now)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "InsertFeedback", p));
            return i > 0;
        }
       
        /// <summary>
        /// 判断是否已经申请过了
        /// </summary>
        /// <param name="studentid">账号</param>
        /// <param name="atarttime">开始时间</param>
        /// <param name="arrivetime">结束时间</param>
        /// <returns></returns>
        public static bool GetApplyMessageByTime(string studentid, string starttime, string arrivetime)
        {
            MySqlParameter[] p ={                              
                                new MySqlParameter("@starttime",starttime),
                                new MySqlParameter("@arrivetime",arrivetime),
                                new MySqlParameter("@StudentID",studentid)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetApplyMessageByTime", p));
            return i > 0;
        }
        /// <summary>
        /// 学生修改信息
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <param name="phonenum">电话号码</param>
        /// <param name="email">电子邮箱</param>
        /// <param name="location">地址</param>
        /// <returns></returns>
        public static bool ChangeAccountMessage(string studentid, string phonenum, string email, string location)
        {
            MySqlParameter[] p ={
                                  new MySqlParameter("@StudentID",studentid),
                                  new MySqlParameter("@Phonenum",phonenum),
                                  new MySqlParameter("@Email",email),
                                  new MySqlParameter("@Location",location)
                              };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ChangeAccountMessage", p));
            return i > 0;
        }
        /// <summary>
        /// 发布岗位
        /// </summary>
        /// <param name="outschoolpost">校外岗位对象</param>
        /// <returns>bool类型</returns>
        public static bool PublishPost(OutSchoolPost outschoolpost)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@publisher",outschoolpost.Publisher),
                                new MySqlParameter("@workname",outschoolpost.WorkName),
                                new MySqlParameter("@worktime",outschoolpost.WorkTime),
                                new MySqlParameter("@workaddress",outschoolpost.WorkAddress),
                                new MySqlParameter("@neednumber",outschoolpost.NeedNumber),
                                new MySqlParameter("@wagestandard",outschoolpost.WageStandard),
                                new MySqlParameter("@workcontent",outschoolpost.WorkContent),
                                new MySqlParameter("@requirement",outschoolpost.Requirement),
                                new MySqlParameter("@contactway",outschoolpost.ContactWay),
                                new MySqlParameter("@publishtime",outschoolpost.PublishTime),
                                new MySqlParameter("@postimg",outschoolpost.PostImg),
                                new MySqlParameter("@reason",outschoolpost.Reason)       
                            };
            int i = MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "PublishPost", p);
            return i > 0;
        }
        /// <summary>
        /// 得到消息
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>信息对象列表</returns>
        public static List<Message> GetMessages(string studentid)
        {
            MySqlParameter []p ={
                                    new MySqlParameter("StudentID",studentid)
                             };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetMessages", p);
            List<Message> mlist = new List<Message>();
            while (mdr.Read())
            {
                Message m = new Message();
                m.AlreadyRead = Convert.ToInt32( mdr["AlreadyRead"]);
                m.Content = mdr["Content"].ToString();
                m.Receiver = mdr["Receiver"].ToString();
                m.Sender = mdr["Sender"].ToString();
                m.SendingDate = Convert.ToDateTime(mdr["SendingDate"]).ToString("yyyy-MM-dd HH:mm:ss");
                mlist.Add(m);
            }
            mdr.Close();
            return mlist;
        }
        /// <summary>
        /// 得到新的消息条数
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static int GetMessagesCount(string studentid)
        {
            MySqlParameter[] p ={                                                             
                                new MySqlParameter("@StudentID",studentid)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetMessagesCount", p));
            return i ;
        }
        /// <summary>
        /// 已读
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static int EditAlreadyRead(string studentid)
        {
            MySqlParameter[] p ={                                                             
                                new MySqlParameter("@StudentID",studentid),
                                new MySqlParameter("@AlreadRead",true)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "EditAlreadyRead", p));
            return i;
        }
    }
}
