<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="nyMain">
   <div class="myLocation">
      您的位置：<a href="<%=Url.Action("index") %>">首页</a>
      &gt;&gt; 新闻详情</div>
   <div class="newsContent">
<%
   var news = ViewData["one_news_details"] as News;
   if (news != null)
   {
%>
      <h2><%=news.TITLE %></h2>
      <p><%=news.CONTENT %></p>      
<%
   }   
%>
   </div>
</div>
</asp:Content>
