<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<script src="/Scripts/scoresite/score_newcardrecord.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      ����λ�ã�<a href="<%=Url.Action("index") %>">��ҳ</a>
      &gt;&gt; <a href="<%=Url.Action("personal") %>">��������</a>
      &gt;&gt; ���ֿ��һ���¼</div>
   <div class="kindTools">
      <h1>
         <span class="titleBbg"><span class="title">���ֿ��һ���¼��</span></span></h1>
      <div class="newcardRecord" id="newcardRecord_div">
          <script language="javascript" type="text/javascript">
             var c = new NewCardRecords('<%=Url.Action("GetNewCardRecords") %>', '', 'newcardRecord_div');
             
             var p = new PagerMan({
                onFirstPageClick: function(pg) { $("#pager_div").html(''); c.loadNewCardRecordsList(pg) },
                onLastPageClick: function(pg) { $("#pager_div").html(''); c.loadNewCardRecordsList(pg) },
                onPrevPageClick: function(pg) { $("#pager_div").html(''); c.loadNewCardRecordsList(pg) },
                onNextPageClick: function(pg) { $("#pager_div").html(''); c.loadNewCardRecordsList(pg) },
                onPageClick: function(pg) { $("#pager_div").html(''); c.loadNewCardRecordsList(pg) },
                onGoPageClick: function() { var pg = document.getElementById(p.cfg.goToPageId).value; $("#pager_div").html(''); c.loadNewCardRecordsList(pg) }
             });
             c.loadNewCardRecordsList(1);
          </script>
      </div>
      <div style="height: 20px;">&nbsp;</div>
      <div class="meneame" id="pager_div"></div>
   </div>
</div>
</asp:Content>
