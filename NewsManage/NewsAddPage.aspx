<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
新闻管理</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div><input type="button" value="显示全部" onclick="javascript:window.location.href = '<%= Url.Action("NewsAddPage") %>';" /></div>
<div id="newsmanage_list">
   <table id="table_new_list" cellpadding="0" cellspacing="0">
      <thead>
         <tr>
            <td width="60">编号</td>
            <td width="120">日期</td>
            <td width="470">新闻标题</td>
            <td>启用</td>
         </tr>
      </thead>
      <tbody>
   
   <%
      var list = ViewData["news"] as List<News>;
      var pager = ViewData["pager"] as PageMan;
      var total = 0;
      var maxPage = 0;
      
      if (list != null && pager != null)
      {
         total = pager.Total;
         maxPage = pager.MaxPage;
         foreach (var item in list)
         {
   %>
            <tr class="news_list_tr">
               <td><%=Html.Encode(item.ID)%></td>
               <td><%=Html.Encode(item.TIME)%></td>
               <td id="news_list_tr_<%=Html.Encode(item.ID)%>"><%=item.TITLE%></td>
               <td>
                  
                  <% 
                     if (item.TYPE == 0)
                     {
                  %>
                        <input type="checkbox" checked="checked" onclick="updateStatus(this)" />
                  <%      
                     }
                     else if (item.TYPE == (int)TGProject.Helpers.CheckState.OK)
                     {
                  %>
                        <input type="checkbox" onclick="updateStatus(this)" />
                  <%
                     }
                  %>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <%
                     if (item.TYPE == (int)TGProject.Helpers.CheckState.Wait)
                     {
                  %>
                        <a class="news_edit" href="#newsmanage_edit">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="news_check" href="javascript:;">审核</a>
                        
                  <%
                     }
                     else if (item.TYPE == (int)TGProject.Helpers.CheckState.Checking)
                     {
                  %>
                       <a>审核中</a>
                  <%
                     }
                     else
                     {
                  %>
                       <a>审核通过</a>
                  <%   
                     }
                  %>
                  <span style="display:none;"><%=Html.Encode(item.ID)%></span>
               </td>
            </tr>
   <%
         }
      }
   %>
   
   </tbody>
      <%
         if (list.Count > 0)
         {   
      %>
      <tfoot>
         <tr>
            <td colspan="6" align="right">
               <form action="<%=Url.Action("NewsAddPage") %>" id="page_form" name="page_form" accept="POST">
                  共&nbsp;<%= total.ToString()%>&nbsp;条记录，每页&nbsp;<%= pager.PageSize%>&nbsp;条
                  转到
                  <select name="page" class="select_page" onchange="page_form.submit()">
                     <%
               for (int i = 1; i <= maxPage; i++)
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
      <%
         } 
      %>
   </table>
</div>

<div id="newsmanage_edit">
<div id="newsmanage_edit_dvtlt">添加新闻</div>
<ul>
   <li>
      <span>新闻标题</span><br />
      <input name="title" id="news_title" type="text" /><input type="hidden" id="news_id" />
   </li>
   <li>
      <span style="vertical-align:top;">新闻内容</span>
      <div id="panel" name="panel"></div>
      <div id="news_cnt" name="news_cnt" ></div>
   </li>
</ul>
   
<ul>
   <li>
      <span>相关链接</span><br />
      <input name="link" id="news_lnk" type="text" />
   </li>
   <li>
      <a id="news_edit_commit" href="javascript:;"  style="width:80px;margin:15px 0 0 30px;" >添加新闻</a>
      <a id="news_edit_save" href="javascript:;" style="width:80px;margin:15px 0 0 30px; display:none;" >保存修改</a>
      <a id="news_edit_cancel" href="javascript:;" style="width:80px;margin:15px 0 0 30px;display:none;" >取消编辑</a>
   </li>
</ul>
</div>

<div id="hiddenModalContent" style="display:none;"><p id="in_content">操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

<script language="javascript" type="text/javascript">

var editor = new nicEditor({ buttonList: ['fontSize', 'fontFamily', 'fontFormat', 'bold', 'italic', 'underline', 'strikeThrough', 'removeformat', 'hr', 'forecolor', 'link'] });

editor.setPanel('panel');
editor.addInstance('news_cnt');

function parse(str) {

   while (str.indexOf("<") != -1) {

      str = str.replace("<", "&lt;");
   }
   while (str.indexOf(">") != -1) {

      str = str.replace(">", "&gt;");
   }
   return str;
}

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="关 闭" onclick="parent.tb_remove();" /></div>').show();
}

function alertMsg2(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"></div>').show();
}

function alertMsg1(msg) {

   $("#in_content").hide().html('<div>&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div>').show();
}


