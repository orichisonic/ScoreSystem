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
   $("#con_game_list").html("���ڼ�����Ϸ�б�...");
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
            str += '<option value="0">ȫ������</option>';
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

var loadDefaultStr = '<select name="select" id="gid" onchange="selectGame()"><option value="0">ȫ������</option></select><script type="text/javascript" language="javascript">selectGame();setInterval(function() { selectGame(); }, 120000);<\/script>';

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
   $("#list_m818_item").html("�����б�����У����Ժ�...");
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
         $("#list_m818_item").html("���޵��ߡ�");
      }
   });
}

var getDetailsByGame = function(gameID, pg, isfirst) {

   var str = "";
   var usr_score = $("#usr_score").val() - 0;

   $("#item_list_pager_id").hide();
   $("#list_item_by_game").html("�����б�����У����Ժ�...");

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
               $("#list_item_by_game").html("���޵��ߡ�");
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

               str += '<span class="c3">' + json.rows[ii].cell[5] + '</span>&nbsp;����<br />';

               //��ʿ
               if (json.rows[ii].cell[2] != 'DNH0429') {

                  if (json.rows[ii].cell[6] - 0 != -1) {
                     if (json.rows[ii].cell[6] - 0 == 0) {
                        str += '��Ч�ڣ�<span class="c3">����</span>��<br />';
                     }
                     else {
                        str += '��Ч�ڣ�<span class="c3">' + json.rows[ii].cell[6] + '</span>��<br />';
                     }
                  }
                  else {
                     str += '��&nbsp;����<span class="c3">' + json.rows[ii].cell[8] + '</span>��<br />';
                  }
               }
               else {
                  str += 'ʣ��������<span class="c3">' + json.rows[ii].cell[9] + '</span><br />';
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
            $("#list_item_by_game").html("���޵��ߡ�");
            $("#gid")[0].disabled = '';
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#list_item_by_game").html("���޵��ߡ�");
         $("#gid")[0].disabled = '';
      }
   });
}

function noPoint() {
   alert("��û���㹻�Ļ��֣�");
}

function SummitGameItem(strID, strGameID) {

   var name = $("#login_uaccount").text();
   if ($.trim(name) == "") {
      alert("����δ��¼�����ȵ�¼��");
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
      alert("��ʿOL�ڲ⼤�����Ѿ�ȫ���һ���ϣ�ʣ������Ϊ0��");

   }
   else if (result == 4) {
      alert("��Ҫ�һ��ĵ����������Ա𲻷���");
   }
   else if (result == 6) {
      alert("�����󶨵���ʿ��Ϸ��ɫ�ﵽ 10 �����ɻ�� 2Q�ң���ý�ɫ���� 10 Ԫ���ϵ����ѣ��ɻ�� 3Q�ҡ�");
   }
   else {
      window.location.href = '<%= Url.Action("NineyouItemInfo") %>';
   }
}

