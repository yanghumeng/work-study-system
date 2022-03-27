using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Manager
    {
        /// <summary>
        /// 管理员姓名
        /// </summary>
        public string ManagerName { get; set; }
        /// <summary>
        /// 管理员ID
        /// </summary>
        public string ManagerID { get; set; }
        /// <summary>
        /// 管理员账号
        /// </summary>
        public string Account { get; set; }
        /// <summary>
        /// 管理员密码
        /// </summary>
        public string Password { get; set; }
        /// <summary>
        /// 电子邮件
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNum { get; set; }
        /// <summary>
        /// 最后登录时间
        /// </summary>
        public string LastLoginTime { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 管理员类型
        /// </summary>
        public string Type { get; set; }

    }
}