function updateStatus(tag) {
   var news_id = $(tag).next().next().text();
   var news_type = $(tag).attr("checked");

   alertMsg1('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
   tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

   $.ajax({
      url: '<%=Url.Action("UpdateNewsType") %>',
      type: "POST",
      dataType: "json",
      data: { id: news_id, type: news_type },
      success: function(r) {
         if (r.Msg == "failed") {
            alertMsg("操作失败");
            $(tag).attr("checked", false);
            tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         }
         else {
            alertMsg("操作成功");
            tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=false", "thickbox");
         }
      }

   });
}


$(document).ready(function() {

   $("#news_edit_commit").bind("click", function() {

      var title = $.trim($("#news_title").val());
      var content = parse($("#news_cnt").html());

      if (title.length == 0) {
         alertMsg("标题不能为空");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else if (content.lenght == 0) {
         alertMsg("内容不能为空");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else {
         alertMsg1('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("AddNews") %>',
            type: "POST",
            dataType: "json",
            data: { "title": title, "content": content, "link": $("#news_lnk").val() },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("添加新闻失败");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  alertMsg2("添加新闻成功，正在刷新，请稍后...");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                  window.location.href = '<%= Url.Action("NewsAddPage") %>';
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("添加新闻失败" + XMLHttpRequest);
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

            }
         });
      }
   });
});

$(function() {
   $(".news_check").each(function(i, tag) {
      $(tag).bind("click", function() {
         var nid = $(tag).next().text();
         $(".news_list_tr").css("background-color", "white");
         $(tag).parent().parent().css("background-color", "#5aa6f3");
         alertMsg2("审核提交中，请稍后...");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("QueryOneNews") %>',
            type: "POST",
            dataType: "json",
            data: { "id": nid, "isCheck": "true" },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("提交审核失败，请重试！");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  if (r.Msg === '{"state":"OK"}') {
                     updateChecking(nid, tag);
                  }
                  else {
                     alertMsg("提交审核失败，请重试！");
                     tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
                  }
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("提交审核失败，请重试！");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            },
            complete: function() {
            }
         });
      });
   });
});

function updateChecking(id, tag) {
   $.ajax({
      url: '<%=Url.Action("UpdateToChecking") %>',
      type: "POST",
      dataType: "json",
      data: { "id": id },
      success: function(r) {
         alertMsg("提交审核成功！");
         $(tag).parent().html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>审核中</a>");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      },
      error: function(XMLHttpRequest, textStatus) {
         alertMsg("提交审核失败，请重试！");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
   });
}

$(document).ready(function() {
   $(".news_edit").each(function(i, tag) {
      $(tag).bind("click", function() {
         
         $("#news_edit_commit").css("display", "none");
         $("#news_edit_save").css("display", "inline");
         $("#news_edit_cancel").css("display", "inline");
         $("#newsmanage_edit_dvtlt").text("编辑新闻");
         $(".news_list_tr").css("background-color", "white");
         $(tag).parent().parent().css("background-color", "#5aa6f3");
         tb_show("thickbox");

         $.ajax({
            url: '<%=Url.Action("QueryOneNews") %>',
            type: "POST",
            dataType: "json",
            data: { "id": $(tag).next().next().text(), "isCheck":"false" },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("新闻内容读取失败");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  $("#news_id").val(r.id)
                  $("#news_title").val(r.title)

                  document.getElementById("news_cnt").innerHTML = r.content;
                  $("#news_lnk").val(r.link)
                  tb_remove();
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("新闻内容读取失败");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            },
            complete: function() {
            }
         });

      });
   });
});

$(document).ready(function() {
   $("#news_edit_save").bind("click", function() {
      var title = $.trim($("#news_title").val());
      var content = parse($("#news_cnt").html());

      if (title.length == 0) {
         alertMsg("标题不能为空");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else if (content.lenght == 0) {
         alertMsg("内容不能为空");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else {
         alertMsg1('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("EditNews") %>',
            type: "POST",
            dataType: "json",
            data: { "id": $("#news_id").val(), "title": title, "content": content, "link": $("#news_lnk").val() },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("编辑新闻失败");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  alertMsg("编辑新闻成功");
                  $("#news_list_tr_" + $("#news_id").val()).html(title);
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("编辑新闻失败");
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
            }
         });
      }
   });
});

$("#news_edit_cancel").bind("click", function() {
   $("#news_edit_commit").css("display", "inline");
   $("#news_edit_save").css("display", "none");
   $("#news_edit_cancel").css("display", "none");
   $("#newsmanage_edit_dvtlt").text("添加新闻");
   $(".news_list_tr").css("background-color", "white");
   $("#news_id").val("");
   $("#news_title").val("");
   document.getElementById("news_cnt").innerHTML = '';
   $("#news_lnk").val("");
});


</script>

</asp:Content>
