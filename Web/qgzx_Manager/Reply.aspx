<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reply.aspx.cs" Inherits="Manager_Reply" %>

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
                    <span class="x-red">*</span>反馈人
                </label>
                <div class="layui-input-inline">
                    <asp:Label ID="txt_Feedback_person" runat="server" Text="" CssClass="layui-form-label" Style="text-align: left; border-bottom: 1px solid #009688;"></asp:Label>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>反馈内容
                </label>
                <div class="layui-input-inline">
                    <asp:Label ID="txt_Feedback_content" runat="server" Text="" CssClass="layui-form-label" Style="text-align: left; border-bottom: 1px solid #009688;"></asp:Label>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>回复内容
                </label>
                <div class="layui-input-block">
                    <asp:TextBox ID="txt_content" TextMode="MultiLine" runat="server" lay-verify="required"  required="required" placeholder="请输入内容" name="desc" CssClass="layui-textarea"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button class="layui-btn" lay-filter="add" lay-submit="">
                    发送
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
                console.log(data);
                var content = $.trim($("#txt_content").val());
                //使用ajax提交
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "reply.aspx/Reply",
                    data: "{content:'" + content + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("回复成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("回复失败", { icon: 2 }, function () {
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
