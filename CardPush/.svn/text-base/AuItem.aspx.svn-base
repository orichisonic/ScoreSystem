<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--最新公告 -->
   <%
       string strBackUrl = (string)ViewData["BackUrl"];
   %>
   <span id="BackUrl" visible="false"><%=strBackUrl%></span>
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_25[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <span class="mt10 lh25 "><strong>推广一卡通（劲舞团）说明：</strong><br />
                        <span class="STYLE26">1、12月22日起注册的劲舞团新用户，可在商城领取30体验币（一个劲舞团新账号仅可领取一次）；<br />
                       </span><%--<br />    2、09年9月1日前注册，3个月内未登陆过游戏的流失用户，可在商城领取价值1000MB回归抵用券+魔法星星1个；--%>
                        <strong>注：未满足以上条件，或已领取过邮件活动奖励的用户，不能领取。</strong></span></p>
               </div>
               <div class="clear">
                  <strong>久游推广一卡通说明：</strong><br />
                  1、使用久游推广一卡通，只需要首次输入卡号完成帐号绑定，即可领取本平台提供的所有游戏新手奖励。<br />
                  2、每个玩家帐号对于同一款游戏，只能选择一个大区领取一次，不可重复领取。
               </div>
            </div>
            <div class="mt10 lh25 STYLE26">
               <a href="<%=strBackUrl%>" target="_blank"><strong><font color="#ff0000" size="+1">#--> 领奖通道，点击此处去商城领取道具！！！</font></strong></a>
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var backurl = $('#BackUrl').html();
        $('#BackUrl').hide();
        if (backurl == 'nourl') {
            alert("您不属于本次活动用户，或您已通过邮件活动领取本奖励！！");
            history.go(-1);
        }
        else if (backurl = 'bindcard') {
            location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
        }
    });
</script>
</asp:Content>
