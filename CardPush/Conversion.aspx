<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<style type="text/css">
#myDialog_content a{margin-right:3px;margin-left:3px;text-decoration:underline;color:#dC8D3B;}
#get_qcoin{font-size:18px;font-weight:bold;margin-left:460px !important;}
#get_qcoin:hover{text-decoration:none;}
#myDialog_content table{width:100%;}
#myDialog_content table td{width:260px;height:50px;}
#myDialog_content table td a{font-size:17px;font-weight:bold;}
#myDialog_content table input{width:170px;border:solid 1px #aaa;}
#myDialog_content{text-align:left;background:url('');}
/*#myDialog_M818_logo_div{width:500px;height:50px;text-align:left;padding:0;*margin-left:-115px;_margin-left:-130px;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=/content/images/cardpush/m818/m818logo.png,sizingMethod=scale);};*/
#myDialog{background:url('/content/images/cardpush/m818/m818logo.jpg') 10px 321px no-repeat}

</style>
<script type="text/javascript" src="/Scripts/cardpush/m818MD5.js"></script>
<script type="text/javascript" language="javascript">

$(function() {
   getGameList();
   getQCoin();
});
function getGameList() {
   $("#con_game_list").html("正在加载游戏列表...");
   var str = "";
   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetGameList") %>',
      dataType: "json",
      success: function(json) {
         try {
            if (json == "") {
               loadDefault();
               return;
            }

            str += '<select name="select" id="gid" onchange="selectGame()">';
            str += '<option value="0">全部道具</option>';
            for (ii = 0; ii < json.rows.length; ++ii) {

               str += '<option value="' + json.rows[ii].cell[0] + '">' + json.rows[ii].cell[1] + '</option>';
            }
            str += '</select><script type="text/javascript" language="javascript">selectGame();setInterval(function() { selectGame(); }, 120000);<\/script>';
            $("#con_game_list").html(str);
         } catch (ex) {
            loadDefault();
         }
      },
      error: function(XMLHttpRequest, textStatus) {

         loadDefault();
      }
   });
}

var loadDefaultStr = '<select name="select" id="gid" onchange="selectGame()"><option value="0">全部道具</option></select><script type="text/javascript" language="javascript">selectGame();setInterval(function() { selectGame(); }, 120000);<\/script>';

function loadDefault() {$("#con_game_list").html(loadDefaultStr);}

function selectGame() {
   try {
      if ($("#gid").val() != undefined) {
         $("#gid")[0].disabled = 'disabled';
         getDetailsByGame($("#gid").val(), 1, "true");
      }
   } catch (ex) {
      $("#gid")[0].disabled = '';
   }
}

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

   if ($("#gid").val() != undefined) {
      getDetailsByGame($("#gid").val(), pg, "false");
   }
}

function gameItemNextPage(tag) {
   var curr = $("#curr_page").text() - 0;
   var max = $("#max_page").text() - 0;
   var pg = curr - 0 + 1;

   if (curr >= max) {return;}

   if (pg >= max) {
      pg = max;
   }

   $("#curr_page").text(pg);

   if ($("#gid").val() != undefined) {
      getDetailsByGame($("#gid").val(), pg, "false");
   }
}

var getQCoin = function() {
   var str = "";
   $("#list_m818_item").html("道具列表加载中，请稍后...");
   $.ajax({
      url: '<%=Url.Action("GetQCoin")%>',
      type: "post",
      dataType: "json",
      success: function(json) {
         for (ii = 0; ii < json.rows.length; ++ii) {

            str += '<li><a href="javascript:;" onclick="getQCoinStep1();return false;"><img border="0" alt="" width="120" height="120" src="' + json.rows[ii].cell[2] + '" class="borderc" /></a><br />';
            str += '<a href="javascript:;" onclick="getQCoinStep1();return false;">' + json.rows[ii].cell[1] + '</a><br />';
            str += '<br />';
            str += '<a href="javascript:;" onclick="getQCoinStep1();return false;" ><img width="61" height="20" border="0" src="/Content/images/cardpush/dh.gif" /></a></li>';
         }
         $("#list_m818_item").html(str);
         $("#usr_hero").val(json.BindCard);
         //$("#curr_page").text(json.CurrPage);
         //$("#max_page").text(json.MaxPage);
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#list_m818_item").html("暂无道具。");
      }
   });
}

