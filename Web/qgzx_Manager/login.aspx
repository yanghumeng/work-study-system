<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Manager_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/cookie.js"></script>
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">勤工助学管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" runat="server" >
            <asp:TextBox ID="ma_txt_account" runat="server" name="username" placeholder="账号" autocomplete="off" type="text" required="required" lay-verify="required" class="layui-input" ></asp:TextBox>
            <hr class="hr15"/>
            <asp:TextBox ID="ma_txt_password" runat="server" name="password" lay-verify="required"  autocomplete="off" placeholder="密码"  type="password" class="layui-input"></asp:TextBox>
            <hr class="hr15"/>
            <asp:Button ID="login_btn" runat="server" Text="登录" lay-submit="" lay-filter="login" style="width:100%;" type="submit" OnClick="login_btn_Click" />
            <hr class="hr20" />
        </form>
    </div>
    <script>
        //禁止页面退出后利用浏览器返回

        $(function () {
            if (window.history && window.history.pushState) {
                $(window).on('popstate', function () {
                    window.history.pushState('forward', null, '#');
                    window.history.forward(1);
                });
            }
            window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
            window.history.forward(1);
        });
</script>
</body>
</html>
