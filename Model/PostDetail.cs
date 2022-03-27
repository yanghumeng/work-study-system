using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class PostDetail
    {
        /// <summary>
        /// 岗位id
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 岗位名称
        /// </summary>
        public string PostName { get; set; }
        /// <summary>
        /// 岗位具体位置
        /// </summary>
        public string PostLocation { get; set; }
        /// <summary>
        /// 岗位介绍
        /// </summary>
        public string PostContent { get; set; }
        /// <summary>
        /// 需要人数
        /// </summary>
        public int NeedNumber { get; set; }
        /// <summary>
        /// 工作时间
        /// </summary>
        public string WorkTime { get; set; }
        /// <summary>
        /// 工作要求
        /// </summary>
        public string Requirement { get; set; }
        /// <summary>
        /// 计费标准
        /// </summary>
        public int Wages { get; set; }
        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Toenable { get; set; }
    }
}
