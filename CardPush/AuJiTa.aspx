<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CardPush1.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<style type="text/css">
#card,#validate,#username,#pw{width:160px;}
#area{width:164px;}
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div id="content">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td height="35">
                     <div style="width: 996px; height: 123px; padding: 0; margin: 0px; border-bottom: solid 1px #ccc;">
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>
                     <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bian5">
                        <tr align="center">
                           <td>
                              <table width="692" border="0" align="center" cellpadding="0" cellspacing="0">
                                 <tr>
                                    <td>
                                       &nbsp;
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <img alt="" src="/content/images/cardpush/card_08a.jpg" width="692" height="29" />
                                    </td>
                                 </tr>
                                 <tr>
                                    <td height="20">
                                       &nbsp;
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                     
                                       <table width="692" border="0" align="center" cellpadding="0" cellspacing="15" id="jitatable" class="bian3">
                                          <tr>
                                             <td colspan="2" align="center" class="STYLE14">
                                                ���輪��������߳�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="230" align="right" class="STYLE14">
                                                ����
                                             </td>
                                             <td align="left">
                                                <input name="card" id="card" class="input1" value="9898CB" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ��Ϸ����
                                             </td>
                                             <td class="STYLE14" align="left">
                                                <select name="area" id="area">
                                                   <option value="45">����3G��ͨר��</option>
                                                </select>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ����ͨ��֤
                                             </td>
                                             <td align="left">
                                                <input class="input1" type="text" name="userName" id="username" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ͨ��֤����
                                             </td>
                                             <td align="left">
                                                <input class="input1" type="password" name="password" id="pw" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ��������֤��
                                             </td>
                                             <td align="left">
                                                <input class="input1" type="text" name="identifyingCode" id="validate" maxlength="8" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="left">
                                                &nbsp;
                                             </td>
                                             <td width="415" align="left">
                                                <img alt="��֤��" border="0"  align="absmiddle" id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" />
                                                <span><a href="javascript:reloadcode();" title="��һ��" class="c2">������</a></span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                <input type="hidden" name="id" id="id" value="<%=TGProject.Helpers.SSOVerify.TG_9YOU_ID %>" />
                                                <input type="hidden" name="continue" id="nextUrl" value="http://tg.9you.com/cardpush/VerifyTicketAuJiTa/" />
                                                <input type="hidden" name="userIp" id="userIp" value="<%=Request.UserHostAddress %>" />
                                                <input type="hidden" name="s" id="s" value="<%=TGProject.Helpers.SSOVerify.GetTuiGuangSS(Request.UserHostAddress)  %>" />
                                             </td>
                                             <td align="left">
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="200" align="right" height="28">
                                                <img class="wait" alt="" style="display:none;" src="/content/images/ajax-loader.gif" width="25" height="25" />
                                             </td>
                                             <td align="left">
                                                <span class="wait" style="display:none;">������ȡ�����Ժ�����ˢ��ҳ�棡</span>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td colspan="2" align="left">
                                             </td>
                                          </tr>
                                       </table>
                             
                                    </td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td>
                     <img alt="" src="/content/images/cardpush/card_22.jpg" width="996" height="86" />
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</div>

<script language="JavaScript" type="text/javascript">
function reloadcode() {
   var verify = document.getElementById('validimg');
   document.getElementById('validate').value = '';
   document.getElementById('validate').focus();
   verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
}


function pressCaptcha(obj) {
   obj.value = obj.value.toUpperCase();
}

$(function() {
   $("#card").bind("mouseover", function(ev) {
      ev.target.select();
   });
});

$(function() {
   $("#subBtn").bind("click", function(event) {
      var card = $("#card").val();
      var area = $("#area").val();
      var username = $("#username").val();
      var pw = $("#pw").val();
      var validate = $("#validate").val();

      if ($.trim(card) == ""
      || $.trim(area) == ""
      || $.trim(username) == ""
      || $.trim(pw) == ""
      || $.trim(validate) == ""
      ) {
         alert('�뽫��Ϣ��д������');
         return;
      }

      $("input").attr("disabled", "disabled");
      $("#area").attr("disabled", "disabled");
      event.target.disabled = 'disabled';
      $(".wait").show();

      $.ajax({
         url: '<%=Url.Action("GetJiTa")%>',
         type: "post",
         dataType: "json",
         data: { "you9Account": username, "pwd": pw, "area": area, "card": card, "check": validate },
         success: function(r) {
            $("input").attr("disabled", "");
            $("#area").attr("disabled", "");
            event.target.disabled = '';
            $(".wait").hide();
            alert(r.Msg);
            reloadcode();
         },
         error: function(XMLHttpRequest, textStatus) {
            $("input").attr("disabled", "");
            $("#area").attr("disabled", "");
            event.target.disabled = '';
            $(".wait").hide();
            alert("��Ǹ����ȡ����������һ�Σ�");
            reloadcode();
         }
      });

   });
});
     
</script>

</asp:Content>