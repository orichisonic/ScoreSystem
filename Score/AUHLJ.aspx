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
                                                AU劲舞团 黑龙江专区活动卡
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
                                                <input type='password' name="pw" id="pw" class="input1" onkeyup="pressCaptcha(this)" />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td align="right" class="STYLE14">
                                                游戏大区
                                             </td>
                                             <td class="STYLE14" align="left">
                                                <select name="area" id="area">
                                                   <option value="8">黑龙江(网通东北)</option>
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
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="getEventCardGift('<%=Url.Action("EventCardGift") %>', '<%=Url.Action("CreateCheckCodeImage") %>', 'card', 'pw', 'area', 'username', 'validate', 2, 'subBtn')" />
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
</asp:Content>
