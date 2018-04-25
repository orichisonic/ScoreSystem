<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   #TB_title{display:none;}
</style>
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_virtual.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
var c = new GameItems('<%=Url.Action("GetItemsByGameId")%>', '<%=Url.Action("GetServerByGameId")%>', '<%=Url.Action("ExchangeVirtualItem")%>', 'virtualToolsContent_div');

var p = new PagerMan({
   onFirstPageClick: function(pg) { $("#pager_div").html(''); c.getGameItems(pg) },
   onLastPageClick: function(pg) { $("#pager_div").html(''); c.getGameItems(pg) },
   onPrevPageClick: function(pg) { $("#pager_div").html(''); c.getGameItems(pg) },
   onNextPageClick: function(pg) { $("#pager_div").html(''); c.getGameItems(pg) },
   onPageClick: function(pg) { $("#pager_div").html(''); c.getGameItems(pg) },
   onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.getGameItems(pg) }
});

$(function() {
   c.getGameItems(1, -1);
});

</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 兑换道具</div>
   <div class="virtualTools">
      <h1>
         <span class="titleBbg"><span class="title" id="title_span_gamelist">
            <script language="javascript" type="text/javascript">
               getGamesList('title_span_gamelist', '<%=Url.Action("GetGameList")%>', 'GameItems.prototype.getGameItems');
            </script>
         </span></span>
      </h1>
      <div class="virtualToolsContent">
         <div id="virtualToolsContent_div">
         </div>
         <div class="meneame" id="pager_div">
         </div>
      </div>
   </div>
</div>
<div id="virtualTap_div"  style="display:none;">
   <div>
      <h6>
         <span><span class="title" style="font-weight: bold;">请确认您要兑换的道具信息</span><span class="close"><a title="关闭" href="javascript:;" onclick="tb_remove();return false;"><img alt="close" src="/content/images/scoresite/close.gif" width="14" height="14" align="absmiddle" /></a></span></span>
      </h6>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="tapContent" style="border: 0;" id="tapContent_div">
      
   </div>
   <div class="tapArea" style="border: 0;">
      请选择大区：
      <select name="select" id="select_server">
      </select>
      <p id="btn_confirm_p"></p>
   </div>
</div>
</asp:Content>
