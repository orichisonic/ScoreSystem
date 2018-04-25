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
                                                AU劲舞团 河北、大华北经验翻倍卡
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="230" align="right" class="STYLE14">
                                                活动卡卡号
                                             </td>
                                             <td align="left">
                                                <input name="card" id="card" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                密码
                                             </td>
                                             <td align="left">
                                                <input type='password' name="pw" id="pw" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                游戏大区
                                             </td>
                                             <td class="STYLE14" align="left">
                                                <select name="area" id="area" >
                                                   <option value="20">河北(网通)</option>
                                                   <option value="39">大华北</option>
                                                </select>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                久游帐号
                                             </td>
                                             <td align="left">
                                                <input name="username" id="username" class="input1" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                请输入验证码
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
                                                <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
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
                                                <strong>活动卡说明：</strong><br />
                                                1、本卡仅限于久游网出品的《劲舞团》网络游戏使用；<br />
                                                2、使用本卡前，请先登录http://www.9you.com注册成为久游用户，下载、安装《劲舞团》最新版本游戏客户端，并激活相应游戏大区、建立角色；<br />
                                                3、每个玩家账号最多可领取三次，每个活动卡号只能使用一次；<br />
                                                4、使用本卡可领取：经验翻倍卡10张；<br />
                                                5、本卡有效期至2009年10月31日；<br />
                                                6、本卡最终解释权归久游所有。
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
        //这里必须加入随机数不然地址相同我发重新加载
    }

    function send() {
        var cardNO = $('#card').val();         //卡号
        var cardPWD = $('#pw').val();          //卡密码
        var username = $('#username').val();   //用户名
        var gameServer = $('#area').val();                     //游戏大区
        var authcode = $('#validate').val();   //验证码

        //检验字符
        var myReg = /[^A-Za-z0-9]/;
        if (myReg.test(username) || username.length < 6 || username.length > 17) {
            alert('请不要输入非法字符');
            reloadcode();
            return;
        }
        
        $("#subBtn").attr('disabled', 'false'); //不可用
        $("#wait").html("请稍候...");

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
        $("#subBtn").attr('disabled', false); //可用
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
