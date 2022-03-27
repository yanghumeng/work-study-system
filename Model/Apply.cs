using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace qgzx.Model
{
    public class Apply
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
        /// 学生姓名
        /// </summary>
        public string StudentName { get; set; }
        /// <summary>
        /// 电话号码
        /// </summary>
        public string PhoneNum { get; set; }
        /// <summary>
        /// 班级
        /// </summary>
        public string ClassNum { get; set; }
        /// <summary>
        /// 家庭人口
        /// </summary>
        public int FamilyNum { get; set; }
        /// <summary>
        /// 个人照片
        /// </summary>
        public string PersonerPhoto { get; set; }
        /// <summary>
        /// 家庭地址
        /// </summary>
        public string FamilyAddress { get; set; }
        /// <summary>
        /// 性别
        /// </summary>
        public string Sex { get; set; }
        /// <summary>
        /// 民族
        /// </summary>
        public string Nation { get; set; }
        /// <summary>
        /// 申请职位
        /// </summary>
        public string ApplyLocation { get; set; }
        /// <summary>
        /// 服从调配
        /// </summary>
        public string Deploy { get; set; }
        /// <summary>
        /// 应交学费
        /// </summary>
        public int TuitionPayable { get; set; }
        /// <summary>
        /// 已交学费
        /// </summary>
        public int TuitionPaid { get; set; }
        /// <summary>
        /// 欠学费
        /// </summary>
        public int TuitionShortage { get; set; }
        /// <summary>
        /// 申请理由
        /// </summary>
        public string ApplicationReason { get; set; }
        /// <summary>
        /// 申请时间
        /// </summary>
        public DateTime ApplyTime { get; set; }
        /// <summary>
        /// 审核状态
        /// </summary>
        public string ApplyStatus { get; set; }
    }
}
