using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.BLL
{
    public class PostDetailBusiness
    {
        /// <summary>
        /// 得到岗位集合
        /// </summary>
        /// <returns>list集合</returns>
        public static List<string> GetPostDetailName()
        {
            return DAL.PostDetailDataAccess.GetPostDetailName();
        }
        /// <summary>
        /// 得到岗位
        /// </summary>
        /// <returns></returns>
        public static List<PostDetail> GetAllPostDetail(string Toenable, string Toenable2)
        {
            return DAL.PostDetailDataAccess.GetAllPostDetail(Toenable, Toenable2);
        }
        /// <summary>
        /// 得到岗位数量
        /// </summary>
        /// <returns></returns>
        public static int GetPostDetailCount()
        {
            return DAL.PostDetailDataAccess.GetPostDetailCount();
        }
        /// <summary>
        /// 通过岗位ID得到岗位信息
        /// </summary>
        /// <param name="ID">岗位ID</param>
        /// <returns>岗位对象</returns>
        public static PostDetail GetPostDetailByID(int ID)
        {
            return DAL.PostDetailDataAccess.GetPostDetailByID(ID);
        }
        /// <summary>
        /// 得到校外岗位集合
        /// </summary>
        /// <returns>list集合</returns>
        public static List<OutSchoolPost> GetOutSchoolPost()
        {
            return DAL.PostDetailDataAccess.GetOutSchoolPost();
        }
        /// <summary>
        /// 得到校外岗位数量
        /// </summary>
        /// <returns></returns>
        public static int GetOutSchoolPostCount()
        {
            return DAL.PostDetailDataAccess.GetOutSchoolPostCount();
        }
        /// <summary>
        /// 得到全部的校外岗位
        /// </summary>
        /// <returns></returns>
        public static List<OutSchoolPost> GetAllPublishPost(string PublishStatus, string PublishStatus2, string PublishStatus3)
        {
            return DAL.PostDetailDataAccess.GetAllPublishPost(PublishStatus, PublishStatus2, PublishStatus3);
        }
        /// <summary>
        /// 根据启用得到校外岗位信息列表
        /// </summary>
        /// <param name="Toenable">参数1</param>
        /// <param name="Toenable2">参数2</param>
        /// <returns></returns>
        public static List<OutSchoolPost> GetAllOutSchoolPost(string Toenable, string Toenable2)
        {
            return DAL.PostDetailDataAccess.GetAllOutSchoolPost(Toenable, Toenable2);

        }
        /// <summary>
        /// 通过岗位ID得到校外岗位信息
        /// </summary>
        /// <param name="postid">岗位ID</param>
        /// <returns>岗位对象</returns>
        public static OutSchoolPost GetOutSchoolPostByID(int postid)
        {
            return DAL.PostDetailDataAccess.GetOutSchoolPostByID(postid);
        }
        /// <summary>
        /// 根据学号找到该用户发布的岗位
        /// </summary>
        /// <param name="studentid">学号</param>
        /// <returns>list对象</returns>
        public static List<OutSchoolPost> GetOutSchoolPostByStudentID(string studentid)
        {
            return DAL.PostDetailDataAccess.GetOutSchoolPostByStudentID(studentid);
        }
    }
}
