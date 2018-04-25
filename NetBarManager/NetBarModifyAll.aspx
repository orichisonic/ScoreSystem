<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ȫ����Ϣ�޸�</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        ��������:<%=DateTime.Now.ToLongDateString() %></p>
        <%
             TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
             string strNetBarID = (string)ViewData["NBid"];
             if ((string)ViewData["NBid"] == null)
             {
                 strNetBarID = string.Empty;
             }
            %>
            <span id="power"><%=account.POPEDOMID %></span>
            <span id="areaid"><%=account.AREAID %></span>
            <span id="nbid"><%=strNetBarID%></span>
            <span id="UACCOUNT"><%=account.UACCOUNT %></span>
            <span id="USERNAME"><%=account.USERNAME%></span>
    <fieldset>
        <legend>��������</legend>
        <div style="text-align:center">
            ���ɱ��:&nbsp;&nbsp;&nbsp;
            <input type="text" id="netbarID" disabled="disabled" />&nbsp;&nbsp;&nbsp;
            <button class="ui-state-default ui-corner-all" type="submit" onclick="searchLoad()" id="btnSearch" visible="false" disabled="disabled">
                ����</button></div>
    </fieldset>
    <br />
    <form id="form1">
 
    <fieldset>
        <legend>��ϸ��Ϣ</legend>
        <div>
            <ul class="verticality">
                <li>��������<br />
                    <input type="text" id="barName" name="barName" /></li>
                <li>�������ڵ�
                    <ul>
                        <li style="display: inline; list-style-type: none; padding-left: 0px;">
                            <input type="text" id="province" name="province" style="width: 60px" />ʡ&nbsp;&nbsp;
                            <input type="text" id="city" name="city" style="width: 60px" />��&nbsp;&nbsp;
                            <input type="text" id="county" name="county" style="width: 60px" />��/�� </li>
                    </ul>
                </li>
                <li>���ɵ�ַ<br />
                        1)���ƺţ�
                        <input type="text" id="netbarAddr" name="netbarAddr" />
                        ����ϸ���ƺţ�������дʡ������Ϣ��ʾ���� �»�·1889�Ŷ�¥����&nbsp;
                        <br />
                        2)����� 
                        <input type="text" id="netbarAddr1" name="netbarAddr1" /> 
                        ������·�ڻ��־�Խ�����ʾ�����»�·����·�ڣ����˴�����100�ף�<br />
                        3)��ͨվ�� 
                        <input type="text" id="netbarAddr2" name="netbarAddr2" />
                        ����ͨ��·��վ�㡣ʾ��������60·����㳡վ������1����15�ſڣ�</li>
                <li>��ϵ��<br />
                    <input type="text" id="linkMan" name="linkMan" /></li>
                <li>��ϵ�绰<br />
                    <input type="text" id="phone" name="phone" /></li>
               
                <li>�޸�ԭ��: <br />
                    <%=Html.TextArea("remark", "N/A") %></li>
                <li>���ɱ�ע: <br />
                    <%=Html.TextArea("intro", "N/A") %></li>
            </ul>
        </div>
    </fieldset>
    <br />
    <fieldset>
        <legend>IP ����</legend>
        <ul>
            <li style="display: inline; list-style-type: none; line-height: 22px;">�̶�IP<input type="radio" name="ipType" value="1" id="type1" style="width: 60px" checked="checked" /></li>
            <li style="display: inline; list-style-type: none; line-height: 22px;">IP��<input type="radio" name="ipType" value="2" id="type2" style="width: 60px" /></li>
            <li style="display: inline; list-style-type: none; line-height: 22px;">����IP<input type="radio" name="ipType" value="3" id="type3" style="width: 60px" /></li>
            <li>
                <div id="ip">
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="ip1" name="ip1" style="width: 100px" />
                            </td>
                            <td>
                                <input type="text" id="ip2" name="ip2" style="width: 100px" />
                            </td>
                            <td>
                                <input type="text" id="ip3" name="ip3" style="width: 100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="ip4" name="ip4" style="width: 100px" />
                            </td>
                            <td>
                                <input type="text" id="ip5" name="ip5" style="width: 100px" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="wobbleIP">
                    <table>
                        <tr>
                            <td>
                                ��ʼIP<input type="text" id="wobbleIP1" name="wobbleIP1" style="width: 100px" />
                            </td>
                            <td>
                                ����IP<input type="text" id="wobbleIP2" name="wobbleIP2" style="width: 100px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </li>
        </ul>
    </fieldset>
       <div id="tab2-userinfo">
     <fieldset>
            <legend>Ӳ����Ϣ</legend>
            <ul >
               <%--<li>�������<br />
                        <input type="text" id="WIDEBAND" name="WIDEBAND" /></li>
               <li>�������<br />
                        <input type="text" id="ADMINSOFT" name="ADMINSOFT" /></li>
               <li>�ض�λ��<br />
                        <input type="text" id="POSITION" name="POSITION" /></li>
               <li>CPU<br />
                        <input type="text" id="CPUFREQ" name="CPUFREQ" /></li>
               <li>�Կ�<br />
                        <input type="text" id="DISCARD" name="DISCARD" /></li>
               <li>Ӳ��<br />
                        <input type="text" id="HARDDISK" name="HARDDISK" /></li>
               <li>�ڴ�<br />
                        <input type="text" id="MEMORY" name="MEMORY" /></li>--%>
                        
               <li>��������<br />
                    <input type="text" id="macNum" name="macNum" /></li>
               <li>�������<br />
                       <select id="WIDEBAND" name="WIDEBAND" style="width: 195px" >
                           <option value="0">����</option>
                           <option value="1">��ͨ</option>
                           <option value="2">˫��(����+��ͨ)</option>
                           <option value="3">����(��ͨ������ͨ��)</option>
                       </select>
               </li> 
               <li>�ض�λ��<br />
                        <select id="POSITION" name="POSITION" style="width: 195px" >
                            <option value="0">����</option>
                            <option value="1">��У��</option>
                            <option value="2">����</option>
                            <option value="3">����</option>

                        </select>
               </li>
               <li>CPU<br />
                        <select id="CPUFREQ" name="CPUFREQ" style="width: 195px" >
                     <%--       <option value="0">��Ƶ3.0G������˫��</option>
                            <option value="1">��Ƶ2.4G-3.0G���˻�˫��</option>
                            <option value="2">��Ƶ2.4G���µ���</option>--%>
                            <option value="0">2GHz���£��͹��ģ�</option>
                            <option value="1">2GHz-2.6GHz������/�칫��</option>
                            <option value="2">2.6GHz-3GHz����Ϸ/���֣�</option>
                            <option value="3">3GHz���ϣ��������ܣ�</option>
                        </select>
               </li>
               <li>�Կ�<br />
                        <select id="DISCARD" name="DISCARD" style="width: 195px" >
                          <%--  <option value="0">1G����</option>
                            <option value="1">512�� -1G</option>
                            <option value="2">512������</option>
                            <option value="3">���������Կ�</option>--%>
                            <option value="0">N��Xϵ��ͬ��A��</option>
                            <option value="1">N��9ϵ��ͬ��A��</option>
                            <option value="2">N��8ϵ��ͬ��A��</option>
                            <option value="3">N��7ϵ��ͬ��A��</option>
                            <option value="4">�����Ͷ�</option>
                        </select>
               </li>
               <li>Ӳ��<br />
                        <select id="HARDDISK" name="HARDDISK" style="width: 195px" >
                    <%--        <option value="0">100G����</option>
                            <option value="1">50G-100G</option>
                            <option value="2">50G����</option>
                            <option value="3">��������ϵͳ</option>--%>
                            <option value="0">��������ϵͳ</option>
                            <option value="1">��������ϵͳ</option>
                        </select>
               </li>
               <li>�ڴ�<br />
                        <select id="MEMORY" name="MEMORY" style="width: 195px" >
                           <%-- <option value="0">2G����</option>
                            <option value="1">1G-2G</option>
                            <option value="2">1G����</option>--%>
                            <option value="0">2G����</option>
                            <option value="1">2G</option>
                            <option value="3">1G</option>
                            <option value="2">1G����</option>
                        </select>
               </li>
               <li>�������<br />
                        <select id="ADMINSOFT" name="ADMINSOFT" style="width: 195px" >
                            <option value="0">����</option>
                            <option value="1">Ѹ��</option>
                            <option value="2">����</option>
                            <option value="3">ǿ��</option>
                            <option value="4">��ά��ʦ</option>
                            <option value="5">����</option>
                            <option value="6">����</option>
                            <option value="7">����</option>
                        </select>
               </li>
               <li>���ɹ��<input type="radio" name="tab2-pass" checked="checked" value="1" />��<input type="radio" name="tab2-pass"
                        id="tab2-pass" value="2" />��</li>
                        
                   
            </ul>
        </fieldset>
         </div>
            <div id="tab2-upgrade">
                <fieldset>
                    <legend>���ɹ��</legend>
                    <ul class="verticality" id="tab4-account">
                        <li style="color:Red;">��λ:����</li>
                        <li>��ͷ���ƴ�С<br />
                            <%--<input type="text" id="FACIAADSIZE" name="FACIAADSIZE" style="width: 128px" />--%>
                            1.��<input type="text" id="Fx1" name="FACIAADSIZEx1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Fy1" name="FACIAADSIZEy1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            2.��<input type="text" id="Fx2" name="FACIAADSIZEx2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Fy2" name="FACIAADSIZEy2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            3.��<input type="text" id="Fx3" name="FACIAADSIZEx3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Fy3" name="FACIAADSIZEy3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />

                        </li>
                        
                        <li>��ͷ��������<br />
                            <input type="text" id="FACIAADNUM" name="FACIAADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                                       
                        <li>����λ�ô�С<br />
                           <%-- <input type="text" id="INDOORADSIZE" name="INDOORADSIZE" />--%>
                            1.��<input type="text" id="Ix1" name="INDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Iy1" name="INDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.��<input type="text" id="Ix2" name="INDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Iy2" name="INDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.��<input type="text" id="Ix3" name="INDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Iy3" name="INDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>����λ������<br />
                            <input type="text" id="INDOORADNUM" name="INDOORADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>����λ�ô�С<br />
                            <%--<input type="text" id="OUTDOORADSIZE" name="OUTDOORADSIZE" />--%>
                            1.��<input type="text" id="Ox1" name="OUTDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Oy1" name="OUTDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.��<input type="text" id="Ox2" name="OUTDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Oy2" name="OUTDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.��<input type="text" id="Ox3" name="OUTDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Oy3" name="OUTDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>����λ������<br />
                            <input type="text" id="OUTDOORADNUM" name="OUTDOORADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>�������ƴ�С<br />
                           <%-- <input type="text" id="REMAINADSIZE" name="REMAINADSIZE" />--%>
                            1.��<input type="text" id="Rx1" name="REMAINADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Ry1" name="REMAINADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.��<input type="text" id="Rx2" name="REMAINADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Ry2" name="REMAINADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.��<input type="text" id="Rx3" name="REMAINADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*��<input type="text" id="Ry3" name="REMAINADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        <li>������������<br />
                            <input type="text" id="REMAINADNUM" name="REMAINADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                    </ul>
                </fieldset>
               
           
            </div>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
            �ύ</button></p>
    </form>
    
    <div id="netbarStatus">
    <fieldset>
        <legend>����״̬����</legend>
        <ul class="verticality">
            <li>����״̬:&nbsp;<span id="status"></span></li>
            <li>��������:&nbsp;<span id="lockaccount"></span></li>
            <li>����ʱ��:&nbsp;<span id="lockTime"><%=DateTime.Now.ToLongDateString() %></span></li>
            <li>�������, ��Ϊ��&nbsp;<input type="radio" name="newStatus" value="2" id="NewStatus1" style="width: 60px"/></li>
            <li>�������, ��Ϊ�Ǽ�&nbsp;<input type="radio" name="newStatus" value="1" id="NewStatus2" style="width: 60px" /></li>
            <li>����ԭ��<br /> <%=Html.TextArea("reason")%></li>
        </ul>
    </fieldset>
    <p style="text-align: center"> <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="updateStatus()">��������״̬</button></p>
    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;
        var oriID;
        $("#power").hide();
        $("#areaid").hide();
        $("#nbid").hide();
        var UACCOUNT = $("#UACCOUNT").html();
        var USERNAME = $("#USERNAME").html();
        $("#UACCOUNT").hide();
        $("#USERNAME").hide();
        function searchLoad() {
            oriID = $("#netbarID").val();
            var intExp = /^[1-9]\d*$/;
            var strUrl;
            var areaid = $("#areaid").html();
            var power = $("#power").html();
            if (power == 5 || power == "5") {
                var pm641 = BASE64.encode(oriID + "," + areaid);
                strUrl = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID2/" + pm641;
            }
            else {
                var pm64 =  BASE64.encode(oriID);
                strUrl = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID/" + pm64
            }
            if (oriID.match(intExp) == null) {
                alert("���ɱ�ű�����������!");
                return false;
            } else {
                $.ajax({
                url: strUrl,
                    dataType: 'json',
                    type: 'POST',
                    success: netbarSuccessed
                });
            }
        }

        function netbarSuccessed(result) {
            if (result.isSuccessed != 0) {
                $("#WIDEBAND").val(result.wideband);
                $("#ADMINSOFT").val(result.adminsoft);
                $("#POSITION").val(result.position);

                var cpuVal = 0;
                var dispVal = 0;
                var hdVal = 0;
                var memVal = 0;

                //CPU
                switch (result.cpufreq) {
                    case '2GHz���£��͹��ģ�':
                        cpuVal = 0;
                        break;
                    case '2GHz-2.6GHz������/�칫��':
                        cpuVal = 1;
                        break;
                    case '2.6GHz-3GHz����Ϸ/���֣�':
                        cpuVal = 2;
                        break;
                    case '3GHz���ϣ��������ܣ�':
                        cpuVal = 3;
                        break;
                }

                //DisplayCard
                switch (result.discard) {
                    case 'N��Xϵ��ͬ��A��':
                        dispVal = 0;
                        break;
                    case 'N��9ϵ��ͬ��A��':
                        dispVal = 1;
                        break;
                    case 'N��8ϵ��ͬ��A��':
                        dispVal = 2;
                        break;
                    case 'N��7ϵ��ͬ��A��':
                        dispVal = 3;
                        break;
                    case '�����Ͷ�':
                        dispVal = 4;
                        break;
                }

                //HD
                switch (result.harddisk) {
                    case '��������ϵͳ':
                        hdVal = 0;
                        break;
                    case '��������ϵͳ':
                        hdVal = 1;
                        break;
                }

                //memory
                switch (result.memory) {
                    case '2G����':
                        memVal = 0;
                        break;
                    case '2G':
                        memVal = 1;
                        break;
                    case '1G':
                        memVal = 2;
                        break;
                    case '1G����':
                        memVal = 3;
                        break;
                }

                $("#CPUFREQ").val(cpuVal);
                $("#DISCARD").val(dispVal);
                $("#HARDDISK").val(hdVal);
                $("#MEMORY").val(memVal);
//                $("#CPUFREQ").val(result.cpufreq);
//                $("#DISCARD").val(result.discard);
//                $("#HARDDISK").val(result.harddisk);
//                $("#MEMORY").val(result.memory);
                
                       
                $("#barName").val(result.barname);
                $("#province").val(result.province);
                $("#city").val(result.city);
                $("#county").val(result.county);
                $("#linkMan").val(result.linkman);
//                $("#netbarAddr").val(result.address);
                var straddr = result.address.split('%');
                if (straddr.length >= 1) {
                    $("#netbarAddr").val(straddr[0]);
                }
                if (straddr.length >= 2) {
                    $("#netbarAddr1").val(straddr[1]);
                }
                if (straddr.length >= 3) {
                    $("#netbarAddr2").val(straddr[2]);
                }
                
                $("#phone").val(result.phone);
                $("#macNum").val(result.macnum);
                $("#status").html(result.status);
                $("#lockname").html(result.lockname);

                $("#ip input").val("");
                $("#wobbleIP input").val("");

                if (result.iptype == '�̶�IP') {
                    $("input[name*='ipType']")[0].checked = true;
                    $("#wobbleIP").hide();
                    $("#ip").show();
                }
                else if (result.iptype == 'IP��') {
                    $("input[name*='ipType']")[1].checked = true;
                    $("#wobbleIP").show();
                    $("#ip").hide();
                }
                else if (result.iptype == 'ADSL') {
                    $("input[name*='ipType']")[2].checked = true;
                    $("#wobbleIP").hide();
                    $("#ip").hide();
                }

                if (result.ipaddress.length > 0) {
                    var ipArray = result.ipaddress.split(',');
                    if (result.iptype == '�̶�IP') {
                        $.each(ipArray, function(i, item) {
                            $("#ip input")[i].value = item;
                        });
                    } else if (result.iptype == 'IP��') {
                    ipArray = result.ipaddress.split('-');
                        $("#wobbleIP input")[0].value = ipArray[0];
                        //$("#wobbleIP input")[1].value = ipArray[ipArray.length - 2];
                        $("#wobbleIP input")[1].value = ipArray[ipArray.length - 1];
                    }
                }
                $("#intro").val(result.baseintro); 

                $('#form1').show();
                $('#netbarStatus').show();
            }
            else {

                $("#barName").val("");
                $("#province").val("");
                $("#city").val("");
                $("#county").val("");
                $("#linkMan").val("");
                $("#netbarAddr").val("");
                $("#netbarAddr1").val("");
                $("#netbarAddr2").val("");
                $("#phone").val("");
                $("#macNum").val("");
                $("#status").html("");
                $("#lockname").html("");

                $("#ip input").val("");
                $("#wobbleIP input").val("");
                $('#form1').hide();
                $('#netbarStatus').hide();
                $('#form1').hide();
                alert("�����ɱ�Ų����ڻ�����Ȩ�޸ĸ�������Ϣ!");
            }
        }
            
        //�¼���
        $(document).ready(function() {
            $("#wobbleIP").hide();
            $('#form1').hide();
            $('#netbarStatus').hide();
            $("#type1").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").show(400); });
            $("#type2").bind("click", function() { $("#wobbleIP").show(400); $("#ip").hide(400); });
            $("#type3").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").hide(400); });
            if ($('#nbid').html() != "") {
                $("#netbarID").val($('#nbid').html());
                searchLoad();
            }

            $('#btnSearch').hide();

            //��ʾ���������ɹ��
            $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

                $("#tab2-upgrade").show(400);
            });


            $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

                $("#tab2-upgrade").hide(400);
            });

        });

        //��ȡ����IP
        function getNetBarIP() {
            var ipStr = "";

            ipAddrType = $("input[name*='ipType']")[0].checked ? 1 :
                                $("input[name*='ipType']")[1].checked ? 2 :
                                $("input[name*='ipType']")[2].checked ? 3 : 0;

            var ipStr1 = $("#ip1").val().length > 0 ? $("#ip1").val() + "," : "";
            var ipStr2 = $("#ip2").val().length > 0 ? $("#ip2").val() + "," : "";
            var ipStr3 = $("#ip3").val().length > 0 ? $("#ip3").val() + "," : "";
            var ipStr4 = $("#ip4").val().length > 0 ? $("#ip4").val() + "," : "";
            var ipStr5 = $("#ip5").val().length > 0 ? $("#ip5").val() + "," : "";

            var beginIP = $("#wobbleIP1").val().length > 0 ? $("#wobbleIP1").val() + "," : "";
            var endIP = $("#wobbleIP2").val().length > 0 ? $("#wobbleIP2").val() + "," : "";

            if (ipAddrType == 1) {
                ipStr = ipStr1 + ipStr2 + ipStr3 + ipStr4 + ipStr5;
            }
            else if (ipAddrType == 2) {
                ipStr = beginIP + endIP;
            }
            else if (ipAddrType == 3) {
                ipStr = "";
            }

            return ipStr;
        }

        //�ύ��Ϣ
        function submitInfo() {
           
            if ($("#form1").valid()) {
                // ��ֹ �û�δ�������ɵ�������ύ������Ϣ
                if (oriID != $("#netbarID").val()) {
                    alert("δ����������Ϣ!");
                    return false;
                }
                    
                var ipStr = getNetBarIP();
                if (ipAddrType == 1) {  //��֤IPΨһ��
                    var ipArray = ipStr.split(',');
                    if (ipArray.length > 1) {
                        for (var i = 0; i < ipArray.length - 1; i++) {
                            var ip = ipArray[i] + ",";
                            var tempStr = ipStr;
                            var len = 0;
                            for (var j = 0; j < ipArray.length; j++) {
                                tempStr = tempStr.replace(ip, "");
                                len = tempStr.length;
                            }
                            if (len != ipStr.length - ip.length) {
                                alert("IP�ظ�");
                                return false;
                            }
                        }
                    }
                } else if (ipAddrType == 2) { // IP������֤
                    if ($("#wobbleIP1").val().length < 1 || $("#wobbleIP2").val().length < 1) {
                        alert("��������IP��");
                        return false;
                    }
                    else {
                        var beginIPArray = $("#wobbleIP1").val().split(".");
                        var endIPArray = $("#wobbleIP2").val().split(".");
                        if (!(beginIPArray[0] == endIPArray[0] && beginIPArray[1] == endIPArray[1] && beginIPArray[2] == endIPArray[2] && parseInt(beginIPArray[3]) < parseInt(endIPArray[3]))) {
                            alert("IP�����벻��ȷ!");
                            return false;
                        }
                    }
                }

                var barName = $("#barName").val();
                var province = $("#province").val();
                var city = $("#city").val();
                var county = $("#county").val();
                var linkMan = $("#linkMan").val();
                var address = $("#netbarAddr").val() + "%" + $("#netbarAddr1").val() + "%" + $("#netbarAddr2").val();
                var phone = $("#phone").val();
                var macNum = $("#macNum").val();
                var ipType = ipAddrType;
                var NetBarIP = ipStr;
                var remark = $("#remark").val();
                var intro = $("#intro").val(); 

                url = "http://" + location.host + "/NetBarManager.aspx/NetBarEditFull";
                $.ajax({
                url: url,
                    type: "POST",
                    dataType: "json",
                    data: {   NetBarID: oriID,
                                BarName: barName,
                                Province: province,
                                City: city,
                                County: county,
                                LinkMan: linkMan,
                                Address: address,
                                Phone: phone,
                                MacNum: macNum,
                                IPType: ipType,
                                NetBarIP: NetBarIP,
                                Remark: remark,
                                BaseIntro:intro },
                    success: submitSuccessed
                });
            }
        }

        function submitSuccessed(result) {
            if (result.isSuccessed == 0) {
                alert("����IP��ͻ:�޸�ʧ��! \n����ͻ������(����ID:" + result.NetBarId + " ������:" + result.NetBarName+")");
            } else if (result.isSuccessed == 1) {
//            alert("�޸ĳɹ�!");
            if ($("#form1").valid()) {
               
                var NETBARID = result.NetBarId;
                var WIDEBAND = $("#WIDEBAND").val();
                var ADMINSOFT = $("#ADMINSOFT").val();
                var POSITION = $("#POSITION").val();
                
//                var CPUFREQ = $("#CPUFREQ").val();
//                var DISCARD = $("#DISCARD").val();
//                var HARDDISK = $("#HARDDISK").val();
//                var MEMORY = $("#MEMORY").val();

                var CPUFREQ = $("#CPUFREQ")[0][$("#CPUFREQ").val()].text;
                var DISCARD = $("#DISCARD")[0][$("#DISCARD").val()].text;
                var HARDDISK = $("#HARDDISK")[0][$("#HARDDISK").val()].text;
                var MEMORY = $("#MEMORY")[0][$("#MEMORY").val()].text;
                
                //var FACIAADSIZE = $("#FACIAADSIZE").val();
                var FACIAADSIZE = $("#Fx1").val() + "*" + $("#Fy1").val() + "," + $("#Fx2").val() + "*" + $("#Fy2").val() + "," + $("#Fx3").val() + "*" + $("#Fy3").val(); //��ͷ���ߴ�
                var FACIAADNUM = $("#FACIAADNUM").val();

                //var INDOORADSIZE = $("#INDOORADSIZE").val();
                var INDOORADSIZE = $("#Ix1").val() + "*" + $("#Iy1").val() + "," + $("#Ix2").val() + "*" + $("#Iy2").val() + "," + $("#Ix3").val() + "*" + $("#Iy3").val(); //���ڹ��ߴ�
                var INDOORADNUM = $("#INDOORADNUM").val();

                //var OUTDOORADSIZE = $("#OUTDOORADSIZE").val();
                var OUTDOORADSIZE = $("#Ox1").val() + "*" + $("#Oy1").val() + "," + $("#Ox2").val() + "*" + $("#Oy2").val() + "," + $("#Ox3").val() + "*" + $("#Oy3").val(); //������ߴ�
                var OUTDOORADNUM = $("#OUTDOORADNUM").val();

                //var REMAINADSIZE = $("#REMAINADSIZE").val();
                var REMAINADSIZE = $("#Rx1").val() + "*" + $("#Ry1").val() + "," + $("#Rx2").val() + "*" + $("#Ry2").val() + "," + $("#Rx3").val() + "*" + $("#Ry3").val(); //�������ߴ�
                var REMAINADNUM = $("#REMAINADNUM").val();
                var NAME = USERNAME;
                var ACCOUNT = UACCOUNT;
                url = "http://" + location.host + "/NetBarManager.aspx/NBRemarkUpdate";
                $.ajax({
                url: url,
                    type: "POST",
                    dataType: "json",
                    data: { NETBARID: NETBARID,
                        WIDEBAND: WIDEBAND,
                        ADMINSOFT: ADMINSOFT,
                        POSITION: POSITION,
                        CPUFREQ: CPUFREQ,
                        DISCARD: DISCARD,
                        HARDDISK: HARDDISK,
                        MEMORY: MEMORY,
                        FACIAADSIZE: FACIAADSIZE,
                        FACIAADNUM: FACIAADNUM,
                        INDOORADSIZE: INDOORADSIZE,
                        INDOORADNUM: INDOORADNUM,
                        OUTDOORADSIZE: OUTDOORADSIZE,
                        OUTDOORADNUM: OUTDOORADNUM,
                        REMAINADSIZE: REMAINADSIZE,
                        REMAINADNUM: REMAINADNUM,
                        NAME: NAME,
                        ACCOUNT: ACCOUNT
                    },
                    success: NBRemarkUpdateSuccessed
                });

            }
                
                
                
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 2) {
                alert("�����ɲ�����!");
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            }
            else if (result.isSuccessed == 5) {
                alert("�޸�ʧ��!");
            }
        }
        
        
        
        function NBRemarkUpdateSuccessed(result) {
          
            if (result.isSuccess == 0) {
                alert("�����ɲ����ڣ�");

            }
            else if (result.isSuccess == 1) {

            alert("�޸ĳɹ���");
                history.go(-1);
            }
            else if (result.isSuccess == 2) {
                alert("û������!");
            }
            else if (result.isSuccess == 3) {
                alert("̫����!");
            }
            else if (result.isSuccess == 4) {
                alert("������ͻ!");
            }
            else if (result.isSuccess == 5) {
                alert("���ʧ��!");
            } 
        
        
        
        
        
        
        }
        // �ַ�����
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[���зǷ��ַ�]");

        // IP��ʽ��֤
        jQuery.validator.addMethod("ipFormat", function(value, element) {
            if (value.length == 0) return true;
            return this.optional(element) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/.test(value);
        }, "&nbsp;&nbsp;[����ȷ��������IP!]");

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        jQuery.validator.addMethod("wideBand", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ�������뷽ʽ]");

        jQuery.validator.addMethod("pOsition", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ��ض�]");

        jQuery.validator.addMethod("cPUFREQ", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ��CPU����]");

        jQuery.validator.addMethod("dISCARD", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ���Կ�����");

        jQuery.validator.addMethod("hARDDISK", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ��Ӳ������]");

        jQuery.validator.addMethod("mEMORY", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ���ڴ�����]");

        jQuery.validator.addMethod("aDMINSOFT", function(value, element) {
            var flag = true;
            if (element.length > 0) {
                for (i = 0; i < element.length; i++) {
                    if (element[i].selected == true) {
                        flag = true;
                        break;
                    }
                    else {
                        flag = false;
                    }
                }
            }
            return flag;
        }, "&nbsp;&nbsp;[��ѡ�����]");
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        $("#form1").validate({
            rules:
             {
                 barName: { required: true, filterChar: true },
                 province: { required: true, filterChar: true },
                 city: { required: true, filterChar: true },
                 county: { required: true, filterChar: true },
                 netbarAddr: { required: true, filterChar: true },
                 netbarAddr1: { required: true, filterChar: true },
                 netbarAddr2: { required: true, filterChar: true },
                 linkMan: { required: true, filterChar: true },
                 phone: { required: true, number: true, filterChar: true },
                 macNum: { required: true, number: true, filterChar: true },
                 remark: { required: true, filterChar: true },
                 ip1: { ipFormat: true },
                 ip2: { ipFormat: true },
                 ip3: { ipFormat: true },
                 ip4: { ipFormat: true },
                 ip5: { ipFormat: true },
                 wobbleIP1: { ipFormat: true },
                 wobbleIP2: { ipFormat: true },

                 WIDEBAND: { wideBand: true },
                 POSITION: { pOsition: true },
                 CPUFREQ: { cPUFREQ: true },
                 DISCARD: { dISCARD: true },
                 HARDDISK: { hARDDISK: true },
                 MEMORY: { mEMORY: true },
                 ADMINSOFT: { aDMINSOFT: true }
             },
            messages:
            {
                barName: { required: "&nbsp;&nbsp;[�������Ʋ���Ϊ��]" },
                province: { required: "&nbsp;&nbsp;[ʡ�ݲ���Ϊ��]" },
                city: { required: "&nbsp;&nbsp;[���в���Ϊ��]" },
                county: { required: "&nbsp;&nbsp;[��/�ز���Ϊ��]" },
                netbarAddr: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                netbarAddr1: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                netbarAddr2: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                linkMan: { required: "&nbsp;&nbsp;[��ϵ�˲���Ϊ��]" },
                phone: { required: "&nbsp;&nbsp;[��ϵ�绰����Ϊ��]", number: "&nbsp;&nbsp;[��ϵ�绰����������]" },
                macNum: { required: "&nbsp;&nbsp;[������������Ϊ��]", number: "&nbsp;&nbsp;[������������������]" },
                remark: { required: "&nbsp;&nbsp;[��ע����Ϊ��]" },
                ip1: { required: "&nbsp;&nbsp;[ip1����Ϊ��]" },
                ip2: { required: "&nbsp;&nbsp;[ip2����Ϊ��]" },
                ip3: { required: "&nbsp;&nbsp;[ip3����Ϊ��]" },
                ip4: { required: "&nbsp;&nbsp;[ip4����Ϊ��]" },
                ip5: { required: "&nbsp;&nbsp;[ip5����Ϊ��]" },
                wobbleIP1: { required: "&nbsp;&nbsp;[IP��ʽ����ȷ]" },
                wobbleIP2: { required: "&nbsp;&nbsp;[IP��ʽ����ȷ]" },
                WIDEBAND: { required: "&nbsp;&nbsp;[������벻��Ϊ��]" },
                ADMINSOFT: { required: "&nbsp;&nbsp;[�����������Ϊ��]" },
                POSITION: { required: "&nbsp;&nbsp;[λ�ò���Ϊ��]" },
                CPUFREQ: { required: "&nbsp;&nbsp;[CPU����Ϊ��]" },
                DISCARD: { required: "&nbsp;&nbsp;[�Կ�����Ϊ��]" },
                HARDDISK: { required: "&nbsp;&nbsp;[Ӳ�̲���Ϊ��]" },
                MEMORY: { required: "&nbsp;&nbsp;[�ڴ治��Ϊ��]" }
            }
        });

        function updateStatus() {
            var reasonValue = $("#reason").val();
            if (reasonValue == "") {
                alert("����ԭ����Ϊ��!");
                return false;
            } else {
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < reasonValue.length; i++) {
                    if (reasonValue.indexOf(charArray[i]) != -1) {
                       /// alert("����ԭ���зǷ��ַ�!");
                       /// return false;
                    }
                }
            }

            var statusValue = $("input[name*='newStatus']")[0].checked ? 2 : 1;
            url = "http://" + location.host + "/NetBarManager.aspx/NetBarUnlock";
            $.ajax({
                url: url,
                dataType: 'json',
                type: 'POST',
                data: { NetBarID: oriID, NewStatus: statusValue, Reason: reasonValue },
                success: statusSuccessed
            });
        }

        function statusSuccessed(result) {
            if (result.isSuccessed == 1) {
                alert("�޸ĳɹ�!");
                history.go(-1);
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 2) {
                alert("�����ɲ�����!");
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 3) {
                alert("������δ���󶨻�����!");
            }
        }

        var BASE64 = {
            /**
            * �˱���Ϊ�����key��ÿ���ַ����±����Ӧ����������ı��롣
            */
            enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
            /**
            * �˱���Ϊ�����key����һ�����飬BASE64���ַ���ASCIIֵ���±꣬����Ӧ�ľ��Ǹ��ַ�������ı���ֵ��
            */
            deKey: new Array(
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
        -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
        -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1
    ),
            /**
            * ����
            */
            encode: function(src) {
                //��һ����������ű������ַ���Ч�ʱ����ַ�����Ӹߺܶࡣ
                var str = new Array();
                var ch1, ch2, ch3;
                var pos = 0;
                //ÿ�����ַ����б��롣
                while (pos + 3 <= src.length) {
                    ch1 = src.charCodeAt(pos++);
                    ch2 = src.charCodeAt(pos++);
                    ch3 = src.charCodeAt(pos++);
                    str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                    str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
                }
                //��ʣ�µ��ַ����б��롣
                if (pos < src.length) {
                    ch1 = src.charCodeAt(pos++);
                    str.push(this.enKey.charAt(ch1 >> 2));
                    if (pos < src.length) {
                        ch2 = src.charCodeAt(pos);
                        str.push(this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                        str.push(this.enKey.charAt(ch2 << 2 & 0x3f), '=');
                    } else {
                        str.push(this.enKey.charAt(ch1 << 4 & 0x3f), '==');
                    }
                }
                //��ϸ��������ַ�������һ���ַ�����
                return str.join('');
            },
            /**
            * ���롣
            */
            decode: function(src) {
                //��һ����������Ž������ַ���
                var str = new Array();
                var ch1, ch2, ch3, ch4;
                var pos = 0;
                //���˷Ƿ��ַ�����ȥ��'='��
                src = src.replace(/[^A-Za-z0-9\+\/]/g, '');
                //decode the source string in partition of per four characters.
                while (pos + 4 <= src.length) {
                    ch1 = this.deKey[src.charCodeAt(pos++)];
                    ch2 = this.deKey[src.charCodeAt(pos++)];
                    ch3 = this.deKey[src.charCodeAt(pos++)];
                    ch4 = this.deKey[src.charCodeAt(pos++)];
                    str.push(String.fromCharCode(
                (ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2), (ch3 << 6 & 0xff) + ch4));
                }
                //��ʣ�µ��ַ����н��롣
                if (pos + 1 < src.length) {
                    ch1 = this.deKey[src.charCodeAt(pos++)];
                    ch2 = this.deKey[src.charCodeAt(pos++)];
                    if (pos < src.length) {
                        ch3 = this.deKey[src.charCodeAt(pos)];
                        str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2)));
                    } else {
                        str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4)));
                    }
                }
                //��ϸ��������ַ�������һ���ַ�����
                return str.join('');
            }
        };
    </script>

</asp:Content>
