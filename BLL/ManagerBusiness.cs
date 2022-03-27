using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.BLL
{
    public class ManagerBusiness
    {
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="account">管理员账号</param>
        /// <param name="password">管理员密码</param>
        /// <returns></returns>
        public static bool Login(string account, string password)
        {
            return DAL.ManagerDataAccess.Login(account, password);
        }
        /// <summary>
        /// 改变最后一次登录时间
        /// </summary>
        /// <param name="account">管理员账号</param>
        /// <returns></returns>
        public static bool ChangeManagerLastLoginTime(string account)
        {
            return DAL.ManagerDataAccess.ChangeManagerLastLoginTime(account);
        }
        /// <summary>
        /// 判断管理员是否存在
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>bool类型</returns>
        public static bool ManagerIsExist(string account)
        {
            return DAL.ManagerDataAccess.ManagerIsExist(account);
        }
        /// <summary>
        /// 管理员修改密码
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="newpassword">新密码</param>
        /// <returns></returns>
        public static bool ChangeManagerPassword(string account,string newpassword)
        {
            return DAL.ManagerDataAccess.ChangeManagerPassword(account,newpassword);
        }
        /// <summary>
        /// 得到管理员对象
        /// </summary>
        /// <param name="account">账号</param>
        /// <returns>管理员对象</returns>
        public static Manager GetManager(string account)
        {
            return DAL.ManagerDataAccess.GetManager(account);
        }
        /// <summary>
        /// 根据ID得到管理员对象
        /// </summary>
        /// <param name="ID">ID号</param>
        /// <returns></returns>
        public static Manager GetManagerByID(int ID)
        {
            return DAL.ManagerDataAccess.GetManagerByID(ID);
        }
        /// <summary>
        /// 通过ID修改管理员信息
        /// </summary>
        /// <param name="manager">管理员对象</param>
        /// <param name="ID">ID号</param>
        /// <returns></returns>
        public static bool EditManagerByID(Manager manager, int ID)
        {
            return DAL.ManagerDataAccess.EditManagerByID(manager,ID);
        }
        /// <summary>
        /// 改变申请通道状态
        /// </summary>
        /// <param name="b">值</param>
        /// <returns></returns>
        public static bool EditPassstatus(int b)
        {
            return DAL.ManagerDataAccess.EditPassstatus(b);
        }
        /// <summary>
        /// 添加岗位
        /// </summary>
        /// <param name="postdetail">岗位对象</param>
        /// <returns></returns>
        public static bool AddPostdetail(PostDetail postdetail)
        {
            return DAL.ManagerDataAccess.AddPostdetail(postdetail);
        }
        /// <summary>
        /// 根据ID删除岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool DelPostDetail(int ID)
        {
            return DAL.ManagerDataAccess.DelPostDetail(ID);
        }
        /// <summary>
        /// 根据ID删除校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool DelOutSchoolPost(int ID)
        {
            return DAL.ManagerDataAccess.DelOutSchoolPost(ID);
        }
        /// <summary>
        /// 审核校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>bool类型</returns>
        public static bool EditPublishStatus(int ID, string reason, string status, int toenable)
        {
            return DAL.ManagerDataAccess.EditPublishStatus(ID, reason, status,toenable);
        }
        /// <summary>
        /// 根据ID修改岗位
        /// </summary>
        /// <param name="postdetail">岗位对象</param>
        /// <param name="id">岗位ID</param>
        /// <returns></returns>
        public static bool EditPostdetail(PostDetail postdetail,int id)
        {
            return DAL.ManagerDataAccess.EditPostdetail(postdetail,id);
        }
        /// <summary>
        /// 修改是否启用岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <param name="Toenable">参数</param>
        /// <returns>bool类型</returns>
        public static bool EditPostDetailStatus(int ID, int Toenable)
        {
            return DAL.ManagerDataAccess.EditPostDetailStatus(ID,Toenable);
        }
        /// <summary>
        /// 修改是否启用校外岗位
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <param name="Toenable">参数</param>
        /// <returns></returns>
        public static bool EditOutSchoolPostStatus(int ID, int Toenable)
        {
            return DAL.ManagerDataAccess.EditOutSchoolPostStatus(ID, Toenable);
        }
        /// <summary>
        /// 审核申请
        /// </summary>
        /// <param name="id">申请编号</param>
        /// <param name="status">值</param>
        /// <returns></returns>
        public static bool EditApplyStatus(int id, string status)
        {
            return DAL.ManagerDataAccess.EditApplyStatus(id, status);
        }
        /// <summary>
        /// 删除申请
        /// </summary>
        /// <param name="id">id号</param>
        /// <returns></returns>
        public static bool DelApplymessage(int id)
        {
            return DAL.ManagerDataAccess.DelApplymessage(id);
        }
        /// <summary>
        /// 把岗位添加到账号信息里面
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <param name="postname">岗位</param>
        /// <returns></returns>
        public static bool AddStudentPost(string studentid,string postname)
        {
            return DAL.ManagerDataAccess.AddStudentPost(studentid, postname);
        }
         /// <summary>
        /// 发送消息
        /// </summary>
        /// <param name="sender">发送人</param>
        /// <param name="receiver">接收人</param>
        /// <param name="content">内容</param>
        /// <returns></returns>
        public static bool SendMessage(string sender, string receiver, string content)
        {
            return DAL.ManagerDataAccess.SendMessage(sender, receiver, content);
        }
        /// <summary>
        /// 根据页码得到反馈列表
        /// </summary>
        /// <param name="pageindex">页码</param>
        /// <param name="pagesize">每页显示数量</param>
        /// <returns></returns>
        public static List<Feedback> GetFeedBack(string IsReply, string IsReply2)
        {
            return DAL.ManagerDataAccess.GetFeedBack(IsReply, IsReply2);
        }
        /// <summary>
        /// 得到反馈数量
        /// </summary>
        /// <returns></returns>
        public static int GetFeedBackCount()
        {
            return DAL.ManagerDataAccess.GetFeedBackCount();
        }
        /// <summary>
        /// 是否回复
        /// </summary>
        /// <param name="ID">id号</param>
        /// <returns></returns>
        public static bool EditFeedbackIsreply(int ID)
        {          
            return DAL.ManagerDataAccess.EditFeedbackIsreply(ID);
        }
        /// <summary>
        /// 得到全部管理员
        /// </summary>
        /// <returns></returns>
        public static List<Manager> GetAllManager()
        {
            return DAL.ManagerDataAccess.GetAllManager();
        }
        /// <summary>
        /// 管理员数量
        /// </summary>
        /// <returns></returns>
        public static int GetAllManagerCount()
        {
            return DAL.ManagerDataAccess.GetAllManagerCount();
        }
        /// <summary>
        /// 添加管理员
        /// </summary>
        /// <param name="manager">管理员对象</param>
        /// <returns></returns>
        public static bool Addmanager(Manager manager)
        {
            return DAL.ManagerDataAccess.Addmanager(manager);
        }
        /// <summary>
        /// 删除管理员
        /// </summary>
        /// <param name="ID">管理员编号</param>
        /// <returns></returns>
        public static bool Delmanager(string ID)
        {
            return DAL.ManagerDataAccess.Delmanager(ID);
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
            return DAL.ManagerDataAccess.IssueNewNotice(publisher,  content,  publishdate);
        }
    }
}
