<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Head_MasterPage.master" AutoEventWireup="true" CodeFile="StudentSchoolMessage.aspx.cs" Inherits="User_PersonalMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <meta name="keywords" content="Gadget Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/Personal_style.css" rel="stylesheet" />
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="back_history" onclick="javascrtpt: window.location.href = '../User/main.aspx'">返回上一页</div>
    <div class="services-section">
        <h1 class="section-title">个人在校信息</h1>
        <div class="border"></div>
        <!---728x90--->
        <div class="w3layouts-two-grids">
            <!---728x90--->
            <div class="mid-class">
                <div class="img-right-side">
                    <h3><asp:Label ID="lab_studentname" runat="server"></asp:Label></h3>
                        <img src="../img/login-img.png" class="img-fluid" alt="个人照片" /> 
                </div>
                <div class="txt-left-side">
                    <h2>详细信息</h2>

                    <div class="form-left-to-w3l">
                        <span class="fa fa-user-o" aria-hidden="true">姓名：</span>
                        <asp:TextBox ID="txt_studentname" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>学号：</span>
                        <asp:TextBox ID="txt_studentid" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>性别：</span>
                        <asp:TextBox ID="txt_Sex" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>身份证号：</span>
                        <asp:TextBox ID="txt_IDcard" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>民族：</span>
                        <asp:TextBox ID="txt_Nation" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>籍贯：</span>
                        <asp:TextBox ID="txt_NativePlace" runat="server" Text="" ReadOnly="true"></asp:TextBox>

                    </div>
                    <div class="form-left-to-w3l">
                        <span>政治面貌：</span>
                        <asp:TextBox ID="txt_PoliticalStatus" runat="server" Text="" ReadOnly="true"></asp:TextBox>

                    </div>
                    <div class="form-left-to-w3l">
                        <span>出生年月：</span>
                        <asp:TextBox ID="txt_DateOfBirth" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>入学日期：</span>
                        <asp:TextBox ID="txt_DatesofAttendance" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>毕业日期：</span>
                        <asp:TextBox ID="txt_DatesofGraduation" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>系部：</span>
                        <asp:TextBox ID="txt_Department" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>年级：</span>
                        <asp:TextBox ID="txt_Grade" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>专业：</span>
                        <asp:TextBox ID="txt_Major" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>班级：</span>
                        <asp:TextBox ID="txt_ClassNum" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-left-to-w3l">
                        <span>在读状态：</span>
                        <asp:TextBox ID="txt_IsSchool" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <!---728x90--->
        <footer class="copyrigh-wthree">
        </footer>
    </div>
</asp:Content>

