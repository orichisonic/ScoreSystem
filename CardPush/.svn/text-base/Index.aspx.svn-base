<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/CarPush.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<script type="text/javascript">

$(function() {

   $("#news_index").html("<div style='color:#888;padding-top:30px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />&nbsp;loading...</div>");
   $.ajax({
      url: '<%=Url.Action("GetIndexNews") %>',
      type: "POST",
      dataType: "json",
      data: { pageSize: 6 },
      success: function(myJSON) {

         $("#news_index").html(ParseNews(myJSON));
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#news_index").html("<br />暂无更多新闻。");
      }
   });

});

$(function() {

   $("#index_act_left").html("<div style='color:#888;padding-top:30px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />&nbsp;loading...</div>");
   $("#index_act_right").html("<div style='color:#888;padding-top:30px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />&nbsp;loading...</div>");

   var str = "";

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("IndexAction") %>',
      dataType: "json",
      success: function(json) {

         if (json == "") {
            $("#index_act_left").html("暂无更多活动。");
            $("#index_act_right").html("");
            return;
         }

         if (json.rows.length > 0) {

            str += '<li><span class="c2">活 动 名：</span>' + json.rows[0].cell[0] + '</li>';
            str += '<li><span class="c2">活动简介：</span>' + json.rows[0].cell[1] + '</li>';
            str += '<li><span class="c2">活动时间：</span>' + json.rows[0].cell[2] + '&nbsp;-&nbsp;' + json.rows[0].cell[7] + '</li>';
            str += '<li><a href="' + json.rows[0].cell[4] + '" target="_blank"><img alt="" src="/Content/images/cardpush/detail.gif" width="80" height="20" border="0" /></a></li>'

            $("#index_act_left").html(str);
         }
         else {
            $("#index_act_left").html("暂无更多活动。");
         }

         if (json.rows.length > 1) {

            str = "";

            str += '<li><span class="c2">活 动 名：</span>' + json.rows[1].cell[0] + '</li>';
            str += '<li><span class="c2">活动简介：</span>' + json.rows[1].cell[1] + '</li>';
            str += '<li><span class="c2">活动时间：</span>' + json.rows[1].cell[2] + '&nbsp;-&nbsp;' + json.rows[1].cell[7] + '</li>';
            str += '<li><a href="' + json.rows[1].cell[4] + '" target="_blank"><img alt="" src="/Content/images/cardpush/detail.gif" width="80" height="20" border="0" /></a></li>'

            $("#index_act_right").html(str);
         }
         else {
            $("#index_act_right").html("");
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#index_act_left").html("暂无更多活动。");
         $("#index_act_right").html("");
      }
   });
});

