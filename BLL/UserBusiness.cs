using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace qgzx.BLL
{
    public class UserBusiness
    {
        /// <summary>
        /// 学生登录
        /// </summary>
        /// <param name="account">学号</param>
        /// <param name="password">密码</param>
        /// <returns>bool类型</returns>
        public static bool Login(string studentid, string password)
        {
            return DAL.UserDataAccess.Login(studentid, password);
        }
        /// <summary>
        /// 得到公告
        /// </summary>
        /// <returns></returns>
        public static Notice GetNewNotice()
        {
            return DAL.UserDataAccess.GetNewNotice();
        }
        /// <summary>
        /// 判断学生是否在校
        /// </summary>
        /// <param name="account">学号</param>
        /// <returns>bool类型</returns>
        public static bool StudentIsExist(string studentid)
        {
            return DAL.UserDataAccess.StudentIsExist(studentid);
        }
        /// <summary>
        /// 学生修改密码
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <param name="newpassword">新密码</param>
        /// <param name="email">邮箱</param>
        /// <returns>string类型</returns>
        public static bool ChangeStudentPassword(string studentid,string newpassword,string email)
        {
                
                    if(DAL.UserDataAccess.ChangeStudentPassword(studentid, newpassword, email))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
               
        }
        /// <summary>
        /// 学生在校信息
        /// </summary>
        /// <param name="account">学号</param>
        /// <returns></returns>
        public static Student GetStudentMessage(string studentid)
        {
            return DAL.UserDataAccess.GetStudentMessage(studentid);
        }
        /// <summary>
        /// 学生账号信息
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static Account GetAccountMessage(string studentid)
        {
            return DAL.UserDataAccess.GetAccountMessage(studentid);
        }
        /// <summary>
        /// 申请工作
        /// </summary>
        /// <param name="message">信息对象</param>
        /// <returns>bool类型</returns>
        public static bool ApplyMessage(Apply message)
        {
            return DAL.UserDataAccess.AddApply(message);
        }
        /// <summary>
        /// 根据学号获取申请信息列表
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>MySqlDataReader列表</returns>
        public static List<Apply> GetApplyMessageByStudentID(string studentid)
        {
            return DAL.UserDataAccess.GetApplyMessageByStudentID(studentid);
        }
        /// <summary>
        /// 得到全部岗位详情
        /// </summary>
        /// <returns>详情列表</returns>
        public static List<PostDetail> GetPostDetail()
        {
            return DAL.UserDataAccess.GetPostDetail();
        }
        /// <summary>
        /// 根据id删除申请记录
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns>bool类型</returns>
        public static bool EditApplymessageStatus(int id)
        {
            return DAL.UserDataAccess.EditApplymessageStatus(id);
        }
        /// <summary>
        /// 根据申请状态筛选
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns>bool类型</returns>
        public static List<Apply> GetApplyMessageByApplystatus(string studentid, string applystatus)
        {
            return DAL.UserDataAccess.GetApplyMessageByApplystatus(studentid,applystatus);
        }
        /// <summary>
        /// 改变学生登录时间
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static bool ChangeUserLastLoginTime(string studentid)
        {
            return DAL.UserDataAccess.ChangeUserLastLoginTime(studentid);
        }
        /// <summary>
        /// 发送反馈
        /// </summary>
        /// <param name="studentid">账号</param>
        /// <param name="depict">内容</param>
        /// <returns></returns>
        public static bool InsertFeedback(string studentid, string depict)
        {
            return DAL.UserDataAccess.InsertFeedback(studentid, depict);
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
            return DAL.UserDataAccess.GetApplyMessageByTime(studentid, starttime, arrivetime);
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
            return DAL.UserDataAccess.ChangeAccountMessage(studentid, phonenum, email, location);
        }
        /// <summary>
        /// 发布岗位
        /// </summary>
        /// <param name="outschoolpost">校外岗位对象</param>
        /// <returns>bool类型</returns>
        public static bool PublishPost(OutSchoolPost outschoolpost)
        {
            return DAL.UserDataAccess.PublishPost(outschoolpost);
        }
        /// <summary>
        /// 得到消息
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>信息对象列表</returns>
        public static List<Message> GetMessages(string studentid)
        {
            return DAL.UserDataAccess.GetMessages(studentid);
        }
         /// <summary>
        /// 得到消息条数
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static int GetMessagesCount(string studentid)
        {
            return DAL.UserDataAccess.GetMessagesCount(studentid);
        }
        /// <summary>
        /// 已读
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns></returns>
        public static int EditAlreadyRead(string studentid)
        {
            return DAL.UserDataAccess.EditAlreadyRead(studentid);
        }
    }
}
