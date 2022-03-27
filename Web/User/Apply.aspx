<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="User_Apply" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link rel="stylesheet" href="../css/home.css" />
    <link rel="stylesheet" href="../css/loading.css" />
    <link href="../css/Apply_style.css" rel="stylesheet" />
    <link href="../css/html5tooltips.animation.css" rel="stylesheet" />
    <link href="../css/html5tooltips.css" rel="stylesheet" />
    <style type="text/css">
        .back_history {
            position: fixed;
            background: #52849b;
            padding: 5px;
            margin: 10px;
            color: #fff;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
    </style>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/up.js"></script>
    <script type="text/javascript" src="../js/html5tooltips.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <section class="aui-content" style="background: #eee; color: #666; font: 12px/150% Arial,Verdana,microsoft yahei; height: auto;">
        <div style="height: 20px;"></div>
        <div class="aui-content-up">
            <div class="aui-content-up-form">
                <h1 style="text-align: center">勤工俭学申请表</h1>
            </div>
            <!--第一行-->
            <div class="table_all">
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        学生姓名 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="stu_name" runat="server" CssClass="aui-form-control-two " placeholder="请输入真实名字" required="required" MaxLength="10" ToolTip=""></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        手机号码 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="phone_num" runat="server" CssClass="aui-form-control-two " placeholder="请输入手机号码" required="required" MaxLength="20" ToolTip=""></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear" style="z-index: 100;">
                    <label class="aui-label-control">
                        个人照片 <em>*</em>
                        <span>小于2M</span>
                    </label>
                    <div class="aui-form-input" style="height: 155px; width: 150px;">
                        <div class="aui-content-img-box aui-content-full" style="height: 100%; width: 100%;">
                            <div class="aui-photo aui-up-img clear">
                                <section class="aui-file-up fl">
                                    <div style="float: left; height: 100%; width: 100%;">
                                        <!--设置默认图片-->
                                        <img style="width: 100%; height: 100%; cursor: pointer;" id="myimg" src="../img/up.png" onclick="Id('file').click();" />
                                    </div>
                                    <span id="uploadSpan">
                                        <asp:FileUpload ID="file" name="file" runat="server" accept="image/png,image/jpg,image/jpeg" onchange="changeToop(this);" style="display: none;" />
                                    </span>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--第二行-->
            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        学生班级 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="stu_class" CssClass="aui-form-control-two " runat="server" placeholder="如：2017级软件技术一班" required="required" MaxLength="40" ToolTip="最多输入40个字"></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        家庭人口 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="family_num" CssClass="aui-form-control-two tip" runat="server" placeholder="家庭人口" required="required" ToolTip="只能输入数字" oninput="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <div class="empty"></div>
                </div>
            </div>
            <!--第三行-->
            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear family_address">
                    <label class="aui-label-control">
                        家庭住址 <em>*</em>
                    </label>
                    <div class="aui-form-input family_address_input">
                        <asp:TextBox ID="family_address" runat="server" CssClass="aui-form-control-two " placeholder="请输入家庭地址" required="required" MaxLength="80" ToolTip="最多输入80个字"></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear" style="width: 25%;">
                </div>
            </div>
            <!--第四行-->
            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        性别 <em>*</em>
                    </label>
                    <div class="aui-form-input">
                        <div class="aui-form-input" style="width: 50px">
                            <div>
                                <asp:DropDownList ID="Sex_select" runat="server" CssClass="filter-text">
                                    <asp:ListItem Text="男" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="女"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        民族 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:DropDownList ID="Select_nation" CssClass="filter-text aui-form-input" runat="server" placeholder="民族" required="required">
                            <asp:ListItem Text="请选择" Selected="True"></asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        申请岗位 <em>*</em>
                    </label>
                    <div class="aui-form-input">
                        <asp:DropDownList ID="apply_location" runat="server" CssClass="filter-text aui-form-input">
                            <asp:ListItem Text="请选择" Selected="True"></asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>
            </div>
            <!--第五行-->
            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear" style="width: 93.5%;">
                    <label class="aui-label-control">
                        服从调配<em>*</em>
                    </label>
                    <div class="aui-form-input" style="width: 80%; font-size: 14px; line-height: 36px">
                        <div class="aui-form-input" style="width: 50px">

                            <asp:DropDownList ID="deploy" runat="server" CssClass="filter-text">
                                <asp:ListItem Text="是" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="否"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <label style="width: auto;">(原因：由于学校的各项工作的工作量和个人的差异，会有所淘汰，服从调配会提高录用几率)</label>
                    </div>
                </div>
            </div>
            <!--第六行-->
            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        应交学费 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="TuitionPayable" CssClass="aui-form-control-two tip" runat="server" placeholder="应交学费" required="required" ToolTip="只能输入数字" oninput="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        已交学费 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="TuitionPaid" CssClass="aui-form-control-two tip" runat="server" placeholder="已交学费" required="required" ToolTip="只能输入数字" oninput="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                    </div>
                </div>
                <div class="aui-form-group clear">
                    <label class="aui-label-control">
                        欠学费 <em>*</em>
                    </label>
                    <div class="aui-form-input-auto">
                        <asp:TextBox ID="TuitionShortage" CssClass="aui-form-control-two tip" runat="server" placeholder="欠学费" required="required" ToolTip="只能输入数字" oninput="value=value.replace(/[^\d]/g,'')"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="table_all table_twoandthree">
                <div class="aui-form-group clear" style="width: 93.5%;">
                    <label class="aui-label-control">
                        申请理由：
                    </label>
                    <div class="aui-form-input" style="width: 100%; height: 150px;">
                        <asp:TextBox ID="ApplicationReason" runat="server" TextMode="MultiLine" style="width: 100%; height: 100%;" class="aui-form-control" name="description" Rows="7" required="required" ToolTip="最多输入400字" placeholder="请输入申请原因...(字数限制:400字)" MaxLength="400"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="aui-form-group-text">
                <h3>注意：</h3>
                <p style="overflow: hidden; color: #de2215">
                    1、如有相关证明请持乡镇以上证明（可用复印件）交给辅导员老师，交系部审批。<br />
                    2、等候审核通过后可参加招聘部门面试的通知。<br />
                    3、账号和名字必须为本人的，否则后果自负。（且一个人每学年最多交一份申请）
                </p>
            </div>
            <div class="aui-mask aui-works-mask">
                <div class="aui-mask-content">
                    <p class="aui-delete-text">确定要提交你的资料？</p>
                    <p class="aui-check-text">
                        <asp:Button ID="yes" runat="server" Text="确定" CssClass="aui-delete aui-accept-ok" OnClick="yes_Click" />
                        <input type="button" id="no" runat="server" value="取消" class="aui-delete aui-accept-no" />
                    </p>
                </div>
            </div>
            <div class="aui-mask-cancle aui-works-mask">
                <div class="aui-mask-content">
                    <p class="aui-delete-text">确定要返回？</p>
                    <p class="aui-check-text">
                        <asp:Button ID="back_yes" runat="server" CssClass="aui-delete aui-backt-ok " UseSubmitBehavior="false" Text="确定" OnClick="back_yes_Click" />
                        <input type="button" id="back_no" runat="server" value="取消" class="aui-delete aui-back-no" />
                    </p>
                </div>
            </div>
        </div>
        <div class="aui-btn-default table_all">
            <label class="aui-btn aui-btn-account" id="review">提交审核</label>
            <label class="aui-btn aui-btn-account" id="cancle">取消提交</label>
        </div>

    </section>

    <script type="text/javascript">


        var html = document.getElementById('uploadSpan').innerHTML;
        document.getElementById('uploadSpan').innerHTML = html;
        function ClassandId(classandid) {
            return document.querySelector(classandid);
        }
        ClassandId("#review").onclick = function () {
            ClassandId(".aui-mask").style.display = "block";
        }
        ClassandId(".aui-accept-no").onclick = function () {
            ClassandId(".aui-mask").style.display = "none";
        }
        ClassandId("#cancle").onclick = function () {
            ClassandId(".aui-mask-cancle").style.display = "block";
        }
        ClassandId(".aui-back-no").onclick = function () {
            ClassandId(".aui-mask-cancle").style.display = "none";
        }

    </script>
    <script type="text/javascript">

        html5tooltips([
          {
              contentText: "请输入真实名字",
              targetSelector: "#stu_name",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          },
          {
              contentText: "只能输入数字",
              targetSelector: ".tip",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          },
          {
              contentText: "最多输入40个字",
              targetSelector: "#stu_class",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          },
          {
              contentText: "最多输入80个字",
              targetSelector: "#family_address",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          },
          {
              contentText: "请输入真实的手机号",
              targetSelector: "#phone_num",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          },
          {
              contentText: "最多输入400字",
              targetSelector: "#ApplicationReason",
              stickTo: "top",
              maxWidth: 180,
              animateFunction: "slidein"
          }
        ]);
    </script>
</asp:Content>
