<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CardPush1.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<script language="JavaScript" type="text/javascript">

function pressCaptcha(obj) {
   obj.value = obj.value.toUpperCase();
}

</script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div id="content">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td height="35">
                     <img src="/content/images/cardpush/card_03.jpg" width="996" height="123" />
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
                                       <img src="/content/images/cardpush/card_08a.jpg" width="692" height="29" />
                                    </td>
                                 </tr>
                                 <tr>
                                    <td height="20">
                                       &nbsp;
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <table width="692" border="0" align="center" cellpadding="0" cellspacing="15" class="bian3">
                                          <tr>
                                             <td colspan="2" align="center" class="STYLE14">
                                                AU������ �ӱ����󻪱����鷭����
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="230" align="right" class="STYLE14">
                                                �������
                                             </td>
                                             <td align="left">
                                                <input name="card" id="card" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ����
                                             </td>
                                             <td align="left">
                                                <input type='password' name="pw" id="pw" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ��Ϸ����
                                             </td>
                                             <td class="STYLE14" align="left">
                                                <select name="area" id="area" >
                                                   <option value="20">�ӱ�(��ͨ)</option>
                                                   <option value="39">�󻪱�</option>
                                                </select>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                �����ʺ�
                                             </td>
                                             <td align="left">
                                                <input name="username" id="username" class="input1" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                ��������֤��
                                             </td>
                                             <td align="left">
                                                <input name="validate" id="validate" class="input1"  />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="left">
                                                &nbsp;
                                             </td>
                                             <td width="415" align="left">
                                                <img alt="�����壿���������һ����֤�롣" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left">
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="send()">
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left" id="wait">
                                             </td>
                                          </tr>
                                          <tr>
                                             <td colspan="2" align="left">
                                                <br />
                                                <strong>���˵����</strong><br />
                                                1�����������ھ�������Ʒ�ġ������š�������Ϸʹ�ã�<br />
                                                2��ʹ�ñ���ǰ�����ȵ�¼http://www.9you.comע���Ϊ�����û������ء���װ�������š����°汾��Ϸ�ͻ��ˣ���������Ӧ��Ϸ������������ɫ��<br />
                                                3��ÿ������˺�������ȡ���Σ�ÿ�������ֻ��ʹ��һ�Σ�<br />
                                                4��ʹ�ñ�������ȡ�����鷭����10�ţ�<br />
                                                5��������Ч����2009��10��31�գ�<br />
                                                6���������ս���Ȩ��������С�
                                             </td>
                                          </tr>
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
                     <img src="/content/images/cardpush/card_22.jpg" width="996" height="86" />
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
//        verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
        verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
        //�����������������Ȼ��ַ��ͬ�ҷ����¼���
    }

    function send() {
        var cardNO = $('#card').val();         //����
        var cardPWD = $('#pw').val();          //������
        var username = $('#username').val();   //�û���
        var gameServer = $('#area').val();                     //��Ϸ����
        var authcode = $('#validate').val();   //��֤��

        //�����ַ�
        var myReg = /[^A-Za-z0-9]/;
        if (myReg.test(username) || username.length < 6 || username.length > 17) {
            alert('�벻Ҫ����Ƿ��ַ�');
            reloadcode();
            return;
        }
        
        $("#subBtn").attr('disabled', 'false'); //������
        $("#wait").html("���Ժ�...");

        $.ajax({
            url: "http://" + location.host + "/CardPush.aspx/SendAUHB/",
            type: "POST",
            dataType: "json",
            data: { CardNo: cardNO, CardPwd: cardPWD, UserID: username, GameServer: gameServer, AuthCode: authcode },
            success: submitSuccessed
        });
    }
    function submitSuccessed(result) {
        alert(result.msg);
        $("#subBtn").attr('disabled', false); //����
        $("#wait").html("");
        if (result.isSuccessed == 2) {
            reloadcode();
        }
        else if (result.isSuccessed == 3) {
            reloadcode();
        }
        else {
            reloadcode();
            location.replace("http://" + location.host + "/CardPush.aspx/AuHB");
        }
    }
 </script>

</asp:Content>
