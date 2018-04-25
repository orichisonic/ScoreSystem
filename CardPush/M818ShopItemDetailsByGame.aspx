<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<link href="/Content/css/m818Common_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818Common_buz_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818ProductManage_ProductInfo.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="divShopMain_Right_Work">
    <!--#include file='m818topshotcut.htm' -->
    <input type="hidden" value='<%= ViewData["gid"] %>' id="gid" />
   </div>
   <div class="divShopMain_Right_ProductTitle">
      ��Ʒ��ϸ��Ϣ<input name="hidProductID" id="hidProductID" value="1002" type="hidden" />
   </div>
   <div class="divShopMain_Right_BaseInfo" style="height:145px;">
      <div class="divShopMain_Right_BaseInfo_Photo" style="width:136px;height:136px;">
         <a id="hlPhoto" href="javascript:;">
         <img alt="" src='/Content/images/cardpush/<%= ViewData["pic"] %>' style="border-width: 0px;"  border="0"/></a>
      </div>
      <ul class="ulShopMain_Right_BaseInfo_Content">
         <li id="liProduct_Name" class="liShopMain_Right_BaseInfo_Content_Name">
            <%= ViewData["gname"].ToString()%>
         </li>
      </ul>
   </div>
   <ul class="ulShopMain_Right_Tag">
      <li class="liShopMain_Right_Tag_Title">
         ��Ʒ��Ϣ�б�
      </li>
   </ul>
   <table class="tabList_Header" cellpadding="4" cellspacing="0" border="0">
      <tbody>
         <tr class="trList_Header_Item">
            <td class="tdList_Header_Item_MerchandiseName" style="text-align:left;">
               ��Ʒ����
            </td>
            <td class="tdList_Header_Item_ParPrice" style="text-align:left;width:280px;">
               �������
            </td>
            <td class="tdList_Header_Item_Buy" style="text-align:left;width:100px;">
               �һ�
            </td>
         </tr>
      </tbody>
   </table>
   <div class="divList_Loading" id="divList_Loading" style="background-image: url(&quot;/content/images/cardpush/m818/Icon_0039.gif&quot;); display: block;">
      ���������У����Ժ�...</div>
   <div style="" id="ajaxDataList">
      <table class="tabList_Data" cellpadding="4" cellspacing="0">
         <tbody id="list_item_by_game">
                       
         </tbody>
         <tfoot>
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr align="right">
               <td colspan="3">
                  <div class="item_list_pager">��&nbsp;<span id="curr_page">1</span>&nbsp;ҳ����&nbsp;<span id="max_page">1</span>&nbsp;ҳ&nbsp;&nbsp;<a href="javascript:;" onclick="gameItemPrevPage(this);return false;">��һҳ</a>&nbsp;<a href="javascript:;" onclick="gameItemNextPage(this);return false;">��һҳ</a>&nbsp;&nbsp;</div>
               </td>
            </tr>
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
         </tfoot>
      </table>
      <table class="tabList_Button" cellspacing="0">
         <tbody>
            <tr>
               <td>
                  <input class="btnForm_Button_Cancel" value="������Ʒ����ҳ" onclick="location.href = '<%= Url.Action("M818ShopItemList") %>';" type="button" />
               </td>
            </tr>
         </tbody>
      </table>
   </div>
<input type="hidden" id="usr_score" value='<%=ViewData["userscore"].ToString() %>' />
</div>

<script type="text/javascript" language="javascript">

function gameItemPrevPage(tag) {
   var curr = $("#curr_page").text() - 0;
   
   if (curr <= 1) {
      return;
   }

   var pg = curr - 0 - 1;

   if (pg <= 1) {
      pg = 1;
   }

   $("#curr_page").text(pg);

   getDetailsByGame($("#gid").val(), pg, "false");
}

function gameItemNextPage(tag) {
   var curr = $("#curr_page").text() - 0;
   var max = $("#max_page").text() - 0;
   var pg = curr - 0 + 1;

   if (curr >= max) {
      return;
   }

   if (pg >= max) {
      pg = max;
   }

   $("#curr_page").text(pg);

   getDetailsByGame($("#gid").val(), pg, "false");
}

$(function() {
   getDetailsByGame($("#gid").val(), 1, "true");
   setInterval(function() { getDetailsByGame($("#gid").val(), 1, "true"); }, 60000);
});

var table_column_count = 3;

function getDetailsByGame(gameID, pg, isfirst) {

   var str = "";
   var usr_score = $("#usr_score").val() - 0;

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetGameItemDetail") %>',
      dataType: "json",
      data: {
         GameID: gameID, 'page': pg, 'isfirst':isfirst
      },
      success: function(json) {

         $("#divList_Loading").css("display", "none");

         if (json == "") {

            return;
         }

         for (ii = 0; ii < json.rows.length; ++ii) {

            if (ii % 2 == 0) {
               str += "<tr class='trList_Data_Item' onmouseover=\"this.className='trList_Data_OnMouse'\" onmouseout=\"this.className='trList_Data_Item'\">";
            }
            else {
               str += "<tr class='trList_Data_Alternating' onmouseover=\"this.className='trList_Data_OnMouse'\" onmouseout=\"this.className='trList_Data_Alternating'\">";
            }

            str += '<td class="tdList_Data_Item_MerchandiseName" style="text-align:left;">'
                 + '<img border="0" alt="" src="/content/images/cardpush/m818/Icon_Main.gif" align="absMiddle" height="16" width="16" />'
                 + '<img border="0" alt="" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" align="absMiddle" height="16" width="16" />'
                 + '<span class="link_007700_c">' + json.rows[ii].cell[1] + '</span></td>'
                 + '<td class="tdList_Data_Item_ParPrice" style="text-align:left;width:280px;">'
                 + json.rows[ii].cell[5] + '</td>'
                 + '<td>';

            if (usr_score > json.rows[ii].cell[5]) {

               str += '<a href="javascript:;" onclick="SummitGameItem(' + json.rows[ii].cell[0] + ',' + json.rows[ii].cell[3] + ');return false;" ><img border="0" width="80" height="20" src="/Content/images/cardpush/lq.gif" /></a></td>';
            }
            else {
               str += '<a href="javascript:;" onclick="javascript:noPoint();return false;" ><img border="0" width="80" height="20" src="/Content/images/cardpush/lq_enable.gif" /></a></td>';
            }


            str += '</tr>';
         }

         $("#list_item_by_game").html(str);
         $("#curr_page").text(json.CurrPage);
         $("#max_page").text(json.MaxPage);

      },
      error: function(XMLHttpRequest, textStatus) {
         $("#divList_Loading").css("display", "none");
      }
   });
}

function noPoint() {
   alert("��û���㹻�Ļ��֣�");
}

function SummitGameItem(strID, strGameID) {

   var name = $("#login_uaccount").text();
   if ($.trim(name) == "") {
      alert("�û�û�е�½9you�ʺţ����ȵ�½��");
      return false;
   }
   
   url = '<%= Url.Action("SendGameItemID") %>';
   $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: {
         //ACCOUNT: name,
         ID: strID,
         GameID: strGameID
      },
      success: submitGameItemSuccessed
   });
}

function submitGameItemSuccessed(result) {

   window.location.href = '<%= Url.Action("NineyouItemInfo") %>';
}

</script>
</asp:Content>
