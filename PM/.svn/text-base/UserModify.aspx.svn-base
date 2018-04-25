<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TGProject.Models.TGSUSERDETAILQUERY>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	基本信息修改
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
 
        基本信息修改日期:<%=DateTime.Now.ToLongDateString() %></p>
    <form id="form1">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            List<TGProject.Models.TGSEDUTYPESHOW> eduList = (List<TGProject.Models.TGSEDUTYPESHOW>)ViewData["Edu"];
            List<TGProject.Models.TGSBZTYPESHOW> bzList = (List<TGProject.Models.TGSBZTYPESHOW>)ViewData["BZ"];
            TGSUSERQUERYALL wageinfo = (TGSUSERQUERYALL)ViewData["WageInfo"];
        
        decimal eduid=0;
        decimal bzid=0;
        for (int i=0;i<eduList.Count;i++)
        {
            if (eduList[i].EDUNAME==Model.EDUNAME)
            {
                eduid=eduList[i].EDUID;
                break;
            }
        }
            
        for (int i=0;i<bzList.Count;i++)
        {
            if (bzList[i].BZNAME==Model.BZNAME)
            {
                bzid=bzList[i].BZID;
                break;
            }
        }
        %>
        <span id="eduid"><%=eduid%></span>
        <span id="bzid"><%=bzid%></span>
        <span id="power"><%=account.POPEDOMID%></span>
    <fieldset>
        <legend>个人信息(必填项)</legend>
        <div>
            <br />
            <ul class="verticality">
                <%--<li>员工姓名&nbsp;&nbsp;<span id="username"><%=Html.Encode(Model.USERNAME)%></span></li>--%>
                 <li>员工姓名<br />
                    <input type="text" name="username" id="username" value="<%=Html.Encode(Model.USERNAME)%>"/></li>
                    
                <li>联系电话<br />
                    <input type="text" name="mobile" id="mobile" value="<%= Html.Encode(Model.MOBILE) %>"  onkeyup  ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /></li>
                <li>联系地址<br />
                    <input type="text" name="address" id="address" value="<%=Html.Encode(Model.ADDRESS) %>"  /></li>
                    
                <li>当前银行类型&nbsp;&nbsp;<span id="currBank"><%=Html.Encode(Model.BANKTYPE)%></span></li>
                
                <li>修改银行类型
                    <input type="radio" name="banktype" value="0" checked="checked" />招商银行
                    <input type="radio" name="banktype" value="1" id="banktype" />工商银行</li>
                <li>银行账号<br />
                    <input type="text" name="bankaccount" id="bankaccount" value="<%=Html.Encode(Model.BANKACCOUNTS) %>"  onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                <li>开户银行<br />
                    <input type="text" name="bankdeposit" id="bankdeposit" value="<%=Html.Encode(Model.BANKDEPOSIT) %>" /></li>
            </ul>
        </div>
    </fieldset>
    <fieldset>
        <legend id='bzinfo'>编制工资信息</legend>

         <ul class="verticality">

                <li>学历<br />
                    <select name="edu" id="edu">
                        <%

                          foreach (TGProject.Models.TGSEDUTYPESHOW edu in eduList)
                          {%>
                        <option value="<%= edu.EDUID%>">
                            <%= edu.EDUNAME%></option>
                        <%}%>
                    </select>
                </li>
                
                <li>编制<br />
                    <select name="bz" id="bz">
                        <%
                              foreach (TGProject.Models.TGSBZTYPESHOW bz in bzList){%>
                        <option value="<%= bz.BZID%>"><%= bz.BZNAME%></option>
                        <%}%>
                    </select>
                </li>

                <li>工资数目<br />
                    <input type="text" name="WageNum" id="WageNum" value="<%=wageinfo.WAGENUM%>" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                <li>岗位工资<br />
                    <input type="text" name="PostWage" id="PostWage" value="<%=wageinfo.POSTWAGE%>" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
        </ul>
    </fieldset>
    </form>
    <br />
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
            提交</button></p>
    <div id="divIframe" title="信息提交中...." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: location.href = '../UserQuery'">
                返回</button>
        </p>
    </div>

    <span id="userid"><%=Html.Encode(Model.USERID)%></span>
    <script language="javascript" type="text/javascript">
        var intExp = /^[1-9]\d*$/;
        var power = $("#power").html();
        $(document).ready(function() {
            var eduid = $("#eduid").html();
            var bzid = $("#bzid").html();
            $("#edu").attr('value', eduid);
            $("#bz").attr('value', bzid);

            if (power == 2) {
                $("#username").attr('disabled', false);
                $("#bzinfo").show();
            }
            else
            {
                $("#username").attr('disabled','false' );
                $("#bzinfo").hide();
            }
            $("#eduid").hide();
            $("#bzid").hide();
            $("#userid").hide();
            $("#power").hide();
        });
        
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break; }
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[含有非法字符]");
               
     
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

        function submitInfo() {

            //验证信息
            if ($("#form1").valid()) {
            
                //个人信息
                var userID = $("#userid").html();
                var mobile = $("#mobile").val();
                var address = $("#address").val();
                var bankaccount = $("#bankaccount").val();
                var banktype = $("input[name*='banktype']")[0].checked ? 0 : 1;
                var bankdeposit = $("#bankdeposit").val();

                $("#displayInfo").show();
                $("#msg").text("信息处理中");

                $("#closeDailog").hide();
                $("#divIframe").dialog("open");

                $.ajax({
                    url: 'UserModify/',
                    type: 'POST',
                    data: { UserID: userID, Mobile: mobile, Address: address, BankAccount: bankaccount, BankType: banktype, BankDeposit: bankdeposit},
                    dataType: 'json',
                    success: modifySuccess
                });
            }
        }

        function modifySuccess(result)
        {
            $("#displayInfo").hide();
            $("#closeDailog").show();

            if (result.isSuccess == 1) {
                if (power == 2) {
                    var userID = $("#userid").html();
                    var userName = $("#username").val();
                    var userEduID = $("#edu").val();
                    var userBZID = $("#bz").val();
                    var userWAGE = $("#WageNum").val();
                    var userPOSTWAGE = $("#PostWage").val();
                    $.ajax({
                    url: 'http://'+location.host+'/PM.aspx/UserBZModify/',
                        type: 'POST',
                        data: { UserID: userID, UserName: userName, EduID: userEduID, BZID: userBZID, WageNum: userWAGE, PostWage: userPOSTWAGE },
                        dataType: 'json',
                        success: modifyBZSuccess
                    });
                }
                else {
                    $("#msg").text("修改成功!");
                }
            }else {
                $("#msg").text("修改失败!");
            }
        }

        function modifyBZSuccess(result) {
            $("#displayInfo").hide();
            $("#closeDailog").show();

            if (result.isSuccess == 1) {
                $("#msg").text("修改成功!");
            } else {
                $("#msg").text("修改失败!");
            }
        }
        $("#form1").validate({
             rules:
             {
                 mobile: { required: true, number: true, filterChar: true },
                 address: { required: true, filterChar: true },
                 bankaccount: { required: true, number: true, filterChar: true },
                 bankdeposit: { required: true, filterChar: true }
             },
            messages:
            {
                mobile: { required: "&nbsp;&nbsp;[联系电话不能为空!]", number: "&nbsp;&nbsp;[电话必须是数字!]" },
                address: { required: "&nbsp;&nbsp;[联系地址不能为空!]" },
                bankaccount: { required: "&nbsp;&nbsp;[银行账号不能为空!]", number: "&nbsp;&nbsp;[银行账号必须是数字!]" },
                bankdeposit: { required: "&nbsp;&nbsp;[开户银行不能为空!]" }
            }
        });

       
   
    </script>
</asp:Content>

