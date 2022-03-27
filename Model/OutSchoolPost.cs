using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class OutSchoolPost
    {
        /// <summary>
        /// 岗位id
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// 发布人
        /// </summary>
        public string Publisher { get; set; }
        /// <summary>
        /// 工作名称
        /// </summary>
        public string WorkName { get; set; }
        /// <summary>
        /// 工作时间
        /// </summary>
        public string WorkTime { get; set; }
        /// <summary>
        /// 工作地点
        /// </summary>
        public string WorkAddress { get; set; }
        /// <summary>
        /// 工资标准
        /// </summary>
        public string WageStandard { get; set; }
        /// <summary>
        /// 工作内容
        /// </summary>
        public string WorkContent { get; set; }
        /// <summary>
        /// 联系方式
        /// </summary>
        public string ContactWay { get; set; }
        /// <summary>
        /// 工作要求
        /// </summary>
        public string Requirement { get; set; }
        /// <summary>
        /// 发布状态
        /// </summary>
        public string PublishStatus { get; set; }
        /// <summary>
        /// 发布时间
        /// </summary>
        public string PublishTime { get; set; }
        /// <summary>
        /// 理由
        /// </summary>
        public string Reason { get; set; }
        /// <summary>
        /// 需要人数
        /// </summary>
        public string NeedNumber { get; set; }
        /// <summary>
        /// 岗位图片
        /// </summary>
        public string PostImg { get; set; }
        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Toenable { get; set; }
    }
}
