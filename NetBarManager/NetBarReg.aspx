<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���ɵǼ�
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Account account = null; if (Session["Account"] != null) { account = (Account)Session["Account"];%>
    <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
        <ul class="horizontal">
            <li>�������´�&nbsp;&nbsp;<span><%=account.AREANAME%></span></li>
            <li>�Ǽ���&nbsp;&nbsp;<span><%=account.USERNAME%></span></li>
            <li>�˺�&nbsp;&nbsp;<span><%=account.UACCOUNT%></span></li>
            <li>�Ǽ�ʱ��&nbsp;&nbsp;<span><%=DateTime.Now.ToLongDateString().ToString()%></span></li>
        </ul>
    </div>
    <%} %>
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
                                <input type="text" id="province" name="province" style="width: 60px" />(ʡ)&nbsp;&nbsp;
                                <input type="text" id="city" name="city" style="width: 60px" />(��)&nbsp;&nbsp;
                                <input type="text" id="county" name="county" style="width: 60px" />(��/��) </li>
                        </ul>
                    </li>
                    <li>���ɵ�ַ<br />
                        <input type="text" id="netbarAddr" name="netbarAddr" /></li>
                    <li>��ϵ��<br />
                        <input type="text" id="linkMan" name="linkMan" /></li>
                    <li>��ϵ�绰<br />
                        <input type="text" id="phone" name="phone"  onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>��������<br />
                        <input type="text" id="macNum" name="macNum"  onkeyup ="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>��ע<br />
                        <%=Html.TextArea("remark", "N/A") %></li>
                </ul>
            </div>
        </fieldset>
        <br />
        <fieldset>
            <legend>IP ����</legend>
            <ul >
                <li style="display: inline; list-style-type: none; line-height: 22px;">�̶�IP<input type="radio" name="ipType" value="1" id="type1" style="width: 60px" checked="checked"/></li>
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
    </form>
    <p style="text-align: center">
        <button id="submitBtn"  class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
            �ύ</button></p>
    <div id="divIframe" title="��Ϣ�ύ��........." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
                �ر�</button>
        </p>
    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;

        function loadNetbarInfo() {
            var id = $("#netbarID").val();
            var intExp = /^[1-9]\d*$/;
            var pm64 = BASE64.encode(id);
            
            if (id.match(intExp) == null) {
                alert("���ɱ�ű�����������!");
                return false;
            } else {
            $.ajax({
                    url: 'LoadNetBarByID/' + pm64,
                    dataType: 'json',
                    type: 'POST',
                    success: netbarSuccessed
                });
            }
        }

        function netbarSuccessed(result) {
            $("#barName").val(result.barname);
            $("#netbarAddr").val(result.address);
            $("#linkMan").val(result.linkman);
            $("#phone").val(result.phone);
            $("#macNum").val(result.macnum);
            $('#form1').show();
        }
        
        
        
        //�¼���
        $(document).ready(function() {
               $("#wobbleIP").hide(); 
              $("#type1").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").show(400); });
              $("#type2").bind("click", function() { $("#wobbleIP").show(400); $("#ip").hide(400); });
              $("#type3").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").hide(400); });
        });
        
        //��ȡ����IP
        function getNetBarIP(){
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
                
             if (ipAddrType == 1){
                ipStr = ipStr1 + ipStr2 + ipStr3 + ipStr4 + ipStr5;
             }
             else if (ipAddrType == 2){
                ipStr = beginIP + endIP;
             }
             else if (ipAddrType == 3)
             {
                ipStr = "";
             }
             
             return ipStr;
        }
    
        //�ύ��Ϣ
        function submitInfo() {
           
            
            if ($("#form1").valid()) {
                var ipStr = getNetBarIP();
                if (ipAddrType == 1) {  //��֤IPΨһ��

                    var ipArray = ipStr.split(',');
                    if (ipArray.length <= 0 || ipStr.length == 0||ipStr.indexOf('.')<=0) {
                        alert('�̶�IP����Ϊ��');
                        return;
                    
                    }
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
                        //&& beginIPArray[3] < endIPArray[3]
                        var beginIPArray = $("#wobbleIP1").val().split(".");
                        var endIPArray = $("#wobbleIP2").val().split(".");
                        if (!(beginIPArray[0] == endIPArray[0] && beginIPArray[1] == endIPArray[1] && beginIPArray[2] == endIPArray[2] &&beginIPArray[3]!=endIPArray[3])) {
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
                var address = $("#netbarAddr").val();
                var phone = $("#phone").val();
                var macNum = $("#macNum").val();
                var ipType = ipAddrType;
                var NetBarIP = ipStr;
                var remark = $("#remark").val();
//                alert("yy");
//                return;
                //                alert("after");
                $("#submitBtn").attr('disabled', 'false');
                $.ajax({
                    url: "NetBarReg/",
                    type: "POST",
                    dataType: "json",
                    data: { BarName: barName, Province: province, City: city, County: county, LinkMan: linkMan, Address: address, Phone: phone, MacNum: macNum, IPType: ipType, NetBarIP: NetBarIP, Remark: remark },
                    success: submitSuccessed
                });
            }
        }

        function submitSuccessed(result) {
            $("#submitBtn").attr('disabled', false);
            if (result.isSuccessed == 1) {
                alert("��ӳɹ�!");
                $("input[type*='text']").val("");
                $('#remark').val("");
            }
            else if (result.isSuccessed == 0) {

                if (result.rows.length > 0) {
                    $.each(result.rows, function(i, item) {
                        alert("IP��ͻ!(��" + item.cell[0] +  "������ID��" + item.cell[1] + " ����������" + item.cell[2] + "������IP��ͻ)");

                    });
                }
                return;
            }
            else if (result.isSuccessed == 2) {
                alert("û������!");
            }
            else if (result.isSuccessed == 3) {
                alert("̫����!");
            }
            else if (result.isSuccessed == 4) {
                alert("������ͻ!");
            }
            else if (result.isSuccessed == 5) {
                alert("���ʧ��!");
            } else if (result.isSuccessed == 22) {
                alert("�������Ѵ���!");
            }
        }
  
            // �ַ����� peng
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
                //alert(value);
                // value = value.trim();
                if (value.length == 0) return true;
                return this.optional(element) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/.test(value);
            }, "&nbsp;&nbsp;[����ȷ��������IP!]");

            $("#form1").validate({
             rules:
             {
                 barName: { required: true, filterChar: true },
                 province: { required: true, filterChar: true },
                 city: { required: true, filterChar: true },
                 county: { required: true, filterChar: true },
                 netbarAddr: { required: true, filterChar: true },
                 linkMan: { required: true, filterChar: true },
                 phone: { required: true, number: true, filterChar: true },
                 macNum: { required: true, number: true, filterChar: true },
                 remark: { required: true,  filterChar: true },
                 ip1: { ipFormat: true },
                 ip2: { ipFormat: true },
                 ip3: { ipFormat: true },
                 ip4: { ipFormat: true },
                 ip5: { ipFormat: true },
                 wobbleIP1: { ipFormat: true },
                 wobbleIP2: { ipFormat: true }
             },
            messages:
            {
                 barName: { required: "&nbsp;&nbsp;[�������Ʋ���Ϊ��]"},
                 province: { required: "&nbsp;&nbsp;[ʡ�ݲ���Ϊ��]" },
                 city: { required: "&nbsp;&nbsp;[���в���Ϊ��]"},
                 county: { required: "&nbsp;&nbsp;[��/�ز���Ϊ��]"},
                 netbarAddr: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
                 linkMan: { required: "&nbsp;&nbsp;[��ϵ�˲���Ϊ��]" },
                 phone: { required: "&nbsp;&nbsp;[��ϵ�绰����Ϊ��]", number: "&nbsp;&nbsp;[��ϵ�绰����������]"},
                 macNum: { required: "&nbsp;&nbsp;[������������Ϊ��]", number: "&nbsp;&nbsp;[������������������]"},
                 remark: { required: "&nbsp;&nbsp;[��ע����Ϊ��]" },
                 ip1: { required: "&nbsp;&nbsp;[ip1����Ϊ��]" },
                 ip2: { required: "&nbsp;&nbsp;[ip2����Ϊ��]" },
                 ip3: { required: "&nbsp;&nbsp;[ip3����Ϊ��]" },
                 ip4: { required: "&nbsp;&nbsp;[ip4����Ϊ��]" },
                 ip5: { required: "&nbsp;&nbsp;[ip5����Ϊ��]" },
                 wobbleIP1: { required: "&nbsp;&nbsp;[IP��ʽ����ȷ]" },
                 wobbleIP2: { required: "&nbsp;&nbsp;[IP��ʽ����ȷ]" }
            }
        });



        $(function() {
            $("#divIframe").dialog({
                show: 'drop',
                bgiframe: false,
                autoOpen: false,
                draggable: true,
                resizable: true,
                modal: true,
                dialogClass: "removeCloseBtn",
                closeOnEscape: false
            });
        });
    </script>

</asp:Content>
