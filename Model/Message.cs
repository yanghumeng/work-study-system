using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Message
    {
        /// <summary>
        /// 发送人
        /// </summary>
        public string Receiver { get; set; }
        /// <summary>
        /// 接收人
        /// </summary>
        public string Sender { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 发送日期
        /// </summary>
        public string SendingDate { get; set; }
        /// <summary>
        /// 已读
        /// </summary>
        public int AlreadyRead { get; set; }

    }
}
