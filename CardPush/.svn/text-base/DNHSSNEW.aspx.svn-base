<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
<!--#include file='stepmenu.htm' -->
   <?php include_once('step_menu.php');?>
   <!--最新公告 -->
   <div class="notice">
      <ul>
         <li class="lit2"></li>
         <li class="lic p38 pb40">
            <div class="lh25 pt20 borderb">
               <img class="left" style="margin-right: 6px; margin-bottom: 10px;" src="/Content/images/cardpush/dnhhot.jpg" width="130" height="130" />
               <div class="m2">
                   <p><strong>当角色达到以下等级时，可获得奖励~<br />
                        等级  道具<br />
                        5&nbsp;&nbsp; 剧情橙色首饰、复活币*2、一级礼盒<br />
                        10&nbsp;&nbsp; 双倍经验道具*3、宠物粮食*10、二级礼盒<br />
                        15&nbsp;&nbsp; 幸运符*3、升星袋*3、三级礼盒<br /></strong><br />
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
            
               &nbsp; &nbsp; 产品名称：&nbsp; 勇士OL<br>
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
                <%--玩家帐号&nbsp;&nbsp;&nbsp; ： 
                <label>
                  <input name="useraccount" id="useraccount" size="20"  maxlength="20" />
               </label>--%>
               &nbsp; 
                <br />
                输入验证码&nbsp; ：
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
        var vUaccount = "";  //$('#useraccount').val();
        $.ajax({
        url: "http://" + location.host + "/CardPush.aspx/SENDDNHSSNEW/",
            type: "POST",
            dataType: "json",
            //data: { UserID: '', You9ID: '', GameServer: gameServer, AuthCode: authcode },
            data: { CardNo: "", UserID: vUaccount, Jw2Itemtype: "1", GameServer: gameServer, AuthCode: authcode },
            success: submitSuccessed
        });
    }


    function submitSuccessed(result) {
        alert(result.msg);
        $("#subBtn").attr('disabled', false); //可用
        $("#wait").html("");
        if (result.isSuccessed == 1) {
            location.href("http://" + location.host + "/CardPush.aspx/DNHSSNEW/");
        }
        else if (result.isSuccessed == 0) {
            reloadcode();
        }
        else if (result.isSuccessed == 2) {
            reloadcode();
        }
        else if (result.isSuccessed == 6) {
            location.href('http://' + location.host + '/CardPush.aspx/CardBind/');
        }
        else if (result.isSuccessed == 5) {
            location.href("http://" + location.host + "/CardPush.aspx/index");
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