var getDetailsByGame = function(gameID, pg, isfirst) {

   var str = "";
   var usr_score = $("#usr_score").val() - 0;

   $("#item_list_pager_id").hide();
   $("#list_item_by_game").html("道具列表加载中，请稍后...");

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("GetGameItemDetail") %>',
      dataType: "json",
      data: {
         GameID: gameID, 'page': pg, 'isfirst': isfirst
      },
      success: function(json) {
         $("#gid")[0].disabled = '';
         try {
            if (json == "") {
               $("#list_item_by_game").html("暂无道具。");
               return;
            }

            if (json.MaxPage > 1) {
               $("#item_list_pager_id").show();
            }
            for (ii = 0; ii < json.rows.length; ++ii) {

               if (usr_score >= json.rows[ii].cell[5]) {
                  str += '<li><a href="javascript:;" onclick="SummitGameItem(' + json.rows[ii].cell[0] + ',' + json.rows[ii].cell[3] + ');return false;"><img border="0" alt="" width="120" height="120" src="' + json.rows[ii].cell[7] + '" class="borderc" /></a><br />';
                  str += '<a href="javascript:;" onclick="SummitGameItem(' + json.rows[ii].cell[0] + ',' + json.rows[ii].cell[3] + ');return false;">' + json.rows[ii].cell[1] + '</a><br />';
               }
               else {
                  str += '<li><a href="javascript:;" onclick="javascript:noPoint();return false;"><img border="0" alt="" width="120" height="120" src="' + json.rows[ii].cell[7] + '" class="borderc" /></a><br />';
                  str += '<a href="javascript:;" onclick="javascript:noPoint();return false;">' + json.rows[ii].cell[1] + '</a><br />';
               }

               str += '<span class="c3">' + json.rows[ii].cell[5] + '</span>&nbsp;积分<br />';

               //勇士
               if (json.rows[ii].cell[2] != 'DNH0429') {

                  if (json.rows[ii].cell[6] - 0 != -1) {
                     if (json.rows[ii].cell[6] - 0 == 0) {
                        str += '有效期：<span class="c3">永久</span>天<br />';
                     }
                     else {
                        str += '有效期：<span class="c3">' + json.rows[ii].cell[6] + '</span>天<br />';
                     }
                  }
                  else {
                     str += '次&nbsp;数：<span class="c3">' + json.rows[ii].cell[8] + '</span>次<br />';
                  }
               }
               else {
                  str += '剩余数量：<span class="c3">' + json.rows[ii].cell[9] + '</span><br />';
               }

               if (usr_score >= json.rows[ii].cell[5]) {

                  str += '<a href="javascript:;" onclick="SummitGameItem(' + json.rows[ii].cell[0] + ',' + json.rows[ii].cell[3] + ');return false;" ><img width="61" height="20" border="0" src="/Content/images/cardpush/dh.gif" /></a></li>';
               }
               else {
                  str += '<a href="javascript:;" onclick="javascript:noPoint();return false;" ><img border="0" width="61" height="20" src="/Content/images/cardpush/dh_enable.jpg" /></a></li>';
               }
            }
            $("#list_item_by_game").html(str);
            $("#curr_page").text(json.CurrPage);
            $("#max_page").text(json.MaxPage);
         }
         catch (ex) {
            $("#list_item_by_game").html("暂无道具。");
            $("#gid")[0].disabled = '';
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#list_item_by_game").html("暂无道具。");
         $("#gid")[0].disabled = '';
      }
   });
}

