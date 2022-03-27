<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <title>登录</title>
    <link href="../css/style.css" rel="stylesheet"/>
    <link href="../css/dialog.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/jquery.dialog.js"></script>
    
</head>
<body style="">
    <form id="form1" runat="server" class="login-form">

        <div id="login_input">
            <h1>登录</h1>
            <div style="position: absolute;color: #34db91;margin-top:5px;"><i class="fa fa-user fa-2x" aria-hidden="true"></i></div>
            <div class="txtb">
                <asp:TextBox ID="txt_student_id" runat="server" autocomplete="off" required="required"></asp:TextBox>
                <span data-placeholder="用户名"></span>
            </div>
            <div style="position: absolute;color: #34db91;margin-top:5px;"><i class="fa fa-lock fa-2x" aria-hidden="true"></i></div>
            <div class="txtb">
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"  autocomplete="off" required="required"></asp:TextBox>
                <span data-placeholder="密码"></span>
            </div>
        </div>
        <asp:Button ID="btn_Login" runat="server" Text="登录" CssClass="logbtn" OnClick="btn_Login_Click" />
        <div class="bottom-text">
            忘记密码？<a href="Forget_password.aspx">立即找回</a>
        </div>

    </form>
</body>
<script type="text/javascript">
    $(".txtb input").on("focus", function () {
        $(this).addClass("focus");
    });
    $(".txtb input").on("blur", function () {
        if ($(this).val() == "")
            $(this).removeClass("focus");
    });

    
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

</html>
