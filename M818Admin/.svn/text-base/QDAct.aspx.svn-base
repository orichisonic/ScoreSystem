<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">活动管理 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script src="/Scripts/jscal2.js" type="text/javascript"></script>

<script src="/Scripts/cn.js" type="text/javascript"></script>

<div class="manage_div">
   <div class="manage_head_div">
      <form  action="<%=Url.Action("QDAct") %>" method="post">
      <ul>
         <li>
            <div class="manage_head_div_title_div">
               过虑条件</div>
         </li>
         <li>
            活动时间大于：<input type="text" name="stime" id="qd_act_starttime" />
         </li>
      </ul>
      <input type="hidden" value="1" name="reload" />
      <input type="submit" value="查询"/>
      </form>
   </div>
   <div class="manage_body_div">
   
      <table class="manage_body_div_table" border="0" cellpadding="0" cellspacing="0">
         <thead>
            <tr>
               <td></td>
               <td>编号</td>
               <td>活动名称</td>
               <td>活动时间</td>
               <%--<td>活动描述</td>--%>
               <td>游戏</td>
               <td>活动大区</td>
               <td>有效期（天）</td>
               <td></td>
            </tr>
         </thead>
         <tbody>
               <%
                  var list = ViewData["Itemlist"] as List<NineYouActive>;
                  var pager = ViewData["pager"] as PageMan;
                  foreach (var item in list)
                  {
               %>
                      <tr id='<%= Html.Encode(item.ACTIVEID) %>_tr'>
                        <td width="10"width="10"><input type="checkbox" class="act_chk" onclick="onActCheck(this)" /><span style="display:none;"><%= Html.Encode(item.ACTIVEID)%></span></td>
                        <td width="30"><%= Html.Encode(item.ACTIVEID)%></td>
                        <td width="100"><%= Html.Encode(item.ACTIVENAME)%></td>
                        <td width="190"><%= Html.Encode(TGProject.Helpers.Utils.ParseNewsDate(item.ACTIVEDATE))%>&nbsp;<span style="color:#FF9C08;font-weight:bold;">/</span>&nbsp;<%= Html.Encode(TGProject.Helpers.Utils.ParseNewsDate(item.ACTIVEENDDATE))%></td>
                        <%--<td width="60"><%= Html.Encode(item.ACTIVEDESC)%></td>--%>
                        <td width="60"><%= Html.Encode(item.GAMENAME)%></td>
                        <td width=""><%--<%= Html.Encode(item.GAMEAREAName)%><%= Html.ListBox("", new List<string>(){"1", "2"}) %>--%>
                        <select size="1" style="width:100px;">
                        <%
                           var arealist = item.GAMEAREAName.Split(',');
                           foreach (var area in arealist)
                           {
                        %>
                              <option><%= area%></option>
                        <%
                           }
                        %>
                        </select>
                        </td>
                        <td width="80"><%= Html.Encode(item.EFFECTIVE_MONTH)%></td>
                        <td width="60">
                           <%
                              if (item.STATE == (int)TGProject.Helpers.CheckState.Wait)
                              {
                           %>
                                 <a class="act_edit" href="#manage_foot_div_id">编辑</a>
                                 <span style="display:none;"><%= Html.Encode(item.ACTIVEID)%></span>
                                 <a class="act_check" href="javascript:;">审核</a>
                           <%
                              }
                              else if (item.STATE == (int)TGProject.Helpers.CheckState.Checking)
                              {
                           %>
                                 <a>审核中</a>
                           <%   
                              }
                              else if (item.STATE == (int)TGProject.Helpers.CheckState.OK)
                              {
                           %>
                                 <a>审核通过</a>
                           <% 
                              }
                           %>
                           
                        </td>
                      </tr>
               <%
                  }
               %>
         </tbody>
         <tfoot>
            <tr>
            <td colspan="9" align="right">
               <form  action="<%=Url.Action("QDAct") %>" id="page_form" name="page_form" method="post">
               <%
               if (list.Count > 0)
               {
               %>
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
               <%} %>
               
                  <input type="hidden" name="stime" id="starttime" value="<%= ViewData["starttime"] %>" />
                  </form>
               </td>
            </tr>
         </tfoot>
      </table>
   
      <ul class="manage_body_div_op_ul">
         <li>
            <input type="button" value="添加" onclick="showFooterDiv()" />
            <input type="button" value="删除" onclick="delAct()" /></li>
      </ul>
   </div>
   <div class="manage_foot_div" id="manage_foot_div_id" style="display:none;">
   <form action="<%=Url.Action("EditQDActive") %>" name="act_manage_form" id="act_manage_form" method="post">
   <ul>
      <li>
         <span>选择游戏：</span>
         <select name="gid" id="gameId" style="width:250px;" onchange="getSerList(this.value)">
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
      <li><span>活动名称：</span><input type="text" name="actName" id="actName" /></li>      
      <li><span>活动简介：</span><input type="text" name="actDesc" id="actDesc" /></li>      
      <li><span>开始时间：</span><input type="text" name="stime" id="op_act_start_time" /></li>      
      <li><span>结束时间：</span><input type="text" name="etime" id="op_act_end_time" /></li>      
      <li><span>活动奖励：</span><input type="text" name="award" id="award" />&nbsp;个积分</li>     
      <li><span>有效期：</span><input type="text" name="emonth" id="emonth" />&nbsp;天</li>
      <li><span>活动链接：</span><input type="text" name="link" id="link" /></li>
      <li>
         <span>活动大区：</span>
         <select id="garea_choose" size="5" style="width:250px;height:78px;" ondblclick="selectArea(this.value, this.options[this.selectedIndex].text)">
         </select>
         <select id="garea_choosed" size="5" style="width:250px;height:78px;" ondblclick="delArea(this, this.value, this.selectedIndex)">
         </select>
         <input type="hidden" name="garea" id="garea" />
      </li>
      <li><span>活动图片：</span><img alt="" src="/content/images/cardpush/no.jpg" id="act_img" width="50" height="50" /><input type="hidden" name="img" /><a href="javascript:;" style="color:#333;padding-left:15px;" onclick="selectImg('act_img');return false;">选择图片</a></li>
      <li style="display:none;"><input type="hidden" name="id" value="-1" id="acid" /></li>
      <li id="manage_foot_div_id_submit"><input type="button" value="提交" id="act_manage_form_submit" /></li>
      <li id="manage_foot_div_id_update" style="display:none;"><a href="javascript:;" id="manage_foot_div_id_edit">修改</a>&nbsp;&nbsp;<a href="javascript:;" id="manage_foot_div_id_cancel">取消</a></li>    
   </ul>
   
   </form>
   </div>
