// user
$('.reg_user').blur(function(){
  if ((/^[0-9_-]{6,15}$/).test($(".reg_user").val())){
    $('.user_hint').html("✔").css("color","green");
  }else {
    $('.user_hint').html("×").css("color","red");
  }
});
// password
$('.reg_password').blur(function(){
  if ((/^[a-z0-9_-]{6,16}$/).test($(".reg_password").val())){
    $('.password_hint').html("✔").css("color","green");
  }else {
    $('.password_hint').html("×").css("color","red");
  }
});


// password_confirm
$('.reg_confirm').blur(function(){
  if (($(".reg_password").val())==($(".reg_confirm").val())){
    $('.confirm_hint').html("✔").css("color","green");
  }else {
    $('.confirm_hint').html("×").css("color","red");
  }
});


// Email
$('.reg_email').blur(function(){
  if ((/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/).test($(".reg_email").val())){
    $('.email_hint').html("✔").css("color","green");
  }else {
    $('.email_hint').html("×").css("color","red");
  }
});
//修改、发送成功
function sendSuccess() {
    $.sendSuccess('修改成功,请前往登录', 2000, function () {
        console.log('sendSuccess closed');
    });
}
//发送失败

function yzmError() {
    $.sendError('验证码错误', 2000, function () {
        console.log('sendError closed');
    });
}
function yzm() {
    if ((/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/).test($(".reg_email").val())) {
        var email = document.getElementById("forget_txt_email").value;
            //发送验证码
            $.ajax({
                type: "post",
                url: "Forget_password.aspx/QQ_email",
                data: "{'Email':'" + email + "'}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d == "1") {
                        $.sendSuccess('发送成功，请注意查收', 2000, function () {
                            console.log('sendSuccess closed');
                        });
                        
                    }
                    else {
                        $.sendError('发送失败，请重试！', 2000, function () {
                            console.log('sendError closed');
                        });
                    }
                },
                error: function (e) {
                    alert("错误是:" + e.responseText);
                }
            });
            //验证码时间
            var code = $("#forget_yzm");
            code.attr("disabled", "disabled");
            setTimeout(function () {
                code.css("opacity", "0.8");
                code.css("cursor", "no-drop")
            }, 1000)
            var time = 60;
            var set = setInterval(function () {
                code.val("(" + --time + ")秒后重新获取");
            }, 1000);
            setTimeout(function () {
                code.attr("disabled", false).val("重新获取验证码");
                code.css("cursor", "pointer")
                clearInterval(set);
               
            }, 60000);
        
    }
    else {
        $.sendError('发送失败，请重试！', 2000, function () {
            console.log('sendError closed');
        });
    }
    
}
function setCookie(name, value, time) {
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
function getsec(str) {
    alert(str);
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    } else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    } else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
    }
}




