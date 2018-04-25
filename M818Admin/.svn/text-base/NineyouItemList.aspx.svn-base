<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"> 9You 道具管理 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="sch_9you_item_top_div">
   <input type="button" value="显示全部" onclick="listAll()" />
</div>
<div id="sch_9you_item_mid_div">

<table id="sch_you_item_table" cellpadding="0" cellspacing="0" border="0">
   <thead>
      <tr>
         <td></td>
         <td>图片</td>
         <td>道具ID</td>
         <td>游戏名</td>
         <td>活动ID</td>
         <td>道具名</td>
         <td>道具介绍</td>
         <td>有效期</td>
         <td>个数</td>
         <td>消耗积分</td>
         <td>适用性别</td>
         <td></td>
      </tr>
   </thead>
   <tbody>
         <%
            var list = ViewData["Itemlist"] as List<MModels.NineyouItem>;
            var pager = ViewData["pager"] as PageMan;
            foreach (var item in list)
            {
         %>
                <tr id='<%= Html.Encode(item.ID) %>_tr'>
                  <td width="5"><input class="sch_you_item_chk" onclick="onCheck(this)" type="checkbox" /><span style="display:none;"><%= Html.Encode(item.ID) %></span></td>
                  <td width="55"><img alt="" src="<%= Html.Encode(item.IMGPATH) %>" width="48" height="48" /></td>
                  <td width="50"><%= Html.Encode(item.ITEMID) %></td>
                  <td width="50"><input type="hidden" value="<%= Html.Encode(item.GAMEID) %>" /><span><%= Html.Encode(item.GAMENAME) %></span></td>
                  <td width="55"><%= Html.Encode(item.ACTIVEID) %></td>
                  <td width="90"><%= Html.Encode(item.ITEMNAME) %></td>
                  <td width="70"><%= Html.Encode(item.ITEMDESC) %></td>
                  <td width="50"><%= TGProject.Helpers.Utils.ConvertIntToString((int)item.VAILDDATE, -1, "")%></td>
                  <td width="40"><%= TGProject.Helpers.Utils.ConvertIntToString((int)item.ITEMLIMIT, -1, "") %></td>
                  <td width="70"><%= Html.Encode(item.POINTS) %></td>
                  <td width="70" class="sch_you_item_table_gender"><%= Html.Encode(item.ITEMGENDER) %></td>
                  <td width="30"><a href="#sch_9you_item_edit_div" class="sch_9you_item_edit">编辑</a><span style="display:none;"><%= Html.Encode(item.ID) %></span></td>
                </tr>
         <%
            }
         %>
   </tbody>
   <%
      if (list.Count > 0)
      {
   %>
         <tfoot>
            <tr>
               <td colspan="12" align="right">
                  <form  action="<%=Url.Action("NineyouItemList") %>" id="page_form" name="page_form" method="post">
                     <input type="hidden" name="gameid" value="0"  />
                     共&nbsp;<%= pager.Total %>&nbsp;条记录，每页&nbsp;<%= pager.PageSize%>&nbsp;条
                     转到
                      <select name="page" class="select_page" onchange="page_form.submit()">
                     <%
                        for (int i = 1; i <= pager.MaxPage; i++)
                        {
                           if (pager != null && i == pager.CurrentPage)
                           {
                     %>
                           <option selected="selected"><%= i%></option>
                     <%
                        }
                           else
                           {
                     %>
                           <option><%= i%></option>
                     <%
                        }

                        }
                     %>
                  </select>&nbsp;页
                  </form>
               </td>
            </tr>
         </tfoot>
   <%} %>
</table>

</div>
<div id="sch_9you_item_bottom_div">
   <input type="button" value="添加" onclick="add()" />
   <input type="button" value="删除" onclick="del()" />
</div>

