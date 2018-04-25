<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>
 <div id="netbarStatus">
   <%
    
       TGProject.Models.TGSNetBarByID condtion = (TGProject.Models.TGSNetBarByID)ViewData["condition"];
   
        %>

          <span id="netbarid"><%=condtion.NETBARID %></span>
          <span id="LOCKACCOUNT"><%=condtion.LOCKACCOUNT%></span>
           <span id="LOCKNAME"><%=condtion.LOCKNAME%></span>
    <fieldset>
        <legend>����״̬����</legend>
        <ul class="verticality">
            <li>����״̬:&nbsp;<span id="status"><%=condtion.STATUS%></span></li>
            <li>�ְ���:&nbsp;<span id="lockaccount"><%=condtion.LOCKACCOUNT%></span></li>
            <li>��ʱ��:&nbsp;<span id="lockTime"><%=condtion.LOCKTIME %></span></li>
            <li>�����<input type="radio" name="newStatus" value="2" id="NewStatus1" style="width: 60px" checked/></li>
            <li>����ԭ��<br /> <%=Html.TextArea("reason")%></li>
        </ul>
    </fieldset>
    <p style="text-align: center"> <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="updateStatus()">��������״̬</button>

            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">����</button></p>

    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;
        var oriID;
        $("#power").hide();
        $("#areaid").hide();
                 
        //�¼���
        $(document).ready(function() {
            $("#LOCKACCOUNT").hide();
            $("#LOCKNAME").hide();
            $("#wobbleIP").hide();
            $('#form1').hide();
            //            $('#netbarStatus').hide();
            $("#type1").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").show(400); });
            $("#type2").bind("click", function() { $("#wobbleIP").show(400); $("#ip").hide(400); });
            $("#type3").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").hide(400); });

            oriID = $("#netbarid").html();
            oriID = oriID + ",";
            $("#netbarid").hide();
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
                 remark: { required: true, filterChar: true },
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
                barName: { required: "&nbsp;&nbsp;[�������Ʋ���Ϊ��]" },
                province: { required: "&nbsp;&nbsp;[ʡ�ݲ���Ϊ��]" },
                city: { required: "&nbsp;&nbsp;[���в���Ϊ��]" },
                county: { required: "&nbsp;&nbsp;[��/�ز���Ϊ��]" },
                netbarAddr: { required: "&nbsp;&nbsp;[���ɵ�ַ����Ϊ��]" },
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
                wobbleIP2: { required: "&nbsp;&nbsp;[IP��ʽ����ȷ]" }
            }
        });

        function updateStatus() {

//            idStr = "";
//            var netbars = $("input[type *= 'checkbox']")
//            $.each(netbars, function(index, item) {
//                if (item.checked == true) {
//                    idStr += item.id + ','
//                }
//            });

//            if (idStr.length < 1) {
//                alert("��ѡ��������ɺ��ύ!");
//                return false;
//            }

            var account = $("#LOCKACCOUNT").html();
            var reasonValue = $("#reason").val();
            if (reasonValue == "") {
                alert("����ԭ����Ϊ��!");
                return false;
            } else {
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < reasonValue.length; i++) {
                    if (reasonValue.indexOf(charArray[i]) != -1) {
                     }
                }
            }
            var name = $('#LOCKNAME').text();

            $.ajax({
                url: "../UnBindNetBar/",
                type: "POST",
                dataType: "json",
                data: { NetBarID: oriID, Account: account, Name: name, Remark: reasonValue },
                success: unBindSuccessed
            });
        }

        function unBindSuccessed(result) {
            if (result.isSuccessed == 1) {
                alert("���ɹ�!");
            }
            else if (result.isSuccessed == 2) {
                alert("���ʧ��, �������ɲ�����");
            } else if (result.isSuccessed == 3) {
                alert("�������Ѿ����󶨻����������֮��ſ������·���");
            }
            history.go(0);
        }
    </script>

</asp:Content>