function switchTabPage(id) {
   if (id == 'm2') {
      // �һ�����
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
var q_get_str = '<table><tr><td>�㳩�˺ţ�<input type="text" id="q_m818account" /></td><td>�㳩���룺<input type="password" id="q_m818password" /></td></tr><tr><td colspan="2" align="center"><a href="javascript:;" onclick="sendQCoin();return false;">��ʼ��ȡ</a></td></tr></table>';
function getQCoinStep2() {
   $("#myDialog_content").html(q_get_str);
}

var q_get_str1 = '1�� ��ƽ̨������Q�ҽ����ɾ�����ս�Ժ�����顪�㳩��<a href="http://www.m818.com/" target="_blank">www.m818.com</a>��ȫ�����ȵ�������Ʒ����ƽ̨��ȫ��������<br /><br />2�� �һ���Q�ұ����¼�㳩�� www.m818.com ��ȡ��<br /><br />3�� ������Ѿ�ע����㳩�� www.m818.com ������������ȡ�������������δע��㳩�� www.m818.com ������ע�ἴ��������ȡ������  <a href="http://user.m818.com/UserLogin.aspx" target="_blank">��Ҫע��</a><br /><br />4�� ���ƹ�ƽ̨�϶һ�Q�ҵ��û�����¼�㳩M818���������Ǯ���ڿ�����ֵ���ֽ�������2Q��=2Ԫ��3Q��=3Ԫ��<br /><br />5�� ������ֱ��ʹ�����͵Ľ����ֵ��Q�ҡ���Ҳ����ʹ�����͸����Ľ���۲����һ�ƽ̨������Ʒ�����ཱ��������ѡ�񣬾���<a href="http://www.m818.com/" target="_blank">�㳩M818</a>��<br /><br />6�� ��������������2010��9��30��ǰ����ʹ�ã�����ϵͳ�����Զ����㡣<br /><br />7�� ��Ϸ��ɫ�ﵽ10����������15Ԫ������ȡ����ȡ����Ҫ���յ��˶һ���<br /><br /><a id="get_qcoin" href="javascript:;" onclick="getQCoinStep2();return false;">��M818��ȡQ��</a>';

function getQCoinStep1() {

   if ($.trim($("#login_uaccount").text()) == "") {
      alert("����δ��¼�����ȵ�¼��");
      return false;
   }

   if ($("#usr_bind").val() == 0) {
      alert("����δ���ƹ�һ��ͨ�˺ţ����Ȱ󶨣�");
      window.location.href = '<%=Url.Action("CardBind") %>';
      return;
   }
   
   if ($("#usr_hero").val() == 0) {
      alert("����δ��á���ʿ����������VIP���ʸ�");
      window.location.href = '<%=Url.Action("DNHSSNEW") %>';
      return;
   }

   $("#myDialog_content").html(q_get_str1);
   showDialog();
}

function sendQCoin() {
   if ($.trim($("#login_uaccount").text()) == "") {
      alert("����δ��¼�����ȵ�¼��");
      return false;
   }

   var a8 = $("#q_m818account").val();
   var a8pwd = $("#q_m818password").val();

   if ($.trim(a8) == "" || $.trim(a8pwd) == "") {
      alert("�뽫��Ϣ��д������");
      return;
   }
   $("#myDialog_content").html('<table><tr align="center"><td height="28"><img alt="" src="/content/images/ajax-loader.gif" width="25" height="25" /></td></tr><tr align="center"><td><span>������ȡ�����Ժ�����ˢ��ҳ�棡</span></td></tr></table>');
   $.ajax({
      url: '<%=Url.Action("SendQCoin")%>',
      type: "post",
      dataType: "json",
      data: { m818Account: a8, m818Password: md5(a8pwd) },
      success: function(r) {
         if (r.Msg == "REDIRECTBindCard") {
            alert("����δ���ƹ�һ��ͨ�˺ţ����Ȱ󶨣�");
            window.location.href = '<%=Url.Action("CardBind") %>';
            return;
         }
         else if (r.Msg == "REDIRECTGetHeroVIPCard") {
            alert("����δ��á���ʿ����������VIP���ʸ�");
            window.location.href = '<%=Url.Action("DNHSSNEW") %>';
            return;
         }
         alert(r.Msg);
         closeWin();
      },
      error: function(XMLHttpRequest, textStatus) {
         alert('��ȡQ��ʧ�ܣ�������һ�Σ�');
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
                  <a style="height:21px;" class="on1" onmouseover="" id="m2" href="javascript:void(0)" onclick="switchTabPage('m2');return false;">�һ�����</a><a style="height:21px;" id="m1" onmouseover="" href="javascript:;" onclick="switchTabPage('m1');return false;">�һ�Q��<span style="font-size:9px;color:Red;"><sup>hot</sup></span></a>
               </div>
               <div id="tabpage0">
                  <div class="mt10">
                     ɸѡָ����Ϸ���ߣ�
                     <label id="con_game_list"></label>
                  </div>
                  <div class="convl mt10" style="width:646px;">
                     <ul id="list_item_by_game"></ul>
                     <div class="clear">
                     </div>
                     <div class="item_list_pager" style="width:635px;display:none;" id="item_list_pager_id">��&nbsp;<span id="curr_page">1</span>&nbsp;ҳ����&nbsp;<span id="max_page">1</span>&nbsp;ҳ&nbsp;&nbsp;<a href="javascript:;" onclick="gameItemPrevPage(this);return false;">��һҳ</a>&nbsp;<a href="javascript:;" onclick="gameItemNextPage(this);return false;">��һҳ</a>&nbsp;&nbsp;</div>
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
<div id="myDialog" title=" Q����ȡ˵��" style="display:none;">
<div id="myDialog_M818_logo_div"></div>
<div id="myDialog_content">
</div>
</div>
</asp:Content>