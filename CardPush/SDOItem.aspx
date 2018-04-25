<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--最新公告 -->
   <div class="notice">
   <span id="authcode" visible="false"><%=(string)Session["ValidationCode"] %></span>
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_26[2].jpg" width="130" height="130" />
               <div class="right m2">
                   <p>
                       <strong>欢迎使用久游推广一卡通，您可领取的《超级舞者》新手奖励如下：<br />
                       2010年3月1日后注册或激活《超级舞者》的新用户可获得：<br />
                       女性玩家：逗气娇娇女（7天）；逗气娇娇 女衣（7天）；逗气娇娇 女裤（7天）；逗气娇娇 
                       女鞋（7天）；同舞卡（7天）；彩虹卡（绿）（7天）；悠嘻猴表情卡1（7天）；<br />
                       男性玩家：帅气 贵公子（7天）；帅气 公子装（7天）；帅气 公子裤（7天）；帅气 公子鞋（7天）；同舞卡（7天）；彩虹卡（绿）（7天）；悠嘻猴表情卡1（7天）；<br />
                       祝您游戏愉快！</strong><br />
                   </p>
                  <p>
                      &nbsp;</p>
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

               &nbsp; &nbsp; 产品名称：&nbsp; 超级舞者<br />
               选择游戏大区：
               <select name="area" id="area">
               <%
                    List<MModels.Jw2ServerList> areaList = (List<MModels.Jw2ServerList>)ViewData["AreaList"];
                    foreach (MModels.Jw2ServerList zone in areaList)
                            { 
                    %>
                    <option value="<%=zone.id%>">
                        <%= zone.ServerName%></option>
                    <%      }
                %>
               </select>
               <br />
               &nbsp; 输入验证码：
               <label>
                  <input name="validate" id="validate" size="6"  maxlength="6" />
               </label>
               <label>
               </label>
             <%--  <img id="seccode2" src="seccode2.php" border="0" align="absmiddle" onclick="changeSeccode()" style="cursor: pointer;" title="看不清？点击更换另一个验证码。">--%>
             <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30"  style="margin-left: 90px; margin-top: 10px;" onclick="send()" />
            <br />
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
            
         <script language="JavaScript" type="text/javascript">

             function send() {
                 var authcode = $('#validate').val();   //验证码
                 var gameServer = $('#area').val();
                 $("#subBtn").attr('disabled', 'false'); //不可用
                 $("#wait").html("请稍候...");
                 $.ajax({
                     url: "http://" + location.host + "/CardPush.aspx/SendSDOItem/",
                     type: "POST",
                     dataType: "json",
                     data: { GameServer: gameServer, AuthCode: authcode },
                     success: submitSuccessed
                 });
             }


             function submitSuccessed(result) {
                 alert(result.msg);
                 $("#subBtn").attr('disabled', false); //可用
                 $("#wait").html("");
                 if (result.isSuccessed == 1) {
                     location.href("http://" + location.host + "/CardPush.aspx/SDOItem/");
                 }
                 else if (result.isSuccessed == 6) {
                     location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
                 }
                 else if (result.isSuccessed == 2) {
                     location.href("http://" + location.host + "/CardPush.aspx/stepfour/");
                 }
                 else {
                     reloadcode()
                 }
             }
             function reloadcode() {
                  

                 var verify = document.getElementById('validimg');
//                 verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
                 verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
                 //这里必须加入随机数不然地址相同我发重新加载
             }




    
         </script>
</div>

</asp:Content>
