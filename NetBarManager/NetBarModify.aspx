<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ɻ�����Ϣ�޸�

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            string strNetBarID = (string)ViewData["NBid"];
            if ((string)ViewData["NBid"] == null)
            {
                strNetBarID = string.Empty;
            }
        %>
<span id="areaid"><%=account.AREAID %></span>
<span id="nbid"><%=strNetBarID%></span>
<span id="USERNAME"><%=account.USERNAME%></span>
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        ��������:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
        <legend>��������</legend>
        <div style="text-align:center">
           ���ɱ��:&nbsp;&nbsp;&nbsp;<input type="text" id="netbarID"  disabled="disabled"/>&nbsp;&nbsp;&nbsp;<button class="ui-state-default ui-corner-all" type="button" onclick="searchLoad()" id="btnSearch">����</button></div>
    </fieldset>
    <br />
    <form id="form1">
    <fieldset>
        <legend>������Ϣ</legend>
        <div>
            <ul class="verticality">
                <li>��������<br />
                    <input type="text" id="barName" name="barName" /></li>
                <li>���ɵ�ַ<br />
                   <%-- <input type="text" id="netbarAddr" name="netbarAddr" /></li>--%>
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
                <li>����ԭ��<br />
                    <%=Html.TextArea("remark", "N/A") %></li>
              </ul>
        </div>
    </fieldset>
    <div id="tab2-userinfo">
    <fieldset>
            <legend>Ӳ����Ϣ</legend>
            <ul >                        
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
     <%--                       <option value="0">��Ƶ3.0G������˫��</option>
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
                           <%-- <option value="0">1G����</option>
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
                            <option value="0">��������ϵͳ</option>
                            <option value="1">��������ϵͳ</option>
                        </select>
               </li>
               <li>�ڴ�<br />
                        <select id="MEMORY" name="MEMORY" style="width: 195px" >
                            <option value="0">2G����</option>
                            <option value="1">2G</option>
                            <option value="2">1G</option>
                            <option value="3">1G����</option>
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
   

    <script type="text/javascript" language="javascript">
        var oriID;
        var areaid;
        var UACCOUNT = $("#UACCOUNT").html();
        var USERNAME = $("#USERNAME").html();
        $(document).ready(function() {
            $("#areaid").hide();
            $('#form1').hide();
            $('#nbid').hide();
            $('#btnSearch').hide();
            $('#USERNAME').hide();
            
            if ($('#nbid').html() != "") {
                
                $("#netbarID").val($('#nbid').html());
                searchLoad();
            }

            //��ʾ���������ɹ��
            $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

                $("#tab2-upgrade").show(400);
            });


            $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

                $("#tab2-upgrade").hide(400);
            });

        });

        function searchLoad() {
        
            oriID = $("#netbarID").val();
            areaid = $("#areaid").html();
            var intExp = /^[1-9]\d*$/;
            if (oriID.match(intExp) == null) {
                alert("���ɱ�ű�����������!");
                return false;
            } else {
            var pm641 = BASE64.encode(oriID + "," + areaid);
                $.ajax({
                url: "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID2/" + pm641,
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
                

                //��ͷ����С
                //$("#FACIAADSIZE").val(result.faciaadsize);
                var FacSize = result.faciaadsize.split(',');
                for (idx = 0; idx < FacSize.length; idx++) {
                    var FSizeOne = FacSize[idx].split('*');
                    if (FSizeOne.length >= 1) {
                        $("#Fx" + (idx + 1)).val(FSizeOne[0]);
                    }
                    if (FSizeOne.length >= 2) {
                        $("#Fy" + (idx + 1)).val(FSizeOne[1]);
                    }
                }
                //��ͷ�������
                $("#FACIAADNUM").val(result.faciaadnum);
                /////////////////////////////////////////////////////////////////
                //���ڹ���С
                //$("#INDOORADSIZE").val(result.indooradsize);
                var InSize = result.indooradsize.split(',');
                for (idx1 = 0; idx1 < InSize.length; idx1++) {
                    var InSizeOne = InSize[idx1].split('*');
                    if (InSizeOne.length >= 1) {
                        $("#Ix" + (idx1 + 1)).val(InSizeOne[0]);
                    }
                    if (InSizeOne.length >= 2) {
                        $("#Iy" + (idx1 + 1)).val(InSizeOne[1]);
                    }
                }
                //���ڹ������
                $("#INDOORADNUM").val(result.indooradnum);
                ///////////////////////////////////////////////////////////////

                //�������С
                //$("#OUTDOORADSIZE").val(result.outdooradsize);
                var OutSize = result.outdooradsize.split(',');
                for (idx2 = 0; idx2 < OutSize.length; idx2++) {
                    var OutSizeOne = OutSize[idx2].split('*');
                    if (OutSizeOne.length >= 1) {
                        $("#Ox" + (idx2 + 1)).val(OutSizeOne[0]);
                    }
                    if (OutSizeOne.length >= 2) {
                        $("#Oy" + (idx2 + 1)).val(OutSizeOne[1]);
                    }
                }
                //����������
                $("#OUTDOORADNUM").val(result.outdooradnum);
                ///////////////////////////////////////////////////////////////

                //��������С
                //$("#REMAINADSIZE").val(result.remainadsize);
                var RemainSize = result.remainadsize.split(',');
                for (idx3 = 0; idx3 < RemainSize.length; idx3++) {
                    var RemainSizeOne = RemainSize[idx3].split('*');
                    if (RemainSizeOne.length >= 1) {
                        $("#Rx" + (idx3 + 1)).val(RemainSizeOne[0]);
                    }
                    if (RemainSizeOne.length >= 2) {
                        $("#Ry" + (idx3 + 1)).val(RemainSizeOne[1]);
                    }
                }
                //�����������
                $("#REMAINADNUM").val(result.remainadnum);
                
                
                $("#barName").val(result.barname);
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
                $("#linkMan").val(result.linkman);
                $("#phone").val(result.phone);
                $("#macNum").val(result.macnum);

                $('#form1').show();
            }
            else {
                $("#barName").val("");
                $("#netbarAddr").val("");
                $("#netbarAddr1").val("");
                $("#netbarAddr2").val("");
                $("#linkMan").val("");
                $("#phone").val("");
                $("#macNum").val("");

                $('#form1').hide();
                alert("�����ɱ�Ų����ڻ�����Ȩ�޸ĸ�������Ϣ!");
                
            }
         }

            jQuery.validator.addMethod("filterChar", function(value, element) {
                var flag = true;
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < charArray.length; i++) {
                    if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
                }
                return this.optional(element) || flag;
            }, "&nbsp;&nbsp;[���зǷ��ַ�]");
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
                     netbarAddr: { required: true, filterChar: true },
                     netbarAddr1: { required: true, filterChar: true },
                     netbarAddr2: { required: true, filterChar: true },
                     linkMan: { required: true, filterChar: true },
                     phone: { required: true, number: true, filterChar: true },
                     macNum: { required: true, number: true, filterChar: true },
                     remark: { required: true, filterChar: true },

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
                    netbarAddr: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                    netbarAddr1: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                    netbarAddr2: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                    linkMan: { required: "&nbsp;&nbsp;[��ϵ�˲���Ϊ��]" },
                    phone: { required: "&nbsp;&nbsp;[��ϵ�绰����Ϊ��]", number: "&nbsp;&nbsp;[��ϵ�绰����������]" },
                    macNum: { required: "&nbsp;&nbsp;[������������Ϊ��]", number: "&nbsp;&nbsp;[������������������]" },
                    remark: { required: "&nbsp;&nbsp;[����ԭ����Ϊ��]" },

                    WIDEBAND: { required: "&nbsp;&nbsp;[������벻��Ϊ��]" },
                    ADMINSOFT: { required: "&nbsp;&nbsp;[�����������Ϊ��]" },
                    POSITION: { required: "&nbsp;&nbsp;[λ�ò���Ϊ��]" },
                    CPUFREQ: { required: "&nbsp;&nbsp;[CPU����Ϊ��]" },
                    DISCARD: { required: "&nbsp;&nbsp;[�Կ�����Ϊ��]" },
                    HARDDISK: { required: "&nbsp;&nbsp;[Ӳ�̲���Ϊ��]" },
                    MEMORY: { required: "&nbsp;&nbsp;[�ڴ治��Ϊ��]" }
                }
            });


            function submitInfo() {
                if ($("#form1").valid()) {
                
                    if (oriID != $("#netbarID").val()) {
                        alert("δ����������Ϣ!");
                        return false;
                    }
                    
                   var barID = $("#netbarID").val();
                   var barName = $("#barName").val();
                   var address = $("#netbarAddr").val() + "%" + $("#netbarAddr1").val() + "%" + $("#netbarAddr2").val();
                   var linkMan = $("#linkMan").val();
                   var phone = $("#phone").val();
                   var macNum = $("#macNum").val();
                   var remark = $("#remark").val();

                    $.ajax({
                        url: "http://" + location.host + "/NetBarManager.aspx/NetBarEditBasic/",
                        type: "POST",
                        dataType: "json",
                        data: { NetBarID: barID, BarName: barName, LinkMan: linkMan, Address: address, Phone: phone, MacNum: macNum,  Remark: remark },
                        success: submitSuccessed
                    });
                }
            }

            function submitSuccessed(result) {
                if (result.isSuccessed) {
                    //alert("�޸ĳɹ�");
                 
                    if ($("#form1").valid()) {

                        var NETBARID = $("#netbarID").val(); ;
                        var WIDEBAND = $("#WIDEBAND").val();
                        var ADMINSOFT = $("#ADMINSOFT").val();
                        var POSITION = $("#POSITION").val();
                        
//                        var CPUFREQ = $("#CPUFREQ").val();
//                        var DISCARD = $("#DISCARD").val();
//                        var HARDDISK = $("#HARDDISK").val();
//                        var MEMORY = $("#MEMORY").val();

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
                  
                    //history.go(-1);
                }
                else {
                    alert("�޸�ʧ��");
                }
            }

            function NBRemarkUpdateSuccessed(result) {

                if (result.isSuccess == 0) {
                    alert("�����ɲ����ڣ�");

                }
                else if (result.isSuccess == 1) {
                    $('#form1').hide();
                    $("input[type*='text']").val("");
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
