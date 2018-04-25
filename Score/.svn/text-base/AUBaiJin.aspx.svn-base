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
                                                   <script language="javascript" type="text/javascript">
                                                   loadServerInfosByGameId('<%=Url.Action("GetServerByGameId")%>', 2, function(r) {
                                                      var slc = $("#area");
                                                      slc.setDisabled(true);
                                                      var str = "";
                                                      you9.parseJsonResutlObject(r, function(e, idx) {
                                                         str += '<option value="' + e.id + '">' + e.name + '</option>';
                                                      });

                                                      if (str != "") {
                                                         slc.html(str).setDisabled(false);
                                                      }
                                                   });
                                                   </script>
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
                                             <td align="left">
                                                &nbsp;
                                             </td>
                                             <td width="415" align="left">
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
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="getEventCardGift('<%=Url.Action("EventCardGift") %>', '<%=Url.Action("CreateCheckCodeImage") %>', 'card', 'pw', 'area', 'username', 'validate', 1, 'subBtn')" />
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
</asp:Content>
