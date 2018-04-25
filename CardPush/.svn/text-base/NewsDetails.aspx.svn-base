<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="news">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2 p20">
            <div class="newsdetails ">
               
               
              <% 
                 News item = null;
                 if ((item = (ViewData["one_news_details"] as News)) != null)
                 {
                    
             %>      
                     <div class="title">
                        <h1><%= Html.Encode(item.TITLE) %></h1>
                        <span class="c2"><%= Html.Encode(item.TIME) %></span>
                     </div>
                     <div class="lh25 text"><%=item.CONTENT%></div>
             <%
                 }
                 else
                 {
              %>
                     <div class="title">
                        <h1 style="color:#888;">N/A</h1>
                        <span class="c2">N/A</span>
                     </div>
                     <div class="lh25 text"></div>
              <%
                 }  
              %>
               
            </div>
         </li>
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>
</asp:Content>
