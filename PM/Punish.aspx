<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ����¼��
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        ¼������:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
        <legend>����¼��</legend>
        <div>
            <ul class="verticality">
                <li>
                    <input type="radio" name="rptype" checked="checked" value="1" />����<input type="radio" name="rptype" value="2" id="banktype" />�ͷ�</li>
                <li>����<br />
                    <select name="zoneDown" id="zoneDown">
                        <option value="0">ȫ��</option>
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
                <li>����<br />
                    <%=Html.DropDownList("areaDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "��ѡ��", Value = "0" } }, "Value", "Text"))%>
                </li>
                <li>����<br />
                    <%=Html.DropDownList("usernameDown", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "��ѡ��", Value = "0" } }, "Value", "Text"))%>
                <li>�˺�&nbsp;&nbsp;<span id="account"></span></li>
                <li>ְλ&nbsp;&nbsp;<span id="place"></span></li>
                <li>���<br />
                    <input type="text" name="rpnum" id="rpnum" /></li>
                <li>����ԭ��<br />
                    <%=Html.TextArea("remark")%></li>
            </ul>
        </div>
    </fieldset>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitFun()">
            �ύ</button></p>

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
                    alert("�����뱸ע");
                    return false;
                }
                if (! intExp.test(rpnum)) {
                    alert("����ȷ������!");
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
                   alert("�ύ�ɹ�!")
           }
       
    </script>

</asp:Content>
