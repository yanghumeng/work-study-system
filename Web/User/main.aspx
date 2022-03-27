<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="User_main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link rel="stylesheet" href="../css/vintage-popup.min.css">
    <link rel="stylesheet" href="../css/popup-material-theme.min.css">
    <link href="../css/main_Style.css" rel="stylesheet" />
    <link href="../css/loading.css" rel="stylesheet" />
    <link href="../css/dialog.css" rel="stylesheet" />
    <style type="text/css">
        .notice-show-css {
            width: 20%;
            margin: 0 auto 10px;
            height: 50px;
            border-radius: 10px;
            background-color: #333333;
            cursor: pointer;
            text-align: center;
            color: #fff;
            font-size: 1.5em;
            line-height: 50px;
        }
       

    .notice_content::-webkit-scrollbar-track-piece {
        background-color: rgba(0, 0, 0, 0);
        border-left: 1px solid rgba(0, 0, 0, 0);
    }

    .notice_content::-webkit-scrollbar {
        width: 5px;
        height: 13px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        display: block;
    }

    .notice_content::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0.5);
        background-clip: padding-box;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        min-height: 28px;
    }

        .notice_content::-webkit-scrollbar-thumb:hover {
            background-color: rgba(0, 0, 0, 0.5);
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

.notice_content {
    max-height: 400px;
    max-width: 700px;
    overflow-y: scroll;
    display: block;
    font-size: 1.3em;
}

    </style>
    <script type="text/javascript" src="../js/loading.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="loading-div">
        <div class="loading-div-div">
            <i class="fa fa-spinner fa-pulse fa-3x fa-fw "></i>
            <span class="sr-only" style="position: relative">Loading...</span>
        </div>
    </div>
    <div class="main-bg">
        <div class="wrap">
            <div class="main clearfix">
                <nav id="notice" class="nav">
                    <div id="notice-show" class="notice-show-css">
                        <div class="htmleaf-content">
                            <div class="btn htmleaf-demo popupTrigger" data-popup-target="demoPopup">
                                公&nbsp;告
                            </div>
                        </div>
                    </div>
                </nav>
                <nav id="menu" class="nav">
                    <ul>
                        <li>
                            <a href="StudentSchoolMessage.aspx">
                                <span class="icon">
                                    <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                </span>
                                <span>在校信息</span>
                            </a>
                        </li>
                        <li>
                            <a href="Apply.aspx">
                                <span class="icon">
                                    <i class="fa fa-handshake-o fa-2x" aria-hidden="true"></i>
                                </span>
                                <span>工作申请</span>
                            </a>
                        </li>
                        <li>
                            <a href="PostDetail.aspx">
                                <span class="icon">
                                    <i class="fa fa-snowflake-o fa-2x" aria-hidden="true"></i>
                                </span>
                                <span>岗位详情</span>
                            </a>
                        </li>
                        <li>
                            <a href="ApplyHistory.aspx">
                                <span class="icon">
                                    <i class="fa fa-history fa-2x" aria-hidden="true"></i>
                                </span>
                                <span>申请记录</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="confirmWithCustom">
                                <span class="icon">
                                    <i class="fa fa-telegram fa-2x" aria-hidden="true"></i>
                                </span>
                                <span>用户反馈</span>
                            </a>
                        </li>
                    </ul>
                    <div class="clear"></div>

                </nav>
            </div>
        </div>
    </div>
    <!-- Popup -->
    <div class="popup" tabindex="-1" role="dialog" data-popup-id="demoPopup">
        <div class="popup__container">
            <div class="popup__close"><span></span><span></span></div>
            <div class="popup__content" style="max-height:500px;min-width:350px">
                <div>
                    <label style="font-weight: 600;font-size:1.5em">公告信息如下</label><br>
                    <br>
                    <div id="onotice-content-content" class="notice_content" style="">
                        <asp:Label ID="notice_content" runat="server" Text="Label"></asp:Label>
                        <hr />
                        <div style="text-align:right">
                            <span>发布日期：</span><asp:Label ID="notice_date" runat="server" Text="Label"></asp:Label><br>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/vintage-popup.min.js"></script>
    <script src="../js/modernizr.custom.js"></script>
    <script src="../js/jquery.dialog.js"></script>
    <script type="text/javascript">
        // 确认框：自定义内容格式，阻止onConfrim的执行
        $('#confirmWithCustom').click(function () {
            $.sendConfirm({
                title: '用户反馈',
                content: '<div id="addIpBox">' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 学号:</div>' +
                    '<input type="text" class="frm-input" id="studentid" name="ip" placeholder="请填写有效的学号">' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '<div class="frm-label"><span class="requireIcon">*</span> 说明:</div>' +
                    '<textarea maxlength="80" style="resize:none" cols="100%" id="depict" rows="5" class="frm-input" name="desc" placeholder="最多80个汉字"/>' +
                    '</div>' +
                    '<div class="frm-item">' +
                    '</div>' +
                    '</div>',
                button: {
                    confirm: '确认',
                    cancel: '取消'
                },

                onConfirm: function () {

                },
                onCancel: function () {
                    console.log('点击取消！');
                },
                onClose: function () {
                    console.log('点击关闭！');
                }
            });

        });

    </script>
    <script>
        $('.popupTrigger').popup();
	</script>
</asp:Content>

