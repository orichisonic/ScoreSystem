<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<link href="/Content/css/m818Common_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818Common_buz_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818ProductManage_ProductList.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/Scripts/cardpush/VirtualPath.koc"></script>

<script type="text/javascript" src="/Scripts/cardpush/m818Common.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/EmployeeListObj.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/EmployeeListBind.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/ClueWindow.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/DialogParent.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/Message.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/User_AgentInfoForClueWindow.js"></script>

<script type="text/javascript" src="/Scripts/cardpush/LeftFile.js"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="divShopMain_Right_Work">
      <!--#include file='m818topshotcut.htm' -->
   </div>
   <div class="divShopMain_Right_ClassList">

      <ul class="ulShopMain_Right_ClassList_Header">
         <li class="liShopMain_Right_ClassList_Header_Now" onclick="selectTab('divClass_1000');" id="liClass_1000">
            网络游戏</li>
         <%--<li class="liShopMain_Right_ClassList_Header_Now" onclick="selectTab('div_game_item');" id="li1">
            游戏道具</li>--%>
      </ul>
      
      <div id="divClass_1000">
         <ul class="ulShopMain_Right_ClassList_Tag">
            <li class="liShopMain_Right_ClassList_Tag_Title">游戏厂商</li>
            <li class="liShopMain_Right_ClassList_Tag_More">&nbsp;</li>
         </ul>
         <table cellspacing="0" cellpadding="4" class="tabShopMain_Right_ClassList_Data">
            <tbody id="m818_game_company_list">
               <tr class="trShopMain_Right_ClassList_Data_Row">
                  <td class="" colspan="4">
                     <div class="divList_Loading" id="divList_Loading1" style="background-image: url('/content/images/cardpush/m818/Icon_0039.gif'); display: block;"></div>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
      <div id="div_game_item" style="display:none;">
         <ul class="ulShopMain_Right_ClassList_Tag">
            <li class="liShopMain_Right_ClassList_Tag_Title">大型网游</li>
            <li class="liShopMain_Right_ClassList_Tag_More">&nbsp;</li>
         </ul>
         <table cellspacing="0" cellpadding="4" class="tabShopMain_Right_ClassList_Data">
            <tbody id="m818_game_list">
               <tr class="trShopMain_Right_ClassList_Data_Row">
                  <td class="" colspan="4">
                     <div class="divList_Loading" id="divList_Loading2" style="background-image: url('/content/images/cardpush/m818/Icon_0039.gif'); display: block;"></div>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <!-- END divShopMain_Right_ClassList -->
<input type="hidden" id="show_game_tab" value="<%= ViewData["show_game"] %>" />
<form action="<%= Url.Action("M818ShopItemDetailsByGame") %>" name="gotolistbygame" id="gotolistbygame" method="post">
   <input type="hidden" name="gid" id="gid" />
   <input type="hidden" name="gname" id="gname" />
   <input type="hidden" name="pic" id="pic" />
</form>
<form action="<%= Url.Action("M818ShopItemDetailsByCompany") %>" name="gotolistbycmp" id="gotolistbycmp" method="post">
   <input type="hidden" name="cid" id="cid" />
   <input type="hidden" name="cname" id="cname" />
   <input type="hidden" name="pic" id="cpic" />
</form>
</div>
<script type="text/javascript" language="javascript">

$(function() {
   if ($("#show_game_tab").val() == "show_game") {
      selectTab('div_game_item');
   }
   else {
      selectTab('divClass_1000');
   }
});

function selectTab(id) {
   $("#divClass_1000").css("display", "none");
   $("#div_game_item").css("display", "none");
   $("#" + id).css("display", "block");
}

var table_column_count = 4;

$(function() {
   getGameCompany();
   getGameList();
});

function getGameCompany() {
   var str = "";

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetProductCategory") %>',
      dataType: "json",
      success: function(json) {
         $("#divList_Loading1").css("display", "none");
         try {
            for (ii = 0; ii < json.rows.length; ++ii) {

               if (ii % table_column_count == 0) {

                  if ((ii / table_column_count) % 2 == 0) {
                     str += '<tr class="trShopMain_Right_ClassList_Data_Row">';
                  }
                  else {
                     str += '<tr class="trShopMain_Right_ClassList_Data_Alternating">';
                  }
               }

               str += '<td class="tdShopMain_Right_ClassList_Data_Row_Item"><a class="link_4C4C4C_c" href="javascript:;" onclick="'
            + "goToListByCompany('','" + json.rows[ii].cell[0] + "','" + json.rows[ii].cell[1] + "','" + json.rows[ii].cell[2] + "');return false;"
               + '">' + json.rows[ii].cell[1] + '</a></td>';

               if (ii % table_column_count == table_column_count - 1) {
                  str += '</tr>';
               }
            }

            if (json.rows.length % table_column_count != 0) {
               var fill = table_column_count - json.rows.length % table_column_count;
               for (ii = 0; ii < fill; ++ii) {
                  str += '<td class="tdShopMain_Right_ClassList_Data_Row_Item">&nbsp;</td>';
               }
               str += '</tr>';
            }

            $("#m818_game_company_list").html(str);
         } catch (ex) {

         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#divList_Loading1").css("display", "none");
      }
   });
}

function getGameList() {
   return;
   var str = "";
   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetGameList") %>',
      dataType: "json",
      success: function(json) {
         $("#divList_Loading2").css("display", "none");
         try {
            for (ii = 0; ii < json.rows.length; ++ii) {

               if (ii % table_column_count == 0) {

                  if ((ii / table_column_count) % 2 == 0) {
                     str += '<tr class="trShopMain_Right_ClassList_Data_Row">';
                  }
                  else {
                     str += '<tr class="trShopMain_Right_ClassList_Data_Alternating">';
                  }
               }

               str += '<td class="tdShopMain_Right_ClassList_Data_Row_Item"><a class="link_4C4C4C_c" href="javascript:;" onclick="'
               + "goToListByGame('','" + json.rows[ii].cell[0] + "','" + json.rows[ii].cell[1] + "','" + json.rows[ii].cell[2] + "');return false;"
               + '">' + json.rows[ii].cell[1] + '</a></td>';

               if (ii % table_column_count == table_column_count - 1) {
                  str += '</tr>';
               }
            }

            if (json.rows.length % table_column_count != 0) {
               var fill = table_column_count - json.rows.length % table_column_count;
               for (ii = 0; ii < fill; ++ii) {
                  str += '<td class="tdShopMain_Right_ClassList_Data_Row_Item">&nbsp;</td>';
               }
               str += '</tr>';
            }

            $("#m818_game_list").html(str);
         } catch (ex) { 
            
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#divList_Loading2").css("display", "none");
      }
   });
}

function goToListByGame(url, gid, gname, pic) {

   $("#gid").val(gid);
   $("#gname").val(gname);
   $("#pic").val(pic);

   document.gotolistbygame.submit();
}

function goToListByCompany(url, cid, cname, pic) {

   $("#cid").val(cid);
   $("#cname").val(cname);
   $("#cpic").val(pic);

   document.gotolistbycmp.submit();
}

</script>
</asp:Content>
