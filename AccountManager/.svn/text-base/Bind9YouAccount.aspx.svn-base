<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广账号绑定 9You 账号
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" language="javascript">

$(document).ready(function() {

   $("#btn_bind").bind("click", function() {

      $("#in_content").html('操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" />');

      $.ajax({
         type: "POST",
         url: 'Bind/',
         dataType: "json",
         data: { 'nineyouAccount': $("#userName").val(), 'nineyouPwd': $("#password").val() },
         success: function(r) {

            alertMsg(r.Msg);
         },
         error: function(XMLHttpRequest, textStatus) {
            alertMsg(textStatus);
         }
      });

   });

   $("#show_identifyingCode").bind("click", function() {

      $("#9you_identifyingCode").css("visibility", "visible");
      $("#show_identifyingCode").css("display", "none");
      $("#direct_to_MProductList").css("display", "inline");

   });
});

function alertMsg(msg) {

   $("#in_content").hide().html('<div><img src="/content/images/alert.gif" />&nbsp;&nbsp;&nbsp;&nbsp;' + msg + '</div><div style="border-top:solid 1px #bbb;padding-top:8px;margin-top:5px;text-align:center;"><input type="button" value="关 闭" onclick="parent.tb_remove();" /></div>').show();
}



</script>

<div id="bind9you_div">
   <span style="font-size:16px;font-weight:bold;">绑定推广账号和 9You 账号</span><br /><br />
   <form name="bind9you_form" action="<%=Url.Action("DirectToMProductList") %>" method="post">
   <% if (ViewData["IsBind"] != null && ViewData["IsBind"].ToString() == "false")
      {
   %>
   
            <ul>
               
               <li>9You 账号：<input id="userName" name="userName" type="text" style="width:210px;" /></li>
               <li>9You 密码：<input id="password" name="password" type="password" style="width:210px;" /></li>
               <li><input id="btn_bind" alt="#TB_inline?height=80&width=320&inlineId=hiddenModalContent&modal=true" title="绑定" class="thickbox" type="button" value="绑定" /></li>
               <%--<li>
                  <a href="javascript:document.bind9you_form.submit();"  style="font-size:12px;">转到积分兑换页面</a>
               </li>--%>
            </ul>
   
   <% 
      }
      else
      {
   %>
            <span style="color:red;">账号已绑定</span><br /><br />
            <ul>
               <li>9You 账号：<input id="Text1" name="userName" readonly="readonly" type="text" style="width:210px;" value='<%= ViewData["acc"] %>' /></li>
               <li>9You 密码：<input id="password1" name="password" readonly="readonly" type="password" style="width:210px;" value=<%= ViewData["pwd"] %> /></li>
               <li>
                  <a href="javascript:document.bind9you_form.submit();"  style="font-size:12px;">转到积分兑换页面</a>
               </li>
            </ul>
            
   <%      
      }
   %>
   </form>
</div>
  
<div id="hiddenModalContent" style="display:none;"><p id="in_content">操作中，请稍后...<br /><img alt="" src="/Content/images/barAdmin/loadingAnimation.gif" /></p></div>

</asp:Content>
