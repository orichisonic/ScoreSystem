<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
�ϴ�����ͼƬ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="item_img_dv">
   <div class="item_img_title" >����ͼƬ�б�&nbsp;&nbsp;<a href="<%=Url.Action("itemimage") %>">ˢ��</a></div>
   <div>
    <% 
       if (ViewData["imgs"] != null)
       {
          var names = ((string[])ViewData["imgs"]);

          foreach (string name in names)
          {
             if (name.Trim().Length > 0)
             {
    %>
               <div class="m818_item_img_box">
                  <div class="m818_item_img"><img style="margin:3px;" title="<%=name %>" alt="<%=name %>" src="/upload/m818/<%=name %>" width="100" height="100" /></div>
                  <input type="text" class="m818_item_img_name" value="<%= name %>" readonly="readonly" />&nbsp;&nbsp;<a class="del_img" href="javascript:;">ɾ��</a>
               </div>
    <%
             }
          }
       }   
    %>
    </div>
</div>

<div class="item_img_dv">
   <div class="item_img_title">��ѡ��Ҫ�ϴ���ͼƬ��֧��gif��jpeg��jpg��png��ͬ��ͼƬ����ɾ�������ϴ���</div>
   <div>
      <form name="mainForm" id="load" enctype="multipart/form-data" action="<%=Url.Action("ItemImage") %>" method="post">
         <input class="upload_input" type="file" id="file1" name="file1" /><br />
         <br />
         <input class="upload_input" type="file" id="file2" name="file2" /><br />
         <br />
         <input class="upload_input" type="file" id="file3" name="file3" /><br />
         <br />
         <input class="upload_input" type="file" id="file4" name="file4" /><br />
         <br />
         <input class="upload_input" type="file" id="file5" name="file5" /><br />
         <br />
         <input type="submit" value="�ϴ�" />
      </form>
  </div>
</div>
<div id="hiddenModalContent" style="display:none;"><p id="in_content">�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

<script type="text/javascript">

$(function() {

   $(".del_img").each(function(i, tag) {

      $(tag).bind("click", function() {

         var pic_name = $(tag).prev().val();

         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

         $.ajax({
            type: "POST",
            url: '<%= Url.Action("DelItemImg") %>',
            data: { name: pic_name },
            dataType: "json",
            success: function(r) {
               if (r.Msg == "ok") {
                  alertMsg('ͼƬɾ���ɹ���');
                  $(tag).parent().css("display", "none");
               }
               else if (r.Msg == "noaccess") {
                  alertMsg('��û��ɾ��ͼƬ����ɣ�');
               }
               else {
                  alertMsg('ͼƬɾ��ʧ�ܣ�');
               }
            },
            error: function(XMLHttpRequest, textStatus) {
               alertMsg('��⣬����ʧ�ܣ�');
            }
         });
      });

   });

})

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="�� ��" onclick="parent.tb_remove();" /></div>').show();
}

</script>

</asp:Content>
