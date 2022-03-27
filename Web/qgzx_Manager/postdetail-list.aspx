<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postdetail-list.aspx.cs" Inherits="Manager_order_list" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                background: #009688;
            }

        .btn-group:hover .dropdown-menu {
            display: block;
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

        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height: 30px">ဂ</i></a>
    </div>
    <div class="x-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so" runat="server">

                <input class="layui-input" placeholder="开始日" name="start" id="start" />
                <input class="layui-input" placeholder="截止日" name="end" id="end" />
                <div class="layui-input-inline">

                    <asp:DropDownList ID="type" runat="server" name="contrller" style="height: 38px; line-height: 1.3; line-height: 38px\9; border-width: 1px; border-style: solid; background-color: #fff; border-radius: 2px;">
                        <asp:ListItem Text="全部" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="使用中"></asp:ListItem>
                        <asp:ListItem Text="已停用"></asp:ListItem>
                    </asp:DropDownList>

                </div>

                <input type="text" name="username" placeholder="请输入岗位ID" autocomplete="off" class="layui-input">
                <asp:Button ID="search" CssClass="layui-btn" runat="server" Text="搜索" lay-submit="" lay-filter="sreach" OnClick="search_Click"/>
              
            </form>
        </div>
        <div class="layui-card-header">
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="x_admin_show('添加岗位','./postdetail-add.aspx')"><i class="layui-icon"></i>添加</button>
            <span class="x-right" style="line-height: 40px">共有数据：88 条</span>
        </div>
        <div class="layui-card-body layui-table-body layui-table-main">
            <table id="tb" class="table layui-table  layui-form">
                <thead>
                    <tr>
                        <th>选择
                        </th>
                        <th>岗位ID号</th>
                        <th>岗位名称</th>
                        <th>具体位置</th>
                        <th>工作内容</th>
                        <th>工作时间</th>
                        <th>计费标准</th>
                        <th>工作要求</th>
                        <th>需求人数</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <!--校内岗位-->
                    <asp:Repeater ID="postdetail_list" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <input type="checkbox" class="bb" name="id" value="<%# Eval("ID") %>" lay-skin="primary">
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("PostName") %></td>
                                <td><%# Eval("PostLocation") %></td>
                                <td><%# Eval("PostContent") %></td>
                                <td><%# Eval("WorkTime") %></td>
                                <td><%# Eval("Wages") %></td>
                                <td><%# Eval("Requirement") %></td>
                                <td><%# Eval("NeedNumber") %></td>
                                <%# Convert.ToBoolean(Eval("Toenable"))==true?"<td class='td-status'><span class='layui-btn layui-btn-normal layui-btn-mini'>已启用</span></td>":"<td class='td-status'><span class='layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled'>已停用</span></td>" %>
                                <td class="td-manage">
                                    <a onclick="member_stop(this,<%# Eval("ID") %>)" href="javascript:;" title="<%# Convert.ToBoolean(Eval("Toenable"))==true?"启用":"停用" %>">
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>
                                    <a title="编辑" onclick="x_admin_show('编辑','postdetail-edit.aspx?id=<%# Eval("ID") %>')" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="删除" onclick="member_del(this,<%# Eval("ID") %>)" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!--校外岗位-->

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
            layer.confirm('确认要修改状态吗？', function (index) {
                var toenable;
                if ($(obj).attr('title') == '启用') {
                    toenable = "0";
                }
                else if ($(obj).attr('title') == '停用') {
                    toenable = "1";
                }

                $.ajax({
                    type: "post",
                    url: "postdetail-list.aspx/EditPostDetailStatus",
                    data: "{ID:'" + id + "',Toenable:'" + toenable + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {
                            //发异步删除数据
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
                                layer.msg('已启用!', { icon: 1, time: 1000 });
                            }
                        }
                        else if (data.d == false) {
                            //发异步删除数据
                            $(obj).parents("tr").remove();
                            layer.msg('操作失败!', { icon: 2, time: 1000 });
                        }

                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                });


            });
        }

        /*用户-删除*/
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                $.ajax({
                    type: "post",
                    url: "postdetail-list.aspx/Delpostdetail",
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
                        url: "postdetail-list.aspx/DelAllpostdetail",
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
    <script>
        
    </script>
</body>
</html>
