<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 活动卡领奖</div>
   <div class="eventCard">
      <h1>
         <span>点击选择活动卡：</span></h1>
      <div class="eventCardContent">
         <div class="cardFl">
            <a href="<%=Url.Action("sdofs") %>" target="_blank">
            <img alt="" src="/content/images/cardpush/card_new1.jpg" width="287" height="100" /></a><br />
            活动卡适用时间段：2010/06/17-2010/12/31
         </div>
          <div class="cardFl">
            <a href="<%=Url.Action("ausummer") %>" target="_blank">
            <img alt="" src="/content/images/cardpush/AUclothcard.jpg" width="287" height="100" /></a><br />
            活动卡适用时间段：2010/08/11-2011/5/31
         </div>
         <div class="meneame"></div>
      </div>
   </div>
</div>
</asp:Content>
