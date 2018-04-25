<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScoreSystem1.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="server">久游活动卡领取</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
<script src="/Scripts/scoresite/score_event.js" type="text/javascript"></script>
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
                                                超级舞者 服饰 活动卡
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
                                                <input name="pw" id="pw" class="input1" type="password" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                选择游戏大区
                                             </td>
                                             <td width="395" align="left">
                                                <select name="area" id="area">
                                                   <option value="5">黑龙江网通</option>
                                                </select>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                久游通行证
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
                                             <td width="250" align="left">
                                                &nbsp;
                                             </td>
                                             <td width="395" align="left">
                                                <span id="chk_img"><img src="<%=Url.Action("CreateCheckCodeImage") %>" width="60" height="20" alt="验证码"  align="top" /></span>
                                                &nbsp;
                                                <a href="javascript:reloadMyCheckCode('chk_img','<%=Url.Action("CreateCheckCodeImage") %>')">看不清 换一张</a>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td width="150" align="right">
                                                &nbsp;
                                             </td>
                                             <td align="left"> 
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="getEventCardGift('<%=Url.Action("EventCardGift") %>', '<%=Url.Action("CreateCheckCodeImage") %>', 'card', 'pw', 'area', 'username', 'validate', 4, 'subBtn')" />
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
                                             <td colspan="2" class="STYLE14">
                                                <p>
                                                   1、本卡仅限于久游网出品的《超级舞者》网络游戏“黑龙江专区”用户使用；</p>
                                                <p>
                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、使用本卡前，请先登录http://www.9you.com 注册成为久游用户，下载、安装《超级舞者》最新版本游戏客户端，并激活相应游戏大区、建立角色；
                                                </p>
                                                <p>
                                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、活动规则：2010年6月17日后激活《超级舞者》黑龙江专区的玩家，可以凭手中的5种专区服饰卡，免费领取对应奖励：</p>
                                                <p>
                                                   AVATAR兑换卡可领取：AVATAR兑换券3张</p>
                                                <p>
                                                   红太郎卡可领取：永久宠物 红太郎1只</p>
                                                <p>
                                                   灰太狼卡可领取：永久宠物 灰太狼1只</p>
                                                <p>
                                                   懒羊羊卡可领取：永久宠物 懒羊羊1只</p>
                                                <p>
                                                   钥匙卡可领取：钥匙3把</p>
                                                <p>
                                                   4、每种卡片每个玩家分别只可领取一次，每张活动卡只能被使用一次；</p>
                                                <p>
                                                   5、本卡有效期至2010年12月31日；</p>
                                                <p>
                                                   6、本卡最终解释权归久游所有。<p>
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
