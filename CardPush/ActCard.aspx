<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="rt">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2 p38 pb40">
            <div class="lh25 f2 borderb pt20">
               选择活动卡立即领取</div>
            <div class="mt20 lh25 f2 pl40 cardlist">
               <tr>
                  <td>
                     <a href="<%=Url.Action("dnhssnew") %>">
                     <img alt="" src="/content/images/cardpush/dnh/dhcard.jpg" width="296" height="100" border="0" /></a>
                  </td>
                  <td>
                     <a href="<%=Url.Action("aubaijin") %>" target="_blank">
                     <img alt="" src="/content/images/cardpush/baijin_card.jpg" width="296" height="100" border="0" /></a>
                  </td>
               </tr>
               <tr>
                  <td>
                     <a href="<%=Url.Action("auhlj") %>" target="_blank">
                     <img alt="" src="/content/images/cardpush/card_au_hlj.jpg" width="296" height="100" border="0" /></a>
                  </td>
                  <td>
                     <a href="<%=Url.Action("auhb") %>" target="_blank">
                     <img alt="" src="/content/images/cardpush/card003.jpg" width="296" height="100" border="0" /></a>
                  </td>
               </tr>
               <tr>
                  <td>
                     
                  </td>
                  <td>
                     
                  </td>
               </tr>
               <tr>
                  <td>
                     
                  </td>
                  <td>
                     
                  </td>
               </tr>
             
            </div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
</div>
</asp:Content>
