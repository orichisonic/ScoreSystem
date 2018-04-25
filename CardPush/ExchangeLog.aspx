<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<style type="text/css">
   #exchange_log_table
   {
      width: 620px;
      color: #555;
      margin-top: 5px;
      font-size: 12px;
   }
   #exchange_log_table_head
   {
      height: 23px;
      margin: 5px;
   }
   .exchange_log_table_tr
   {
      height: 25px;
   }
   
    #exchange_log_table tbody td, #exchange_log_table thead td
   {border-top:dotted 1px #ddd;text-align:left;}
   
   #exchange_log_table tfoot a, #exchange_log_table tfoot span
   {
   	font-size:12px;
   	color:#888;
   	margin:5px 7px 0 0;
   }

</style>

<script type="text/javascript" language="javascript">

$(document).ready(function() {
   getExchangeLog(1);
});


function exLogPrevPage(tag) {
   var curr = $("#curr_page").text() - 0;

   if (curr <= 1) {
      return;
   }
   
   var pg = curr - 0 - 1;

   if (pg <= 1) {
      pg = 1;
   }

   $("#curr_page").text(pg);

   getExchangeLog(pg);
}

function exLogNextPage(tag) {
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

   getExchangeLog(pg);
}

function getExchangeLog(pg) {

   $("#exchange_log_loading").html("<div style='color:#888;padding-top:35px;padding-left:10px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />加载中，请稍后...</div>");

   var name = $("#login_uaccount").text();
   
   if ($.trim(name) == "") {
      $("#exchange_log_loading").html('');
      return;
   }

   $.ajax({
      type: "POST",
      url: '<%=Url.Action("GetExchangeLog") %>',
      data: { 'page': pg },
      dataType: "json",
      success: function(myJSON) {
      $("#exchange_log_loading").html('');

         if (myJSON == "") {
            
            $("#exchange_log_div").html("用户暂未登录。");
         }
         else {
            $("#max_page").val(myJSON.MaxPage);
            var ignoreColumn = [];
            var log = "<table id='exchange_log_table' border='0'  cellspacing='0' cellpadding='0'><thead><tr id='exchange_log_table_head'><td width='150'>物品名称</td><td width='80'>类别</td><td width='60'>花费积分</td><td width='60'>兑换数量</td><td width='120'>日期</td><td width='50'>状态</td></tr></thead>";

            log += ParseJsonObjectToTableBody(myJSON, ignoreColumn, "class='point_details_table_tbody'", "class='exchange_log_table_tr'", "calss='point_details_table_td'");

            if (myJSON.MaxPage > 1) {
               log += "<tfoot><tr><td colspan='6'>&nbsp;</td></tr><tr><td><span id='curr_page'>" + myJSON.CurrPage + "</span><span>/</span><span id='max_page'>" + myJSON.MaxPage + "</span></td><td colspan='5' align='right'><a onclick='exLogPrevPage(this);return false;' href='javascript:;' title='上一页'>上一页</a><a href='javascript:;' onclick='exLogNextPage(this);return false;' title='下一页'>下一页</a></tr></tfoot>";
            }

            log += "</table>";

            $("#exchange_log_div").html(log);
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#exchange_log_div").html("没有更多详细信息。");
         $("#exchange_log_loading").html('');
      }
   });
}

</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="right width703">
   <div class="scoretitle"><span id="exchange_log_loading"></span>
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2 conv_li">
            <div class="conv1 borderb f2">
               <b class="c3">兑换记录</b>
            </div>
            <div id="exchange_log_div">
            </div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
</div>
</asp:Content>