function ParseNews(json_data) {

   var str = '<ul class="lh25 noticeli p20"  style="padding-left:5px;">';
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

function indexaa(s_id) {
   for (i = 1; i < 6; i++) {
      try {
         if (i == s_id) {
            document.getElementById("s" + i).style.display = "block"; //内容的样式
            document.getElementById("m" + i).className = "switchon"; //头部的样式
         }
         else {
            document.getElementById("s" + i).style.display = "none"; //内容不显示
            document.getElementById("m" + i).className = ""; //
         }
      }
      catch (error) { }
   }
}

</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="right width703">
   <!--#include file='stepmenu.htm' -->
   <!--最新公告 -->
   <div class="notice">
      <ul>
         <li class="lit">
            <a href='<%=Url.Action("news") %>'>
               <img alt="" src="/Content/images/cardpush/more.gif" width="30" height="14" border="0" class="ml30" /></a></li>
         <li class="lic"  style="_height:218px;">
            <div class="left borderr width400 p7" id="news_index"></div>
            <div class="right p9">
               <div>
                  <!-- ADPolestar Control Code/No./ada2df9b-7d7f-47d6-bb5f-d9630b3539f3-->
                    <IFRAME SRC="http://gg.9you.com/ADPolestar/lgs/door/;ap=ada2df9b-7d7f-47d6-bb5f-d9630b3539f3&ct=i&pw=260&ph=180&mv=710&er=&ir=f&pu=jiuyou?" NAME="adFrame" WIDTH="260" HEIGHT="180" FRAMEBORDER="no" BORDER="0" MARGINWIDTH="0" MARGINHEIGHT="0" SCROLLING="no">
                    <SCRIPT LANGUAGE="JavaScript1.1">
                    var browVersion = parseInt(navigator.appVersion);
                    if (navigator.appName=='Netscape' && browVersion<=4) document.write("<SCR"+"IPT LANGUAGE='Javascript1.1' SRC='http://gg.9you.com/ADPolestar/lgs/door/;ap=ada2df9b-7d7f-47d6-bb5f-d9630b3539f3&ct=j&pw=260&ph=180&mv=710&er=&ir=f&pu=jiuyou?'><\/SCRIPT>");
                    </SCRIPT>
                    <NOSCRIPT>
                    <A HREF="http://gg.9you.com/ADPolestar/lgs/way/;ap=ada2df9b-7d7f-47d6-bb5f-d9630b3539f3&ct=g&er=&mv=710&pu=jiuyou"><IMG SRC="http://gg.9you.com/ADPolestar/lgs/door/;ap=ada2df9b-7d7f-47d6-bb5f-d9630b3539f3&ct=g&pw=260&ph=180&mv=710&er=&ir=f&pu=jiuyou?" BORDER=0 HEIGHT="180" WIDTH="260"></A>
                    </NOSCRIPT>
                    </IFRAME>
                  <!-- ADPolestar Control Code End/No.-->

               </div>
            </div>
            <div class="clear">
            </div>
         </li>
         <li class="lib" style="_margin-top:-2px;"></li>
      </ul>
   </div>
   <!--通栏广告 -->
   <div class="mt10">
      <%--<iframe src="http://www.9you.com/tuiguang/gg_703px.html" name="gg_703px" width="703" marginwidth="0" height="76" marginheight="0" scrolling="no" frameborder="0"></iframe>--%>
      <!-- ADPolestar Control Code/No./6b75d1aa-b0ca-4866-995b-ccff03dcd9fb-->
      <IFRAME SRC="http://gg.9you.com/ADPolestar/lgs/door/;ap=6b75d1aa-b0ca-4866-995b-ccff03dcd9fb&ct=i&pw=703&ph=76&mv=710&er=&ir=f&pu=jiuyou?" NAME="adFrame" WIDTH="703" HEIGHT="76" FRAMEBORDER="no" BORDER="0" MARGINWIDTH="0" MARGINHEIGHT="0" SCROLLING="no">
      <SCRIPT LANGUAGE="JavaScript1.1">
      var browVersion = parseInt(navigator.appVersion);
      if (navigator.appName=='Netscape' && browVersion<=4) document.write("<SCR"+"IPT LANGUAGE='Javascript1.1' SRC='http://gg.9you.com/ADPolestar/lgs/door/;ap=6b75d1aa-b0ca-4866-995b-ccff03dcd9fb&ct=j&pw=703&ph=76&mv=710&er=&ir=f&pu=jiuyou?'><\/SCRIPT>");
      </SCRIPT>
      <NOSCRIPT>
      <A HREF="http://gg.9you.com/ADPolestar/lgs/way/;ap=6b75d1aa-b0ca-4866-995b-ccff03dcd9fb&ct=g&er=&mv=710&pu=jiuyou"><IMG SRC="http://gg.9you.com/ADPolestar/lgs/door/;ap=6b75d1aa-b0ca-4866-995b-ccff03dcd9fb&ct=g&pw=703&ph=76&mv=710&er=&ir=f&pu=jiuyou?" BORDER=0 HEIGHT="76" WIDTH="703"></A>
      </NOSCRIPT>
      </IFRAME>
      <!-- ADPolestar Control Code End/No.-->
   </div>
   <!--道具展示 -->
   <div class="mt10 activity">
      <ul>
         <li class="lit2 alignr">
            <div class="switch">
               <a href="javascript:void('0')" id="m5" onmouseover="indexaa(5)">勇士OL</a>
               <a href="javascript:void('0')" id="m2" onmouseover="indexaa(2)" class="switchon">劲舞团</a>
               <a href="javascript:void('0')" id="m1" onmouseover="indexaa(1)" >劲舞团2</a>
               <a href="javascript:void('0')" id="m3" onmouseover="indexaa(3)">SD敢达</a>
               <a href="javascript:void('0')" id="m4" onmouseover="indexaa(4)">劲爆篮球</a></div>
         </li>
         <li class="lic pdj" style="height:115px;">
            <ul class="daoju" id="s1" style="display: none;">
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/EBACE.jpg" width="94" height="94" /><br />
                  EBACE十字 手套</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/shoes.jpg" width="94" height="94" /><br />
                  白色迷情 凉鞋</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/glass.jpg" width="94" height="94" /><br />
                  牛奶条纹 大眼镜</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/hair.jpg" width="94" height="94" /><br />
                  流行潮人男发</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/mini.jpg" width="94" height="94" /><br />
                  靓丽牛仔 短裤</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/jw2/pet.jpg" width="94" height="94" /><br />
                  小嘻哈冬己</li>
               <div class="clear">
               </div>
            </ul>
            <ul class="daoju" id="s2" style="display: none;">
               <li>
                  <img alt="" src="/Content/images/cardpush/au/1000mb.jpg" width="94" height="94" border="0" /><br />
                  回归抵用券</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/au/magic-star.jpg" width="94" height="94" border="0" /><br />
                  魔法星星</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/au/30bi.jpg" width="94" height="94" border="0" /><br />
                  30体验币</li>
               <div class="clear">
               </div>
            </ul>
            <ul class="daoju" id="s3" style="display: none;">
               <li>
                  <img alt="" src="/Content/images/cardpush/sd/Rising_Gundam_01-1.jpg" width="94" height="94" /><br />
                  Rising Gundam</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/sd/pinksuit.jpg" width="94" height="94" /><br />
                  粉红2 涂装套件</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/sd/cap.jpg" width="94" height="94" /><br />
                  副官E型</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/sd/hs1.jpg" width="94" height="94" /><br />
                  海市蜃楼</li>
              
               <div class="clear">
               </div>
            </ul>
            <ul class="daoju" id="s4" style="display: none;">
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/q.jpg" width="94" height="94" /><br />
                  代金券</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/j.jpg" width="94" height="94" /><br />
                  积分</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/y.jpg" width="94" height="94" /><br />
                  经验</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/x.jpg" width="94" height="94" /><br />
                  枭</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/la.jpg" width="94" height="94" /><br />
                  小喇叭</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/lq/ym.jpg" width="94" height="94" /><br />
                  羽</li>
               <div class="clear">
               </div>
            </ul>
            <ul class="daoju" id="s5">
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/pjlh.jpg" width="94" height="94" /><br />
                  铂金礼盒</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/cwls.jpg" width="94" height="94" /><br />
                  宠物粮食</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/fhb.jpg" width="94" height="94" /><br />
                  复活币</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/csss.jpg" width="94" height="94" /><br />
                  剧情橙色首饰</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/sbjy.jpg" width="94" height="94" /><br />
                  双倍经验道具</li>
               <li>
                  <img alt="" src="/Content/images/cardpush/dnh/xsd.jpg" width="94" height="94" /><br />
                  星石袋</li>
               <div class="clear">
               </div>
            </ul>
            <div class="clear">
            </div>
         </li>
         <li class="lib" style="margin-top:-2px;"></li>
      </ul>
   </div>
   <!-- 最新活动-->
   <div class="mt10 activity">
      <ul>
         <li class="lit alignr">
            <a href="<%=Url.Action("Score") %>"><img alt="" src="/Content/images/cardpush/more.gif" width="30" height="14" border="0" class="mm1" /></a>
         </li>
         <li class="lic p12" style="_height:105px;">
            <div class="">
               <div class="left width319">
                  <ul class="lh25" id="index_act_left">
                  </ul>
               </div>
               <div class="right width319">
                  <ul class="lh25" id="index_act_right">
                  </ul>
               </div>
               <div class="clear">
               </div>
            </div>
         </li>
         <li class="lib" style="_margin-top:-2px;"></li>
      </ul>
   </div>
</div>
</asp:Content>