<div id="sch_9you_item_edit_div" style="display:none;">
   <form action='<%= Url.Action("EditItem") %>' method="post" name="item_form" id="item_form">
   <ul>
      <li><span>道具名</span><input type="text" name="itemName" id="itemName" /></li>
      <li><span>道具介绍</span><input type="text" name="itemDesc" id="itemDesc" /></li>
      <li><span>道具ID</span><input type="text" name="itemId" id="itemId"/>（多个ID用,分隔）</li>
      <li><span>道具有效期</span><input type="text" name="vailddate" id="vailddate" />&nbsp;天（0为无限期）</li>
      <li><span>道具次数</span><input type="text" name="itemNum" id="itemNum"/></li>
      <li>
         <span>游戏ID</span>
         <select name="gameId" id="gameId" style="width:250px;">
         <%  
            var gmlist = ViewData["gmlist"] as List<MModels.M_GameList>;
            foreach (var item in gmlist)
            {
         %>
               <option value="<%= item.ID%>"><%= item.GAMENAME%></option>
         <%
            }
         %>
         </select>
      </li>
      <li>
         <span>活动ID</span>
         <select name="actId" id="actId" style="width:250px;">
         <%  
            var actList = ViewData["actList"] as List<NineYouActive>;
            foreach (var item in actList)
            {
         %>
               <option value="<%= item.ACTIVEID%>"><%= item.ACTIVENAME%></option>
         <%
            }
         %>
         </select>
      </li>
      <li><span>道具消耗积分</span><input type="text" name="point" id="point"/></li>
      <li>
         <span>道具适用性别</span>
         <select name="gender" id="gender" style="width:250px;">
            <option value="0">女</option>
            <option value="1">男</option>
            <option value="3">通用</option>
         </select>
      </li>
      <li><span>道具图片</span><img alt="" src="/content/images/cardpush/no.jpg" id="item_img_9you" width="50" height="50" /><input type="hidden" name="img" /><a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">选择图片</a><a style="color:#333;margin-left:15px;" href="javascript:;" onclick="defaultImg();return false;">默认图片</a></li>
      <li style="display:none;"><span>id</span><input type="text" name="id" id="kid" /></li>
      <li>&nbsp;</li>
      <li id="sch_9you_item_add_sub" style="display:none;"><input id="sumbit_btn" type="button" value="提交" /></li>
      <li id="sch_9you_item_add_edit" style="display:none;"><a href="javascript:;" id="sch_9you_item_add_edit_update">修改</a>&nbsp;&nbsp;<a href="javascript:;" id="sch_9you_item_add_edit_cancel">取消</a></li>
   </ul>
   </form>
</div>




<div id="hiddenModalContent" style="display:none;"><p id="in_content">操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

<script type="text/javascript" language="javascript">

function selectImg(id) {
   $("#browser_img_div").show();
   tb_show("", '<%= Url.Action("ListImages") %>?arg=' + id + '#?KeepThis=true&TB_iframe=true&height=400&width=630&modal=true', "thickbox");
}


