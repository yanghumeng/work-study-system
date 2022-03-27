<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apply-list.aspx.cs" Inherits="Manager_apply_list" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>申请列表</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <link href="lib/layui/css/layui.css" rel="stylesheet" />
    <link href="../bootstrap/bootstrap-table.css" rel="stylesheet" />
    <link href="../bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        #form1 select {
            height: 40px;
            padding: 0px 10px;
            width: 13%;
        }

        .pagination-detail {
            float: left;
        }

        .pagination {
            float: right;
        }

            .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
                background-color: #009688;
                border-color: #009688;
            }

        .layui-form input[type=checkbox], .layui-form input[type=radio], .layui-form select {
            display: block;
        }

        .layui-form-checkbox[lay-skin=primary] i {
            display: none;
        }

        .layui-unselect, .layui-form-checkbox {
            display: none;
        }

        .dropdown-menu a {
            width: 100%;
            float: inherit;
            text-align: center;
        }
        .dropdown-menu a:hover {
            background:#009688;
        }
        .btn-group:hover .dropdown-menu{
            display:block;
        }
    </style>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap/bootstrap-table.js"></script>
    <script src="../bootstrap/bootstrap-table-zh-CN.js"></script>
    <script src="../bootstrap/dist/js/bootstrap.min.js"></script>
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
    <div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
                <cite>导航元素</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height: 30px">ဂ</i></a>
    </div>
    <div class="x-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so" runat="server">
                <input class="layui-input" placeholder="开始日" name="start" id="start">
                <input class="layui-input" placeholder="截止日" name="end" id="end">


                <div class="layui-input-inline">
                    <asp:DropDownList ID="type" runat="server" name="contrller"  style="height: 38px; line-height: 1.3; line-height: 38px\9; border-width: 1px; border-style: solid; background-color: #fff; border-radius: 2px;">
                        <asp:ListItem Text="全部" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="未通过"></asp:ListItem>
                        <asp:ListItem Text="待审核"></asp:ListItem>
                        <asp:ListItem Text="已通过"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <input type="text" name="username" placeholder="请输入学号号" autocomplete="off" class="layui-input">
                <asp:Button ID="search" CssClass="layui-btn" runat="server" Text="搜索"  lay-submit="" lay-filter="sreach" OnClick="search_Click"/>
                <%--<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>--%>
            </form>
        </div>
        <div class="layui-card-header">
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
            <span class="x-right" style="line-height: 40px">共有数据：88 条</span>
        </div>
        <div class="layui-card-body layui-table-body layui-table-main">
            <table class="layui-table  layui-form" id="tb">
                <thead>
                    <tr>
                        <th>
                           选择
                        </th>
                        <th>申请编号</th>
                        <th>申请人</th>
                        <th>学号</th>
                        <th>电话号码</th>
                        <th>班级</th>
                        <th>申请状态</th>
                        <th>申请时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="apply_list" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <input type="checkbox" class="bb" name="id" value="<%# Eval("ID") %>" lay-skin="primary">
                                </td>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("StudentName") %></td>
                                <td><%# Eval("StudentID") %></td>
                                <td><%# Eval("PhoneNum") %></td>
                                <td><%# Eval("ClassNum") %></td>
                                <td><%# Eval("ApplyStatus") %></td>
                                <td><%# Eval("ApplyTime") %></td>

                                <td class="td-manage">
                                    <a title="审核" onclick="x_admin_show('审核','apply-detail.aspx?applyid=<%# Eval("ID") %>')" href="javascript:;">
                                        <i class="layui-icon">&#xe63c;</i>
                                    </a>
                                    <a title="删除" onclick="member_del(this,<%# Eval("ID") %>)" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                </tbody>
            </table>
        </div>


    </div>
    <script>
        $("#tb").bootstrapTable({
            pagination: true,   //是否显示分页条
            pageSize: 5,   //一页显示的行数
            paginationLoop: false,   //是否开启分页条无限循环，最后一页时点击下一页是否转到第一页
            pageList: [5, 10, 20]   //选择每页显示多少行，数据过少时可能会没有效果
        });
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

        /*用户-停用*/
        function member_stop(obj, id) {
            layer.confirm('确认要停用吗？', function (index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用')
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', { icon: 5, time: 1000 });

                } else {
                    $(obj).attr('title', '启用')
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', { icon: 5, time: 1000 });
                }

            });
        }

        /*用户-删除*/
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                $.ajax({
                    type: "post",
                    url: "apply-list.aspx/Delapply",
                    data: "{ID:'" + id + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {
                            //发异步删除数据
                            $(obj).parents("tr").remove();
                            layer.msg('已删除!', { icon: 1, time: 1000 });
                            $("#tb").load(location.href + " #tb");
                        }
                        else if (data.d == false) {
                            //发异步删除数据
                            $(obj).parents("tr").remove();
                            layer.msg('删除失败!', { icon: 2, time: 1000 });
                        }

                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                });

            });
        }



        function delAll(argument) {

            var data = tableCheck.getData();
            //获取被选中的CheckBox的value
            var get = $(".bb");
            var strIds = [];
            for (i = 0 ; i < get.length; i++) {
                if (get[i].checked) {
                    strIds.push(get[i].value);
                }
            }
            if (strIds.length > 0) {
                layer.confirm('确认要删除吗？' + data, function (index) {
                    $.ajax({
                        type: "post",
                        url: "apply-list.aspx/DelAllapply",
                        data: "{idlist:'" + strIds + "'}",
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d == true) {
                                //发异步删除数据
                                layer.msg('删除成功', { icon: 1 });
                                $(".layui-form-checked").not('.header').parents('tr').remove();
                                $("#tb").load(location.href + " #tb");
                            }
                            else if (data.d == false) {
                                //发异步删除数据
                                //$(obj).parents("tr").remove();
                                layer.msg('删除失败!', { icon: 2, time: 1000 });
                            }

                        },
                        error: function (e) {
                            alert("错误是:" + e.responseText);
                        }
                    });

                });
            }
        }
    </script>

</body>
</html>