function noPoint() {
   alert("您没有足够的积分！");
}

function SummitGameItem(strID, strGameID) {

   var name = $("#login_uaccount").text();
   if ($.trim(name) == "") {
      alert("您尚未登录，请先登录！");
      return false;
   }

   url = '<%= Url.Action("SendGameItemID") %>';
   $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: {
         ID: strID,
         GameID: strGameID
      },
      success: submitGameItemSuccessed
   });
}

function submitGameItemSuccessed(result) {

   if (result == 3) {
      alert("勇士OL内测激活码已经全部兑换完毕，剩余数量为0！");

   }
   else if (result == 4) {
      alert("您要兑换的道具与您的性别不符！");
   }
   else if (result == 6) {
      alert("当您绑定的勇士游戏角色达到 10 级，可获得 2Q币，如该角色发生 10 元以上的消费，可获得 3Q币。");
   }
   else {
      window.location.href = '<%= Url.Action("NineyouItemInfo") %>';
   }
}

function switchTabPage(id) {
   if (id == 'm2') {
      // 兑换道具
      $("#m2").addClass("on1");
      $("#m1").removeClass("on1");
      $("#tabpage1").hide();
      $("#tabpage0").show();
   } else {
      $("#m1").addClass("on1");
      $("#m2").removeClass("on1");
      $("#tabpage0").hide();
      $("#tabpage1").show();
   }
}

$.ui.dialog.defaults.bgiframe = true;
$(function() {
   $('#myDialog').dialog({
      width: 660,
      height: 450,
      autoOpen: false,
      modal: true,
      resizable:false,
      position:[460,200]
});
});

function showDialog() {
   $('#myDialog').dialog('open');
}

function closeWin() {
   $('#myDialog').dialog('close');
}
var q_get_str = '<table><tr><td>汇畅账号：<input type="text" id="q_m818account" /></td><td>汇畅密码：<input type="password" id="q_m818password" /></td></tr><tr><td colspan="2" align="center"><a href="javascript:;" onclick="sendQCoin();return false;">开始领取</a></td></tr></table>';
function getQCoinStep2() {
   $("#myDialog_content").html(q_get_str);
}

var q_get_str1 = '1、 本平台内所有Q币奖励由久游网战略合作伙伴—汇畅网<a href="http://www.m818.com/" target="_blank">www.m818.com</a>（全国领先的数字商品交易平台）全程赞助。<br /><br />2、 兑换的Q币必须登录汇畅网 www.m818.com 获取。<br /><br />3、 如果您已经注册过汇畅网 www.m818.com ，即可立即领取奖励；如果您还未注册汇畅网 www.m818.com ，立即注册即可马上领取奖励。  <a href="http://user.m818.com/UserLogin.aspx" target="_blank">我要注册</a><br /><br />4、 在推广平台上兑换Q币的用户，登录汇畅M818后可在您的钱包内看到等值的现金奖励。即2Q币=2元；3Q币=3元。<br /><br />5、 您可以直接使用赠送的金额购买等值的Q币。您也可以使用赠送给您的金额差价补贴兑换平台其他商品。更多奖励，更多选择，尽在<a href="http://www.m818.com/" target="_blank">汇畅M818</a>。<br /><br />6、 本活动奖励余额请在2010年9月30日前尽快使用，逾期系统将会自动清零。<br /><br />7、 游戏角色达到10级或消费满15元即可领取。领取后需要隔日到此兑换！<br /><br /><a id="get_qcoin" href="javascript:;" onclick="getQCoinStep2();return false;">上M818领取Q币</a>';

function getQCoinStep1() {

   if ($.trim($("#login_uaccount").text()) == "") {
      alert("您尚未登录，请先登录！");
      return false;
   }

   if ($("#usr_bind").val() == 0) {
      alert("您尚未绑定推广一卡通账号，请先绑定！");
      window.location.href = '<%=Url.Action("CardBind") %>';
      return;
   }
   
   if ($("#usr_hero").val() == 0) {
      alert("您尚未获得《勇士》新手至尊VIP卡资格！");
      window.location.href = '<%=Url.Action("DNHSSNEW") %>';
      return;
   }

   $("#myDialog_content").html(q_get_str1);
   showDialog();
}

