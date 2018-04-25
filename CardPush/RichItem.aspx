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
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_57[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <strong>注意事项：
                        <br />
                        1.成功绑定中银新手卡的玩家，在中银富翁专区内角色等级达到3级即可获得价值1300MB精美游戏道具。
                        <br />
                        2.符合要求的帐号只有一次获奖机会，不可重复获奖。
                        <br />
                        3.该奖励并非实时领取，每周日24点前统计该周符合要求的玩家，并在下周二服务器例行维护时发放奖励。
                        <br />
                        4.国定假日及其他特殊情况下，奖励的发放可能会延迟，具体情况请留意官网及论坛公告。
                        <br />
                        5.本活动的最终解释权归久游网所有。</strong></p>
               </div>
               <div class="clear">
               </div>
            </div>
            <div class="mt10 lh25 ">
               <strong>一卡通说明：</strong><br />
               1、使用久游推广一卡通，只需要首次输入卡号完成帐号绑定，即可以领取本平台内所有的游戏道具。<br />
               2、每个玩家帐号对于同一款游戏，只能选择一个大区领取一次，不可重复领取。
            </div>
            <div class="mt10 lh25 ">
            
               &nbsp; &nbsp; 产品名称：&nbsp; 大富翁OL<br>
               选择游戏大区：&nbsp; 中银富翁
               <br />
               &nbsp; 输入验证码：
               <label>
                  <input name="validate" id="validate" size="6"  maxlength="6" />
               </label>
               <label>
               </label>
               <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30" border="0" style="margin-left: 90px; margin-top: 10px;"onclick="send()" />
             <br />
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>
               </script>

            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>

 <script language="JavaScript" type="text/javascript">
     function send() {
//         location.href("http://" + location.host + "/CardPush.aspx/AuItem/");
         var gameServer = $('#area').val();
         var authcode = $('#validate').val();
         $("#subBtn").attr('disabled', 'false'); //不可用
         $("#wait").html("请稍候...");
         $.ajax({
             url: "http://" + location.host + "/CardPush.aspx/SendRICHItem/",
             type: "POST",
             dataType: "json",
             data: { GameServer: gameServer ,AuthCode:authcode},
             success: submitSuccessed
         });
     }

     function submitSuccessed(result) {
         alert(result.msg);
         $("#subBtn").attr('disabled', false); //可用
         $("#wait").html("");
         if (result.isSuccessed == 1) {
             location.href("http://" + location.host + "/CardPush.aspx/RichItem/");
         }
         else if (result.isSuccessed == 6) {
             location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
         }
         else {
             reloadcode();
         }
     }
     function reloadcode() {


         var verify = document.getElementById('validimg');
//         verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
         verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
         //这里必须加入随机数不然地址相同我发重新加载
     }

 </script>
</asp:Content>
