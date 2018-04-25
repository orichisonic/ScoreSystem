<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarPush.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="right width703">
   <div class="scoretitle">
   </div>
   <div class="rtc">
      <ul>
         <li class="lit2">
            <div class="lh25 p12" id="act_list_div">
            </div>
            <div class="item_list_pager" id="item_list_pager_id" style="display:none;">第&nbsp;<span id="curr_page">1</span>&nbsp;页，共&nbsp;<span id="max_page">1</span>&nbsp;页&nbsp;&nbsp;<a href="javascript:;" onclick="activePrevPage(this);return false;">上一页</a>&nbsp;<a href="javascript:;" onclick="activeNextPage(this);return false;">下一页</a>&nbsp;&nbsp;</div>
         </li>
         <li class="lib">
         </li>
      </ul>
   </div>
   <!-- 最新活动-->
</div>
<div id="hiddenModalContent" style="display:none;"><p id="in_content">操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>
<script language="javascript" type="text/javascript">

function activePrevPage(tag) {
   var curr = $("#curr_page").text();

   if (curr <= 1) {
      return;
   }
   
   var pg = curr - 0 - 1;

   if (pg <= 1) {
      pg = 1;
   }

   $("#curr_page").text(pg);

   getActive(pg, "false");
}

function activeNextPage(tag) {
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

   getActive(pg, "false");
}

$(function() {
   getActive(1, "true");
});

var table_column_count = 3;

function getActive(pg, reload) {

   var str = "";

   $.ajax({
      type: "POST",
      url: '<%= Url.Action("ScoreAction") %>',
      dataType: "json",
      data: {
         'page': pg, 'reload': reload
      },
      success: function(json) {

         $("#act_list_div").html("<div style='color:#888;padding-top:35px;padding-left:10px;'><img src='/Content/images/cardpush/m818/Icon_0039.gif' alt='loading' />加载中，请稍后...</div>");
         $("#item_list_pager_id").hide();

         if (json == "") {
            $("#act_list_div").html("暂无更多活动。");
            return;
         }

         for (ii = 0; ii < json.rows.length; ++ii) {
            str += '<ul class="lh25 mt10" style="width:660px;">';
            str += '<li class="left"><img class="pt4" align="absmiddle" src="' + json.rows[ii].cell[5] + '" width="123" height="90" /></li>';
            str += '<li class="right width520">';
            str += '<span class="c2">活 动 名：</span>' + json.rows[ii].cell[0] + '<br />';
            str += '<span class="c2">活动简介：</span>' + json.rows[ii].cell[1] + '<br />';
            str += '<span class="c2">活动时间：</span>' + json.rows[ii].cell[2] + '&nbsp;-&nbsp;' + json.rows[ii].cell[7] + '<br />';
            str += '<span class="c2">相关游戏：</span>' + json.rows[ii].cell[6] + '<br />';
            str += '<span class="c2">活动奖励：</span>' + json.rows[ii].cell[3] + '个积分';
            str += '</li>';
            str += '<div class="clear"></div><li class="alignr clear borderb  height28" >';

            if (json.rows[ii].cell[8] == "") {
               str += '<a href="javascript:;" onclick="javascript:outOfDate();return false;" ><img alt="活动已截止" src="/content/images/cardpush/join1.jpg" width="79" height="20" border="0" /></a>&nbsp;&nbsp;';
            }
            else {
               str += '<a href="javascript:;" onclick="SubmitBM(' + json.rows[ii].cell[8] + ');return false;"><img alt="我要报名" src="/content/images/cardpush/join.jpg" width="79" height="20" border="0" /></a>&nbsp;&nbsp;';
            }


            str += '<a target="_blank" href="' + json.rows[ii].cell[4] + '"><img src="/content/images/cardpush/detail.gif" width="80" height="20" border="0" /></a>' +
                    '</li></ul>';
         }

         $("#act_list_div").html(str);
         $("#curr_page").text(json.CurrPage);
         $("#max_page").text(json.MaxPage);

         if (json.MaxPage > 1) {
            $("#item_list_pager_id").show();
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         $("#act_list_div").html("暂无更多活动。");
      }
   });
}


function SubmitBM(applyID) {

    var name = $("#login_uaccount").text();
    if ($.trim(name) == "") {
       alert("用户没有登陆9you帐号，请先登陆！");
       return;
    }

    $("#in_content").html('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
    tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

    url = '<%= Url.Action("ActionApply") %>';
    $.ajax({
       url: url,
       type: "POST",
       dataType: "json",
       data: { strApplyID: applyID },
       success: submitGameItemSuccessed,
       error: function(XMLHttpRequest, textStatus) { parent.tb_remove(); }
    });
}

function outOfDate() {
   alert("本次活动已截止！");
}

function submitGameItemSuccessed(result) {
   parent.tb_remove();
   var r = result.isSuccessed - 0

   if (r == 5) {
      //
      alert(result.msg);
   }
   else if (r == 6) {

      alert(result.msg);
      window.location.href = '<%= Url.Action("CardBind") %>';
   }
   else if (r == 7) {
      //
      alert(result.msg);
   }
   else if (r == 9) {
      //
      alert(result.msg);
   }
   else if (r == 10) {
      //
      alert(result.msg);
   }
   else if (r == 19) {
      alert(result.msg);
   }
}

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="关 闭" onclick="parent.tb_remove();" /></div>').show();
}

</script>
</asp:Content>
