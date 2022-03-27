<%@ Page Language="C#" AutoEventWireup="true" CodeFile="outschoolpost-examine.aspx.cs" Inherits="Manager_outschoolpost_examine" %>

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
        #img img{
            height:300px;
            width:400px;
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
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>申请人
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_publisher" runat="server" name="username" ReadOnly="true" autocomplete="off" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>工作名称
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_workname" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>工作内容
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_workcontent" TextMode="MultiLine" runat="server" name="desc" CssClass="layui-textarea" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>工作时间
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_worktime" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>工作地点
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_workaddress" runat="server" name="desc" CssClass="layui-textarea" ReadOnly="true"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>需求人数
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_neednumber" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>计费标准
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_wagestandard" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label for="desc" class="layui-form-label">
                    工作要求
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_requirement" runat="server" TextMode="MultiLine" ReadOnly="true" name="desc" CssClass="layui-textarea"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>联系方式
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_contactway" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>图片附件
                </label>
                <div class="layui-input-inline" id="img" runat="server">
                    
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>发布日期
                </label>
                <div class="layui-input-inline">
                    <asp:TextBox ID="txt_publishdate" runat="server" name="username" ReadOnly="true" CssClass="layui-input"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>理由
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_reason" runat="server" TextMode="MultiLine" MaxLength="50" lay-verify="required" required="required" name="desc" CssClass="layui-textarea"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button class="layui-btn" lay-filter="pass" lay-submit="">
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
            form.on('submit(pass)', function (data) {

                //使用ajax提交
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "outschoolpost-examine.aspx/EditPublishStatus",
                    data: "{status:'1'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("已通过了", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("审核失败", { icon: 2 }, function () {
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
                    url: "outschoolpost-examine.aspx/EditPublishStatus",
                    data: "{status:'0'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("已驳回了", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("审核失败", { icon: 2 }, function () {
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