</div>

<div id="hiddenModalContent" style="display:none;"><p id="in_content">操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

<script type="text/javascript" language="javascript">

function selectImg(id) {
   $("#browser_img_div").show();
   tb_show("", '<%= Url.Action("ListImages") %>?arg=' + id + '#?KeepThis=true&TB_iframe=true&height=400&width=600&modal=true', "thickbox");
}
 var add_value = new Array();
 function selectArea(v, txt) {
    if (v == 0) {
       add_value.length = 0;
       $("#garea_choosed").html('');
    }
    var flag = true;
    for (i = 0; i < add_value.length; ++i) {
       if (add_value[i] == 0 || add_value[i] == v) {
          flag = false;
          break;
       }
    }
    if (flag) {
       add_value[v] = v;
       $("#garea_choosed").html($("#garea_choosed").html() + '<option value="' + v + '">' + txt + '</option>');
    }
 }

 function delArea(tag, v, index) {
    if (v == 0 && index == 0) {
       add_value.length = 0;
       $("#garea_choosed").html('');
       return;
    }
    if (index > -1) {
       tag.remove(index);
       add_value[v] = -1;
    } 
 }

 function getSerList(v, isEdit, aids) {
    add_value.length = 0;
    $("#garea_choosed").html('');
   var all = '<option value="0">所有大区</option>';
   var str = "";
   $.ajax({
      url: '<%=Url.Action("GetAreaByGameId") %>',
      type: "post",
      dataType: "json",
      data: { gameId: v },
      success: function(r) {
         try {
            for (i = 0; i < r.length; ++i) {

               str += '<option value="' + r[i].id + '">' + r[i].name + '</option>';
            }
            $("#garea_choose").html(all + str);

            if (isEdit) {

               var gg = document.getElementById("garea_choose");
               var ids = aids.split(',');

               for (m = 0; m < ids.length; ++m) {
                  selectArea(ids[m], gg.options[ids[m]].text);
               }
            }
         }
         catch (ex) {
            $("#garea_choose").html(all);
         }
      },
      error: function(XMLHttpRequest, textStatus) {
      }
   });
}

