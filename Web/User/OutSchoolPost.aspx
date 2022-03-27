<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="OutSchoolPost.aspx.cs" Inherits="User_OutSchoolPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />

    <!-- Style dependencies -->
    <link rel="stylesheet" href="../css/vintage-popup.min.css">
    <link rel="stylesheet" href="../css/popup-material-theme.min.css">
    <link href="../css/PostDetail_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/outschoolpost-style.css" rel="stylesheet" />
    <script src="../js/jquery-3.2.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/PostDetail.aspx'">返回上一页</div>
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">校外兼职</h1>
            <div class="border"></div>
            <div class="services-container">
                <div id="link_outschoolpost">
                    <h5 style="color: red">（提示：校外岗位由学生自己发布的，存在一定的安全性，请谨慎选择）</h5>
                </div>
                <div id="link_map">
                    <a href="Map.aspx">进入地图</a>
                </div>
                <asp:Repeater ID="OutSchoolPostRepeater" runat="server">
                    <ItemTemplate>
                        <div class="service-box" id="service-box">
                            <div class="service-icon" onclick="">
                                <i class="fa fa-won" aria-hidden="true"></i>
                            </div>
                            <div class="service-title"><%# Eval("WorkName") %></div>
                            <div class="service-desc" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                <span>发布人：<%# Eval("Publisher") %></span>
                            </div>
                            <div class="service-desc" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                <span>工作内容：<%# Eval("WorkContent") %></span>
                            </div>

                            <div class="htmleaf-content">
                                <div class="btn htmleaf-demo popupTrigger" onclick="show(<%# Eval("ID") %>)" style="width: 30%; margin: 0 auto; cursor: pointer;" data-popup-target="demoPopup">
                                    <a href="#"><i class="fa fa-ellipsis-h" aria-hidden="true">更多</i></a>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="htmleaf-container">
        </div>
    </div>
    <!-- Popup -->
    <div class="popup" tabindex="-1" role="dialog" data-popup-id="demoPopup">
        <div class="popup__container">
            <div class="popup__close"><span></span><span></span></div>
            <div class="popup__content" style="">
                <div>
                    <label style="font-weight: 600;">兼职全部信息如下：</label><br>
                    <br>
                    <div id="outschoolpost-content" style="max-height: 270px; overflow-y: scroll; display: block;">
                        <span>发布人：</span><label class="publisher"></label><br>
                        <hr />
                        <span>工作名称：</span><label class="workname"></label><br>
                        <hr />
                        <span>工作内容：</span><label class="workcontent"></label><br>
                        <hr />
                        <span>工作时间：</span><label class="worktime"></label><br>
                        <hr />
                        <span>工作地点：</span><label class="workaddress"></label><br>
                        <hr />
                        <span>需要人数：</span><label class="neednumber"></label><br>
                        <hr />
                        <span>工资薪水：</span><label class="wage"></label><br>
                        <hr />
                        <span>条件要求：</span><label class="requirement"></label><br>
                        <hr />
                        <span>发布时间：</span><label class="publishtime"></label><br>
                        <hr />
                        <span>联系方式：</span><label class="contectway" style="color: #52849b; font-weight: 600;"></label><br>
                        <span>图片：</span>
                        <div id="showimg">

                        </div>
                    </div>
                </div>
                <br>
                <a href="Map.aspx" style="border-bottom: 1px solid">进入地图</a>
                <br>
                <span style="color: #c73932;">如果对岗位满意可以自行联系；若对发布者有疑问可以反馈给我们，我们会及时处理☺</span>
            </div>
        </div>
    </div>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/vintage-popup.min.js"></script>
    <!-- Initialize popup -->
    <script>
        function show(id) {
            $.ajax({
                type: "post",
                url: "OutSchoolPost.aspx/GetOutSchoolPostByID",
                data: "{id:'" + id + "'}",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var obj = jQuery.parseJSON(data.d);
                    $(".publisher").text(obj.Publisher);
                    $(".workname").text(obj.WorkName);
                    $(".workcontent").text(obj.WorkContent);
                    $(".worktime").text(obj.WorkTime);
                    $(".workaddress").text(obj.WorkAddress);
                    $(".wage").text(obj.WageStandard);
                    $(".requirement").text(obj.Requirement);
                    $(".publishtime").text(obj.PublishTime);
                    $(".contectway").text(obj.ContactWay);
                    $(".neednumber").text(obj.NeedNumber);
                    var arr = new Array();
                    var str = obj.PostImg;
                    if ($.trim(str) == "") {
                        return;
                    }
                    //可以用字符或字符串分割
                    arr = str.split(',');
                    $("#showimg").html("");
                    for (var i = 0; i < arr.length; i++) {
                        $("#showimg").append("<img src='../UploadFile/postpictures/" + arr[i]+ "' width=150px height=150px style='margin:0 10px;border:1px solid #a2a2a2'>");
                    }
                },
                error: function (e) {
                    alert("错误是:" + e.responseText);
                }
            });

        }
        $('.popupTrigger').popup();

    </script>
</asp:Content>

