<%@ Page Language="C#" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="Manager_welcome" %>

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
</head>
<body>
    <div class="x-body">
        <form class="layui-form" runat="server">
            <div class="x-body">
                <blockquote class="layui-elem-quote">
                    欢迎管理员：
           
                <span class="x-red">
                    <asp:Label ID="managername" runat="server" Text=""></asp:Label>
                </span>
                </blockquote>
                <fieldset class="layui-elem-field">
                    <legend>数据统计</legend>
                    <div class="layui-field-box">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                                        <div carousel-item="">
                                            <ul class="layui-row layui-col-space10 layui-this">
                                                <li class="layui-col-xs2">
                                                    <a href="javascript:;" class="x-admin-backlog-body">
                                                        <h3>岗位数</h3>
                                                        <p>
                                                            <cite>
                                                                <asp:Label ID="postnum" runat="server" Text=""></asp:Label>
                                                            </cite>
                                                        </p>
                                                    </a>
                                                </li>
                                                <li class="layui-col-xs2">
                                                    <a href="javascript:;" class="x-admin-backlog-body">
                                                        <h3>反馈数</h3>
                                                        <p>
                                                            <cite>
                                                                <asp:Label ID="newfeedback" runat="server" Text=""></asp:Label>
                                                            </cite>
                                                        </p>
                                                    </a>
                                                </li>
                                                <li class="layui-col-xs2">
                                                    <a href="javascript:;" class="x-admin-backlog-body">
                                                        <h3>申请数</h3>
                                                        <p>
                                                            <cite>
                                                                <asp:Label ID="newapply" runat="server" Text=""></asp:Label>
                                                            </cite>
                                                        </p>
                                                    </a>
                                                </li>
                                                <li class="layui-col-xs2">
                                                    <a href="javascript:;" class="x-admin-backlog-body">
                                                        <h3>岗位申请</h3>
                                                        <p>
                                                            <cite>
                                                                <asp:Label ID="newpostapply" runat="server" Text=""></asp:Label>
                                                            </cite>
                                                        </p>
                                                    </a>
                                                </li>
                                                <li class="layui-col-xs2">
                                                    <a href="javascript:;" class="x-admin-backlog-body">
                                                        <h3>岗位申请通道状态</h3>
                                                        <p>
                                                            <cite>
                                                                <asp:Label ID="ApplyStatus" runat="server" Text=""></asp:Label>
                                                            </cite>
                                                        </p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field">
                    <legend>岗位申请通道管理</legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item">
                            <label for="L_repass" class="layui-form-label">
                            </label>
                            <button class="layui-btn" lay-filter="open" lay-submit="" id="open">
                                开启
                            </button>
                            <button class="layui-btn" lay-filter="close" lay-submit="" id="close" style="background-color: #f23c12">
                                关闭
                            </button>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field">
                    <legend>管理员信息</legend>
                    <div class="layui-field-box">
                        <table class="layui-table">
                            <tbody>
                                <tr>
                                    <th>管理员ID</th>
                                    <td>
                                        <asp:Label ID="ManagerID" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>姓名</th>
                                    <td>
                                        <asp:Label ID="mManagerName" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>邮箱</th>
                                    <td>
                                        <asp:Label ID="Email" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>电话</th>
                                    <td>
                                        <asp:Label ID="PhoneNum" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>上一次登录时间</th>
                                    <td>
                                        <asp:Label ID="LastLoginTime" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>备注</th>
                                    <td>
                                        <asp:Label ID="Remark" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>管理员类型</th>
                                    <td>
                                        <asp:Label ID="Type" runat="server" Text=""></asp:Label></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </div>
        </form>
    </div>
    <script>
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
            , layer = layui.layer;
            //监听提交
            form.on('submit(open)', function (data) {
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "welcome.aspx/EditPassstatus",
                    data: "{b:'1'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "1") {

                            layer.msg('开启成功!', { icon: 1, time: 2000 })
                            $("#ApplyStatus").html('开启');
                            // 可以对父窗口进行刷新 
                            //x_admin_father_reload();
                        }
                        else {
                            layer.msg('关闭失败!', { icon: 2, time: 2000 })

                        }
                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                });
                return false;
            });
            //监听提交
            form.on('submit(close)', function (data) {
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "welcome.aspx/EditPassstatus",
                    data: "{b:'0'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        if (data.d == "1") {

                            layer.msg('关闭成功!', { icon: 1, time: 2000 })
                            $("#ApplyStatus").html('关闭');
                            // 可以对父窗口进行刷新 
                            //x_admin_father_reload();
                        }
                        else {
                            layer.msg('关闭失败!', { icon: 2, time: 2000 })
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
