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
                                                 河北专区一卡通服饰卡</td>
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
                                                   <option value="20">河北(网通)</option>
                                                   <OPTION value=39>大华北</OPTION> 
                                                   <OPTION value=45>华北3G联通</OPTION>
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
                                                <input id="subBtn" type="image" src="/content/images/cardpush/bt3_03.gif" width="120" height="28" onclick="getEventCardGift('<%=Url.Action("EventCardGift") %>', '<%=Url.Action("CreateCheckCodeImage") %>', 'card', 'pw', 'area', 'username', 'validate', 5, 'subBtn')" />
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
                                             <td colspan="2" class="STYLE14" align="left">
                                                <p>
                                                   1、本卡仅限于久游网出品的《劲舞团》网络游戏“河北(网通)专区”用户使用；</p><br />
                                                <p>
                                                   2、使用本卡前，请先登录http://www.9you.com 注册成为久游用户，下载、安装《劲舞团》最新版本游戏客户端，并激活相应游戏大区、建立角色；
                                                </p><br />
                                                <p>
                                                   3、活动规则：《劲舞团》河北(网通)专区的玩家，使用“河北专区一卡通服饰卡”，可免费领取服饰道具：</p><br />
                                                <p>
                                                   &nbsp;&nbsp;&nbsp;
                                                   男性角色：DJ.K发型（7天）；棒球手 上衣（7天）；Armani 波纹牛仔（7天）；TOP风格 男鞋（7天）</p><br />
                                                <p>
                                                   &nbsp;&nbsp;&nbsp;
                                                   女性角色：多彩之秋 发型（7天）；图案概念 上衣（7天）；草绿色 短裤（7天）；绽放 凉拖（7天）</p><br />
                                                <p>
                                                   4、每种卡片每个玩家分别只可领取一次，每张活动卡只能被使用一次；</p><br />
                                                <p>
                                                   5、本卡有效期至2011年5月31日；</p><br />
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
