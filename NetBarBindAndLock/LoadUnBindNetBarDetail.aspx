<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	解绑网吧
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
        <legend>网吧状态更改</legend>
        <ul class="verticality">
            <li>网吧状态:&nbsp;<span id="status"><%=condtion.STATUS%></span></li>
            <li>现绑定人:&nbsp;<span id="lockaccount"><%=condtion.LOCKACCOUNT%></span></li>
            <li>绑定时间:&nbsp;<span id="lockTime"><%=condtion.LOCKTIME %></span></li>
            <li>解除绑定<input type="radio" name="newStatus" value="2" id="NewStatus1" style="width: 60px" checked/></li>
            <li>更改原因<br /> <%=Html.TextArea("reason")%></li>
        </ul>
    </fieldset>
    <p style="text-align: center"> <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="updateStatus()">更新网吧状态</button>

            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">返回</button></p>

    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;
        var oriID;
        $("#power").hide();
        $("#areaid").hide();
                 
        //事件绑定
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

        //获取网吧IP
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

      
        // 字符过滤
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[含有非法字符]");

        // IP格式验证
        jQuery.validator.addMethod("ipFormat", function(value, element) {
            if (value.length == 0) return true;
            return this.optional(element) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/.test(value);
        }, "&nbsp;&nbsp;[请正确输入您的IP!]");

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
                barName: { required: "&nbsp;&nbsp;[网吧名称不能为空]" },
                province: { required: "&nbsp;&nbsp;[省份不能为空]" },
                city: { required: "&nbsp;&nbsp;[城市不能为空]" },
                county: { required: "&nbsp;&nbsp;[区/县不能为空]" },
                netbarAddr: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                linkMan: { required: "&nbsp;&nbsp;[联系人不能为空]" },
                phone: { required: "&nbsp;&nbsp;[联系电话不能为空]", number: "&nbsp;&nbsp;[联系电话必须是数字]" },
                macNum: { required: "&nbsp;&nbsp;[机器数量不能为空]", number: "&nbsp;&nbsp;[机器数量必须是数字]" },
                remark: { required: "&nbsp;&nbsp;[备注不能为空]" },
                ip1: { required: "&nbsp;&nbsp;[ip1不能为空]" },
                ip2: { required: "&nbsp;&nbsp;[ip2不能为空]" },
                ip3: { required: "&nbsp;&nbsp;[ip3不能为空]" },
                ip4: { required: "&nbsp;&nbsp;[ip4不能为空]" },
                ip5: { required: "&nbsp;&nbsp;[ip5不能为空]" },
                wobbleIP1: { required: "&nbsp;&nbsp;[IP格式不正确]" },
                wobbleIP2: { required: "&nbsp;&nbsp;[IP格式不正确]" }
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
//                alert("请选择解绑的网吧后提交!");
//                return false;
//            }

            var account = $("#LOCKACCOUNT").html();
            var reasonValue = $("#reason").val();
            if (reasonValue == "") {
                alert("更改原因不能为空!");
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
                alert("解绑成功!");
            }
            else if (result.isSuccessed == 2) {
                alert("解绑失败, 锁定网吧不存在");
            } else if (result.isSuccessed == 3) {
                alert("该网吧已经被绑定或锁定，解绑之后才可已重新分配");
            }
            history.go(0);
        }
    </script>

</asp:Content>
