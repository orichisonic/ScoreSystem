<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    考勤录入
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        录入日期:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
        <legend>考勤录入</legend>
        <div>
            <ul class="verticality">
                <li>大区<br />
                    <select name="zoneDown" id="zoneDown">
                        <option value="0">全部</option>
                        <%
                            List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                            foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                            {
                        %>
                        <option value="<%=zone.AREAID%>"><%= zone.AREANAME%></option>
                        <%
                            } 
                        %>
                    </select></li>
                <li>城市<br />
                    <%=Html.DropDownList("areaDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                </li>
                <li>姓名<br />
                    <%=Html.DropDownList("usernameDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                </li>
                <li>账号&nbsp;&nbsp;<span id="account"></span></li>
                <li>职位&nbsp;&nbsp;<span id="place"></span></li>
                <li>考勤结果<br />
                    <select id="checkType">
                        <%List<TGProject.Models.TGSCHECKTYPESHOW> typeList1 = (List<TGProject.Models.TGSCHECKTYPESHOW>)ViewData["CheckType"];
                          foreach (TGProject.Models.TGSCHECKTYPESHOW type in typeList1)
                          {%>
                        <option value="<%= type.TYPEID.ToString() + ',' + type.DEDUCTNUM.ToString()%>">
                            <%= type.CHECKINFO %></option>
                        <%} %>
                    </select>
                </li>
                <li><span id="deductnum">扣款金额<br /><input type="text" id="deductValue" /></span></li>
                <li>备注<br />
                    <%=Html.TextArea("remark")%></li>
            </ul>
        </div>
    </fieldset>
    <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitFun()">提交</button></p>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#zoneDown").change(function() { loadAreaDown() });
            $("#areaDown").change(function() { loadUsersDown() });
            $("#usernameDown").change(function() { loadUserDetailDown(); });
            $("#checkType").change(function() { showDeductnum(); });
            $("#deductnum").hide();
        });

        function loadAreaDown() {
            $.ajax({
                url: "LoadArea/" + $("#zoneDown").val(),
                type: "POST",
                dataType: "json",
                success: areaDownSuccessed
            });
        }

        function loadUsersDown() {
            $.ajax({
                url: "LoadUsers/" + $("#areaDown").val(),
                type: "POST",
                dataType: "json",
                success: usersDownSuccessed
            });
        }

        function loadUserDetailDown() {
            $.ajax(
             {
                 url: "LoadUserDetail/" + $("#usernameDown").val(),
                 type: "POST",
                 dataType: "json",
                 success: userDetailDownSuccessed
             });
        }


        function areaDownSuccessed(result) {
            $("#areaDown").empty();
            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#areaDown"));
                });
            }
        }

        function usersDownSuccessed(result) {
            $("#usernameDown").empty();
            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#usernameDown"));
                });
            }
        }

        function userDetailDownSuccessed(result) {
            $("#account").html(result.uaccount);
            $("#place").html(result.placename);
        }


        function showDeductnum() {
            var tdArray = $("#checkType").val().split(',');
            var typeID = tdArray[0];
            var deductNum = tdArray[1];

            if (typeID == 5) {
                $("#deductnum").show();
            }
            else {
                $("#deductnum").hide();
            }
        }
        
        function submitFun() {
            var userID = $("#usernameDown").val();
            var tdArray = $("#checkType").val().split(',');
            var typeID = tdArray[0];
            var deductNum = typeID == 5 ? $("#deductValue").val() : tdArray[1];
            var remark = $("#remark").val();
            
            if (remark.length < 1) {
                alert("请输入备注");
                return false;
            }
            
            $.ajax({
                url: "WriteClockingIn/",
                type: "POST",
                data: { UserID: userID, TypeID: typeID, DeductNum: deductNum, Remark: remark },
                dateType: "json",
                success: writeSuccessed
            });
        }

        function writeSuccessed(result) {
            $("#remark").val("");
            $("#remark").val("");
            alert("提交成功!");
        }

        $("#form1").validate({
            rules:
             {
                 username: { required: true, userName: true, filterChar: true },
                 degree: { required: true },
                 idcard: { required: true, isIdCardNo: true, filterChar: true },
                 mobile: { required: true, number: true, filterChar: true },
                 address: { required: true, filterChar: true },
                 bankaccount: { required: true, number: true, filterChar: true },
                 bankdeposit: { required: true, filterChar: true },
                 applydesc: { required: true, filterChar: true }
             },
            messages:
            {
                username: { required: "&nbsp;&nbsp;[姓名不能为空!]" },
                degree: { required: "&nbsp;&nbsp;[学历不能为空!]" },
                idcard: { required: "&nbsp;&nbsp;[身份证号不能为空!]" },
                mobile: { required: "&nbsp;&nbsp;[联系电话不能为空!]", number: "&nbsp;&nbsp;[电话必须是数字!]" },
                address: { required: "&nbsp;&nbsp;[联系地址不能为空!]" },
                bankaccount: { required: "&nbsp;&nbsp;[银行账号不能为空!]", number: "&nbsp;&nbsp;[银行账号必须是数字!]" },
                bankdeposit: { required: "&nbsp;&nbsp;[开户银行不能为空!]" },
                applydesc: { required: "&nbsp;&nbsp;[申请备注不能为空!]" }
            }
        });
    </script>

</asp:Content>
