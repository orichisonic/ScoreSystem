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
                     <img alt="" src="/content/images/cardpush/card_03.jpg" width="996" height="123" />
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

                                       <table width="692" border="0" align="center" cellpadding="0" cellspacing="15" class="bian3">
                                          <tr>
                                             <td colspan="2" align="center" class="STYLE14">
                                                AU劲舞团媒体白金卡
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
                                                <select name="area" id="area">
                                                    <%
                                                        List<MModels.Jw2ServerList> areaList = (List<MModels.Jw2ServerList>)ViewData["AreaList"];
                                                        foreach (MModels.Jw2ServerList zone in areaList)
                                                                { 
                                                        %>
                                                        <option value="<%=zone.id%>">
                                                            <%= zone.ServerName%></option>
                                                        <%      }
                                                    %>
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
                                                <input name="validate" id="validate" class="input1" />
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
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="send()" />
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
                                                <span class="STYLE19">活动卡说明：</span><br />
                                                <strong>1、本卡仅限于久游网出品的《劲舞团》网络游戏使用；<br />
                                                   2、使用本卡前，请先登录http://www.9you.com注册成为久游用户，下载、安装《劲舞团》最新版本游戏客户端，并激活相应游戏大区、建立角色；<br />
                                                   3、活动规则：<br />
                                                   只要使用本活动卡，即可免费领取7天时效的精美AVATAR一件和7天时效的单手道具一枚。<br />
                                                   男：蓝调感觉 上衣（7天）+ 兔兔手袋 手持（7天）<br />
                                                   女：坏情人 上衣（7天）+ 兔兔手袋 手持（7天）<br />
                                                   只要使用本活动卡，并满足以下两个条件之一即可获得：<br />
                                                   男：蓝调感觉 上衣（永久）+ 兔兔手袋 手持（永久）<br />
                                                   女：坏情人 上衣（永久）+ 兔兔手袋 手持（永久）<br />
                                                   条件一：2010年1月11日0：00至2010年1月24日24：00间注册的新玩家，在1月24日前达到5级<br />
                                                   条件二：其他玩家在2010年1月11日至2010年1月24日，每天19：00-22：00间在线累计满10小时<br />
                                                   <span class="STYLE18">注：永久道具将于活动结束后7天内发放</span><br />
                                                   4、每个玩家只能领取一次，每张活动卡只能被使用一次；<br />
                                                   5、本卡有效期至2010年1月24日；<br />
                                                   6、本卡最终解释权归久游所有。</strong>
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
         verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
//         verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
         //这里必须加入随机数不然地址相同我发重新加载
     }

     function send() {
         var cardNO = $('#card').val();          //卡号
     var cardPWD = $('#pw').val();      //卡密码
         var username = $('#username').val();   //用户名
         var gameServer = $('#area').val();     //游戏大区
         var authcode = $('#validate').val();   //验证码

         //判断日期是否正确
         var starttime = "2010-01-01";
         var endtime = "2010-01-24";
         var d = new Date()
         var vYear = d.getFullYear()
         var vMon = d.getMonth() + 1
         var vDay = d.getDate()

         if (vMon < 10) {
             vMon = '0' + vMon;
         }

         if (vDay < 10) {
             vDay = '0' + vDay;
         }

         var dateNow = vYear + '-' + vMon + '-' + vDay;
         if (dateNow <= starttime || dateNow >= endtime) {
             alert('活动已经到期！');
             reloadcode();
             return;
         }

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
             url: "http://" + location.host + "/CardPush.aspx/SendAUBaiJin/",
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
             location.replace("http://" + location.host + "/CardPush.aspx/AuBaiJin");
         }
     }
 </script>
</asp:Content>
