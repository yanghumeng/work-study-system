<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="User_Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css">
    <link href="../css/map.css" rel="stylesheet" />
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=c93e1e293e5b1c3dc581f3ff633144d3&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Walking,AMap.Riding"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/OutSchoolPost.aspx'">返回上一页</div>
    <div style="top:20%">
        <div id="myPageTop">
            <a href="javascript:void(0);" id="show">点击试试———路线工具（展开/收缩）
            </a>
            <div class="pageShow">
                <h3>搜索地址</h3>
                <input id="tipinput" placeholder="模糊地址搜索">
                <h3>搜索行车路径</h3>
                <input id="star" placeholder="行车开始地址">
                <span>—&nbsp;—</span>
                <input id="end" placeholder="行车结束地址">
                <span>—&nbsp;—</span>
                <a id="car" href="javascript:void(0);">点击搜索
                </a>

                <h3>搜索骑行路径</h3>
                <input id="cStar" placeholder="骑行开始地址">
                <span>—&nbsp;—</span>
                <input id="cEnd" placeholder="骑行结束地址">
                <span>—&nbsp;—</span>
                <a id="riding" href="javascript:void(0);">点击搜索
                </a>

                <h3>搜索步行路径</h3>
                <input id="wStar" placeholder="步行开始地址">
                <span>—&nbsp;—</span>
                <input id="wEnd" placeholder="步行结束地址">
                <span>—&nbsp;—</span>
                <a id="walk" href="javascript:void(0);">点击搜索
                </a>
                <div style="margin: 20px 0;">
                    <a id="box" href="javascript:void(0);">鼠标右键拖取选框放大地图
                    </a>
                    <a id="meter" href="javascript:void(0);">测量距离
                    </a>
                </div>
            </div>
        </div>
        <div id="container" style="width: 80%; height: 80%; margin: 100px auto 0 auto;"></div>
        <div id="panel" style=""></div>
    </div>
    <script src="../js/map.js"></script>
</asp:Content>

