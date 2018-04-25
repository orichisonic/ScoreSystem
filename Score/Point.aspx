<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_point.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 获得积分</div>
   <div class="pointEvent">
      <h1>
         <span>获得积分：</span></h1>
      <div class="pointEventContent">
         <div id="pointEventContent_div">
            <script language="javascript" type="text/javascript">
            var c = new GetActions('<%=Url.Action("GetActionList") %>', 'pointEventContent_div', '<%=Url.Action("ActionApply") %>');

            var p = new PagerMan({
               onFirstPageClick: function(pg) { $("#pager_div").html(''); c.loadActionList(pg) },
               onLastPageClick: function(pg) { $("#pager_div").html(''); c.loadActionList(pg) },
               onPrevPageClick: function(pg) { $("#pager_div").html(''); c.loadActionList(pg) },
               onNextPageClick: function(pg) { $("#pager_div").html(''); c.loadActionList(pg) },
               onPageClick: function(pg) { $("#pager_div").html(''); c.loadActionList(pg) },
               onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.loadActionList(pg) }
            });
            c.loadActionList(1);
            </script>
         </div>
         <div class="meneame" id="pager_div"></div>
      </div>
   </div>
</div>
</asp:Content>
