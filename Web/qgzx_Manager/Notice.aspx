<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="qgzx_Manager_Notice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <script src="../Ueditor/ueditor.config.js"></script>
    <script src="../Ueditor/ueditor.all.min.js"></script>
    <script src="../Ueditor/lang/zh-cn/zh-cn.js"></script>
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
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>公告内容
                </label>
                <div class="layui-input-block">

                    <asp:TextBox ID="txtEditorContents" TextMode="MultiLine" Height="300px" Width="100%" lay-verify="required" runat="server" required="required" placeholder="请输入内容" name="desc" CssClass="layui-textarea"></asp:TextBox>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <asp:Button ID="Button1" runat="server" Text="发布" class="layui-btn" lay-filter="" lay-submit="" OnClick="Button1_Click1"/>
                <%--<button class="layui-btn" lay-filter="issue" lay-submit="">
                    发布
                </button>--%>
            </div>

        </form>
    </div>
    <script>
        layui.use(['form', 'layer'], function () {
            $ = layui.jquery;
            var form = layui.form
            , layer = layui.layer;



            //监听提交
            form.on('submit(issue)', function (data) {
                console.log(data);
                var content = $("#txtEditorContents").attr();
                alert(content);
                //使用ajax提交
                $.ajax({
                    type: "post",
                    url: "Notice.aspx/Issue",
                    data: "{content:'" + content + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {

                            //发异步，把数据提交给php
                            layer.alert("发布成功", { icon: 6 }, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                            });
                        }
                        else if (data.d == false) {
                            //发异步，把数据提交给php
                            layer.alert("发布失败", { icon: 2 }, function () {
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
    <script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('txtEditorContents');


        function isFocus(e) {
            alert(UE.getEditor('txtEditorContents').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e) {
            UE.getEditor('txtEditorContents').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('txtEditorContents').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('txtEditorContents');
        }
        function getAllHtml() {
            alert(UE.getEditor('txtEditorContents').getAllHtml())
        }
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('txtEditorContents').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('txtEditorContents').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('txtEditorContents').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('txtEditorContents').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('txtEditorContents').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('txtEditorContents').selection.getRange();
            range.select();
            var txt = UE.getEditor('txtEditorContents').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('txtEditorContents').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('txtEditorContents').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('txtEditorContents').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('txtEditorContents').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }

        function getLocalData() {
            alert(UE.getEditor('txtEditorContents').execCommand("getlocaldata"));
        }

        function clearLocalData() {
            UE.getEditor('txtEditorContents').execCommand("clearlocaldata");
            alert("已清空草稿箱")
        }
</script>
</body>
</html>
