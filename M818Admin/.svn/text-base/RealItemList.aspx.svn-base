<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	实物道具管理
</asp:Content>

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
         <td>道具名</td>
         <td>道具介绍</td>
         <td>市场价格</td>
         <td>重量</td>
         <td>消耗积分</td>
         <td>激活</td>
         <td></td>
      </tr>
   </thead>
   <tbody>
         <%
            var list = ViewData["Itemlist"] as List<MModels.NineYouRealItem>;
            var pager = ViewData["pager"] as PageMan;
            foreach (var item in list)
            {
         %>
                <tr id='<%= Html.Encode(item.RID) %>_tr'>
                  <td width="5"><input class="sch_you_item_chk" onclick="onCheck(this)" type="checkbox" /><span style="display:none;"><%= Html.Encode(item.RID) %></span></td>
                  <td width="55"><img alt="" src="<%= Html.Encode(item.IMGPATH) %>" width="48" height="48" /></td>
                  <td width="50"><%= Html.Encode(item.ITEMID) %></td>
                  <td width="55"><input type="hidden" value="<%= Html.Encode(item.GAMEID) %>" /><span><%= Html.Encode(item.GAMENAME) %></span></td>
                  <td width="90"><%= Html.Encode(item.ITEMNAME) %></td>
                  <td width="70"><%= Html.Encode(item.ITEMDESC) %></td>
                  <td width="70"><%= Html.Encode(item.MPRICE) %></td>
                  <td width="70"><%= Html.Encode(item.WEIGHT) %></td>
                  <td width="70"><%= Html.Encode(item.POINTS) %></td>
                  <%
                     if (item.ACTIVATION == 0)
                     {
                  %>
                  <td width="50"><input type="checkbox" value='<%= Html.Encode(item.RID) %>' onclick="updateAct(this)" /></td>
                  <%
                     }
                     else
                     {
                  %>
                  <td width="50"><input type="checkbox" value='<%= Html.Encode(item.RID) %>' onclick="updateAct(this)" checked="checked" /></td>
                  <%      
                     }
                  %>
                  
                  <td width="50"><a href="#sch_9you_item_edit_div" class="sch_9you_item_edit">编辑</a><span style="display:none;"><%= Html.Encode(item.RID) %></span></td>
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
                  <form  action="<%=Url.Action("RealItemList") %>" id="page_form" name="page_form" method="post">
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
   <form action='<%= Url.Action("EditRealItem") %>' method="post" name="item_form" id="item_form">
   <ul>
      <li><span>道具名</span><input type="text" name="itemName" id="itemName" /></li>
      <li><span>道具介绍</span><input type="text" name="itemDesc" id="itemDesc" /></li>
      <li><span>道具ID</span><input type="text" name="itemId" id="itemId"/></li>
      <li><span>市场价格</span><input type="text" name="mprice" id="mprice" /></li>
      <li><span>重量</span><input type="text" name="weight" id="weight"/></li>
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
      <li><span>需要积分</span><input type="text" name="point" id="point"/></li>
      <li><span>道具图片</span><img alt="" src="/content/images/cardpush/no.jpg" id="item_img_9you" width="50" height="50" /><input type="hidden" name="img" id="img" /><a href="javascript:;" style="color:#333;margin-left:15px;" onclick="selectImg('item_img_9you');return false;">选择图片</a><a style="color:#333;margin-left:15px;" href="javascript:;" onclick="defaultImg();return false;">默认图片</a></li>
      <li style="display:none;"><span>id</span><input type="text" name="rid" id="rid" value="-1" /></li>
      <li>&nbsp;</li>
      <li id="sch_9you_item_add_sub" style="display:none;"><input id="sumbit_btn" onclick="addRealItem()" type="button" value="提交" /></li>
      <li id="sch_9you_item_add_edit" style="display:none;"><input type="button" onclick="editRealItem()" id="sch_9you_item_add_edit_update" value="修改" />&nbsp;&nbsp;<input type="button" onclick="cancelEditRealItem()" id="sch_9you_item_add_edit_cancel" value="取消" /></li>
   </ul>
   </form>
</div>

<script language="javascript" type="text/javascript">

function listAll() {
   location.href = '<%= Url.Action("RealItemList") %>';
}

function add() {
   document.item_form.reset();
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

      alert("请先选择再删除。");
      return;
   }

   $.ajax({
      url: '<%=Url.Action("DelRealItem")%>',
      type: "post",
      dataType: "json",
      data: {pids:ids},
      success: function(r) {
         try {
            if (r.Msg == "failed") {
               alert("糟糕，删除失败。");
            }
            else {
               for (ii = 0; ii < r.length; ++ii) {
                  $("#" + r[ii] + "_tr").css("display", "none");
               }
               alert("删除成功。");
            }
         }
         catch (ex) {
            alert("糟糕，删除过程出错。");
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         alert("糟糕，删除过程出错。");
      }
   });
}

function setButtonDisabled(flag) {
   var d = "";
   if (flag) {
      d = "disabled";
   }
   $("#sumbit_btn").attr("disabled", d);
   $("#sch_9you_item_add_edit_update").attr("disabled", d);
   $("#sch_9you_item_add_edit_cancel").attr("disabled", d);
}

function cancelEditRealItem() {
   document.item_form.reset();
   clearForm();
   $("#sch_9you_item_edit_div").fadeOut();
}

function selectImg(id) {
   $("#browser_img_div").show();
   tb_show("", '<%= Url.Action("ListImages") %>?arg=' + id + '#?KeepThis=true&TB_iframe=true&height=400&width=630&modal=true', "thickbox");
}

function defaultImg() {
   $("#item_img_9you").attr("src", "/content/images/cardpush/no.jpg");
}

function clearForm() {
   $("#rid").val('-1');
   $("#sch_you_item_table tbody tr").css("background-color", "white");
   $("#sch_9you_item_add_sub").css("display", "block");
   $("#sch_9you_item_add_edit").css("display", "none");
   defaultImg();
}

function addRealItem() {
   $("#item_img_9you").next().val($("#item_img_9you").attr("src"));
   setButtonDisabled(true);
   document.item_form.submit();
}

function editRealItem() {
   $("#item_img_9you").next().val($("#item_img_9you").attr("src"));
   var name = $("#itemName").val();
   var desc = $("#itemDesc").val();
   var itemId = $("#itemId").val();
   var mprice = $("#mprice").val();
   var weight = $("#weight").val();
   var gid = $("#gameId").val();
   var point = $("#point").val();
   var img = $("#img").val();
   var rid = $("#rid").val();
   setButtonDisabled(true);

   $.ajax({
      url: '<%=Url.Action("EditRealItem")%>',
      type: "post",
      dataType: "json",
      data: {
         "itemName": name,
         "itemDesc": desc,
         "itemId": itemId,
         "img": img,
         "mprice": mprice,
         "gameId": gid,
         "point": point,
         "weight": weight,
         "rid": rid
      },
      success: function(r) {
         if (r.Msg == "failed") {
            alert('修改失败！');
         } else {


            var game = document.getElementById("gameId");
            var cdr = $("#" + rid + "_tr").children();

            cdr.eq(1).children().eq(0).attr("src", img); // img
            cdr.eq(2).html(itemId); // itemid
            cdr.eq(3).html(game.options[game.selectedIndex].text); // gamename
            cdr.eq(4).html(name); // item name
            cdr.eq(5).html(desc); // item desc
            cdr.eq(6).html(mprice); // mprice
            cdr.eq(7).html(weight); // weight
            cdr.eq(8).html(point); // points

            alert('修改成功！');
         }
         setButtonDisabled(false);
      },
      error: function(XMLHttpRequest, textStatus) {
         alert('修改失败！');
         setButtonDisabled(false);
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

function updateAct(tag) {
   var rid = tag.value;
   var activation = 0;
   if (tag.checked) {
      activation = 1;
   }

   $.ajax({
      url: '<%=Url.Action("UpdateActivation")%>',
      type: "post",
      dataType: "json",
      data: { "rid": rid, "activation": activation },
      success: function(r) {
         if (r.Msg == "failed") {
            if (activation == 0) {
               alert("取消激活失败！");
            }
            else {
               alert("激活失败！");
            }
            
            tag.checked = !tag.checked;
         }
         else {
            if (activation == 0) {
               alert("取消激活成功！");
            }
            else {
               alert("激活成功！");
            }
         }
      },
      error: function(XMLHttpRequest, textStatus) {
         if (activation == 0) {
               alert("取消激活失败！");
            }
            else {
               alert("激活失败！");
            }
            
            tag.checked = !tag.checked;
      }
   });
}

$(function() {
   $(".sch_9you_item_edit").each(function(i, tag) {
      $(tag).bind("click", function() {
         $("#sch_you_item_table > tbody > tr").css("background-color", "white");
         $("#" + $(tag).next().text() + "_tr").css("background-color", "#5aa6f3");
         $("#sch_9you_item_add_sub").css("display", "none");
         $("#sch_9you_item_add_edit").css("display", "block");
         if ($("#sch_9you_item_edit_div").css("display") == "none") {
            $("#sch_9you_item_edit_div").fadeIn();
         }

         var rid = $(tag).next().text();

         $.ajax({
            url: '<%=Url.Action("QueryOneRealItem")%>',
            type: "post",
            dataType: "json",
            data: { "rid": rid },
            success: function(r) {
               if (r.isSuccess > 0) {
                  $("#itemName").val(r.name);
                  $("#itemDesc").val(r.desc);
                  $("#itemId").val(r.itemid);
                  $("#mprice").val(r.mprice);
                  $("#weight").val(r.weight);
                  $("#gameId").val(r.gid);
                  $("#point").val(r.point);
                  $("#img").val(r.img);
                  $("#rid").val(r.rid);
                  $("#item_img_9you").attr("src", r.img);
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alert('读取实物道具信息失败！');
            }
         });

      });
   });
});

</script>

</asp:Content>
