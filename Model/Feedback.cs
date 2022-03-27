using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Feedback
    {
        /// <summary>
        /// id号
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 学号
        /// </summary>
        public string StudentID { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Depict { get; set; }
        /// <summary>
        /// 日期
        /// </summary>
        public DateTime Feeddate { get; set; }
        /// <summary>
        /// 是否回复
        /// </summary>
        public bool Isreply { get; set; }
    }
}
