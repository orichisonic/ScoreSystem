<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <ul>
<%
            if (Session["YOU_ACCOUNT_INFO"] != null)
            {
%>
            
<%          }
            else
            {
%>          <li>
            <%= Html.ActionLink("首页", "Index", "CardPush")%> 
            </li>
<%          }
%>
          </ul>
<div class="right width703">
   <?php include_once('step_menu.php');?>
   <!--最新公告 -->
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_69[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <strong>欢迎使用久游推广一卡通，您可领取的《劲爆篮球》新手奖励为：
                        <br />
                        双倍经验纹身10个、双倍积分纹身10个、小喇叭10个、3000点经验、代金券3张（每张100点，2天有效）。</strong><br />
                  </p>
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
            
               &nbsp; &nbsp; 产品名称：&nbsp; 劲爆篮球 <br>
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
               <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30" border="0" style="margin-left: 90px; margin-top: 10px;" onclick="send()"/>
               <br />
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>

               <script type="text/javascript" language="javascript">
	 				 <!--
		 			function changeSeccode(){
								var img = document.getElementById("seccode2");
								img.src = "seccode2.php?" + Math.random();
		 					}
		  			function pressCaptcha(obj){
    							obj.value = obj.value.toUpperCase();
  							}
	 				//-->
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
 
         var gameServer = $('#area').val();
         var authcode = $('#validate').val();
         $("#subBtn").attr('disabled', 'false'); //不可用
         $("#wait").html("请稍候...");
         $.ajax({
         url: "http://" + location.host + "/CardPush.aspx/SendBasketballItem/",
             type: "POST",
             dataType: "json",
             data: { UserID: '', You9ID:'',GameServer: gameServer ,AuthCode:authcode},
             success: submitSuccessed
         });
     }


     function submitSuccessed(result) {
         alert(result.msg);
         $("#subBtn").attr('disabled', false); //可用
         $("#wait").html("");
         if (result.isSuccessed == 1) {
             location.href("http://" + location.host + "/CardPush.aspx/BasketballItem/");
         }
         else if (result.isSuccessed == 0) {
            reloadcode();
        }
        else if (result.isSuccessed == 6) {
            location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
        }
         else if (result.isSuccessed == 5) {
             location.href("http://" + location.host + "/CardPush.aspx/BasketballItem/");
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
