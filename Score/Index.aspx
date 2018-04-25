<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
<link href="/Content/css/scoresite/thickbox.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/scoresite/ad_new.css" rel="stylesheet" type="text/css" />

<style type="text/css">
   #TB_title
   {
      display: none;
   }
</style>
<script src="/Scripts/scoresite/thickbox-compressed.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_virtual.js" type="text/javascript"></script>
<script src="/Scripts/scoresite/score_index.js?1" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="main">
   <div class="rotation">
      <script type="text/javascript" language="javascript">
      var pic_width = 640; //图片宽度
      var pic_height = 185; //图片高度
      var button_pos = 4; //按扭位置 1左 2右 3上 4下
      var stop_time = 3000; //图片停留时间(1000为1秒钟)
      var show_text = 0; //是否显示文字标签 1显示 0不显示
      var txtcolor = "000000"; //文字色
      var bgcolor = "DDDDDD"; //背景色
      var imag = new Array();
      var link = new Array();
      var text = new Array();
      imag[1] = "/content/flash/scoresite/images/640185.jpg";
      link[1] = "http://vote.9you.com/sdo/2010july/sweet.html";
      text[1] = "标题 1";
      imag[2] = "/content/flash/scoresite/images/100825_au_sky_640_185.jpg";
      link[2] = "http://gamenews.9you.com/html/art_superdance/2010_07/21/TWNJA4ZMNR.html";
      text[2] = "标题 2";
      imag[3] = "/content/flash/scoresite/images/640_185.jpg";
      link[3] = "http://au.9you.com/special/s64/sea.html";
      text[3] = "标题 3";
      imag[4] = "/content/flash/scoresite/images/640_185_1.jpg";
      link[4] = "http://vote.9you.com/sdo/2010july/summer.html";
      text[4] = "标题 4";
      imag[5] = "/content/flash/scoresite/images/640_185_2.jpg";
      link[5] = "http://vote.9you.com/sdo/2010july/camp.html";
      text[5] = "标题 5";
      //可编辑内容结束
      var swf_height = show_text == 1 ? pic_height + 20 : pic_height;
      var pics = "", links = "", texts = "";
      for (var i = 1; i < imag.length; i++) {
         pics = pics + ("|" + imag[i]);
         links = links + ("|" + link[i]);
         texts = texts + ("|" + text[i]);
      }
      pics = pics.substring(1);
      links = links.substring(1);
      texts = texts.substring(1);
      document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0" width="' + pic_width + '" height="' + swf_height + '">');
      document.write('<param name="movie" value="/content/flash/scoresite/focus.swf">');
      document.write('<param name="quality" value="high"><param name="wmode" value="opaque">');
      document.write('<param name="FlashVars" value="pics=' + pics + '&links=' + links + '&texts=' + texts + '&pic_width=' + pic_width + '&pic_height=' + pic_height + '&show_text=' + show_text + '&txtcolor=' + txtcolor + '&bgcolor=' + bgcolor + '&button_pos=' + button_pos + '&stop_time=' + stop_time + '">');
      document.write('<embed src="/content/flash/scoresite/focus.swf" FlashVars="pics=' + pics + '&links=' + links + '&texts=' + texts + '&pic_width=' + pic_width + '&pic_height=' + pic_height + '&show_text=' + show_text + '&txtcolor=' + txtcolor + '&bgcolor=' + bgcolor + '&button_pos=' + button_pos + '&stop_time=' + stop_time + '" quality="high" width="' + pic_width + '" height="' + swf_height + '" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
      document.write('</object>');
      </script>
   </div>
   <div style="height: 20px; margin: 0;">
   </div>
   <div class="ad" style="width:640px;">
       <div class="adLeft" style="width:310px; height:115px; float:left;"><a href="<%=Url.Action("newhandcard") %>"><img alt="" src="/content/images/scoresite/ad_2.jpg" width="308" height="115" /></a>
       </div>
       
       <div class="adRight" style="width:310px; height:115px; float:right;"><a href="<%=Url.Action("event") %>"><img alt="" src="/content/images/scoresite/ad_1.jpg" width="308" height="115" /></a>
       </div>
       
   </div>
   <div style="height:20px; margin:0; clear:both;"></div>
   <div class="adNew">
     <img src="/content/images/scoresite/ad_new_01.jpg" width="640" height="224" />
     <div class="buttonArea">
        <ul>
          <li><a href="http://tg.9you.com/score.aspx/point" target="_blank"><img src="/content/images/scoresite/4.gif" width="114" height="29" /></a></li>
          <li><a href="http://tg.9you.com/score.aspx/virtual" target="_blank"><img src="/content/images/scoresite/3.gif" width="114" height="29" /></a></li>
          <li><a href="http://tg.9you.com/score.aspx/kind" target="_blank"><img src="/content/images/scoresite/2.gif" width="114" height="29" /></a></li>
          <li><a href="http://tg.9you.com/score.aspx/aboutpoint" target="_blank"><img src="/content/images/scoresite/1.gif" width="114" height="29" /></a></li>
        </ul>
     </div>
   </div>
   <div style="height:20px; margin:0; clear:both;"></div>
   <div class="newsCard">
      <div class="news">
         <h1>
            <span class="titleBg"><span class="title">新闻活动广告</span><span class="more"><a href="<%=Url.Action("NewsList") %>" target="_blank"><img src="/content/images/scoresite/more.gif" width="41" height="11" align="right" /></a></span></span></h1>
         <div class="newsList" id="news_list_div">
            <script language="javascript" type="text/javascript">
            loadNews('<%=Url.Action("IndexNews") %>', '<%= Url.Action("newsContent") %>', 'news_list_div');   
            </script>
         </div>
      </div>
      <div class="card">
         <h1>
            <span class="titleBg"><span class="title">久游活动平台介绍</span></span></h1>
         <div class="cardContent">
            <p>
               久游推广卡一经绑定，终身享用适用于所有久游游戏新手卡道具领取参与更多活动，获得积分兑换道具或实物。</p>
            <br />
            <p>
               久游活动平台将陆续推出更多服务，敬请关注！</p>
         </div>
      </div>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div style="height: 20px; margin: 0; clear: both;">
   </div>
   <div class="newhand">
      <h1>
         <span class="titleBbg"><span class="title">新手卡道具</span><span class="moreB">
            <a href="<%=Url.Action("newhandcard") %>" onmousemove="javascript:showNewhandItem('nhi_dnh_ul')">勇士OL</a>
            <a href="<%=Url.Action("newhandcard") %>/2" onmousemove="javascript:showNewhandItem('nhi_au_ul')">劲舞团</a>
            <a href="<%=Url.Action("newhandcard") %>/35" onmousemove="javascript:showNewhandItem('nhi_jw2_ul')">GT劲舞团2</a>
            <a href="<%=Url.Action("newhandcard") %>" target="_blank">
            <img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="middle" /></a></span></span></h1>
      <div class="newhandContent" id="newhandContent_div">
         <ul id="nhi_dnh_ul">
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/pjlh.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  铂金礼盒</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/cwls.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  宠物粮食</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/fhb.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  复活币</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/csss.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  剧情橙色首饰</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/sbjy.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  双倍经验道具</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/dnh/xsd.jpg" alt="">
               </a>
               <br />
               <p>
				  勇士OL<br />
                  星石袋</p>
            </li>
         </ul>
         <ul id="nhi_au_ul" style="display: none;">
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/1000mb.jpg'>
               </a>
               <br />
               <p>
				  劲舞团<br />
                  回归抵用券
               </p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/magic-star.jpg'>
               </a>
               <br />
               <p>
				  劲舞团<br />
                  魔法星星
               </p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/30bi.jpg'>
               </a>
               <br />
               <p>
			      劲舞团<br />
                  30体验币
               </p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/dog.jpg' class='border3'>
               </a>
               <br />
               <p>
				  劲舞团<br />
                  帕恰狗
               </p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/GGhai.jpg'>
               </a>
               <br />
               <p>
				  劲舞团<br />
                  GG情侣女发
               </p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/2" target="_blank">
               <img width='80' height='80' border='0' src='/Content/images/cardpush/au/GGhat.jpg'>
               </a>
               <br />
               <p>
				  劲舞团<br />
                  GG情侣男帽
               </p>
            </li>
         </ul>
         <ul id="nhi_jw2_ul" style="display: none;">
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/EBACE.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  EBACE十字 手套</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/shoes.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  白色迷情 凉鞋</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/glass.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  牛奶条纹 大眼镜</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/hair.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  流行潮人男发</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/mini.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  靓丽牛仔 短裤</p>
            </li>
            <li>
               <a href="<%=Url.Action("newhandcard") %>/35" target="_blank">
               <img width='80' height='80' border='0' src="/Content/images/cardpush/jw2/pet.jpg" alt="">
               </a>
               <br />
               <p>
				  GT劲舞团2<br />
                  小嘻哈冬己</p>
            </li>
         </ul>
         <div style="height: 0px; margin: 0; _display: inline; clear: both;">
         </div>
      </div>
   </div>
   <div style="height: 20px; margin: 0;">
   </div>
   <div class="point">
      <h1>
         <span class="titleBbg"><span class="title">积分兑换道具</span><span class="moreB">
            <!--<a href="<%=Url.Action("virtual") %>">劲舞团</a>
            <a href="<%=Url.Action("virtual") %>">超级舞者</a>
            <a href="<%=Url.Action("virtual") %>">GT劲舞团2</a>-->
            &nbsp;
            <a href="<%=Url.Action("virtual") %>" target="_blank">
            <img alt="more" src="/content/images/scoresite/more.gif" width="41" height="11" align="middle" /></a></span></span></h1>
      <div class="pointContent">
         <ul id="pointContent_ul">
            <script language="javascript" type="text/javascript">
            var c = new GameItems('<%=Url.Action("GetItemsByGameId")%>', '<%=Url.Action("GetServerByGameId")%>', '<%=Url.Action("ExchangeVirtualItem")%>', 'virtualToolsContent_div');
            loadVirtualItem('<%=Url.Action("GetItemsByGameIdIndex") %>', 'pointContent_ul');
            </script>
         </ul>
         <div style="height: 0px; margin: 0; _display: inline; clear: both;">
         </div>
      </div>
   </div>
</div>
<div id="virtualTap_div" style="display: none;">
   <div>
      <h6>
         <span><span class="title" style="font-weight: bold;">请确认您要兑换的道具信息</span><span class="close"><a title="关闭" href="javascript:;" onclick="tb_remove();return false;"><img alt="close" src="/content/images/scoresite/close.gif" width="14" height="14" align="absmiddle" /></a></span></span>
      </h6>
      <div style="height: 0px; margin: 0; _display: inline; clear: both;">
      </div>
   </div>
   <div class="tapContent" style="border: 0;" id="tapContent_div">
   </div>
   <div class="tapArea" style="border: 0;">
      请选择大区：
      <select name="select" id="select_server">
      </select>
      <p id="btn_confirm_p">
      </p>
   </div>
</div>
</asp:Content>