function sendQCoin() {
   if ($.trim($("#login_uaccount").text()) == "") {
      alert("您尚未登录，请先登录！");
      return false;
   }

   var a8 = $("#q_m818account").val();
   var a8pwd = $("#q_m818password").val();

   if ($.trim(a8) == "" || $.trim(a8pwd) == "") {
      alert("请将信息填写完整！");
      return;
   }
   $("#myDialog_content").html('<table><tr align="center"><td height="28"><img alt="" src="/content/images/ajax-loader.gif" width="25" height="25" /></td></tr><tr align="center"><td><span>正在领取，请稍后。请勿刷新页面！</span></td></tr></table>');
   $.ajax({
      url: '<%=Url.Action("SendQCoin")%>',
      type: "post",
      dataType: "json",
      data: { m818Account: a8, m818Password: md5(a8pwd) },
      success: function(r) {
         if (r.Msg == "REDIRECTBindCard") {
            alert("您尚未绑定推广一卡通账号，请先绑定！");
            window.location.href = '<%=Url.Action("CardBind") %>';
            return;
         }
         else if (r.Msg == "REDIRECTGetHeroVIPCard") {
            alert("您尚未获得《勇士》新手至尊VIP卡资格！");
            window.location.href = '<%=Url.Action("DNHSSNEW") %>';
            return;
         }
         alert(r.Msg);
         closeWin();
      },
      error: function(XMLHttpRequest, textStatus) {
         alert('领取Q币失败，请再试一次！');
         closeWin();
      }
   });
}

</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <input type="hidden" id="usr_hero" value="0" />
   <input type="hidden" id="usr_bind" value="<%= ViewData["bindcard"] %>" />
   <input type="hidden" id="usr_score" value="<%= ViewData["userscore"] %>" />
   <div class="scoretitle">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2">
            <div class="lh25 p12">
               <div class="conv bordery" style="height:21px;padding-bottom:0;margin:0px;">
                  <a style="height:21px;" class="on1" onmouseover="" id="m2" href="javascript:void(0)" onclick="switchTabPage('m2');return false;">兑换道具</a><a style="height:21px;" id="m1" onmouseover="" href="javascript:;" onclick="switchTabPage('m1');return false;">兑换Q币<span style="font-size:9px;color:Red;"><sup>hot</sup></span></a>
               </div>
               <div id="tabpage0">
                  <div class="mt10">
                     筛选指定游戏道具：
                     <label id="con_game_list"></label>
                  </div>
                  <div class="convl mt10" style="width:646px;">
                     <ul id="list_item_by_game"></ul>
                     <div class="clear">
                     </div>
                     <div class="item_list_pager" style="width:635px;display:none;" id="item_list_pager_id">第&nbsp;<span id="curr_page">1</span>&nbsp;页，共&nbsp;<span id="max_page">1</span>&nbsp;页&nbsp;&nbsp;<a href="javascript:;" onclick="gameItemPrevPage(this);return false;">上一页</a>&nbsp;<a href="javascript:;" onclick="gameItemNextPage(this);return false;">下一页</a>&nbsp;&nbsp;</div>
                  </div>
               </div>
               <div id="tabpage1" style="display:none;">
                  <div class="mt10">
                  </div>
                  <div class="convl mt10" style="width:646px;">
                     <ul id="list_m818_item"></ul>
                     <div class="clear">
                     </div>
                  </div>
               </div>
            </div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
</div>
<div id="myDialog" title=" Q币领取说明" style="display:none;">
<div id="myDialog_M818_logo_div"></div>
<div id="myDialog_content">
</div>
</div>
</asp:Content>