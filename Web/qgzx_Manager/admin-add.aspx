<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin-add.aspx.cs" Inherits="Manager_admin_add" %>

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
                    <span class="x-red">*</span>登录名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="username" required="" lay-verify="required" autocomplete="off" class="layui-input" />
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input" />
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>邮箱
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_email" name="email" required="" lay-verify="email"
                        autocomplete="off" class="layui-input" />
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>角色</label>
                <div class="layui-input-inline">
                    <select name="contrller" id="sel_role">
                        <option>普通管理员</option>
                        <option>超级管理员</option>
                        <option>编辑人员</option>
                    </select>
                </div>
                
            </div>
            <div class="layui-form-item layui-form-text">
                <label for="desc" class="layui-form-label">
                    备注
                </label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="remark" name="desc" class="layui-textarea" lay-verify="required" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                        autocomplete="off" class="layui-input" />
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                        autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button class="layui-btn" lay-filter="add" lay-submit="">
                    增加
                </button>
            </div>
        </form>
    </div>
    <script>
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
            , layer = layui.layer;

            //自定义验证规则
            form.verify({
                nikename: function (value) {
                    if (value.length < 5) {
                        return '昵称至少得5个字符啊';
                    }
                }
              , pass: [/(.+){6,12}$/, '密码必须6到12位']
              , repass: function (value) {
                  if ($('#L_pass').val() != $('#L_repass').val()) {
                      return '两次密码不一致';
                  }
              }
            });

            //监听提交
            form.on('submit(add)', function (data) {
                console.log(data);
                var username = $.trim($("#username").val());
                var phone = $.trim($("#phone").val());
                var L_email = $.trim($("#L_email").val());
                var sel_role = $.trim($("#sel_role").val());
                var remark = $.trim($("#remark").val());
                var L_pass = $.trim($("#L_pass").val());
                $.ajax({
                    type: "post",
                    url: "admin-add.aspx/Addmanager",
                    data: "{username:'" + username + "',phonenum:'" + phone + "',email:'" + L_email + "',role:'" + sel_role + "',remark:'" + remark + "',pass:'" + L_pass + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("增加成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("增加失败,账号已存在", { icon: 2 }, function () {
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
