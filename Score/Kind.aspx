<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   #TB_title{display:none;}
</style>
<style type="text/css">
#myDialog_content a{margin-right:3px;margin-left:3px;text-decoration:underline;color:#dC8D3B;}
#get_qcoin{font-size:18px;font-weight:bold;margin-left:460px !important;}
#get_qcoin:hover{text-decoration:none;}
#myDialog_content table{width:100%;}
#myDialog_content table td{width:260px;height:50px;}
#myDialog_content table td a{font-size:17px;font-weight:bold;}
#myDialog_content table input{width:170px;border:solid 1px #aaa;}
#myDialog_content{text-align:left;background:url('');}
#myDialog_content{background:url('/content/images/cardpush/m818/m818logo.jpg') 0 300px no-repeat}
</style>
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script type="text/javascript" src="/Scripts/cardpush/m818MD5.js"></script>
<script src="/Scripts/scoresite/score_kind.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
var c = new RealGameItems('<%=Url.Action("GetRealItemsByGameId")%>', '<%=Url.Action("Kindcontent")%>', 'kindToolsContent_div');

var p = new PagerMan({
   onFirstPageClick: function(pg) { $("#pager_div").html(''); c.getRealGameItems(pg) },
   onLastPageClick: function(pg) { $("#pager_div").html(''); c.getRealGameItems(pg) },
   onPrevPageClick: function(pg) { $("#pager_div").html(''); c.getRealGameItems(pg) },
   onNextPageClick: function(pg) { $("#pager_div").html(''); c.getRealGameItems(pg) },
   onPageClick: function(pg) { $("#pager_div").html(''); c.getRealGameItems(pg) },
   onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.getRealGameItems(pg) }
});

$(function() {
   c.getRealGameItems(1, -1);
});

</script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 兑换实物</div>
   <div class="kindTools">
      <h1>
         <span class="titleBbg"><span class="title">请选择兑换的实物道具：</span>
            <span class="moreB" id="moreB_gamelist_span">
            <script language="javascript" type="text/javascript">
               getGamesList('moreB_gamelist_span', '<%=Url.Action("GetGameList")%>', 'RealGameItems.prototype.getRealGameItems');
            </script>
            </span>
        </span></h1>
      <div class="kindToolsContent">
         <div id="kindToolsContent_div">
         </div>
         <div class="meneame" id="pager_div">
         </div>
      </div>
   </div>
</div>
<div style="display:none;" id="gameTap_div">
   <div class="gameTap" style="border:0;" >
      <ul id="gameTap_ul">
      </ul>
      <div style="height:0px; margin:0; _display:inline; clear:both;"></div>
   </div>
</div>

<div style="display:none;" id="exchange_q_div">
<div id="myDialog_content"></div>
</div>
</asp:Content>
