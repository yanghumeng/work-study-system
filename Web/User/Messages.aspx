<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="User_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/Personal_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/message-style.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">消息</h1>
            <div class="border"></div>
            <div class="services-container">
                <div class="message_all_content">
                    <div style="width: auto; height: auto; text-align: right; border-radius: 3px; margin: 0px 10px;">
                        <asp:Button ID="AlreadyRead" runat="server" Text="全部已读" Style="border: 0; padding: 5px; border-radius: 5px; position: fixed; background: #52849b; color: #ffffff; cursor: pointer;" OnClick="AlreadyRead_Click" />
                    </div>
                    <asp:Repeater ID="messageslist" runat="server">
                        <ItemTemplate>
                            <div class="message_small_content">
                                <div><span><%# Eval("SendingDate") %> 来自<%# Eval("Sender") %>的消息</span></div>
                                <%# Convert.ToBoolean(Eval("AlreadyRead"))==true?"<div style='color:#666;padding:0;cursor: default;right:0;top:0;'>此消息已读</div>":"<div style='padding:6px;border-radius:50%;background:#e84200;margin:10px;position:absolute;right:0;top:0;'></div>"%>
                                <div <%# Convert.ToBoolean(Eval("AlreadyRead"))==true?"style='cursor: default;color:#a2a2a2'":""%>>

                                    <p>
                                        <%# Eval("Content") %>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

