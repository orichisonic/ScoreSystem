<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CardPush1.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<script language="JavaScript" type="text/javascript">

function changeSeccode() {
   var img = document.getElementById("seccode2");
   img.src = "seccode2.php?" + Math.random();
}
function pressCaptcha(obj) {

    
   obj.value = obj.value.toUpperCase();
}

function reloadcode() {


    var verify = document.getElementById('validimg');
//    verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());
    //verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
    verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
    //这里必须加入随机数不然地址相同我发重新加载
}

function send() {
    var userid = $('#username').val(); ;
    var you9id = 'aaa';
    var gameServer = $('#zone').val();
    var password = $('#pw').val();
    var authcode = $('#validate').val();
    var cardnum = $('#card').val();

    $("#subBtn").attr('disabled', 'false'); //不可用
    $("#wait").html("请稍候...");
    $.ajax({
        url: "http://" + location.host + "/CardPush.aspx/SendGD/",
        type: "POST",
        dataType: "json",
        data: { UserID: userid, You9ID: you9id, GameServer: gameServer, AuthCode: authcode, password: password, cardnum: cardnum },
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
        location.replace("http://" + location.host + "/CardPush.aspx/GD");
    }
 
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
               <tr align="center">
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
                                                SD敢达 暑期推广活动----神卡
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
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
                                                <input type="password" name="pw" id="pw" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                选择游戏大区
                                             </td>
                                             <td width="395" align="left">
                                             
                                             <select name="zone" id="zone">
                                             <%  List<TGProject.Models.MModels.Jw2ServerList> zoneList = (List<TGProject.Models.MModels.Jw2ServerList>)ViewData["AreaList"];
                                                 foreach (TGProject.Models.MModels.Jw2ServerList zone in zoneList)
                                                 {       
                                                              
                                              %> 
                                               <option value="<%=zone.id%>">
                                                        <%= zone.ServerName%></option>
                                               <%
                        
                                                } %>
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
                                                <input name="validate" id="validate" class="input1"/>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="250" align="left">
                                                &nbsp;
                                             </td>
                                             <td width="395" align="left">
                                                <img alt="看不清？点击更换另一个验证码。" border="0"  align="absmiddle"  style="cursor: pointer;"  id="validimg" src="<%=Url.Action("CreateImage","ValidationCode") %>" onclick="reloadcode()" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left">
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28"  onclick="send()">
                                             </td>
                                           <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left" id="wait">
                                             </td>
                                          </tr>
                                          </tr>
                                          <tr>
                                             <td colspan="2" class="STYLE14" align="left">
                                                <p>
                                                   活动规则</p>
                                                <p>
                                                   <br />
                                                   1、本卡仅限于久游网出品的《SD敢达Online》网络游戏使用；<br />
                                                   2、使用本卡前，请先登录<a href="http://www.9you.com" target="_blank">http://www.9you.com</a>注册成为久游用户，并登陆<a href="http://gd.9you.com" target="_blank">http://gd.9you.com</a>下载、安装最新版本《SD敢达Online》客户端，并激活相应游戏大区、建立角色（重要）；<br />
                                                   3、使用本卡可领取：代币5个、强化型瞬间移动装置（90个）、独眼巨人发生器（30个）、黄金时间副官1（3天）、黄金时间副官2（3天）、神敢达（1天）；<br />
                                                   4、本卡为非卖品，有效期至2009年10月31日；<br />
                                                   5、本卡最终解释权归久游网所有。<br />
                                                </p>
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
                     <img src="/content/images/cardpush/card_22.jpg" width="996" height="86" />
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</div>


</asp:Content>
