<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Manager_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>勤工助学后台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script src="js/xadmin.js"></script>
    <script src="js/cookie.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo"><a href="index.aspx">勤工助学后台</a></div>
            <div class="left_open">
                <i title="展开左侧栏" class="iconfont">&#xe699;</i>
            </div>
            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">+新增</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd><a onclick="x_admin_show('资讯','https://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                        <dd><a onclick="x_admin_show('图片','https://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
                        <dd><a onclick="x_admin_show('用户 最大化','https://www.baidu.com','','',true)"><i class="iconfont">&#xe6b8;</i>用户最大化</a></dd>
                        <dd><a onclick="x_admin_add_to_tab('在tab打开','https://www.baidu.com',true)"><i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <asp:Label ID="L_account" runat="server" Text=""></asp:Label>
                    </a>

                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd><a onclick="">个人信息</a></dd>
                        <dd><a href="login.aspx">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index"><a href="../User/Login.aspx" target="_blank">前台首页</a></li>
            </ul>

        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe723;</i>
                            <cite>岗位管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="postdetail-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>校内岗位列表</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="outschoolpost-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>校外岗位列表</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe723;</i>
                            <cite>用户反馈</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="feedback-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>反馈列表</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe723;</i>
                            <cite>申请管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="apply-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>申请岗位</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="publishoutshoolpost-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>申请发布岗位</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe723;</i>
                            <cite>公告管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="error.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公告列表</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="Notice.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>发布新公告</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a _href="admin-editpassword.aspx">
                            <i class="iconfont">&#xe723;</i>
                            <cite>修改密码</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe726;</i>
                            <cite>录用人员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="admin-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>人员列表</cite>
                                </a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a _href="admin-list.aspx">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="error.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>角色管理</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="error.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限分类</cite>
                                </a>
                            </li>
                            <li>
                                <a _href="error.html">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>权限管理</cite>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
                </ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd>
                    </dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='./welcome.aspx' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <!-- 底部开始 -->
        <div class="footer">
            <div class="copyright">Copyright ©2019 勤工助学 v1.0 All Rights Reserved</div>
        </div>
        <!-- 底部结束 -->
    </form>
</body>
</html>
