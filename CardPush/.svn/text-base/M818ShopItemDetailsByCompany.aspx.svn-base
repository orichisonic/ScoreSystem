<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<link href="/Content/css/m818Common_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818Common_buz_shop.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/m818ProductManage_ProductInfo.css" rel="stylesheet" type="text/css" /> 

<style type="text/css">
#Div2, #Div4
{border:solid 0px red;color:#555;font-size:12px;padding:8px;}
#Div2
{border-bottom:solid 0px #eee;}
</style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
   <div class="divShopMain_Right_Work">
    <!--#include file='m818topshotcut.htm' -->
   </div>
   <div class="divShopMain_Right_ProductTitle">
      产品详细信息<input name="hidProductID" id="hidProductID" value="1002" type="hidden" />
   </div>
   <div class="divShopMain_Right_BaseInfo" style="height:120px;">
      <div class="divShopMain_Right_BaseInfo_Photo" style="width:155px;height:110px;">
         <a id="hlPhoto" href="javascript:;">
         <img alt="pic" src='/Content/images/cardpush/gc/<%= ViewData["pic"] %>' style="border-width: 0px;" border="0" /></a>
      </div>
      <ul class="ulShopMain_Right_BaseInfo_Content">
         <li id="liProduct_Name" class="liShopMain_Right_BaseInfo_Content_Name">
            <%= ViewData["cname"].ToString()%>
         </li>
      </ul>
   </div>
   <ul class="ulShopMain_Right_Tag">
      <li class="liShopMain_Right_Tag_Title">
         商品信息列表
      </li>
   </ul>
   <table class="tabList_Header" cellpadding="4" cellspacing="0" border="0">
      <tbody>
         <tr class="trList_Header_Item">
            <td class="tdList_Header_Item_MerchandiseName" style="text-align:left;">
               产品名称
            </td>
            <td class="tdList_Header_Item_ParPrice" style="text-align:left;width:240px;">
               所需积分
            </td>
            <%--<td class="tdList_Header_Item_SalePrice">
               销售价
            </td>
            <td class="tdList_Header_Item_CostPrice">
               进货价
            </td>--%>
            <td class="tdList_Header_Item_StockNum" style="text-align:left;">
               库存情况
            </td>
            <td class="tdList_Header_Item_Buy" style="text-align:center;width:150px;">
               兑换
            </td>
         </tr>
      </tbody>
   </table>
   <input type="hidden" value='<%= ViewData["cid"] %>' id="cid" />
   <div class="divList_Loading" id="divList_Loading" style="background-image: url(&quot;/content/images/cardpush/m818/Icon_0039.gif&quot;); display: block;">
      数据载入中，请稍候...</div>
   <div style="" id="ajaxDataList">
      <table class="tabList_Data" cellpadding="4" cellspacing="0">
         <tbody id="list_item_by_game">
             <%--<tr class="trList_Data_Item" onmouseover="this.className='trList_Data_OnMouse'" onmouseout="this.className='trList_Data_Item'">
              
               <td class="tdList_Data_Item_MerchandiseName">
                  <img alt="" src="/content/images/cardpush/m818/Icon_Main.gif" align="absMiddle" height="16" width="16" />
                  <img alt="" src="/content/images/cardpush/m818/Icon_MerchandiseType_Esale.gif" align="absMiddle" height="16" width="16" />
                  <a href="" class="link_007700_c">久游休闲卡3元</a>
               </td>
               <td class="tdList_Data_Item_ParPrice">
                  ￥3.00
               </td>
               <td class="tdList_Data_Item_SalePrice">
                  ￥3.00
               </td>
               <td class="tdList_Data_Item_CostPrice">
                  <span id="spanCostPrice_fbf46dc9-a9c4-43d8-a6ed-5e8e4797e83a_1000">******</span>
                  <input id="hidCostPrice_fbf46dc9-a9c4-43d8-a6ed-5e8e4797e83a_1000" value="1.56" type="hidden">
               </td>
               <td class="tdList_Data_Item_StockNum">
                  <span class="spanList_Data_Item_StockNum_Enough">充足</span>
               </td>
               <td class="tdList_Data_Item_Buy">
                  <a href="MerchandiseInfo.aspx?SupplierAgentID=1000&amp;MerchandiseGUID=fbf46dc9-a9c4-43d8-a6ed-5e8e4797e83a"><span class="spanList_Data_Item_Buy_Charge">官方直充</span></a>
               </td>
            </tr>
            <tr class="trList_Data_Alternating" onmouseover="this.className='trList_Data_OnMouse'" onmouseout="this.className='trList_Data_Alternating'">
               <td class="tdList_Data_Item_MerchandiseName">
                  <img src="http://Static.m818.com/Business.Shop/Image/Common/Icon_Main.gif" align="absMiddle" height="16" width="16"><img src="http://Static.m818.com/Common/Image/Icon_MerchandiseType_Esale.gif" alt="直充类商品" align="absMiddle" height="16" width="16"><a href="MerchandiseInfo.aspx?SupplierAgentID=1000&amp;MerchandiseGUID=7d7b0062-2730-48af-b2c8-658d559ad1d2" class="link_007700_c">久游休闲卡5元</a>
               </td>
               <td class="tdList_Data_Item_ParPrice">
                  ￥5.00
               </td>
               <td class="tdList_Data_Item_SalePrice">
                  ￥5.00
               </td>
               <td class="tdList_Data_Item_CostPrice">
                  <span id="spanCostPrice_7d7b0062-2730-48af-b2c8-658d559ad1d2_1000">******</span>
                  <input id="hidCostPrice_7d7b0062-2730-48af-b2c8-658d559ad1d2_1000" value="4.60" type="hidden">
               </td>
               <td class="tdList_Data_Item_StockNum">
                  <span class="spanList_Data_Item_StockNum_Less">较少</span>
               </td>
               <td class="tdList_Data_Item_Buy">
                  <a href="MerchandiseInfo.aspx?SupplierAgentID=1000&amp;MerchandiseGUID=7d7b0062-2730-48af-b2c8-658d559ad1d2"><span class="spanList_Data_Item_Buy_Charge">官方直充</span></a>
               </td>
            </tr>--%>            
         </tbody>
         <tfoot>
            <tr>
               <td colspan="4">&nbsp;</td>
            </tr>
            <tr align="right">
               <td colspan="4">
                  <div class="item_list_pager">第&nbsp;<span id="curr_page">1</span>&nbsp;页，共&nbsp;<span id="max_page">1</span>&nbsp;页&nbsp;&nbsp;<a href="javascript:;" onclick="companyPrevPage(this);return false;">上一页</a>&nbsp;<a href="javascript:;" onclick="companyNextPage(this);return false;">下一页</a>&nbsp;&nbsp;</div>
               </td>
            </tr>
            <tr>
               <td colspan="4">&nbsp;</td>
            </tr>
         </tfoot>
      </table>
      <table class="tabList_Button" cellspacing="0">
         <tbody>
            <tr>
               <td>
                  <input class="btnForm_Button_Cancel" value="返回商品购买页" onclick="location.href = '<%= Url.Action("M818ShopItemList") %>';" type="button" />
               </td>
            </tr>
         </tbody>
      </table>
   </div>
<input type="hidden" id="usr_score" value='<%=ViewData["userscore"].ToString() %>' />

<div id="hiddenModalContent" style="display:none;padding:0;margin:0;">
<ul style="border:solid 1px #eee;padding:3px;">
   <li style="text-align:right;"><a href="javascript:;" onclick="tb_remove();return false;">关闭</a></li>
  <li id="Div2">
     <span>请选择：</span>
     <span style="display:inline-block;width:50px;"></span>
     <input id="a" type="radio" name="user" value="是M818用户" onclick="getLetter()" />&nbsp;我是M818用户
     <span style="display:inline-block;width:80px;"></span>
     <input id="b" type="radio" name="user" value="不是M818用户" onclick="getLetter()" />&nbsp;我不是M818用户
  </li>
  <li id="Div4" style="display:none;">
      <div style="margin-bottom:13px;background-color:#eee;padding:3px;">请输入您已经注册的M818用户，我们将为您绑定久游帐号<input type="hidden" name="m818ID" id="m818ID" /></div>
      <div style="border-bottom:solid 1px #eee;margin-bottom:18px;padding-bottom:10px;">
         久游用户：<input class="input_type" maxlength="50" size="20" name="UserName" id="UserName" value="<%=Session["Account9you"]%>" />
         <span style="display:inline-block;width:70px;"></span>
         M818用户：<input class="input_type" maxlength="50" size="20" name="BankAccount" id="BankAccount" />
      </div>
      <div style="text-align:center;">
         <input type="image" id="BandM818" value="绑定帐号" onclick="BandUser()" src="/Content/css/images/pay3.gif" />
      </div>
  </li>
</ul>
</div>

</div>

<script type="text/javascript" language="javascript">

function companyPrevPage(tag) {
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

function companyNextPage(tag) {
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
   getDetailsByGame($("#cid").val(), 1, "true");
   setInterval(function() { getDetailsByGame($("#cid").val(), 1, "true"); }, 60000);
});

var table_column_count = 3;

function getDetailsByGame(cid, pg, isfirst) {
   var str = "";
   var usr_score = $("#usr_score").val() - 0;

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetProductDetail") %>',
      dataType: "json",
      data: {
         ProductCategoryID: cid, 'page': pg, 'isfirst': isfirst
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
                 + '<td class="tdList_Data_Item_ParPrice" style="text-align:left;width:240px;">'
                 + json.rows[ii].cell[4] + '</td>'
                 + '<td class="tdList_Header_Item_StockNum">'
                 + json.rows[ii].cell[5] + '</td>'
                 + '<td  class="tdList_Header_Item_StockNum" style="text-align:center;width:120px;">'

            if (usr_score > json.rows[ii].cell[4]) {

               str += "<a href='javascript:;'  onclick=\"Summit('"
                                        + json.rows[ii].cell[0] + "','"
                                        + json.rows[ii].cell[1] + "','"
                                        + json.rows[ii].cell[4] + "')\"><img border='0' width='80' height='20' src='/Content/images/cardpush/lq.gif' /></a></td>";
            }
            else {
               str += "<a href='javascript:;'><img border='0' width='80' height='20' src='/Content/images/cardpush/lq_enable.gif' /></a></td>";
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


function Summit(ProductID, ProductName, ProductScore) {

   var name = $("#login_uaccount").text();
   if ($.trim(name) == "") {
      alert("用户没有登陆9you帐号，请先登陆！");
      return false;
   }
   url = '<%= Url.Action("CheckM818User") %>';

   $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: {
         //ACCOUNT: name,
         PRODUCTID: ProductID,
         PRODUCTNAME: ProductName
         //PRODUCTSCORE: ProductScore
      },
      success: submitSuccessed
   });
}

function submitSuccessed(result) {
   if (result == 0) {
      alert("用户未绑定M818帐号！");
      tb_show("", "#TB_inline?height=210&width=620&inlineId=hiddenModalContent&modal=true", "thickbox");
   }
   else if (result == 1) {
      window.location.href = '<%= Url.Action("ItemInfo") %>';
   }
   else {
      alert("无法兑换商品！");
   }
}

function getLetter() {
   if ($('[name="user"][checked=true]:radio').val() == "是M818用户") {
      $("#Div4").fadeIn("fast");
   }
   else {
      alert("请点确定注册M818帐号！");
      window.location.href = '<%= Url.Action("M818Regist") %>';
   }
}
//绑定M818帐号
function BandUser() {
   var m818user = $("#BankAccount").val();
   var name = $("#login_uaccount").text();
   if (m818user == "") {
      alert("请输入需要绑定的M818用户");
      return false;
   }
   url = '<%= Url.Action("BandM818User") %>';
   
   $.ajax({
      url: url,
      type: "POST",
      dataType: "text",
      data: {
         //account: name,
         m818user: m818user
      },
      success: submitSuccessed
   });

   function submitSuccessed(msg) {
      if (msg == 1) {
         alert("您的帐号已经绑定，请重新选择您需要的商品！");
         window.location.href = '<%= Url.Action("M818ShopItemList") %>';
      }
      else if (msg == 2) {
         alert("您输入的帐号不存在！");
      }
      else {
         alert("帐号绑定失败！");
      }
   }
}
</script>

</asp:Content>