<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    奖惩录入
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        录入日期:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
        <legend>奖惩录入</legend>
        <div>
            <ul class="verticality">
                <li>
                    <input type="radio" name="rptype" checked="checked" value="1" />奖励<input type="radio" name="rptype" value="2" id="banktype" />惩罚</li>
                <li>大区<br />
                    <select name="zoneDown" id="zoneDown">
                        <option value="0">全部</option>
                        <%
                            List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                            foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                            {
                        %>
                        <option value="<%=zone.AREAID%>">
                            <%= zone.AREANAME%></option>
                        <%
                            } 
                        %>
                    </select></li>
                <li>城市<br />
                    <%=Html.DropDownList("areaDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                </li>
                <li>姓名<br />
                    <%=Html.DropDownList("usernameDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                <li>账号&nbsp;&nbsp;<span id="account"></span></li>
                <li>职位&nbsp;&nbsp;<span id="place"></span></li>
                <li>金额<br />
                    <input type="text" name="rpnum" id="rpnum" /></li>
                <li>奖惩原因<br />
                    <%=Html.TextArea("remark")%></li>
            </ul>
        </div>
    </fieldset>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitFun()">
            提交</button></p>

    <script type="text/javascript">
           var intExp = /^[1-9]\d*$/;

           $(document).ready(function() {
               $("#zoneDown").change(function() { loadAreaDown() });
               $("#areaDown").change(function() { loadUsersDown() });
               $("#usernameDown").change(function() { loadUserDetailDown(); });
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
               $.ajax({
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

           function submitFun() {
               var userID = $("#usernameDown").val();
               var typeID = $("input[name*='rptype']")[0].checked ? 1 : 2;
               var rpNum = $("#rpnum").val();
               var remark = $("#remark").val();
               var rpnum = $("#rpnum").val()
                
                if (remark.length < 1) {
                    alert("请输入备注");
                    return false;
                }
                if (! intExp.test(rpnum)) {
                    alert("请正确输入金额!");
                    return false;
                }

               $.ajax({
               url: "WritePunish/",
                   type: "POST",
                   data: { UserID: userID, TypeID: typeID, RPNum: rpNum, Remark: remark },
                   dateType: "json",
                   success: writeSuccessed
               });
           }

           function writeSuccessed(result) {
                   $("#rpnum").val("");
                   $("#remark").val("");
                   alert("提交成功!")
           }
       
    </script>

</asp:Content>
