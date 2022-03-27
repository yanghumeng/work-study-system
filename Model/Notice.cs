using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Notice
    {
        /// <summary>
        /// id号
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 发布人
        /// </summary>
        public string Publisher { get; set; }
        /// <summary>
        /// 日期
        /// </summary>
        public DateTime PublishDate { get; set; }
    }
}
