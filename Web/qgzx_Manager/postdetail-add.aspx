<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postdetail-add.aspx.cs" Inherits="Manager_order_add" %>

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
                    <span class="x-red">*</span>岗位名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txt_postdetailname" name="username" required="" lay-verify="required"
                        autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>岗位位置
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txt_postdetail_location" name="username" required="" lay-verify="required"
                        autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>工作内容
                </label>
                <div class="layui-input-block">

                    <textarea placeholder="请输入内容" id="txt_workcontent" name="desc" class="layui-textarea" lay-verify="required" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>需求人数
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txt_neednumber" name="username" required="" lay-verify="required"
                        autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>工作时间
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="txt_worktime" name="username" required="" lay-verify="required"
                        autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>计费标准<br />
                    （/小时）
                </label>
                <div class="layui-input-inline">
                    <select name="contrller" id="sel_wages">
                        <option>12</option>
                        <option>15</option>
                        <option>18</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label for="desc" class="layui-form-label">
                    工作要求
                </label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="txt_requirement" name="desc" class="layui-textarea" lay-verify="required" ></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block">
                    <input type="checkbox" name="toenable" id="chb_toenable" lay-skin="primary" lay-filter="father" title="是否启用">
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



            //监听提交
            form.on('submit(add)', function (data) {
                console.log(data);
                var postname = $.trim($("#txt_postdetailname").val());
                var postlocation = $.trim($("#txt_postdetail_location").val());
                var postcontent = $.trim($("#txt_workcontent").val());
                var neednumber = $.trim($("#txt_neednumber").val());
                var worktime = $.trim($("#txt_worktime").val());
                var requirement = $.trim($("#txt_requirement").val());
                var wages = $.trim($("#sel_wages").val());
                var toenable = $("#chb_toenable").is(":checked");
                //使用ajax提交
                console.log(data);
                $.ajax({
                    type: "post",
                    url: "postdetail-add.aspx/Addpostdetail",
                    data: "{postname:'" + postname + "',postlocation:'" + postlocation + "',postcontent:'" + postcontent + "',neednumber:'" + neednumber + "',worktime:'" + worktime + "',requirement:'" + requirement + "',wages:'" + wages + "',toenable:'" + toenable + "'}",
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
                            layer.alert("增加失败", { icon: 2 }, function () {
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
