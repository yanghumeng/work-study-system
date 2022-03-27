<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="PostDetail.aspx.cs" Inherits="User_PostDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/PostDetail_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <style type="text/css">
        .back_history {
            position: fixed;
            background: #52849b;
            padding: 5px;
            margin: 10px;
            color: #fff;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        #link_outschoolpost {
            margin: 0 auto;
            width: 80%;
            min-height: 10px;
            text-align: center;
            padding: 5px;
        }
        #link_outschoolpost a{
            color:#000000;
            font-weight:600;
        }
        #link_outschoolpost a:hover{
            color:#52849b;
            cursor:pointer;
        }
    </style>
    <script src="../js/jquery-3.2.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">岗位详情</h1>
            <div class="border"></div>
            <div class="services-container">
                <div id="link_outschoolpost">
                    <h3><a href="../User/OutSchoolPost.aspx">点击此处查看校外兼职>></a></h3>
                    <h5 style="color: red">（注意：校外岗位存在安全隐患，请谨慎选择）</h5>
                </div>
                <asp:Repeater ID="PostDetailRepeater" runat="server">
                    <ItemTemplate>
                        <div class="service-box" id="service-box<%# Eval("ID") %>">
                            <div class="service-icon" onclick="">
                                <i class="fa fa-won" aria-hidden="true"></i>
                            </div>
                            <div class="service-title"><%# Eval("PostName") %></div>
                            <div class="service-desc"><%# Eval("PostContent") %></div>
                            <div class="hide<%# Eval("ID") %>" id="hide">
                                <div><span>地点：</span><div><%# Eval("PostLocation") %></div>
                                </div>
                                <div><span>人数：</span><div><%# Eval("NeedNumber") %>人</div>
                                </div>
                                <div><span>工作时间：</span><div><%# Eval("WorkTime") %></div>
                                </div>
                                <div><span>工作要求：</span><div><%# Eval("Requirement") %></div>
                                </div>
                                <div><span>计费标准：</span><div><%# Eval("Wages") %>/小时</div>
                                </div>
                            </div>
                            <div class="more<%# Eval("ID") %>" title="更多" id="more" onclick="more(this,<%# Eval("ID") %>)">
                                <i class="fa fa-angle-double-down fa-2x" aria-hidden="true">更多</i>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ClassandId(classandid) {
            return document.querySelector(classandid);
        }
        function more(obj, id) {
            if ($(obj).attr('title') == '更多') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '收起')

                $(obj).html('<i class="fa fa-angle-double-up fa-2x" aria-hidden="true">收起</i>');
                ClassandId(".hide" + id).style.display = "block";
            } else {
                $(obj).attr('title', '更多')

                $(obj).html('<i class="fa fa-angle-double-down fa-2x" aria-hidden="true">更多</i>');
                ClassandId(".hide" + id).style.display = "none";
            }

        }


    </script>
</asp:Content>

