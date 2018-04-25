<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
���Ź���</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="newsmanage_list">
   <table id="table_new_list" cellpadding="0" cellspacing="0">
      <thead>
         <tr>
            <td width="60">���</td>
            <td width="100">����</td>
            <td width="100">��������</td>
            <td width="400">�������</td>
            
            <td>����</td>
         </tr>
      </thead>
      <tbody>
   
   <%
       var list = ViewData["notices"] as List<Notice>;
       var pager = ViewData["pagers"] as PageMan;
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
               <td><%=Html.Encode(item.NID)%></td>
               <td><%=Html.Encode(item.NTIME)%></td>
               <%
                   if (item.NTYPE == 1)
                   {
               %>
                    <td>�����ƶ�</td>
               <%
                   }
                   else
                   {
               %>
                    <td>��Ŀ����</td>
               <%
                   }
                     
               %>
               
               <td><%=item.TITLE%></td>
               <td>
                  
                  <% 
                     if (item.STATUS == 0)
                     {
                  %>
                        <input type="checkbox" checked="checked" onclick="updateStatus(this)" />
                  <%      
                     }
                     else
                     {
                  %>
                        <input type="checkbox" onclick="updateStatus(this)" />
                  <%
                     }
                  %>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a class="news_edit" href="#newsmanage_edit">�༭</a>
                  <span style="display:none;"><%=Html.Encode(item.NID)%></span>
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
                  ��&nbsp;<%= total.ToString()%>&nbsp;��¼��ÿҳ&nbsp;<%= pager.PageSize%>&nbsp;��
                  ת��
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
                  </select>&nbsp;ҳ
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
<div id="newsmanage_edit_dvtlt">��ӹ���</div>
<ul>
   <li>
      <span>�������</span><br />
      <input name="title" id="news_title" type="text" /><input type="hidden" id="news_id" />

   </li>
   <li>
       <span style="vertical-align:top;">��������</span>
      <div id="panel" name="panel"></div>
      <div id="news_cnt" name="news_cnt" ></div>
   </li>
</ul>
   
<ul>
   <li>
      <span>��������</span><select id="NoticeType" name="NoticeType">
        <option value="0">�����ƶ�</option>
        <option value="1">�ճ�����</option>
      </select>
   </li>
   <li>
      <a id="news_edit_commit" href="javascript:;"  style="width:80px;margin:15px 0 0 30px;" >��ӹ���                                                        </a>
      <a id="news_edit_save" href="javascript:;" style="width:80px;margin:15px 0 0 30px; display:none;" >�����޸�</a>
      <a id="news_edit_cancel" href="javascript:;" style="width:80px;margin:15px 0 0 30px;display:none;" >ȡ���༭</a>
   </li>
</ul>
</div>

<div id="hiddenModalContent" style="display:none;"><p id="in_content">�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

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

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="�� ��" onclick="parent.tb_remove();" /></div>').show();
}

function alertMsg1(msg) {

   $("#in_content").hide().html('<div>&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div>').show();
}


function updateStatus(tag) {
   var news_id = $(tag).next().next().text();
   var news_type = $(tag).attr("checked");

   alertMsg1('�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
   tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

   $.ajax({
      url: '<%=Url.Action("UpdateNewsType") %>',
      type: "POST",
      dataType: "json",
      data: { id: news_id, type: news_type },
      success: function(r) {
         if (r.Msg == "failed") {
            alertMsg("����ʧ��");
            $(tag).attr("checked", false);
            tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         }
         else {
            alertMsg("�����ɹ�");
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
         alertMsg("���ⲻ��Ϊ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else if (content.lenght == 0) {
         alertMsg("���ݲ���Ϊ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else {
         alertMsg1('�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("AddNews") %>',
            type: "POST",
            dataType: "json",
            data: { "title": title, "content": content, "link": $("#news_lnk").val() },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("��ӹ���ʧ��");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                   alertMsg("��ӹ���ɹ�");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
            },
            error: function(XMLHttpRequest, textStatus) {
            alertMsg("��ӹ���ʧ��" + XMLHttpRequest);
               tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               
            }
         });
      }
   });
});

$(document).ready(function() {
   $(".news_edit").each(function(i, tag) {
      $(tag).bind("click", function() {
         $("#news_edit_commit").css("display", "none");
         $("#news_edit_save").css("display", "inline");
         $("#news_edit_cancel").css("display", "inline");
         $("#newsmanage_edit_dvtlt").text("�༭����");
         $(".news_list_tr").css("background-color", "white");
         $(tag).parent().parent().css("background-color", "#5aa6f3");
         tb_show("thickbox");

         $.ajax({
            url: '<%=Url.Action("QueryOneNews") %>',
            type: "POST",
            dataType: "json",
            data: { "id": $(tag).next().text() },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("�������ݶ�ȡʧ��");
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
               alertMsg("�������ݶ�ȡʧ��");
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
         alertMsg("���ⲻ��Ϊ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else if (content.lenght == 0) {
         alertMsg("���ݲ���Ϊ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
      }
      else {
         alertMsg1('�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            url: '<%=Url.Action("EditNews") %>',
            type: "POST",
            dataType: "json",
            data: { "id": $("#news_id").val(), "title": title, "content": content, "link": $("#news_lnk").val() },
            success: function(r) {
               if (r.Msg == "failed") {
                  alertMsg("�༭����ʧ��");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
               else {
                  alertMsg("�༭���ųɹ�");
                  tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg("�༭����ʧ��");
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
   $("#newsmanage_edit_dvtlt").text("�������");
   $(".news_list_tr").css("background-color", "white");
   $("#news_id").val("");
   $("#news_title").val("");
   document.getElementById("news_cnt").innerHTML = '';
   $("#news_lnk").val("");
});



</script>


</asp:Content>
