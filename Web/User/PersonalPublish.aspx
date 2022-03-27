<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="PersonalPublish.aspx.cs" Inherits="User_PersonalPublish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/Personal_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/dialog.css" rel="stylesheet" />
    <link href="../css/personalpublish-style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <script src="../js/jquery-3.2.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/Personal.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">我的发布</h1>
            <div class="border"></div>
            <div class="services-container">
                <div class="publish-history">
                    <asp:Repeater ID="publishpost_list" runat="server">
                        <ItemTemplate>
                            <div class="publish-history-content">
                                <div style="width: 100%; height: 40px; color: #ff3d00; font-weight: bold;">
                                    <div class="header-content">
                                        申请状态：<asp:Label ID="applystatus" runat="server" Text='<%# Eval("PublishStatus") %>'></asp:Label>
                                    </div>
                                    <div class="header-content" style="text-align: right">
                                        发布日期：<asp:Label ID="publishdate" runat="server" Text='<%# Convert.ToDateTime(Eval("PublishTime")).ToString("yyyy-MM-dd") %>'></asp:Label>
                                    </div>
                                </div>
                                <div style="width: 100%; min-height: 60px; text-align: left;">
                                    <div class="content-content">
                                        工作名称：<asp:Label ID="workname" Style="border-bottom: 1px solid #808080" runat="server" Text='<%# Eval("WorkName") %>'></asp:Label>
                                    </div>
                                    <div class="content-content">
                                        工作地址：<asp:Label ID="workaddress" Style="border-bottom: 1px solid #808080" runat="server" Text='<%# Eval("WorkAddress") %>'></asp:Label>
                                    </div>
                                    <div class="content-content">
                                        工作内容：<asp:Label ID="workcontent" Style="border-bottom: 1px solid #808080" runat="server" Text='<%# Eval("WorkContent") %>'></asp:Label>
                                    </div>
                                    <div class="content-content">
                                        工作时间：<asp:Label ID="worktime" Style="border-bottom: 1px solid #808080" runat="server" Text='<%# Eval("WorkTime") %>'></asp:Label>
                                    </div>

                                </div>
                                <div style="width: 100%; height: 40px; color: #ffffff;">
                                    <div class="footer-content">
                                        <label id="look" class="<%# Eval("ID") %>">查看详情</label>
                                    </div>
                                    <div class="footer-content">
                                        <label id="delpost" class="<%# Eval("ID") %>">撤销岗位</label>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/script.js" type="text/javascript"></script>
    <script src="../js/jquery.dialog.js"></script>
    <script>
        $(function () {

            $("#delpost").click(function () {
                var id = $(this).attr("class");
                $.ajax({
                    type: "post",
                    url: "PersonalPublish.aspx/delpost",
                    data: "{id:'" + id + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == true) {
                            $.sendSuccess('删除成功', 2000, function () {
                                console.log('sendSuccess closed');
                            });
                            $(".publish-history").load(location.href + " .publish-history");
                        }
                        else{
                            $.sendError('删除失败！', 2000, function () {
                                console.log('sendError closed');
                            });
                        }
                    },
                    error: function (e) {
                        alert("错误是:" + e.responseText);
                    }
                })
            })
        })
    </script>
</asp:Content>

