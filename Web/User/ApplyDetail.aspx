<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="ApplyDetail.aspx.cs" Inherits="User_ApplyDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />

    <link href="../css/PostDetail_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/ApplyDetail_style.css" rel="stylesheet" />
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/ApplyHistory.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">申请详情</h1>
            <div class="border"></div>
            <div class="services-container">
                <div class="w3ls-contact">

                    <!-- form starts here -->
                    <div id="from">
                        <div class="agile-field-txt">
                            <div class="mr_agilemain">
                                <div class="left-wthree" style="margin:0 auto;text-align: center;" >
                                    <asp:Image ID="photo" runat="server" ToolTip="个人照片" Width="130px" Height="150px"/>
                                </div>
                            </div>
                            <div class="mr_agilemain">
                                <div class="left-wthree">
                                    <label class="bot_w3">学号</label>
                                    <asp:TextBox ID="txt_studentid" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">姓名</label>
                                    <asp:TextBox ID="txt_name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>

                                <div class="left-wthree">
                                    <label class="bot_w3">学生班级</label>
                                    <asp:TextBox ID="txt_class" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mr_agilemain">
                                <div class="left-wthree">
                                    <label class="bot_w3">家庭人口</label>

                                    <asp:TextBox ID="txt_familynum" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">性别</label>
                                    <asp:TextBox ID="txt_sex" runat="server" ReadOnly="true"></asp:TextBox>

                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">手机号码</label>
                                    <asp:TextBox ID="txt_phonrnum" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mr_agilemain">
                                <div class="left-wthree">
                                    <label class="bot_w3">申请岗位</label>
                                    <asp:TextBox ID="txt_apply_location" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">是否服从调配</label>
                                    <asp:TextBox ID="txt_deploy" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">民族</label>
                                    <asp:TextBox ID="txt_nation" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mr_agilemain">
                                <div class="left-wthree">
                                    <label class="bot_w3">应交学费</label>
                                    <asp:TextBox ID="txt_tuitionPayable" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">已交学费</label>
                                    <asp:TextBox ID="txt_tuitionPaid" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="left-wthree">
                                    <label class="bot_w3">欠学费</label>
                                    <asp:TextBox ID="txt_tuitionShortage" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="agile-field-txt" style="margin: 0 20px">
                            <label>家庭住址</label>
                            <asp:TextBox ID="txt_familyaddress" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="agile-field-txt" style="margin: 0 20px">
                            <label>申请理由</label>
                            <asp:TextBox ID="txt_applicationReason" ToolTip="申请理由" runat="server" TextMode="MultiLine" Rows="7" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="agile-field-txt" style="margin: 20px 20px">
                            <label>申请日期：<asp:Label ID="txt_applydate" runat="server" Text="Label"></asp:Label></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

