<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="ApplyHistory.aspx.cs" Inherits="User_ApplyHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/dialog.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/ApplyHistory_style.css" rel="stylesheet" />
    <style type="text/css">
        .a_refresh {
            color: #494949;
            width: 32px;
            border-radius: 50%;
            margin: 0 auto;
            text-align: center;
            
        }

            .a_refresh:hover {
                cursor: pointer;
                color: #82ccdd;
            }

        .a_refreshhover {
            transition: 1s;
            transform: rotate(360deg);
        }
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">个人申请记录</h1>
            <div class="border"></div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="refresh">
                        <div style="height: 100%; position: absolute;">
                            <i>筛选：</i><asp:DropDownList ID="DropDownList1" runat="server" CssClass="filter-text" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Value="全部" />
                                <asp:ListItem Value="审核中" />
                                <asp:ListItem Value="已通过" />
                                <asp:ListItem Value="未通过" />
                                <asp:ListItem Value="待审核" />
                            </asp:DropDownList>
                        </div>
                        <div style="width: 5%; float: right;">
                            <div class="a_refresh" title="刷新">
                                <i class="fa fa-refresh fa-2x" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <div class="services-container">
                        <div class="history_content">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <HeaderTemplate>
                                    <table id="userInfo">
                                        <thead>
                                            <tr>
                                                <th>姓名</th>
                                                <th>学号</th>
                                                <th>手机号</th>
                                                <th>班级</th>
                                                <th>性别</th>
                                                <th>申请岗位</th>
                                                <th>提交日期</th>
                                                <th>审核状态</th>
                                                <th>操作</th>
                                            </tr>

                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="data_td">
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("StudentName")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("StudentID")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("PhoneNum")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("ClassNum")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("Sex")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("ApplyLocation")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("ApplyTime")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <%# Eval("ApplyStatus")%>
                                        </td>
                                        <td style="white-space: nowrap; text-align: center">
                                            <i class="fa fa-trash fa-2x" aria-hidden="true" style="position: absolute" title="删除"></i>
                                            <asp:Button ID="Button1" runat="server" Text=" " OnClick="Button1_Click" CommandArgument='<%# Eval("ID") %>' />
                                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="你确定要删除？" TargetControlID="Button1"></asp:ConfirmButtonExtender>
                                            &nbsp;
                                            <a href="ApplyDetail.aspx?applyid=<%# Eval("ID") %>" title="详情"><i class="fa fa-bars fa-2x" aria-hidden="true" style="color: #0bd08e"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                            <STORE:AspNetPager ID="AspNetPager" runat="server" Width="90%" UrlPaging="true"
                                ShowPageIndexBox="Always" AlwaysShow="True" PageIndexBoxType="DropDownList" TextBeforePageIndexBox="转到: "
                                HorizontalAlign="Center" EnableTheming="true"
                                FirstPageText="首页" LastPageText="尾页" CssClass="paginator" NextPageText="下一页" PrevPageText="上一页">
                            </STORE:AspNetPager>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/jquery.dialog.js"></script>
    <script>
        $(function () {
            $(".a_refresh").click(function () {
                if ($(this).hasClass('a_refreshhover')) {
                    $(this).removeClass('a_refreshhover');
                    $(this).addClass('a_refreshhover');
                } else {
                    $(this).addClass('a_refreshhover');
                }
                //$(this).removeClass("a_refreshhover");
                   // $(this).addClass("a_refreshhover");                                   //在回调函数里面改变css属性来实现transform中的动画变换 
                    
               
            })
            
        })
    </script>
</asp:Content>

