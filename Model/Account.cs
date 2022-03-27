using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Account
    {
        /// <summary>
        /// 学号
        /// </summary>
        public string StudentID { get; set; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNum { get; set; }
        /// <summary>
        /// 电子邮箱
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Location { get; set; }
        /// <summary>
        /// 用户上一次登录时间
        /// </summary>
        public string LastLogin { get; set; }
        /// <summary>
        /// 工作岗位
        /// </summary>
        public string WorkPosition { get; set; }
        /// <summary>
        /// 用户信用度
        /// </summary>
        public string CreditDegree { get; set; }
    }
}
