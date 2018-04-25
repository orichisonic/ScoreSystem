<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Src="../Shared/DataGridControl.ascx" TagName="DataGridControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">�������Ʒ�б� </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



<form action="<%=Url.Action("ExchageItemList")%>" accept="POST">

   <input type="submit" value="�鿴ȫ��" onclick=""/><br /><br />
   
   <table id="table_pdt_all" cellpadding="0" cellspacing="0">
      <thead>
         <tr class="table_pdt_all_tr">
            <td width="20"></td>    
            <td width="60">��Ʒ����</td>
            <td width="100">��Ʒ����</td>
            <td width="360">��Ʒ����</td>
            <td>�һ���Ҫ���ѵĻ���</td>
            <td width="60">��Ʒ���</td>
         </tr>
      </thead>
      <tbody>
   <%  
      var inPids = "";
      if (ViewData["inOcl"] != null)
      {
         inPids = ViewData["inOcl"].ToString();
      }

      var list = ViewData["product"] as List<MModels.M_PRODUCT>;
      var pageSize = 20;
      var pageCount = 0;

      if (list.Count % pageSize == 0)
      {
         pageCount = list.Count / pageSize;
      }
      else
      {
         pageCount = list.Count / pageSize + 1;
      }
      
      foreach (var item in list)
      {
   %>
         <tr style="display:none;" id="<%=Html.Encode(item.PRODUCTID)%>">
            <td><input type="checkbox" id="<%=Html.Encode(item.PRODUCTID)%>_chk" class="table_pdt_all_chk" onclick="onCheck(this)" /><span class="table_pdt_all_pid" style="display:none;"><%=Html.Encode(item.PRODUCTID)%></span></td>
            <td><%=Html.Encode(item.PRODUCTCATEGORYNAME)%></td>
            <td><%=Html.Encode(item.PRODUCTNAME)%></td>
            <td><%=item.INTRODUCTION%></td>
            <td><input type="text" class="table_pdt_all_score" id="<%=Html.Encode(item.PRODUCTID)%>_score" value="<%=Html.Encode(item.SCORE)%>" /></td>
            <td><%=Html.Encode(item.STOCKS)%></td>
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
                  <td colspan="6" align="right">
                     ��&nbsp;<%= list.Count.ToString() %>&nbsp;��¼��ÿҳ&nbsp;<%= pageSize %>&nbsp;��
                     ת��
                     <select id="select_page"  class="select_page" onchange="goTo()">
                        <option selected="selected">1</option>
                        <%
                           for (int i = 2; i <= pageCount; i++)
                           {
                        %>
                              <option><%= i%></option>
                        <%
                           }   
                        %>
                     </select>&nbsp;ҳ
                  </td>
               </tr>
            </tfoot>
      <%
         }
      %>
   </table>
</form>
<br />
<input id="commit" class="select_page" alt="#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true" title="�ύ" class="thickbox" type="button" value="�ύ" />  
<div id="hiddenModalContent" style="display:none;"><p id="in_content">�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>
<script language="javascript" type="text/javascript">
var pageSize = 20;

var inPids = '<%=inPids %>';
var color = "#50a6f3";

if(inPids != ""){
   var inArr = inPids.toString().split(',');
   
   for(ii = 0; ii < inArr.length; ++ii){
      $("#" + inArr[ii] + "_chk").attr("checked", true);
      $("#" + inArr[ii]).css("color", color);
   }
}

$(function(){
   showPage(0, pageSize);
});


function showPage(start, end) {
   $("#table_pdt_all tbody tr").hide();
   //$("#table_pdt_all tbody tr").slice(start, end).css("display", "table-row");
   $("#table_pdt_all tbody tr").slice(start, end).show();
}

function goTo() {
   var p = $("#select_page").val();

   showPage((p - 1) * pageSize, p * pageSize - 1);
}

$(function() {

   $("#commit").bind("click", function() {

      var flag = true;

      $(".table_pdt_all_chk").each(function(i, tag) {

         if (tag.checked == true) {

            if ($(tag).parent().parent().children().eq(4).children().eq(0).val() <= 0) {
               flag = false;
            }
         }
      });

      if (!flag) {
         alertMsg("�һ���Ҫ���ѵĻ��ֱ������ 0 ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }
      else {
         $("#in_content").html('�����У����Ժ�...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');
      }

      tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");

      var pids = "";
      var scores = "";
      $(".table_pdt_all_chk").each(function(i, tag) {

         if (tag.checked == true) {
            pids += $(tag).next().text() + ",";
            scores += $(tag).parent().parent().children().eq(4).children().eq(0).val() + ",";
         }
      });

      if (pids == "") {
         alertMsg("����ѡ�����ύ��");
         tb_show("", "#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true", "thickbox");
         return;
      }

      $.ajax({
         type: "POST",
         url: '<%=Url.Action("Add818Product") %>',
         data: { "pids": pids, "scores": scores },
         dataType: "json",
         success: function(r) {
            if (r.Msg == "failed") {
               alertMsg("��⣡����ʧ�ܣ�������һ�Ρ�");
            }
            else if (r.Msg == "ok") {
               alertMsg("�����ɹ���");
            }
            else {
               for (ii = 0; ii < r.length; ++ii) {

                  $("#" + r[ii] + "_chk").attr("checked", false);
                  $("#" + r[ii]).css("color", "black");
               }
               alertMsg("��Ǹ�����ֲ���δ�ɹ���������������ȡ���˹�ѡ��");
            }
         },
         error: function(XMLHttpRequest, textStatus) {
            tb_remove();
         }

      });
   });

});
function alertMsg(msg){
   
   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="�� ��" onclick="parent.tb_remove();" /></div>').show();
}

function onCheck(tag)
{
   if(tag.checked == true){
      $(tag).parent().parent().css("color", color);
   }
   else{
      $(tag).parent().parent().css("color", "black");
   }
}

</script>

</asp:Content>
