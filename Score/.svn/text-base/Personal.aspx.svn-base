<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<script src="/Scripts/scoresite/score_eventrecord.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_getpoint.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_kindrecord.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_newcardrecord.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_toolrecord.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 个人中心</div>
   <div class="kindTools">
      <h1>
         <span class="titleBbg"><span class="title">积分获得明细：</span><span class="more"><a href="<%=Url.Action("getpoint") %>" target="_blank"><img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="absmiddle" /></a></span></span></h1>
      <div class="getPoint" id="getPoint_div">
         <script language="javascript" type="text/javascript">
            var c = new PointDetails('<%=Url.Action("GetPersonalPointsSummary") %>', '<%=Url.Action("point") %>', 'getPoint_div');
            c.loadPointDetailsList(1, true);
         </script>
      </div>
      <div style="height: 20px;">
      </div>
      <h1>
         <span class="titleBbg"><span class="title">积分兑换道具记录：</span><span class="more"><a href="<%=Url.Action("toolrecord") %>" target="_blank"><img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="absmiddle" /></a></span></span></h1>
      <div class="toolRecord" id="toolRecord_div">
         <script language="javascript" type="text/javascript">
            var c = new ToolRecords('<%=Url.Action("GetPersonalToolRecordsSummary") %>', '', 'toolRecord_div');
            c.loadToolRecordsList(1, true);
         </script>
      </div>
      <div style="height: 20px;">
      </div>
      <h1>
         <span class="titleBbg"><span class="title">积分兑换实物记录：</span><span class="more"><a href="<%=Url.Action("kindrecord") %>" target="_blank"><img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="absmiddle" /></a></span></span></h1>
      <div class="kindRecord" id="kindRecord_div">
         <script language="javascript" type="text/javascript">
            var c = new KindRecords('<%=Url.Action("GetPersonalKindRecordsSummary") %>', '', 'kindRecord_div');
            c.loadKindRecordsList(1, true);
        </script>
      </div>
      <div style="height: 20px; clear: both;">
      </div>
      <h1>
         <span class="titleBbg"><span class="title">新手卡兑换记录：</span><span class="more"><a href="<%=Url.Action("newcardrecord") %>" target="_blank"><img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="absmiddle" /></a></span></span></h1>
      <div class="newcardRecord" id="newcardRecord_div">
         <script language="javascript" type="text/javascript">
            var c = new NewCardRecords('<%=Url.Action("GetPersonalNewCardRecordsSummary") %>', '', 'newcardRecord_div');
            c.loadNewCardRecordsList(1, true);
          </script>
      </div>
      <div style="height: 20px;">
      </div>
      <h1>
         <span class="titleBbg"><span class="title">活动卡兑换记录：</span><span class="more"><a href="<%=Url.Action("eventrecord") %>" target="_blank"><img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="absmiddle" /></a></span></span></h1>
      <div class="eventRecord" id="eventRecord_div">
         <script language="javascript" type="text/javascript">
            var c = new EventRecord('<%=Url.Action("GetPersonalEventCardRecordsSummary")%>', '', 'eventRecord_div');
            c.loadEventRecordList(1, true);
         </script>
      </div>
   </div>
</div>
</asp:Content>
