<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="Personal.aspx.cs" Inherits="User_Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/Personal_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/dialog.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">账号信息</h1>
            <div class="border"></div>
            <div class="services-container">
                <div id="personal-publish">
                    <input class="personal-publish-link" type="button" onclick="javascrtpt: window.location.href = '../User/PublishPostDetail.aspx?page=personal'" value="我要发布" />
                    <input class="personal-publish-link" type="button" onclick="javascrtpt: window.location.href = '../User/PersonalPublish.aspx'" value="我的发布" />
                </div>
                <div class="txt-left-side">

                    <div class="form-left-to-w3l">
                        <span>学号：</span>
                        <asp:TextBox ID="txt_Studentid" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>电话号码：</span>
                        <asp:TextBox ID="txt_Phonenum" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>电子邮箱：</span>
                        <asp:TextBox ID="txt_Email" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>地址：</span>
                        <asp:TextBox ID="txt_Location" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>信用度：</span>
                        <asp:TextBox ID="txt_CreditDegree" runat="server" Text="" ReadOnly="true" Style="color: #10c375; font-size: 18px; font-weight: bold;"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>勤工岗位：</span>
                        <asp:TextBox ID="txt_Workposition" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>上一次登录：</span>
                        <asp:TextBox ID="txt_Lastlogin" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <input type="button" id="changemessage" value="修改信息" />
                        <input type="button" id="changepassword" value="修改密码" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/modernizr.custom.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/jquery.dialog.js"></script>

    <script>
        // 确认框：自定义内容格式，阻止onConfrim的执行
        $('#changemessage').click(function () {
            var phonenum = $.trim($("#txt_Phonenum").val());
            var location = $.trim($("#txt_Location").val());
            var email = $.trim($("#txt_Email").val());
            $.sendConfirm({
                title: '修改信息',
                content: '<div id="addIpBox">' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 电话号码:</div>' +
                    '<input type="text" class="frm-input" id="c_phonrnum" name="ip" placeholder="请填写真实的电话号码"  required="required" value="' + phonenum + '">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 电子邮箱:</div>' +
                    '<input type="text" class="frm-input" id="c_email" name="ip" placeholder="请填写真实的电子邮箱" required="required" value="' + email + '">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 地址:</div>' +
                    '<input type="text" class="frm-input" id="c_location" name="ip" placeholder="请填写地址" required="required" value="' + location + '">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '</div>' +
                    '</div>',
                button: {
                    confirm: '确认',
                    cancel: '取消'
                },

                onConfirm: function () {

                },
                onCancel: function () {
                    console.log('点击取消！');
                },
                onClose: function () {
                    console.log('点击关闭！');
                }
            });

        });
        $('#changepassword').click(function () {
            var email = $.trim($("#txt_Email").val());
            $.sendConfirm({
                title: '修改密码',
                content: '<div id="addIpBox">' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 电子邮箱:</div>' +
                    '<input type="text" class="frm-input" id="c_p_email" name="ip" placeholder="请填写真实的电子邮箱" required="required" value="' + email + '">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 新密码:</div>' +
                    '<input type="password" class="frm-input" id="c_newpassword" name="ip" placeholder="请输入密码" required="required">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 验证码:</div>' +
                    '<input type="text" class="frm-input" id="c_yzm" name="ip" placeholder="请输入验证码" required="required">' +
                     '<input type="button" class="frm-input" id="c_newpassword_yzm" onclick="c_yzm()" value="获取验证码" style="cursor: pointer">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '</div>' +
                    '</div>',
                button: {
                    confirm: '确认',
                    cancel: '取消'
                },

                onConfirm: function () {

                },
                onCancel: function () {
                    console.log('点击取消！');
                },
                onClose: function () {
                    console.log('点击关闭！');
                }
            });

        });


    </script>

</asp:Content>

