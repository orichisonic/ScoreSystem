<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<script src="/Scripts/scoresite/score_eventrecord.js?1" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; <a href="<%=Url.Action("personal") %>">个人中心</a>
      &gt;&gt; 活动卡兑换记录</div>
   <div class="kindTools">
   
   <select id="card_select" onchange="qryEvent()">
      <option value="-2">-- 请选择活动卡类型 --</option>
      <option value="1">劲舞团媒体白金卡</option>
      <option value="2">劲舞团黑龙江专区活动卡</option>
      <option value="3">劲舞团河北/大华北经验翻倍卡</option>
      <option value="4">敢达神卡</option>
      <option value="5">超级舞者服饰卡</option>
      <option value="6">劲舞团2 公会卡</option>
      <option value="7">劲舞团2 新手活动卡</option>
      <option value="8">劲舞团2 技嘉全国巡展活动卡</option>
      <option value="9">劲舞团 河北专区活动卡</option>
   </select>
   <br /><br />
      <h1>
         <span class="titleBbg"><span class="title">活动卡兑换记录：</span></span></h1>
      <div class="eventRecord" id="eventRecord_div">
         <script language="javascript" type="text/javascript">
            var c = new EventRecord('<%=Url.Action("GetEventRecords") %>', 'card_select', 'eventRecord_div');
            
            var p = new PagerMan({
               onFirstPageClick: function(pg) { $("#pager_div").html(''); c.loadEventRecordList(pg) },
               onLastPageClick: function(pg) { $("#pager_div").html(''); c.loadEventRecordList(pg) },
               onPrevPageClick: function(pg) { $("#pager_div").html(''); c.loadEventRecordList(pg) },
               onNextPageClick: function(pg) { $("#pager_div").html(''); c.loadEventRecordList(pg) },
               onPageClick: function(pg) { $("#pager_div").html(''); c.loadEventRecordList(pg) },
               onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.loadEventRecordList(pg) }
            });
            c.loadEventRecordList(1);
            function qryEvent() {
               c.loadEventRecordList(1);
            }
            
         </script>
      </div>
      <div style="height: 20px;">&nbsp;</div>
      <div class="meneame" id="pager_div"></div>
   </div>
</div>
</asp:Content>
