<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forget_password.aspx.cs" Inherits="User_Forget_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />

    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>勤工助学</title>
    <link rel="stylesheet" href="../css/base.css" />
    <link href="../css/dialog.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/home.css" />
    <script src="../js/jquery-3.2.1.min.js"></script>
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <style>
        body {
            min-height: 100vh;
            /* background-image: linear-gradient(120deg,#34db91,#4482ad); */
            background: url(../img/bg.png) no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" class="forget_password">
        <div>
            <div class="reg_div">
                <p>找回密码</p>
                <ul class="reg_ul">
                    <li>
                        <span>学号：</span>
                        <asp:TextBox ID="forget_txt_student_id" type="number" required="required" runat="server" placeholder="请输入学号" CssClass="reg_user"></asp:TextBox>
                        <span class="tip user_hint"></span>
                    </li>
                    <li>
                        <span>密码：</span>
                        <asp:TextBox ID="forget_txt_password" runat="server" placeholder="6-16位密码" CssClass="reg_password" TextMode="Password" required="required"></asp:TextBox>
                        <span class="tip password_hint"></span>
                    </li>
                    <li>
                        <span>确认密码：</span>
                        <asp:TextBox ID="re_forget_txt_password" runat="server" placeholder="确认密码" CssClass="reg_confirm" TextMode="Password" required="required"></asp:TextBox>
                        <span class="tip confirm_hint"></span>
                    </li>
                    <li>
                        <span>邮箱：</span>
                        <asp:TextBox ID="forget_txt_email" type="email" required="required" name="email" runat="server" placeholder="请输入邮箱" CssClass="reg_email"></asp:TextBox>
                        <span class="tip email_hint"></span>
                    </li>
                    <li>
                        <span>验证码：</span>
                        <asp:TextBox ID="forget_txt_yzm" runat="server" required="required" placeholder="验证码" CssClass="reg_yzm" Style="width: 100px;"></asp:TextBox>
                        <div>

                            <input type="button" class="yzm_btn" id="forget_yzm" value="获取验证码" style="cursor: pointer" onclick="yzm()" />
                        </div>
                    </li>
                    <li>
                        <asp:Button ID="btn_repassword" runat="server" Text="重置密码" CssClass="repassword" name="button" style="border: none; float: none; padding: 0; border-radius: 2em;" OnClick="btn_repassword_Click" UseSubmitBehavior="false" />
                    </li>
                    <li>
                        <a href="Login.aspx" style="color: #b00de8; font-size: 14px;">立即登录</a>

                    </li>
                </ul>
            </div>
        </div>
    </form>
    <script src="../js/script.js" type="text/javascript"></script>
    <script src="../js/jquery.dialog.js"></script>

</body>
</html>
