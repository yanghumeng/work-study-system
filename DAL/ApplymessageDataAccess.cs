using MySql.Data.MySqlClient;
using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace qgzx.DAL
{
    public class ApplymessageDataAccess
    {
        /// <summary>
        /// 检测申请通道是否打开
        /// </summary>
        /// <returns>bool类型</returns>
        public static bool GetOpenApplyStatus()
        {
            MySqlParameter[] p = { };
            bool b = Convert.ToBoolean(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetOpenApply", p));
            return b;
        }
        
        /// <summary>
        /// 根据状态得到申请信息
        /// </summary>
        /// <param name="ApplyStatus">状态1</param>
        /// <param name="ApplyStatus2">状态2</param>
        /// <param name="ApplyStatus3">状态3</param>
        /// <returns></returns>
        public static List<Apply> GetAllApplyMessage(string ApplyStatus, string ApplyStatus2, string ApplyStatus3)
        {
            MySqlParameter[] p = { 
                                    new MySqlParameter("@ApplyStatus",ApplyStatus),
                                 new MySqlParameter("@ApplyStatus2",ApplyStatus2),
                                 new MySqlParameter("@ApplyStatus3",ApplyStatus3)
                                 };
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetAllApplyMessage", p);
            List<Apply> list = new List<Apply>();
            while (mdr.Read())
            {
                Apply n = new Apply();
                n.ID = Convert.ToInt32(mdr["ID"]);
                n.ApplyTime = Convert.ToDateTime(mdr["ApplyTime"]);
                n.ClassNum = Convert.ToString(mdr["ClassNum"]);
                n.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                n.ApplyStatus = Convert.ToString(mdr["ApplyStatus"]);
                n.StudentID = Convert.ToString(mdr["StudentID"]);
                n.StudentName = Convert.ToString(mdr["StudentName"]);
                list.Add(n);
            }
            mdr.Close();
            return list;
        }
        /// <summary>
        /// 得到申请数量
        /// </summary>
        /// <returns></returns>
        public static int GetAllApplyMessageCount()
        {
            MySqlParameter[] p = { };
            int i = Convert.ToInt32(MySQLHelper.ExecuteScalar(CommandType.StoredProcedure, "GetAllApplyMessageCount", p));
            return i;
        }
        /// <summary>
        /// 根据ID查询申请信息
        /// </summary>
        /// <param name="id">申请id</param>
        /// <returns></returns>
        public static Apply GetApplymessageByID(int id)
        {
            MySqlParameter[] p ={
                                new MySqlParameter("@ID",id)
                                };
            Apply apply = new Apply();
            MySqlDataReader mdr = MySQLHelper.ExecuteReader(CommandType.StoredProcedure, "GetApplymessageByID", p);
            if (mdr.Read())
            {
                apply.ID = Convert.ToInt32(mdr["ID"]);
                apply.ApplicationReason = Convert.ToString(mdr["ApplicationReason"]);
                apply.ApplyLocation = Convert.ToString(mdr["ApplyLocation"]);
                apply.ApplyTime = Convert.ToDateTime(mdr["ApplyTime"]);
                apply.ClassNum = Convert.ToString(mdr["ClassNum"]);
                apply.Deploy = Convert.ToString(mdr["Deploy"]);
                apply.FamilyAddress = Convert.ToString(mdr["FamilyAddress"]);
                apply.FamilyNum = Convert.ToInt32(mdr["FamilyNum"]);
                apply.Nation = Convert.ToString(mdr["Nation"]);
                apply.PersonerPhoto = Convert.ToString(mdr["PersonerPhoto"]);
                apply.PhoneNum = Convert.ToString(mdr["PhoneNum"]);
                apply.Sex = Convert.ToString(mdr["Sex"]);
                apply.ApplyStatus = Convert.ToString(mdr["ApplyStatus"]);
                apply.StudentID = Convert.ToString(mdr["StudentID"]);
                apply.StudentName = Convert.ToString(mdr["StudentName"]);
                apply.TuitionPaid = Convert.ToInt32(mdr["TuitionPaid"]);
                apply.TuitionPayable = Convert.ToInt32(mdr["TuitionPayable"]);
                apply.TuitionShortage = Convert.ToInt32(mdr["TuitionShortage"]);
            }
            mdr.Close();
            return apply;
        }
    }
}
