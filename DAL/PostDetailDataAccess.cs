using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace qgzx.DAL
{
    public class PostDetailDataAccess
    {
        /// <summary>
        /// 得到岗位名称集合
        /// </summary>
        /// <returns>list集合</returns>
        public static List<string> GetPostDetailName()
        {
            List<string> data = new List<string>();
            MySqlParameter[] p = { };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetPostDetailName", p);
            string name = "";
            while (mdr.Read())
            {
                name = Convert.ToString(mdr["PostName"]);
                data.Add(name);
            }
            return data;
        }
        /// <summary>
        /// 根据状态得到校内岗位
        /// </summary>
        /// <param name="Toenable">状态1</param>
        /// <param name="Toenable2">状态2</param>
        /// <returns></returns>
        public static List<PostDetail> GetAllPostDetail(string Toenable, string Toenable2)
        {
            MySqlParameter[] p = {
                                 new MySqlParameter("@Toenable",Toenable),
                                 new MySqlParameter("@Toenable2",Toenable2)
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAllPostDetail", p);
            List<PostDetail> list = new List<PostDetail>();
            while (mdr.Read())
            {
                PostDetail pd = new PostDetail();
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
        /// 得到岗位数量
        /// </summary>
        /// <returns></returns>
        public static int GetPostDetailCount()
        {
            MySqlParameter[] p = { };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetPostDetailCount", p));
            return i;
        }
        /// <summary>
        /// 通过岗位ID得到岗位信息
        /// </summary>
        /// <param name="postid">岗位ID</param>
        /// <returns>岗位对象</returns>
        public static PostDetail GetPostDetailByID(int postid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@ID",postid)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetPostDetailByID", p);
            PostDetail postdetail = new PostDetail();
            if (mdr.Read())
            {
                postdetail.NeedNumber = Convert.ToInt32(mdr["NeedNumber"]);
                postdetail.PostContent = Convert.ToString(mdr["PostContent"]);
                postdetail.PostLocation = Convert.ToString(mdr["PostLocation"]);
                postdetail.PostName = Convert.ToString(mdr["PostName"]);
                postdetail.Requirement = Convert.ToString(mdr["Requirement"]);
                postdetail.Toenable = Convert.ToBoolean(mdr["Toenable"]);
                postdetail.Wages = Convert.ToInt32(mdr["Wages"]);
                postdetail.WorkTime = Convert.ToString(mdr["WorkTime"]);
                postdetail.Toenable = Convert.ToBoolean(mdr["Toenable"]);
            }
            mdr.Close();
            return postdetail;
        }
        /// <summary>
        /// 得到校外岗位集合
        /// </summary>
        /// <returns>list集合</returns>
        public static List<OutSchoolPost> GetOutSchoolPost()
        {
            List<OutSchoolPost> outschoolpostlist = new List<OutSchoolPost>();
            MySqlParameter[] p = { };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetOutSchoolPost", p);
            while (mdr.Read())
            {
                OutSchoolPost outschoolpost = new OutSchoolPost();
                outschoolpost.ID = Convert.ToInt32(mdr["ID"]);
                outschoolpost.WorkName = Convert.ToString(mdr["WorkName"]);
                outschoolpost.WorkContent = Convert.ToString(mdr["WorkContent"]);
                outschoolpost.Publisher = Convert.ToString(mdr["Publisher"]);
                outschoolpostlist.Add(outschoolpost);
            }
            mdr.Close();
            return outschoolpostlist;
        }
        /// <summary>
        /// 得到校外岗位数量
        /// </summary>
        /// <returns></returns>
        public static int GetOutSchoolPostCount()
        {
            MySqlParameter[] p = { };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetOutSchoolPostCount", p));
            return i;
        }
        /// <summary>
        /// 根据发布状态得到校外岗位
        /// </summary>
        /// <param name="PublishStatus">状态1</param>
        /// <param name="PublishStatus2">状态2</param>
        /// <param name="PublishStatus3">状态3</param>
        /// <returns></returns>
        public static List<OutSchoolPost> GetAllPublishPost(string PublishStatus, string PublishStatus2, string PublishStatus3)
        {
            List<OutSchoolPost> outschoolpostlist = new List<OutSchoolPost>();
            MySqlParameter[] p = {
                                   new MySqlParameter("@PublishStatus",PublishStatus),
                                 new MySqlParameter("@PublishStatus2",PublishStatus2),
                                 new MySqlParameter("@PublishStatus3",PublishStatus3)
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAllPublishPost", p);
            while (mdr.Read())
            {
                OutSchoolPost outschoolpost = new OutSchoolPost();
                outschoolpost.ID = Convert.ToInt32(mdr["ID"]);
                outschoolpost.WorkName = Convert.ToString(mdr["WorkName"]);
                outschoolpost.WorkContent = Convert.ToString(mdr["WorkContent"]);
                outschoolpost.Publisher = Convert.ToString(mdr["Publisher"]);
                outschoolpost.NeedNumber = Convert.ToString(mdr["Neednumber"]);
                outschoolpost.PublishTime = Convert.ToString(mdr["PublishTime"]);
                outschoolpost.PublishStatus = Convert.ToString(mdr["PublishStatus"]);
                outschoolpostlist.Add(outschoolpost);
            }
            mdr.Close();
            return outschoolpostlist;
        }
        /// <summary>
        /// 根据启用得到校外岗位信息列表
        /// </summary>
        /// <param name="Toenable">参数1</param>
        /// <param name="Toenable2">参数2</param>
        /// <returns></returns>
        public static List<OutSchoolPost> GetAllOutSchoolPost(string Toenable, string Toenable2)
        {
            MySqlParameter[] p = {
                                 new MySqlParameter("@Toenable",Toenable),
                                 new MySqlParameter("@Toenable2",Toenable2)
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAllOutSchoolPost", p);
            List<OutSchoolPost> list = new List<OutSchoolPost>();
            while (mdr.Read())
            {
                OutSchoolPost outschoolpost = new OutSchoolPost();
                outschoolpost.ID = Convert.ToInt32(mdr["ID"]);
                outschoolpost.WorkName = Convert.ToString(mdr["WorkName"]);
                outschoolpost.WorkContent = Convert.ToString(mdr["WorkContent"]);
                outschoolpost.Publisher = Convert.ToString(mdr["Publisher"]);
                outschoolpost.NeedNumber = Convert.ToString(mdr["Neednumber"]);
                outschoolpost.PublishTime = Convert.ToString(mdr["PublishTime"]);
                outschoolpost.Toenable = Convert.ToBoolean(mdr["Toenable"]);
                list.Add(outschoolpost);
            }

            return list;
        }
        /// <summary>
        /// 通过岗位ID得到校外岗位信息
        /// </summary>
        /// <param name="postid">岗位ID</param>
        /// <returns>岗位对象</returns>
        public static OutSchoolPost GetOutSchoolPostByID(int postid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@ID",postid)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetOutSchoolPostByID", p);
            OutSchoolPost outschoolpost = new OutSchoolPost();
            if (mdr.Read())
            {
                outschoolpost.ID = Convert.ToInt32(mdr["ID"]);
                outschoolpost.ContactWay = Convert.ToString(mdr["ContactWay"]);
                outschoolpost.NeedNumber = Convert.ToString(mdr["neednumber"]);
                outschoolpost.Publisher = Convert.ToString(mdr["Publisher"]);
                outschoolpost.PublishStatus = Convert.ToString(mdr["PublishStatus"]);
                outschoolpost.PublishTime = Convert.ToString(mdr["PublishTime"]);
                outschoolpost.Reason = Convert.ToString(mdr["Reason"]);
                outschoolpost.WageStandard = Convert.ToString(mdr["WageStandard"]);
                outschoolpost.WorkAddress = Convert.ToString(mdr["WorkAddress"]);
                outschoolpost.WorkContent = Convert.ToString(mdr["WorkContent"]);
                outschoolpost.WorkName = Convert.ToString(mdr["WorkName"]);
                outschoolpost.WorkTime = Convert.ToString(mdr["WorkTime"]);
                outschoolpost.Requirement = Convert.ToString(mdr["Requirement"]);
                outschoolpost.PostImg = Convert.ToString(mdr["Postimg"]);
                outschoolpost.Toenable = Convert.ToBoolean(mdr["Toenable"]);
            }
            mdr.Close();
            return outschoolpost;
        }
        /// <summary>
        /// 根据学号找到该用户发布的岗位
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>list对象</returns>
        public static List<OutSchoolPost> GetOutSchoolPostByStudentID(string studentid)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@studentid",studentid)
                            };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetOutSchoolPostByStudentID", p);
            List<OutSchoolPost> list = new List<OutSchoolPost>();
            while (mdr.Read())
            {
                OutSchoolPost outschoolpost = new OutSchoolPost();
                outschoolpost.ID = Convert.ToInt32(mdr["ID"]);
                outschoolpost.PublishStatus = Convert.ToString(mdr["PublishStatus"]);
                outschoolpost.PublishTime = Convert.ToString(mdr["PublishTime"]);
                outschoolpost.WorkAddress = Convert.ToString(mdr["WorkAddress"]);
                outschoolpost.WorkContent = Convert.ToString(mdr["WorkContent"]);
                outschoolpost.WorkName = Convert.ToString(mdr["WorkName"]);
                outschoolpost.WorkTime = Convert.ToString(mdr["WorkTime"]);
                list.Add(outschoolpost);
            }
            mdr.Close();
            return list;
        }
    }
}