$(function() {
   $(".act_check").each(function(i, tag) {
      $(tag).bind("click", function() {
         var aid = $(tag).prev().text();
         alertMsg2("审核提交中，请稍后...");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("QueryOneAct") %>',
            type: "post",
            dataType: "json",
            data: { acid: aid, isCheck: "true" },
            success: function(r) {

               try {
                  if (r.Msg == "failed") {

                     alertMsg("提交审核失败，请重试！");
                     tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                  }
                  else {
                     if (r.Msg === '{"state":"OK"}') {

                        updateChecking1(aid, tag);
                     }
                     else {
                        alertMsg("提交审核失败，请重试！");
                        tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                     }
                  }
               }
               catch (ex) {
                  alertMsg("提交审核失败，请重试！");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("提交审核失败，请重试！");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            }
         });
      });
   });
});



function updateChecking1(id, tag) {

   $.ajax({
      url: '<%=Url.Action("UpdateToChecking") %>',
      type: "POST",
      dataType: "json",
      data: { "id": id },
      success: function(r) {
         alertMsg("提交审核成功！");
         $(tag).parent().html("<a>审核中</a>");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      },
      error: function(XMLHttpRequest, textStatus) {
         alertMsg("提交审核失败，请重试！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
   });
}


$(function() {
   showCal('qd_act_starttime');
   showCal('op_act_start_time');
   showCal('op_act_end_time');
   $("#manage_foot_div_id_cancel").bind("click", function() {

      clearForm();
      $("#manage_foot_div_id").fadeOut();
      $("#manage_foot_div_id_submit").hide();
      $("#manage_foot_div_id_update").show();
   });
});

function alertMsg2(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"></div>').show();
}

$(function() {
   $("#act_manage_form_submit").bind("click", function() {
      $("#act_img").next().val($("#act_img").attr("src"));
      $("#garea").val(add_value.toString());
      if (
            $.trim($("#actName").val()) == "" ||
            $.trim($("#actDesc").val()) == "" ||
            $.trim($("#op_act_start_time").val()) == "" ||
            $.trim($("#op_act_end_time").val()) == "" ||
            $.trim($("#award").val()) == "" ||
            $.trim($("#link").val()) == "" ||
            $.trim($("#emonth").val()) == ""
         ) {
         alertMsg("请把信息填写完整再提交！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      document.act_manage_form.submit();
   });
});

$(function() {
   $(".act_edit").each(function(i, tag) {
      $(tag).bind("click", function() {
         tb_show("thickbox");
         add_value.length = 0;
         $("#garea_choose").html('');
         $("#garea_choosed").html('');
         $.ajax({
            url: '<%=Url.Action("QueryOneAct") %>',
            type: "post",
            dataType: "json",
            data: { acid: $(tag).next().text(), isCheck:"false" },
            success: function(r) {
               tb_remove();
               try {
                  if (r.Msg == "failed") {
                     alertMsg("活动内容读取失败！");
                     tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                  }
                  else {
                     $("#gameId").val(r.gid);
                     $("#actName").val(r.name);
                     $("#actDesc").val(r.desc);
                     $("#op_act_start_time").val(r.date);
                     $("#op_act_end_time").val(r.enddate);
                     $("#award").val(r.award);
                     $("#link").val(r.link);
                     $("#emonth").val(r.emonth);
                     $("#acid").val(r.id);
                     getSerList(r.gid, true, r.garea);
                     $("#act_img").attr("src", r.img);
                     $("#manage_foot_div_id").fadeIn();
                     $("#manage_foot_div_id_submit").hide();
                     $("#manage_foot_div_id_update").show();
                  }
               }
               catch (ex) {
                  tb_remove();
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               tb_remove();
            }
         });
      });
   });
});

$(function() {
   $("#manage_foot_div_id_edit").bind("click", function() {

      if (
            $.trim($("#actName").val()) == "" ||
            $.trim($("#actDesc").val()) == "" ||
            $.trim($("#op_act_start_time").val()) == "" ||
            $.trim($("#op_act_end_time").val()) == "" ||
            $.trim($("#award").val()) == "" ||
            $.trim($("#link").val()) == "" ||
            $.trim($("#emonth").val()) == ""
         ) {
         alertMsg("请把信息填写完整再提交！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      $.ajax({
         url: '<%=Url.Action("EditQDActive") %>',
         type: "post",
         dataType: "json",
         data: { gid: $("#gameId").val(), actName: $("#actName").val(), actDesc: $("#actDesc").val(), stime: $("#op_act_start_time").val(), award: $("#award").val(), link: $("#link").val(), id: $("#acid").val(), img: $("#act_img").attr("src"), emonth: $("#emonth").val(), etime: $("#op_act_end_time").val(), garea: add_value.toString() },
         success: function(r) {
            try {
               if (r.Msg == "failed" || (r.Msg + "") == "") {
                  alertMsg("糟糕，更新活动失败。");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  alertMsg("更新活动成功！");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                  $("#" + $("#acid").val() + "_tr").children().eq(2).html($("#actName").val());
                  $("#" + $("#acid").val() + "_tr").children().eq(3).html($("#op_act_start_time").val() + '&nbsp;<span style="color:#FF9C08;font-weight:bold;">/</span>&nbsp;' + $("#op_act_end_time").val());
                  //$("#" + $("#acid").val() + "_tr").children().eq(4).html($("#actDesc").val());
                  var gg = document.getElementById("gameId");

                  $("#" + $("#acid").val() + "_tr").children().eq(4).html(gg.options[gg.selectedIndex].text);
                  $("#" + $("#acid").val() + "_tr").children().eq(5).html("已更新");
                  $("#" + $("#acid").val() + "_tr").children().eq(6).html($("#emonth").val());

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
});

var color = "#50a6f3";

function onActCheck(tag) {
   if (tag.checked == true) {
      $(tag).parent().parent().css("color", color);
   }
   else {
      $(tag).parent().parent().css("color", "black");
   }
}

function delAct() {

   var ids = "";
   $(".act_chk").each(function(i, tag) {
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
      url: '<%= Url.Action("DelActive")%>',
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

$("#qd_act_starttime").val($("#starttime").val());

function showFooterDiv() {
   clearForm();
   $("#manage_foot_div_id").fadeIn();
   $("#manage_foot_div_id_submit").show();
   $("#manage_foot_div_id_update").hide();
   getSerList($("#gameId").val());
}

function clearForm() {
   $("#gameId").val('');
   $("#actName").val('');
   $("#actDesc").val('');
   $("#op_act_start_time").val('');
   $("#op_act_end_time").val('');
   $("#emonth").val('');
   $("#award").val('');
   $("#link").val('');
   $("#acid").val('');
   $("#acid").val(-1);
   $("#act_img").attr("src", "/content/images/cardpush/no.jpg");
   add_value.length = 0;
   $("#garea_choose").html('');
   $("#garea_choosed").html('');
}

function showCal(id) {
   var LEFT_CAL = Calendar.setup({
      //cont: "cont",
      weekNumbers: false,
      selectionType: Calendar.SEL_MULTIPLE,
      //showTime: 12
      //showTime: 24,
      fdow: 0,
      trigger: id, // 触发控件id
      inputField: id,
      //min: 最小
      //max: 最大
      // titleFormat: "%B %Y"
      onSelect: function() { this.hide(); $("#starttime").val($("#qd_act_starttime").val()); }
   })
}

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="关 闭" onclick="parent.tb_remove();" /></div>').show();
}

</script>
</asp:Content>
