<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_newhandcard.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
new ServerInfos('<%=Url.Action("GetServerByGameId")%>', '<%=Url.Action("CreateCheckCodeImage") %>', '<%=Url.Action("SendCardGift") %>', 'select');
</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 新手卡领奖</div>
   <div class="newhandCard">
      <h1>
         <span>点击选择游戏</span></h1>
      <div class="newhandContentMain" id="newhandContentMain_div">
         <script language="javascript" type="text/javascript">
             getGamesList('newhandContentMain_div', '<%=Url.Action("GetGameList")%>', 'ServerInfos.prototype.getServerInfos');
         </script>
      </div>
   </div>
   <div id="au">
      <h1>
         <span id="game_title">&nbsp;</span></h1>
      <div class="prize">
         <ul id="prize_ul">
         </ul>
         <div style="height: 0px; margin: 0; _display: inline; clear: both;">
         </div>
      </div>
      <div class="prizeContent">
         <h3>
            领奖说明:</h3>
         <p id="gift_comment_p">请选择游戏
         </p>
      </div>
      <div class="confirmArea" id="confirmArea_div">
      </div>
   </div>
</div>
<script language="javascript" type="text/javascript">
var id = '<%=ViewData["id"] %>';
if(!+id){
   id = 67;
}
setTimeout(function() { ServerInfos.prototype.getServerInfos(id); }, 2000);
</script>
</asp:Content>
