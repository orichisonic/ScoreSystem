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
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/logo_78[1].jpg" width="130" height="130" />
               <div class="right m2">
                  <p>
                     <strong>欢迎使用久游推广一卡通，您可选择领取的《GT劲舞团2》奖励为：<br />
                        a、夏日靓装一套（7天） 或 b、宠物一个：小嘻哈冬己（7天）<br />
                        男生夏日靓装：流行潮人男发、情侣联盟（男）、街头舞步 休闲裤、蝙蝠侠 休闲鞋、EBACE十字 手套；<br />
                        女生夏日靓装：盛夏派队短发、羽翼 上衣、靓丽牛仔 短裤、白 色迷情 凉鞋、牛奶条纹 大眼镜；</strong><br />
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
           
               &nbsp; &nbsp; 产品名称：GT劲舞团2<br>
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
        <div id="frm1" style="text-align: left">
               选择道具类型：
               <input type="radio"value="1" id="ps1" name="ps" checked="checked" />
               夏日靓装一套
               <input type="radio"value="2" id="ps2" name="ps" />宠物（小嘻哈冬己）
               </div>
               <br />
               &nbsp; 输入验证码：
               <label>
                  <input name="validate" id="validate" size="6"  maxlength="6" />
               </label>
               <label>
               </label>
                              <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
               <br />
               <input id="subBtn" type="image" src="/Content/images/cardpush/lq.gif" width="120" height="30" border="0" style="margin-left: 90px; margin-top: 10px;" id="btnSubmit" onclick="send()"/>
               <label id="wait"style="margin-left: 90px; margin-top: 10px;"  ></label>
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>
<script type="text/javascript">

    function send() {

        var gameServer = $('#area').val();
        var authcode = $('#validate').val();
        var itemtype = "";
        if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
            itemtype = '1';
        }
        else if ($("#frm1 input[type *= 'radio'][checked]").val() == 2) {
            itemtype = '2';
        }

        $("#subBtn").attr('disabled', 'false'); //不可用
        $("#wait").html("请稍候...");
        $.ajax({
            url: "http://" + location.host + "/CardPush.aspx/SendJw2Item/",
            type: "POST",
            dataType: "json",
            data: { Jw2Itemtype: itemtype, GameServer: gameServer, AuthCode: authcode },
            success: submitSuccessed
        });
    }
        function reloadcode() {


            var verify = document.getElementById('validimg');
//            verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
            verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
            //这里必须加入随机数不然地址相同我发重新加载
        }
        function submitSuccessed(result) {
            alert(result.msg);

            $("#subBtn").attr('disabled', false); //可用
            $("#wait").html("");
            if (result.isSuccessed == 1) {
                location.href("http://" + location.host + "/CardPush.aspx/Jw2Item/");
            }
            else if (result.isSuccessed == 6) {
                location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
            }
            else if (result.isSuccessed == 0) {
                reloadcode();
            }
            else if (result.isSuccessed == 5) {
            location.href("http://" + location.host + "/CardPush.aspx/Jw2Item/");
            }
        }
     
 
</script>
</asp:Content>
