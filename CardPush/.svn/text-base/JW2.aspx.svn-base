<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CardPush1.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">

<script language="JavaScript" type="text/javascript">

function pressCaptcha(obj) {

    
   obj.value = obj.value.toUpperCase();
}

function reloadcode() {

    var imgUrl = "http://" + location.host;
    var verify = document.getElementById('validimg');
    
   // verify.setAttribute('src', '<%=Url.Content("'+imgUrl+'/ValidationCode.aspx/CreateImage?")%>' + Math.random());
    verify.setAttribute('src', '<%=Url.Content("' + 'http://' + location.host + '/ValidationCode.aspx/CreateImage?")%>' + Math.random());
    //这里必须加入随机数不然地址相同我发重新加载
}

function send() {
    var userid = $('#username').val(); ;
    var you9id = '';
    var gameServer = $("#zone").val();
    
    var password = $('#pw').val();
    var authcode = $('#validate').val();
    var cardnum = $('#card').val();
    $("#subBtn").attr('disabled', 'false'); //不可用
    $("#wait").html("请稍候...");
    $.ajax({
        url: "http://" + location.host + "/CardPush.aspx/SendJW2/",
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
        location.replace("http://" + location.host + "/CardPush.aspx/JW2");
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

                                       <input type="hidden" name="gameid" value="<?=$gameid;?>">
                                       <input type="hidden" name="act" value="<?=$act;?>">
                                       <table width="692" border="0" align="center" cellpadding="0" cellspacing="15" class="bian3">
                                          <tr>
                                             <td colspan="2" align="center" class="STYLE14">
                                               GT劲舞团2 公会卡
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
                                                <input name="pw" id="pw" class="input1" onkeyup="pressCaptcha(this)" />
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

                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28"  onclick="send()"/>

                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left" id="wait">
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

<script language="JavaScript" type="text/javascript">
//function reloadcode() {
//   var verify = document.getElementById('validimg');
//   verify.setAttribute('src', '<%=Url.Content("~/ValidationCode/CreateImage?")%>' + Math.random());

//   //这里必须加入随机数不然地址相同我发重新加载
//}

//function send() {
//   var cardNO = $('#card').val();          //卡号
//   var cardPWD = $('#pw').val();      //卡密码
//   var username = $('#username').val();   //用户名
//   var gameServer = $('#area').val();     //游戏大区
//   var authcode = $('#validate').val();   //验证码

//   //判断日期是否正确
//   var starttime = "2010-01-01";
//   var endtime = "2010-01-24";
//   var d = new Date()
//   var vYear = d.getFullYear()
//   var vMon = d.getMonth() + 1
//   var vDay = d.getDate()

//   if (vMon < 10) {
//      vMon = '0' + vMon;
//   }

//   if (vDay < 10) {
//      vDay = '0' + vDay;
//   }

//   var dateNow = vYear + '-' + vMon + '-' + vDay;
//   if (dateNow <= starttime || dateNow >= endtime) {
//      alert('活动已经到期！');
//      reloadcode();
//      return;
//   }

//   //检验字符
//   var myReg = /[^A-Za-z0-9]/;
//   if (myReg.test(username) || username.length < 6 || username.length > 17) {
//      alert('请不要输入非法字符');
//      reloadcode();
//      return;
//   }


//   $.ajax({
//      url: "http://" + location.host + "/CardPush.aspx/SendAUBaiJin/",
//      type: "POST",
//      dataType: "json",
//      data: { CardNo: cardNO, CardPwd: cardPWD, UserID: username, GameServer: gameServer, AuthCode: authcode },
//      success: submitSuccessed
//   });
//}
//function submitSuccessed(result) {
//   alert(result.msg);
//   location.replace("http://localhost:4256/CardPush.aspx/AuBaiJin");
//   reloadcode();
//   if (result.isSuccessed == 1) {

//   }
//}
 </script>

</asp:Content>
