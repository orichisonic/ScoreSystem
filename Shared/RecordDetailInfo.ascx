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
<div id="divIframe" title="��ϸ��Ϣ">
    <fieldset>
        <legend>�˶�������Ϣ</legend>
      
            <div id="tab2-userinfo" style="float: left;">
                <ul class="verticality">
                    <li>��������: <span id="netName3"></span></li><br /> 
                    <li>���ɱ��: <span id="netNumber"></span></li><br /> 
                    <li>���ɵȼ�: <span id="netlevel"></span></li><br /> 
                    <li>ʡ: <span id="region"></span></li><br /> 
                    <li>��: <span id="area2"></span></li><br /> 
                    <li>������/��: <span id="city"></span></li><br />
                   <%-- <li>������/��: <span id="District"></span></li><br />--%>
                    <li>��ϸ��ַ: <span id="adressDetail"></span></li><br />
                    <li>��ϵ��: <span id="contract"></span>��ϵ�绰: <span id="Tel"></span></li><br /> 
                    <li>IP��Ϣ: <br />
                       <select name="IPType" id="IPType" disabled>
                            
                            <option value="1">
                               �̶�IP</option>
                                <option value="2">
                               IP��</option>
                                <option value="3">
                               ADSL</option>
                        
                       </select>  </li> <li>
                       <table>
                         <tr> 
                       <td id="IPtxt"></td> 
                       </tr></table></li> <br /> 
                        
                        <li>�Ǽ���: <span id="ApplicantName"></span>�Ǽ����˺�:<span id="ApplicantAccount"></span>�Ǽ�����:<span id="ApplicantDate"></span></li> <br />
                        
                        <li>�����: <span id="ExamName"></span>������˺�:<span id="ExamAccount"></span>�������:<span id="ExamDate"></span></li> <br />
                        
                        <li>��������: <span id="LockingPeople"></span>�ְ����ʺ�:<span id="LockingAccount"></span>��������:<span id="LockingTime"></span></li> <br />

                        <li>��������: <span id="MachineNum"></span></li> <br /> 
                        <li>��ע: <textarea  id="RemakBK" style="width:200; color:Red; word-break:break-all;" readonly  ></textarea></li> <br /> 
                    <li>�������ʱ��: <span id="RecentExaminationsOfTime"></span>&nbsp;&nbsp;���������:<span id="RecentExaminationsOfPeople"></span></li><br /> <br />
                    
                    <li><span id="liid">�򿨲����п���</span><input type="radio" name="tab2-pass" value="1"/>��<input type="radio" name="tab2-pass" id="tab2-pass" value="2" />��</li>
                 </ul>
               </div>
               <div id="tab4-account" style=" border-style: solid;border-width: 1px;">
                              
                <ul class="verticality">
                    <li>���п���</li>
                    <!--<li>��������:  <select name="IPInfo" id="Select1">
                          <%-- <%List<TGProject.Models.WModels.TGS_NETBARIP> netbarIpList2 = (List<TGProject.Models.WModels.TGS_NETBARIP>)ViewData["NETBARID"];
                              foreach (TGProject.Models.WModels.TGS_NETBARIP user in netbarIpList2)
                              {
                                  //string values = user.USERID + "," + user.PLACEID + "," + user.WTYPE ;
                                  
                                  %>--%>
                            <option value="<%--<%=values %>--%>">
                              <%--  <%=user.USERNAME %>--%></option>
                         <%--   <%} %>--%>
                       </select>  ���ɱ��: <span id="netNumber2"></span>���ɵȼ�: <span id="netLevel"></span>������: <span id="RecordPeople"></span>����ʱ��: <span id="RecordTime"></span></li>-->
                </ul>
                
                <table cellpadding="0" cellspacing="0">
                <tr>
                   <td class="newStyle">������Ŀ</td>
                   <td class="style4">��������</td>
                   <td class="newStyle">���˽��</td>
                   <td class="newStyle">�÷�</td>
                    <td class="newStyle">��ע</td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="3">����ά��</td>
                   <td class="style4">ÿ������ά��ʱ������15����</td>
                   
                   <td class="newStyle"><table class="table">
                <tr>
                   <td>
                       <input name="rd1" type="radio" value="-1" checked="checked" title="��"/>��</td>
                   <td>
                       <input name="rd1" type="radio" value="0" title="��"/>��</td>
                   <td>
                       <input name="rd1" type="radio" value="0" title="����"/>����</td></tr></table>
                       </td>
                   <td id="bigClass1" class="newStyle" rowspan="3">-1</td>
                  <td id="memo1" class="style5" rowspan="1">
                          <input id="TextBox1" type="text"  maxlength="120"/>
                        
                     
                      </td>
                      
                </tr>
                  <tr>
                   <td class="style4">������δ����������ƻ�δ���Ź�����</td>
                   <td class="newStyle"><table class="table">
                <tr>
                   <td>
                       <input name="rd2" type="radio" checked="checked" value="-1"title="��"/>��</td>
                   <td>
                       <input name="rd2" type="radio" value="0" title="��"/>��</td>
                   <td>
                       <input name="rd2" type="radio" value="0" title="����"/>����</td></tr></table></td>
                 
                     <td id="memo2" class="style5" rowspan="1">
                          <input id="TextBox2" type="text" maxlength="120"/>
                        
                      </td>
                      

                </tr>
                  <tr>
                  <td class="style4">������Ա���˽Ȿ��˾��Ʒ������Ϥ�ƹ���Ա</td>
                  
                   <td class="newStyle">
                       <table>
                <tr>
                   <td>
                       <input name="rd3" type="radio" checked="checked" value="-1"title="��"/>��</td>
                   <td>
                       <input name="rd3" type="radio" value="0" title="��"/>��</td>
                   <td>
                       <input name="rd3" type="radio" value="0" title="����"/>����</td></tr></table></td>
                
                    <td id="memo3" class="style5" rowspan="1">
                           <input id="TextBox3" type="text" maxlength="120"/>
                     
                     
                      </td>
                      
                </tr>
                  <tr>
                   <td  class="newStyle" rowspan="2">������Ϣ</td>
                   <td class="style6">������Ϣ����</td>
                   <td class="style7">
                       <table class="table">
                <tr>
                   <td>
                       <input name="rd4" type="radio" checked="checked" value="-1"title="��"/>��</td>
                   <td>
                       <input name="rd4" type="radio" value="0" title="��"/>��</td>
                   <td>
                       <input name="rd4" type="radio" value="0" title="����"/>����</td></tr></table></td>
                   <td id="bigClass2" class="newStyle" rowspan="2">-1</td>
                    <td id="memo4" class="style8" rowspan="1">
                        <input id="TextBox4" type="text" maxlength="120"/>
                      
                      </td>
                </tr>
                  <tr>
                   <td class="style4">IP��Ϣ����</td>
                   <td class="newStyle">
                       <table class="table">
                <tr>
                   <td>
                       <input name="rd5" type="radio" checked="checked" value="-1"title="��"/>��</td>
                   <td>
                       <input name="rd5" type="radio" value="0" title="��"/>��</td>
                   <td>
                       <input name="rd5" type="radio" value="0" title="����"/>����</td></tr></table></td>
                 
                   <td id="memo5" class="style5" rowspan="1">
                      <input id="TextBox5" type="text" maxlength="120"/>
                     
                      </td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="4">��������</td>
                   <td class="style4">�ص��Ʒ�������ǲ��ϸ�</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd6" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd6" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd6" type="radio" value="0" title="����"/>����</td>
                           </tr>
                       </table>
                      </td>
                   <td id="bigClass3" class="newStyle" rowspan="4">-1</td>
                   <td id="memo6" class="newStyle" rowspan="1">
                      
                         <input id="TextBox6" type="text" maxlength="120"/>
                      </td>
                </tr>
                 <tr>
                   <td class="style4">ά����Ʒ�������ǲ��ϸ�</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd7" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd7" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd7" type="radio" value="0" title="����"/>����</td>
                                 
                           </tr>
                       </table>
                     </td>
                  
                     <td id="memo7" class="newStyle" rowspan="1">
                 
                            <input id="TextBox7" type="text" maxlength="120"/>
                      </td>
                 
                </tr>
                 <tr>
                   <td class="style4">DM�����ò��ϸ�</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd8" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd8" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd8" type="radio" value="0" title="����"/>����</td>
                                  
                           </tr>
                       </table>
                     </td>
                     <td id="memo8" class="newStyle" rowspan="1">
                       <input id="TextBox8" type="text" maxlength="120"/>
                     
                      </td>
                </tr>
                  <tr>
                   
                   <td class="style4">DM���ɷ����ϸ�</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd9" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd9" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd9" type="radio" value="0" title="����"/>����</td>
                           </tr>
                       </table>
                      </td>
               <td id="memo9" class="newStyle" rowspan="1">
                      
                        <input id="TextBox9" type="text" maxlength="120"/>
                      </td>
                </tr>
                  <tr>
                   <td class="newStyle" rowspan="2">�ͻ��˸���</td>
                   <td class="style4">�²�Ʒ�ͻ��˸��ǲ��ϸ�</td>
                   <td class="newStyle">
                       <table class="table">
                           <tr>
                               <td>
                                   <input name="rd10" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd10" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd10" type="radio" value="0" title="����"/>����</td>
                           </tr>
                       </table>
                      </td>
                   <td id="bigClass4" class="newStyle" rowspan="2">-1</td>
                <td id="memo10" class="newStyle" rowspan="1">
                     
                        <input id="TextBox10" type="text" maxlength="120"/>
                      </td>
                </tr>
                  <tr>
                   <td class="style4">�ϲ�Ʒ�ͻ��˸��Ǽ����²��ϸ�</td>
                   <td class="newStyle">
                       <table>
                           <tr>
                               <td>
                                   <input name="rd11" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd11" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd11" type="radio" value="0" title="����"/>����</td>
                           </tr>
                       </table>
                      </td>
                <td id="memo11" class="newStyle" rowspan="1">
                 <input id="TextBox11" type="text" maxlength="120"/>
                     
                      </td>
                  
                </tr>
                  <tr>
                   <td class="newStyle">1V1����</td>
                   <td class="style4">������δ����ҽ�����Ϸ��Ʒ</td>
                   <td class="newStyle">
                       <table>
                           <tr>
                               <td>
                                   <input name="rd12" type="radio" checked="checked" value="-1"title="��"/>��</td>
                               <td>
                                   <input name="rd12" type="radio" value="0" title="��"/>��</td>
                               <td>
                                   <input name="rd12" type="radio" value="0" title="����"/>����</td>
                           </tr>
                       </table>
                      </td>
                   <td  id="bigClass5" class="newStyle">-1</td>
                   <td id="memo12" class="newStyle" rowspan="1">
                       
                       <input id="TextBox12" type="text" maxlength="120"/>
                      </td>
                </tr>
                
                  <tr class="newStyle">
                   <td class="newStyle">�ܼ�</td>
                   <td class="newStyle">&nbsp; </td>
                   <td class="newStyle">&nbsp; </td>
                   <td id="bigClass7" class="newStyle">-5</td>
               <td id="Td3" class="newStyle" rowspan="1">&nbsp;</td>
                </tr>
                </table>
                <ul>
                  <li>
                       ��ע��<input id="Text13" type="text" maxlength="120"/></li>
                 <li>˵����</li>
                 <li>1.ѡ��"��"���۷�,ѡ��"��"��"����"�򲻿۷�.</li>
                 <li>2.ͬһ"������Ŀ"�д��ڵ���1��"��������"���ϸ���۷�</li>
                </ul>
                </div>
               </div>
    



