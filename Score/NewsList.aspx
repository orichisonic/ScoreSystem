<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<script src="/Scripts/scoresite/score_newslist.js?3" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 新闻中心</div>
   <div class="newsListMain" id="news_list_main_div">
      <script language="javascript" type="text/javascript">
      var c = new NewsList('<%=Url.Action("NewsListNews") %>', '<%=Url.Action("newsContent") %>', 'news_list_main_div');
      
      var p = new PagerMan({
         onFirstPageClick: function(pg) { $("#pager_div").html(''); c.loadNewsList(pg) },
         onLastPageClick: function(pg) { $("#pager_div").html(''); c.loadNewsList(pg) },
         onPrevPageClick: function(pg) { $("#pager_div").html(''); c.loadNewsList(pg) },
         onNextPageClick: function(pg) { $("#pager_div").html(''); c.loadNewsList(pg) },
         onPageClick: function(pg) { $("#pager_div").html(''); c.loadNewsList(pg) },
         onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.loadNewsList(pg) }
      });
      c.loadNewsList(1);
      </script>
   </div>
   <div class="meneame" id="pager_div">
   </div>
</div>
</asp:Content>
