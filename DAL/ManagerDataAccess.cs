using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace qgzx.DAL
{
    public class ManagerDataAccess
    {
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns>bool类型</returns>
        public static bool Login(string account, string password)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@Account",account),
                                new MySqlParameter("@mPassword",password)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "ManagerLogin", p));
            return i > 0;
        }
        /// <summary>
        /// 判断管理员是否存在
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>bool类型</returns>
        public static bool ManagerIsExist(string account)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@account",account)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "ManagerIsExist", p));
            return i > 0;
        }
        /// <summary>
        /// 改变管理员最后一次登录时间
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>bool类型</returns>
        public static bool ChangeManagerLastLoginTime(string account)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@Account",account),
                                new MySqlParameter("@ManagerLastTime",DateTime.Now)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ChangeManagerLastLoginTime", p));
            return i > 0;
        }
        /// <summary>
        /// 管理员修改密码
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="newpassword">新密码</param>
        /// <returns>bool类型</returns>
        public static bool ChangeManagerPassword(string account, string newpassword)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@Account",account),
                                new MySqlParameter("@newPassword",newpassword)
                                };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "ChangeManagerPassword", p));
            return i > 0;
        }
        /// <summary>
        /// 得到管理员对象
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>Manager对象</returns>
        public static Manager GetManager(string account)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@Account",account)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetManager", p);
            Manager m = new Manager();
            if (mdr.Read())
            {
                m.ManagerName = Convert.ToString(mdr["ManagerName"]);
                m.Account = Convert.ToString(mdr["Account"]);
                m.Password = Convert.ToString(mdr["Password"]);
                m.ManagerID = mdr["ManagerID"].ToString();
                m.LastLoginTime = Convert.ToString(mdr["LoginTime"]);
                m.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                m.Email = Convert.ToString(mdr["Email"]);
                m.Type = Convert.ToString(mdr["Type"]);
                m.Remark = Convert.ToString(mdr["Remark"]);
            }
            mdr.Close();
            return m;
        }
        /// <summary>
        /// 根据ID得到管理员对象
        /// </summary>
        /// <param name="ID">ID号</param>
        /// <returns></returns>
        public static Manager GetManagerByID(int ID)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@ID",ID)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetManagerByID", p);
            Manager m = new Manager();
            if (mdr.Read())
            {
                m.ManagerName = Convert.ToString(mdr["ManagerName"]);
                m.Account = Convert.ToString(mdr["Account"]);
                m.Password = Convert.ToString(mdr["Password"]);
                m.ManagerID = mdr["ManagerID"].ToString();
                m.LastLoginTime = Convert.ToString(mdr["LoginTime"]);
                m.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                m.Email = Convert.ToString(mdr["Email"]);
                m.Type = Convert.ToString(mdr["Type"]);
                m.Remark = Convert.ToString(mdr["Remark"]);
            }
            mdr.Close();
            return m;
        }
        /// <summary>
        /// 通过ID修改管理员信息
        /// </summary>
        /// <param name="manager">管理员对象</param>
        /// <param name="ID">ID号</param>
        /// <returns></returns>
        public static bool EditManagerByID(Manager manager ,int ID)
        {
            MySqlParameter[] p ={
                                
                                new MySqlParameter("@managername",manager.ManagerName),
                                new MySqlParameter("@account",manager.Account),
                                new MySqlParameter("@email",manager.Email),
                                new MySqlParameter("@phone",manager.PhoneNum),
                                new MySqlParameter("@remark",manager.Remark),
                                new MySqlParameter("@type",manager.Type),
                                new MySqlParameter("@ID",ID)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditManagerByID", p));
            return i > 0;
        }
        /// <summary>
        /// 改变申请通道状态
        /// </summary>
        /// <param name="b">值</param>
        /// <returns>bool类型</returns>
        public static bool EditPassstatus(int b)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@b",b)
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditPassstatus", p));
            return i > 0;
        }
        /// <summary>
        /// 添加岗位
        /// </summary>
        /// <param name="postdetail">岗位对象</param>
        /// <returns></returns>
        public static bool AddPostdetail(PostDetail postdetail)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@PostName",postdetail.PostName),
                                new MySqlParameter("@PostLocation",postdetail.PostLocation),
                                new MySqlParameter("@PostContent",postdetail.PostContent),
                                new MySqlParameter("@NeedNumber",postdetail.NeedNumber),
                                new MySqlParameter("@WorkTime",postdetail.WorkTime),
                                new MySqlParameter("@Requirement",postdetail.Requirement),
                                new MySqlParameter("@Wages",postdetail.Wages),
                                new MySqlParameter("@Toenable",postdetail.Toenable),
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "AddPostDetail", p));
            return i > 0;
        }
        /// <summary>
        /// 根据ID删除岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool DelPostDetail(int ID)
        {
            MySqlParameter[] p = { 
                                 new MySqlParameter("@ID",ID)
                                 };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "DelPostDetail", p));
            return i > 0;
        }
        /// <summary>
        /// 根据ID删除校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool DelOutSchoolPost(int ID)
        {
            MySqlParameter[] p = { 
                                 new MySqlParameter("@ID",ID)
                                 };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "DelOutSchoolPost", p));
            return i > 0;
        }
        /// <summary>
        /// 审核校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool EditPublishStatus(int ID, string reason, string status,int toenable)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@ID",ID),
                                   new MySqlParameter("@Reason",reason),
                                   new MySqlParameter("@PublishStatus",status),
                                   new MySqlParameter("@Toenable",toenable)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditPublishStatus", p));
            return i > 0;
        }
        /// <summary>
        /// 修改岗位
        /// </summary>
        /// <param name="postdetail">岗位对象</param>
        /// <returns></returns>
        public static bool EditPostdetail(PostDetail postdetail, int id)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@PostID",id),
                                new MySqlParameter("@PostName",postdetail.PostName),
                                new MySqlParameter("@PostLocation",postdetail.PostLocation),
                                new MySqlParameter("@PostContent",postdetail.PostContent),
                                new MySqlParameter("@NeedNumber",postdetail.NeedNumber),
                                new MySqlParameter("@WorkTime",postdetail.WorkTime),
                                new MySqlParameter("@Requirement",postdetail.Requirement),
                                new MySqlParameter("@Wages",postdetail.Wages),
                                new MySqlParameter("@Toenable",postdetail.Toenable),
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditPostDetail", p));
            return i > 0;
        }
        /// <summary>
        /// 修改是否启用校内岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <param name="Toenable">参数</param>
        /// <returns></returns>
        public static bool EditPostDetailStatus(int ID,int Toenable)
        {
            MySqlParameter[] p = { 
                                 new MySqlParameter("@PostID",ID),
                                 new MySqlParameter("@Toenable",Toenable)
                                 };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditPostDetailStatus", p));
            return i > 0;
        }
        /// <summary>
        /// 修改是否启用校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <param name="Toenable">参数</param>
        /// <returns></returns>
        public static bool EditOutSchoolPostStatus(int ID, int Toenable)
        {
            MySqlParameter[] p = { 
                                 new MySqlParameter("@PostID",ID),
                                 new MySqlParameter("@Toenable",Toenable)
                                 };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditOutSchoolPostStatus", p));
            return i > 0;
        }
        /// <summary>
        /// 审核申请
        /// </summary>
        /// <param name="id">申请编号</param>
        /// <param name="status">值</param>
        /// <returns></returns>
        public static bool EditApplyStatus(int id,string status)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@ID",id),
                                   new MySqlParameter("@ApplyStatus",status)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditApplyStatus", p));
            return i > 0;
        }
        /// <summary>
        /// 删除申请
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns></returns>
        public static bool DelApplymessage(int id)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@ID",id)
                                   
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "DelApplymessage", p));
            return i > 0;
        }

        /// <summary>
        /// 把岗位添加到账号信息里面
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <param name="postname">岗位</param>
        /// <returns></returns>
        public static bool AddStudentPost(string studentid,string postname)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@studentid",studentid),
                                   new MySqlParameter("@postname",postname)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "AddStudentPost", p));
            return i > 0;
        }
        /// <summary>
        /// 发送消息
        /// </summary>
        /// <param name="sender">发送人</param>
        /// <param name="receiver">接收人</param>
        /// <param name="content">内容</param>
        /// <returns></returns>
        public static bool SendMessage(string sender, string receiver,string content)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@Sender",sender),
                                   new MySqlParameter("@Receiver",receiver),
                                   new MySqlParameter("@Content",content),
                                   new MySqlParameter("@SendingDate",DateTime.Now),
                                   new MySqlParameter("@AlreadyRead",false)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "SendMessage", p));
            return i > 0;
        }
        /// <summary>
        /// 根据状态得到反馈列表
        /// </summary>
        /// <param name="IsReply">状态值1</param>
        /// <param name="IsReply2">状态值2</param>
        /// <returns></returns>
        public static List<Feedback> GetFeedBack(string IsReply, string IsReply2)
        {
            List<Feedback> feedbacklist = new List<Feedback>();
            MySqlParameter[] p = {
                                     new MySqlParameter("@IsReply",IsReply),
                                 new MySqlParameter("@IsReply2",IsReply2)
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetFeedBack", p);
            while (mdr.Read())
            {
                Feedback feedback = new Feedback();
                feedback.ID = Convert.ToInt32(mdr["ID"]);
                feedback.Isreply = Convert.ToBoolean(mdr["IsReply"]);
                feedback.StudentID = Convert.ToString(mdr["StudentID"]);
                feedback.Feeddate = Convert.ToDateTime(mdr["FeedDate"]);
                feedback.Depict = Convert.ToString(mdr["Depict"]);
                feedbacklist.Add(feedback);
            }
            mdr.Close();
            return feedbacklist;
        }
        /// <summary>
        /// 得到反馈数量
        /// </summary>
        /// <returns></returns>
        public static int GetFeedBackCount()
        {
            MySqlParameter[] p = { };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetFeedBackCount", p));
            return i;
        }
        /// <summary>
        /// 是否回复
        /// </summary>
        /// <param name="ID">id号</param>
        /// <returns></returns>
        public static bool EditFeedbackIsreply(int ID)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@ID",ID)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "EditFeedbackIsreply", p));
            return i > 0;
        }
        /// <summary>
        /// 得到全部管理员
        /// </summary>
        /// <param name="pageindex">页码</param>
        /// <param name="pagesize">数量</param>
        /// <returns></returns>
        public static List<Manager> GetAllManager()
        {
            List<Manager> managerlist = new List<Manager>();
            MySqlParameter[] p = {
                                    
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAllManager", p);
            while (mdr.Read())
            {
                Manager manager = new Manager();
                manager.ManagerID = Convert.ToString(mdr["ManagerID"]);
                manager.ManagerName = Convert.ToString(mdr["ManagerName"]);
                manager.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                manager.Account = Convert.ToString(mdr["Account"]);
                manager.Email = Convert.ToString(mdr["Email"]);
                manager.Remark = Convert.ToString(mdr["Remark"]);
                manager.Type = Convert.ToString(mdr["Type"]);
                managerlist.Add(manager);
            }
            mdr.Close();
            return managerlist;
        }
        /// <summary>
        /// 管理员数量
        /// </summary>
        /// <returns></returns>
        public static int GetAllManagerCount()
        {
            MySqlParameter[] p = { };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetAllManagerCount", p));
            return i;
        }
        /// <summary>
        /// 添加管理员
        /// </summary>
        /// <param name="manager">管理员对象</param>
        /// <returns></returns>
        public static bool Addmanager(Manager manager)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@managername",manager.ManagerName),
                                new MySqlParameter("@account",manager.Account),
                                new MySqlParameter("@password",manager.Password),
                                new MySqlParameter("@email",manager.Email),
                                new MySqlParameter("@phone",manager.PhoneNum),
                                new MySqlParameter("@logintime",manager.LastLoginTime),
                                new MySqlParameter("@remark",manager.Remark),
                                new MySqlParameter("@type",manager.Type),
                            };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "Addmanager", p));
            return i > 0;
        }
        /// <summary>
        /// 删除管理员
        /// </summary>
        /// <param name="ID">管理员编号</param>
        /// <returns></returns>
        public static bool Delmanager(string ID)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@managerid",ID)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "Delmanager", p));
            return i > 0;
        }
        /// <summary>
        /// 发布公告
        /// </summary>
        /// <param name="publisher">发布人</param>
        /// <param name="content">内容</param>
        /// <param name="publishdate">日期</param>
        /// <returns></returns>
        public static bool IssueNewNotice(string publisher, string content, string publishdate)
        {
            MySqlParameter[] p ={
                                   new MySqlParameter("@publisher",publisher),
                                   new MySqlParameter("@content",content),
                                   new MySqlParameter("@publishdate",publishdate)
                               };
            int i = Convert.ToInt32(MySQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "IssueNewNotice", p));
            return i > 0;
        }
    }
}
