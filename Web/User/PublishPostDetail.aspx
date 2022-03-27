<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="PublishPostDetail.aspx.cs" Inherits="User_PublishPoatDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <link href="../css/Personal_style.css" rel="stylesheet" />
    <link href="../css/all_header_style.css" rel="stylesheet" />
    <link href="../css/dialog.css" rel="stylesheet" />
    <style>
        .txt-left-side .form-left-to-w3l input {
            cursor: auto;
            font-size: 16px;

        }
        textarea{
            resize:none;
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
            border: 0;
            width: 80px;
        }

        #publishpostdetail, #cancelpublish {
            margin: 5px 40px;
            border: 0;
            border-radius: 10px;
            color: #fff;
            background: #51839b;
            cursor: pointer;
            font-size: 18px;
        }
        #showimg img{
            height:150px;
            border:1px solid #808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <input type="button" value="返回上一页" class="back_history" onclick="back()" />
    <div class="services-section">
        <div class="inner-width">
            <h1 class="section-title">发布岗位</h1>
            <div class="border"></div>
            <div class="services-container">
                <div class="txt-left-side">
                    <div class="form-left-to-w3l">
                        <span>工作名称：</span>
                        <asp:TextBox ID="txt_Workname" runat="server" Text="" required="required" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>工作时间：</span>
                        <asp:TextBox ID="txt_Worktime" runat="server" Text="" placeholder="例如：周一到周五或者每天9：00-12：00" required="required" MaxLength="30"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>工作地点：</span>
                        <asp:TextBox ID="txt_Workaddress" runat="server" Text="" placeholder="例如：校门口" required="required" MaxLength="30"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>需要人数：</span>
                        <asp:TextBox ID="txt_Neednumber" runat="server" Text="" placeholder="例如：男22人、女10人" required="required" MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>计费标准：</span>
                        <asp:TextBox ID="txt_Wagestandard" runat="server" Text="" placeholder="例如：12/（小时）" required="required" MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>工作内容：</span>
                        <asp:TextBox ID="txt_Workcontent" TextMode="MultiLine" Rows="5" runat="server" Text="" placeholder="最多200字" required="required" MaxLength="200"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>条件要求：</span>
                        <asp:TextBox ID="txt_Requirement" TextMode="MultiLine" Rows="5" runat="server" Text="" placeholder="例如：男生身高170cm（最多200字）" required="required" MaxLength="200"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>微信/电话：</span>
                        <asp:TextBox ID="txt_ContactWay" runat="server" Text="" placeholder="例如：13547031031（微信）" required="required" MaxLength="30"></asp:TextBox>
                    </div>
                    <div class="">
                        <span>上传图片：</span>
                        <asp:FileUpload ID="fileupload" runat="server" CssClass="imgInput" AllowMultiple="true" accept="image/png,image/jpg,image/jpeg" />
                        <span style="color: red">按 <b style="color: black">Ctrl</b> 键可一次添加多张图片(最多4张)</span>
                        <div><span id="showimg"></span></div>
                    </div>
                    <div class="form-left-to-w3l" style="border: 0">
                        <asp:Button ID="publishpostdetail" runat="server" Text="发布" ToolTip="发布" OnClick="publishpostdetail_Click"  />
                        <input id="cancelpublish" type="button" value="返回" title="返回" onclick="back()" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script>
        function back() {
            if (getQueryVariable("page") == "main")
            { window.location.href = "main.aspx"; }
            else if (getQueryVariable("page") == "personal")
            { window.location.href = "Personal.aspx"; }
            else {
                window.location.href = "Personal.aspx";
            }
        }
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }
        //多图预览
        $(".imgInput").change(function () {
            $("#showimg").html("")
            var imgNum = $(this)[0].files.length; //图片数量
            for (var i = 0; i < imgNum; i++) {
                $("#showimg").append("<img src='" + URL.createObjectURL($(".imgInput")[0].files[i]) + "' width=150px>");
            }
        });
    </script>

</asp:Content>


