<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<script type="text/javascript">

$(function() {
   getNews(1);
});

function newsPrevPage(tag) {
   var curr = $("#curr_page").text() - 0;

   if (curr <= 1) {
      return;
   }

   var pg = curr - 1;

   if (pg <= 1) {
      pg = 1;
   }

   $("#curr_page").text(pg);

   getNews(pg);
}

function newsNextPage(tag) {
   var curr = $("#curr_page").text() - 0;
   var max = $("#max_page").text() - 0;
   var pg = curr + 1;

   if (curr >= max) {
      return;
   }

   if (pg >= max) {
      pg = max;
   }

   $("#curr_page").text(pg);

   getNews(pg);
}

function getNews(pg) {

   $("#news_page").html("<div style='color:#888;padding-top:20px;padding-left:30px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />&nbsp;loading...</div>");
   $.ajax({
      url: '<%=Url.Action("GetIndexNews") %>',
      type: "POST",
      dataType: "json",
      data: { pageSize: 28, page: pg },
      success: function(myJSON) {
         try {
            var news = ParseNews(myJSON);

            if (news == "") {
               $("#news_page").html('<ul class="lh25  p20"><li>暂无更多新闻。</li></ul>');
               return;
            }

            if (myJSON.MaxPage > 1) {
               news += '<li><div class="item_list_pager">第&nbsp;<span id="curr_page">1</span>&nbsp;页，共&nbsp;<span id="max_page">1</span>&nbsp;页&nbsp;&nbsp;<a href="javascript:;" onclick="newsPrevPage(this);return false;">上一页</a>&nbsp;<a href="javascript:;" onclick="newsNextPage(this);return false;">下一页</a>&nbsp;&nbsp;</div></li>';
            }

            $("#news_page").html(news);
            $("#curr_page").text(myJSON.CurrPage);
            $("#max_page").text(myJSON.MaxPage);
         }
         catch (ex) {
            $("#news_page").html('<ul class="lh25  p20"><li>暂无更多新闻。</li></ul>');
         }
      }
      ,
      error: function(XMLHttpRequest, textStatus) {
         $("#news_page").html('<ul class="lh25  p20"><li>暂无更多新闻。</li></ul>');
      }
   });
}


function ParseNews(json_data) {
   
   if (json_data == "" || json_data.rows.length == 0) {
      return "";
   }  
    var str = '<ul class="lh25 noticeli p20">';
    for (r = 0; r < json_data.rows.length; r++) {
    
        str += "<li>";

        str += "<span>" + json_data.rows[r].Time + "</span>&nbsp;<a href='";
         
        if ($.trim(json_data.rows[r].Link) == "") {
           str += '<%= Url.Action("newsdetails") %>/' + json_data.rows[r].Id;
        }
        else { 
            str += json_data.rows[r].Link;
        }
        str += "' target='_blank'>" + json_data.rows[r].Title + "</a>";

        str += "</li>";
    }
    
    str += "</ul>";
      
    return str;
}

</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="news">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2" id="news_page"></li>
         
         <li class="lib"></li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>
</asp:Content>
