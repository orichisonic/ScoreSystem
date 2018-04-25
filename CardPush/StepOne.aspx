<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--最新公告 -->
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="border2 bgc2 p15 lh25 f2">
               ·注册久游通行证成为久游用户才能正常使用久游推广一卡通<br />
               ·注册时请正确填写帐户信息及个人资料<br />
               ·请牢记您填写的“帐户密码”、“安全码”、“保密邮箱”
            </div>
            <div class="alignc mt10">
               <a href="http://register.9you.com/regist1.jsp" target="_blank">
                  <img alt="" src="/Content/images/cardpush/regbtn.gif" width="233" height="40" border="0" /></a></div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>
</asp:Content>
