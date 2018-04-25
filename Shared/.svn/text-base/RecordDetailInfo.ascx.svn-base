<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<style type="text/css">
   
    .newStyle
    {
        border-style: dotted;
        border-width: 1px;
        text-align: center;
    }
    .newStyle1
    {
    }
    .style4
    {
        border-style: dotted;
        border-width: 1px;
        text-align: left;
    }
    #Text13
    {
        width: 307px;
    }
    .style5
    {
        border-style: dotted;
        border-width: 1px;
        text-align: center;
        width: 70px;
    }
    .style6
    {
        border-style: dotted;
        border-width: 1px;
        text-align: left;
        height: 26px;
    }
    .style7
    {
        border-style: dotted;
        border-width: 1px;
        text-align: center;
        height: 26px;
    }
    .style8
    {
        border-style: dotted;
        border-width: 1px;
        text-align: center;
        width: 70px;
        height: 26px;
    }
</style>
<div id="divIframe" title="详细信息">
    <fieldset>
        <legend>核对网吧信息</legend>
      
            <div id="tab2-userinfo" style="float: left;">
                <ul class="verticality">
                    <li>网吧名称: <span id="netName3"></span></li><br /> 
                    <li>网吧编号: <span id="netNumber"></span></li><br /> 
                    <li>网吧等级: <span id="netlevel"></span></li><br /> 
                    <li>省: <span id="region"></span></li><br /> 
                    <li>市: <span id="area2"></span></li><br /> 
                    <li>所在区/县: <span id="city"></span></li><br />
                   <%-- <li>所在区/县: <span id="District"></span></li><br />--%>
                    <li>详细地址: <span id="adressDetail"></span></li><br />
                    <li>联系人: <span id="contract"></span>联系电话: <span id="Tel"></span></li><br /> 
                    <li>IP信息: <br />
                       <select name="IPType" id="IPType" disabled>
                            
                            <option value="1">
                               固定IP</option>
                                <option value="2">
                               IP段</option>
                                <option value="3">
                               ADSL</option>
                        
                       </select>  </li> <li>
                       <table>
                         <tr> 
                       <td id="IPtxt"></td> 
                       </tr></table></li> <br /> 
                        
                        <li>登记人: <span id="ApplicantName"></span>登记人账号:<span id="ApplicantAccount"></span>登记日期:<span id="ApplicantDate"></span></li> <br />
                        
                        <li>审核人: <span id="ExamName"></span>审核人账号:<span id="ExamAccount"></span>审核日期:<span id="ExamDate"></span></li> <br />
                        
                        <li>现锁定人: <span id="LockingPeople"></span>现绑定人帐号:<span id="LockingAccount"></span>锁定日期:<span id="LockingTime"></span></li> <br />

                        <li>电脑数量: <span id="MachineNum"></span></li> <br /> 
                        <li>备注: <textarea  id="RemakBK" style="width:200; color:Red; word-break:break-all;" readonly  ></textarea></li> <br /> 
                    <li>最近考核时间: <span id="RecentExaminationsOfTime"></span>&nbsp;&nbsp;最近考核人:<span id="RecentExaminationsOfPeople"></span></li><br /> <br />
                    
                    <li><span id="liid">打卡并进行考核</span><input type="radio" name="tab2-pass" value="1"/>是<input type="radio" name="tab2-pass" id="tab2-pass" value="2" />否</li>
                 </ul>
               </div>
               <div id="tab4-account" style=" border-style: solid;border-width: 1px;">
                              
                <ul class="verticality">
                    <li>进行考核</li>
                    <!--<li>网吧名称:  <select name="IPInfo" id="Select1">
                          <%-- <%List<TGProject.Models.WModels.TGS_NETBARIP> netbarIpList2 = (List<TGProject.Models.WModels.TGS_NETBARIP>)ViewData["NETBARID"];
                              foreach (TGProject.Models.WModels.TGS_NETBARIP user in netbarIpList2)
                              {
                                  //string values = user.USERID + "," + user.PLACEID + "," + user.WTYPE ;
                                  
                                  %>--%>
                            <option value="<%--<%=values %>--%>">
                              <%--  <%=user.USERNAME %>--%></option>
                         <%--   <%} %>--%>
                       </select>  网吧编号: <span id="netNumber2"></span>网吧等级: <span id="netLevel"></span>考核人: <span id="RecordPeople"></span>考核时间: <span id="RecordTime"></span></li>-->
                </ul>
                
                <table cellpadding="0" cellspacing="0">
                <tr>
                   <td class="newStyle">考核项目</td>
                   <td class="style4">考核内容</td>
                   <td class="newStyle">考核结果</td>
                   <td class="newStyle">得分</td>
                    <td class="newStyle">备注</td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="3">客情维护</td>
                   <td class="style4">每次网吧维护时间少于15分钟</td>
                   
                   <td class="newStyle"><table class="table">
                <tr>
                   <td>
                       <input name="rd1" type="radio" value="-1" checked="checked" title="是"/>是</td>
                   <td>
                       <input name="rd1" type="radio" value="0" title="否"/>否</td>
                   <td>
                       <input name="rd1" type="radio" value="0" title="不详"/>不详</td></tr></table>
                       </td>
                   <td id="bigClass1" class="newStyle" rowspan="3">-1</td>
                  <td id="memo1" class="style5" rowspan="1">
                          <input id="TextBox1" type="text"  maxlength="120"/>
                        
                     
                      </td>
                      
                </tr>
                  <tr>
                   <td class="style4">工作中未佩带工作胸牌或未穿着工作服</td>
                   <td class="newStyle"><table class="table">
                <tr>
                   <td>
                       <input name="rd2" type="radio" checked="checked" value="-1"title="是"/>是</td>
                   <td>
                       <input name="rd2" type="radio" value="0" title="否"/>否</td>
                   <td>
                       <input name="rd2" type="radio" value="0" title="不详"/>不详</td></tr></table></td>
                 
                     <td id="memo2" class="style5" rowspan="1">
                          <input id="TextBox2" type="text" maxlength="120"/>
                        
                      </td>
                      

                </tr>
                  <tr>
                  <td class="style4">网吧人员不了解本公司产品，不熟悉推广人员</td>
                  
                   <td class="newStyle">
                       <table>
                <tr>
                   <td>
                       <input name="rd3" type="radio" checked="checked" value="-1"title="是"/>是</td>
                   <td>
                       <input name="rd3" type="radio" value="0" title="否"/>否</td>
                   <td>
                       <input name="rd3" type="radio" value="0" title="不详"/>不详</td></tr></table></td>
                
                    <td id="memo3" class="style5" rowspan="1">
                           <input id="TextBox3" type="text" maxlength="120"/>
                     
                     
                      </td>
                      
                </tr>
                  <tr>
                   <td  class="newStyle" rowspan="2">网吧信息</td>
                   <td class="style6">基础信息错误</td>
                   <td class="style7">
                       <table class="table">
                <tr>
                   <td>
                       <input name="rd4" type="radio" checked="checked" value="-1"title="是"/>是</td>
                   <td>
                       <input name="rd4" type="radio" value="0" title="否"/>否</td>
                   <td>
                       <input name="rd4" type="radio" value="0" title="不详"/>不详</td></tr></table></td>
                   <td id="bigClass2" class="newStyle" rowspan="2">-1</td>
                    <td id="memo4" class="style8" rowspan="1">
                        <input id="TextBox4" type="text" maxlength="120"/>
                      
                      </td>
                </tr>
                  <tr>
                   <td class="style4">IP信息错误</td>
                   <td class="newStyle">
                       <table class="table">
                <tr>
                   <td>
                       <input name="rd5" type="radio" checked="checked" value="-1"title="是"/>是</td>
                   <td>
                       <input name="rd5" type="radio" value="0" title="否"/>否</td>
                   <td>
                       <input name="rd5" type="radio" value="0" title="不详"/>不详</td></tr></table></td>
                 
                   <td id="memo5" class="style5" rowspan="1">
                      <input id="TextBox5" type="text" maxlength="120"/>
                     
                      </td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="4">网吧宣传</td>
                   <td class="style4">重点产品海报覆盖不合格</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd6" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd6" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd6" type="radio" value="0" title="不详"/>不详</td>
                           </tr>
                       </table>
                      </td>
                   <td id="bigClass3" class="newStyle" rowspan="4">-1</td>
                   <td id="memo6" class="newStyle" rowspan="1">
                      
                         <input id="TextBox6" type="text" maxlength="120"/>
                      </td>
                </tr>
                 <tr>
                   <td class="style4">维护产品海报覆盖不合格</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd7" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd7" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd7" type="radio" value="0" title="不详"/>不详</td>
                                 
                           </tr>
                       </table>
                     </td>
                  
                     <td id="memo7" class="newStyle" rowspan="1">
                 
                            <input id="TextBox7" type="text" maxlength="120"/>
                      </td>
                 
                </tr>
                 <tr>
                   <td class="style4">DM单放置不合格</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd8" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd8" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd8" type="radio" value="0" title="不详"/>不详</td>
                                  
                           </tr>
                       </table>
                     </td>
                     <td id="memo8" class="newStyle" rowspan="1">
                       <input id="TextBox8" type="text" maxlength="120"/>
                     
                      </td>
                </tr>
                  <tr>
                   
                   <td class="style4">DM单派发不合格</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd9" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd9" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd9" type="radio" value="0" title="不详"/>不详</td>
                           </tr>
                       </table>
                      </td>
               <td id="memo9" class="newStyle" rowspan="1">
                      
                        <input id="TextBox9" type="text" maxlength="120"/>
                      </td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="2">客户端覆盖</td>
                   <td class="style4">新产品客户端覆盖不合格</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd10" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd10" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd10" type="radio" value="0" title="不详"/>不详</td>
                           </tr>
                       </table>
                      </td>
                   <td id="bigClass4" class="newStyle" rowspan="2">-1</td>
                <td id="memo10" class="newStyle" rowspan="1">
                     
                        <input id="TextBox10" type="text" maxlength="120"/>
                      </td>
                </tr>
                  <tr>
                   <td class="style4">老产品客户端覆盖及更新不合格</td>
                   <td class="newStyle">
                       <table>
                           <tr>
                               <td>
                                   <input name="rd11" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd11" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd11" type="radio" value="0" title="不详"/>不详</td>
                           </tr>
                       </table>
                      </td>
                <td id="memo11" class="newStyle" rowspan="1">
                 <input id="TextBox11" type="text" maxlength="120"/>
                     
                      </td>
                  
                </tr>
                  <tr>
                   <td class="newStyle">1V1拉新</td>
                   <td class="style4">工作中未向玩家介绍游戏产品</td>
                   <td class="newStyle">
                       <table>
                           <tr>
                               <td>
                                   <input name="rd12" type="radio" checked="checked" value="-1"title="是"/>是</td>
                               <td>
                                   <input name="rd12" type="radio" value="0" title="否"/>否</td>
                               <td>
                                   <input name="rd12" type="radio" value="0" title="不详"/>不详</td>
                           </tr>
                       </table>
                      </td>
                   <td  id="bigClass5" class="newStyle">-1</td>
                   <td id="memo12" class="newStyle" rowspan="1">
                       
                       <input id="TextBox12" type="text" maxlength="120"/>
                      </td>
                </tr>
                
                  <tr class="newStyle">
                   <td class="newStyle">总计</td>
                   <td class="newStyle">&nbsp; </td>
                   <td class="newStyle">&nbsp; </td>
                   <td id="bigClass7" class="newStyle">-5</td>
               <td id="Td3" class="newStyle" rowspan="1">&nbsp;</td>
                </tr>
                </table>
                <ul>
                  <li>
                       备注：<input id="Text13" type="text" maxlength="120"/></li>
                 <li>说明：</li>
                 <li>1.选择"是"即扣分,选择："否"或"不详"则不扣分.</li>
                 <li>2.同一"考核项目"中大于等于1个"考核内容"不合格均扣分</li>
                </ul>
                </div>
               </div>
    



