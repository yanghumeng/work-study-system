using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.BLL
{
    public class ApplymessageBusiness
    {
        /// <summary>
        /// 检测申请通道是否打开
        /// </summary>
        /// <returns>bool类型</returns>
        public static bool GetOpenApplyStatus()
        {
            return DAL.ApplymessageDataAccess.GetOpenApplyStatus();
        }
        /// <summary>
        /// 根据页码得到申请信息
        /// </summary>
        /// <param name="pageindex">页码</param>
        /// <param name="pagesize">每页获取的数量</param>
        /// <returns></returns>
        public static List<Apply> GetAllApplyMessage(string ApplyStatus, string ApplyStatus2, string ApplyStatus3)
        {
            return DAL.ApplymessageDataAccess.GetAllApplyMessage(ApplyStatus, ApplyStatus2, ApplyStatus3);
        }
        /// <summary>
        /// 得到申请数量
        /// </summary>
        /// <returns></returns>
        public static int GetAllApplyMessageCount()
        {
            return DAL.ApplymessageDataAccess.GetAllApplyMessageCount();
        }
        /// <summary>
        /// 根据ID查询申请信息
        /// </summary>
        /// <param name="id">申请id</param>
        /// <returns></returns>
        public static Apply GetApplymessageByID(int id)
        {
            return DAL.ApplymessageDataAccess.GetApplymessageByID(id);
        }
    }
}
