<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<style type="text/css">
   #point_details_table
   {
      width: 620px;
      color: #555;
      margin-top: 5px;
      font-size: 12px;
   }
   #point_details_table_head
   {
      height: 23px;
      margin: 5px;
   }
   .point_details_table_tr
   {
      height: 25px;
   }
   
   #point_details_table tbody td, #point_details_table thead td
   {border-top:dotted 1px #ddd;text-align:left;}
   
   #point_details_table tfoot a,  #point_details_table tfoot span
   {
   	font-size:12px;
   	color:#888;
   	margin:5px 5px 0 0;
   }
   
</style>

<script type="text/javascript" language="javascript">

$(document).ready(function() {

   getPointDetails(1);
});

function pointDetailsPrevPage(tag) {
   var curr = $("#curr_page").text() - 0;
   var pg = curr - 0 - 1;

   if (curr <= 1) {
      return;
   }

   if (pg <= 1) {
      pg = 1;
   }

   $("#curr_page").text(pg);

   getPointDetails(pg);
}

function pointDetailsNextPage(tag) {
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

   getPointDetails(pg);
}

function getPointDetails(pg) {

   $("#exchange_log_loading").html("<div style='color:#888;padding-top:35px;padding-left:10px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />加载中，请稍后...</div>");

   var name = $("#login_uaccount").text();

   if ($.trim(name) == "") {
      $("#exchange_log_loading").html('');
      return;
   }

   $.ajax({
      type: "POST",
      url: '<%=Url.Action("GetPointDetails") %>',
      data: { 'page': pg },
      dataType: "json",
      success: function(myJSON) {
         $("#exchange_log_loading").html('');

         if (myJSON == "") {
            $("#point_details_div").html("用户暂未登录。");

         } else {

            $("#max_page").val(myJSON.MaxPage);
            var ignoreColumn = [0, 2, 7];

            var details = "<table id='point_details_table' border='0' cellspacing='0' cellpadding='0'><thead><tr id='point_details_table_head'><td width='80'>用户编号</td><td width='80'>获得游戏</td><td width='290'>活动</td><td width='70'>获得积分</td><td width='80'>获得日期</td><td width='65'>到期日期</td></tr></thead>";

            details += ParseJsonObjectToTableBody(myJSON, ignoreColumn, "class='point_details_table_tbody'", "class='point_details_table_tr'", "calss='point_details_table_td'");

            if (myJSON.MaxPage > 1) {
               details += "<tfoot><tr><td colspan='6'>&nbsp;</td></tr><tr><td>" + "<span id='curr_page'>" + myJSON.CurrPage + "</span><span>/</span><span id='max_page'>" + myJSON.MaxPage + "</span></td><td colspan='5' align='right'><a onclick='pointDetailsPrevPage(this);return false;' href='javascript:;' title='上一页'>上一页</a><a href='javascript:;' onclick='pointDetailsNextPage(this);return false;' title='下一页'>下一页</a></tr></tfoot>";
            }

            details += "</table>";

            $("#point_details_div").html(details);
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#point_details_div").html("没有更多详细信息。");
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
               <b class="c3">积分详情</b>
            </div>
            <div id="point_details_div">
            </div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
</div>
</asp:Content>
