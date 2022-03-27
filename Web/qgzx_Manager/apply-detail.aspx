<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apply-detail.aspx.cs" Inherits="Manager_apply_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>勤工助学后台</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <style type="text/css">
        .layui-form-item {
            clear: none;
            float: left;
        }
    </style>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="x-body">
        <form class="layui-form" runat="server">
            <div class="layui-form-item" style="clear: both; float: none">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>学生照片
                </label>
                <div class="layui-input-inline">
                    <asp:Image ID="photo" ImageUrl="~/UploadFile/d474f7eb-8118-4ce4-9f37-3d73c1b9e1e4.jpg" runat="server" Width="130px" Height="150px"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>学号
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_studentid" runat="server" required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>姓名
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_name" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>学生班级
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_class" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>家庭人口
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_familynum" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_sex" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>手机号码
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_phonrnum" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>申请岗位
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_apply_location" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>服从调配
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_deploy" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>民族
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_nation" runat="server" required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>应交学费
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_tuitionPayable" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>已交学费
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_tuitionPaid" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>欠学费
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_tuitionShortage" runat="server"  required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>家庭住址
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_familyaddress" runat="server" required="" lay-verify="required" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item layui-form-text" style="clear: both; float: none">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>申请理由
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_applicationReason" runat="server" TextMode="MultiLine" placeholder="请输入内容" name="desc" CssClass="layui-textarea"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item layui-form-text" style="clear: both; float: none">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>申请日期
                </label>
                <div class="layui-input-block">
                    <asp:Label ID="txt_applydate" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="layui-form-item" style="clear: both; float: none">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button class="layui-btn" lay-filter="add" lay-submit="">
                    通过
                </button>
                <button class="layui-btn" lay-filter="rebut" lay-submit="" style="background-color: #ea421b;">
                    驳回
                </button>
            </div>
        </form>
    </div>
    <script>
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
            , layer = layui.layer;



            //监听提交
            form.on('submit(add)', function (data) {
                
                //使用ajax提交
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "apply-detail.aspx/EditApplyStatus",
                    data: "{status:'1'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("已录用", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给
                            layer.alert("操作失败", { icon: 2 }, function () {
                                //关闭当前frame
                                x_admin_close();
                            });
                        }

                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                });
                return false;
            });
            form.on('submit(rebut)', function (data) {
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "apply-detail.aspx/EditApplyStatus",
                    data: "{status:'0'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("已驳回", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("操作失败", { icon: 2 }, function () {
                                //关闭当前frame
                                x_admin_close();
                            });
                        }

                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                });
                return false;
            });
        });
    </script>
</body>
</html>