$(function() {
   
   $("#sumbit_btn").bind("click", function() {
      $("#item_img_9you").next().val($("#item_img_9you").attr("src"));

      if (
            $.trim($("#itemName").val()) == ""
           || $.trim($("#itemDesc").val()) == ""
           || $.trim($("#itemId").val()) == ""
           || $.trim($("#point").val()) == ""
         ) {
         alertMsg("请把信息填写完整再提交！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      if ($.trim($("#vailddate").val()) != "" && $.trim($("#itemNum").val()) != "") {
         alertMsg("有效期和次数只能填一个！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      document.item_form.submit();
   });
});

function defaultImg() {
   $("#item_img_9you").attr("src", "/content/images/cardpush/no.jpg");
}

$(function() {
   $(".sch_9you_item_edit").each(function(i, tag) {
      $(tag).bind("click", function() {
         $("#sch_you_item_table > tbody > tr").css("background-color", "white");
         $("#" + $(tag).next().text() + "_tr").css("background-color", "#5aa6f3");
         $("#sch_9you_item_add_sub").css("display", "none");
         $("#sch_9you_item_add_edit").css("display", "block");
         
         $("#item_img_9you").attr("src", $(tag).parent().parent().children().eq(1).children().eq(0).attr("src"));
         $("#itemId").val($(tag).parent().parent().children().eq(2).html());
         $("#gameId").val($(tag).parent().parent().children().eq(3).children().eq(0).val());
         $("#actId").val($(tag).parent().parent().children().eq(4).html());
         $("#itemName").val($(tag).parent().parent().children().eq(5).html());
         $("#itemDesc").val($(tag).parent().parent().children().eq(6).html());
         $("#vailddate").val($(tag).parent().parent().children().eq(7).html());
         $("#itemNum").val($(tag).parent().parent().children().eq(8).html());
         $("#point").val($(tag).parent().parent().children().eq(9).html());
         $("#gender").val(parseGenderToInt($(tag).parent().parent().children().eq(10).html()));
         
         $("#kid").val($(tag).next().text());
         if ($("#sch_9you_item_edit_div").css("display") == "none")
         $("#sch_9you_item_edit_div").fadeIn();
      });
   });
});

$(function() {
   $(".sch_you_item_table_gender").each(function(i, tag) {
      var g = $(tag).html() - 0;
      if (g == 0) {
         $(tag).html("女"); return;
      }

      if (g == 1) {
         $(tag).html("男"); return;
      }

      if (g == 3) {
         $(tag).html("通用");
      }
   });
});

function parseGenderToInt(str) {
   if (str == '女') { return 0; }
   if (str == '男') { return 1; }
   return 3;
}

function parseGenderToString(num) {
   var g = num - 0;
   if (g == 0) { return "女"; }
   if (g == 1) { return "男"; }
   return "通用";
}

$(function() {
   $("#sch_9you_item_add_edit_update").bind("click", function() {

      if (
            $.trim($("#itemName").val()) == ""
           || $.trim($("#itemDesc").val()) == ""
           || $.trim($("#itemId").val()) == ""
           || $.trim($("#point").val()) == ""
         ) {
         alertMsg("请把信息填写完整再提交！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      if ($.trim($("#vailddate").val()) != "" && $.trim($("#itemNum").val()) != "") {
         alertMsg("有效期和次数只能填一个！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      $("#in_content").html('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
      tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

      $.ajax({
         url: '<%= Url.Action("EditItem")%>',
         type: "POST",
         dataType: "json",
         data: { itemName: $("#itemName").val(), itemDesc: $("#itemDesc").val(), itemId: $("#itemId").val(), vailddate: $("#vailddate").val(), gameId: $("#gameId").val(), point: $("#point").val(), id: $("#kid").val(), img: $("#item_img_9you").attr("src"), actId: $("#actId").val(), itemNum: $("#itemNum").val(), gender: $("#gender").val() },
         success: function(r) {
            try {
               if (r.Msg == "failed" || (r.Msg + "") == "") {
                  alertMsg("糟糕，更新失败。");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  // ok

                  $("#" + $("#kid").val() + "_tr").children().eq(1).children().eq(0).attr("src", $("#item_img_9you").attr("src"));
                  $("#" + $("#kid").val() + "_tr").children().eq(2).html($("#itemId").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(3).children().eq(0).val($("#gameId").val());

                  var gg = document.getElementById("gameId");

                  $("#" + $("#kid").val() + "_tr").children().eq(3).children().eq(1).text(gg.options[gg.selectedIndex].text);
                  $("#" + $("#kid").val() + "_tr").children().eq(4).html($("#actId").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(5).html($("#itemName").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(6).html($("#itemDesc").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(7).html($("#vailddate").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(8).html($("#itemNum").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(9).html($("#point").val());
                  $("#" + $("#kid").val() + "_tr").children().eq(10).html(parseGenderToString($("#gender").val()));

                  alertMsg("更新成功。");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
            }
            catch (ex) {
               alertMsg("糟糕，更新过程出错。");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            }
         },
         error: function(XMLHttpRequest, textStatus) {
            alertMsg("糟糕，更新过程出错。");
            tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         }
      });
   });
})

$(function() {
   $("#sch_9you_item_add_edit_cancel").bind("click", function() {
      $("#sch_9you_item_edit_div").fadeOut();
      clearForm();
   });
});

function clearForm() {
   $("#sch_you_item_table > tbody > tr").css("background-color", "white");
   $("#sch_9you_item_add_sub").css("display", "block");
   $("#sch_9you_item_add_edit").css("display", "none");
   $("#kid").val('-1');
   $("#itemName").val('');
   $("#itemDesc").val('');
   $("#itemId").val('');
   $("#vailddate").val('');
   $("#gameId").val('');
   $("#actId").val('');
   $("#point").val('');
   $("#item_img_9you").attr("src", "/content/images/cardpush/no.jpg");
}

function listAll() {
   location.href = '<%= Url.Action("NineyouItemList") %>?type=0';
}

function add() {
   clearForm();
   $("#sch_9you_item_edit_div").fadeIn();
}

function del() {
   var ids = "";
   $(".sch_you_item_chk").each(function(i, tag) {
      if ($(tag).attr("checked") == true) {
         ids += $(tag).next().text() + ",";
      }
   });

   if (ids == "") {
   
      alertMsg("请先选择再删除。");
      tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      return;
   }

   $("#in_content").html('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
   tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

   $.ajax({
      url: '<%= Url.Action("DelNineyouItem")%>',
      type: "POST",
      dataType: "json",
      data: { pids: ids },
      success: function(r) {
         try {
            if (r.Msg == "failed") {
               alertMsg("糟糕，删除失败。");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            }
            else {
               for (ii = 0; ii < r.length; ++ii) {
                  $("#" + r[ii] + "_tr").css("display", "none");
               }
               alertMsg("删除成功。");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            }
         }
         catch (ex) {
            alertMsg("糟糕，删除过程出错。");
            tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         alertMsg("糟糕，删除过程出错。");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
   });
}

var color = "#50a6f3";

function onCheck(tag) {
   if (tag.checked == true) {
      $(tag).parent().parent().css("color", color);
   }
   else {
      $(tag).parent().parent().css("color", "black");
   }
}

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="关 闭" onclick="parent.tb_remove();" /></div>').show();
}

</script>
</asp:Content>
