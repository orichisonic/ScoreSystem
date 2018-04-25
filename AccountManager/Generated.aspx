<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Src="../Shared/ExamineControl.ascx" TagName="ExamineControl" TagPrefix="uc1" %>
<%@ Register Src="../Shared/ExamineConditionControl.ascx" TagName="ExamineConditionControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
生成账号
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <% Account account = null;
            if (Session["Account"] != null) { account = (Account)Session["Account"]; }%>
        <legend>生成账号</legend>
        <ul class="verticality">
            <li>选择账号类型<br />
                <select name="popedom1" id="popedom1" style="width:151px;">
                <%if (account != null && account.POPEDOMID == 5){%>
                    <option value="5,6">办事处推广主管</option>
                    <option value="6,7">办事处推广专员</option>
                    <option value="5,9">宣传主管宣传员</option>
                <%} if (account != null && account.POPEDOMID == 2){%>
                    <option value="4,5">办事处经理</option>
                    <option value="3,8">督察专员</option>
                <%} %>
                </select>
            </li>
            <li id="zoneHide">大区<br />
                <select name="zone1" id="zone1" style="width:151px;">
                    <%List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                      foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                      {%>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%} %>
                </select>
            </li>
            <li id="areaHide">选择所属办事处<br />
                <select name="area1" id="area1" style="width:151px;">
                    <%if (account.POPEDOMID == 5) { %>
                        <option value="<%=account.AREAID + ",code"%>">
                        <%= account.AREANAME%></option>
                    <%} %>
                </select>
            </li>
            <li id="leaderHide">选择所属上级<br />
                <select name="leader1" id="leader1" style="width:151px;">
                </select>
            </li>
            <li id="userHide">选择生成账号的用户<br />
                <select name="users1" id="users1" style="width:151px;">
                </select>
            </li>
            <li>生成账号/密码<br />账号: <span id="uaccount"></span>&nbsp;&nbsp;密码: <span id="password"></span></li>
        </ul>
    </fieldset>
    <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitUserInfo()">生成账号</button></p>
    
     <div id="divIframe" title="信息加载中........." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span><span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
                关闭</button>
        </p>
    </div>
    <div id="power"><%=account.POPEDOMID%></div>
    <script type="text/javascript" language="javascript">
        var power;
        $(document).ready(function() {
            $("#popedom1").change(function() { hideZoneArea(); loadArea(); });
            $("#zone1").change(function() { loadArea(); });
            $("#area1").change(function() { loadLeader(); loadUsers(); });
            power = $("#power").html();
            loadArea();
            $("#power").hide();
        });

        function hideZoneArea() {
            var idArray = $("#popedom1").val().split(',');
            var leaderType = idArray[0];
            
            $("#zoneHide").hide();
            $("#areaHide").hide();
            $("#leaderHide").hide();
            $("#userHide").hide();
            
            if (leaderType == 3) {          //督察员
                $("#zoneHide").hide();
                $("#areaHide").hide();
                $("#leaderHide").show();
                $("#userHide").show();
            } else if (leaderType == 4) { //办事处经理
                $("#zoneHide").show();
                $("#areaHide").show();
                $("#leaderHide").show();
                $("#userHide").show();
            } else if (leaderType == 5) { //推广主管
                $("#zoneHide").hide();
                $("#areaHide").hide();
                $("#leaderHide").hide();
                $("#userHide").show();
            } else if (leaderType == 6) { //推广员
                $("#zoneHide").hide();
                $("#areaHide").hide();
                $("#leaderHide").show();
                $("#userHide").show();
            }
        }

    
        function loadArea() {
            $("#displayInfo").show();
            $("#msg").text("信息加载中,请稍候!");
            $("#divIframe").dialog("open");
            if (power != 5) {
                $.ajax({
                    url: "LoadArea/" + $("#zone1").val(),
                    type: "POST",
                    dataType: "json",
                    success: areaSuccessed
                });
            }else {
                loadLeader();
                loadUsers();
            }
        }

        function areaSuccessed(result) {
            $("#area1").empty();
            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0] + ',' + item.cell[3]).text(item.cell[1]).appendTo($("#area1"));
                });
            }
            $("#divIframe").dialog("close");
            
            loadLeader();
            loadUsers();
        }

        function loadLeader() {
        
            $("#displayInfo").show();
            $("#msg").text("信息加载中,请稍候!");
            $("#divIframe").dialog("open");
            
            var idArray = $("#popedom1").val().split(',');
            var leaderType = idArray[0];
            var userType = idArray[1];
            var areaArray = $("#area1").val().split(',');
            var idArea = areaArray[0];
            var codeArea = areaArray[1];

            var areaID = userType == 5 ? $("#zone1").val() : userType == 8 ? 0 : idArea;

            $.ajax({
                url: "LoadLeader/",
                type: "POST",
                dataType: "json",
                data: { AreaID: areaID, Popedom: leaderType },
                success: leaderSuccessed
            });
        }

        function leaderSuccessed(result) {
            $("#leader1").empty();
            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0] + ',' + item.cell[2]).text(item.cell[1]).appendTo($("#leader1"));
                });
            }

            $("#divIframe").dialog("close");
        }

        function loadUsers() {

            $("#displayInfo").show();
            $("#msg").text("信息加载中,请稍候!");
            $("#divIframe").dialog("open");
            
            var areaArray = $("#area1").val().split(',');
            var areaID = areaArray[0];
            var areaCode = areaArray[1];

            var idArray = $("#popedom1").val().split(',');
            var leaderType = idArray[0];
            var userType = idArray[1];

            if (leaderType == 3) {
                $.ajax({
                    url: "LoadSupervisor/",
                    type: "POST",
                    dataType: "json",
                    data: { AreaID: areaID == 0 ? 1 : areaID, PlaceID: userType },
                    success: usersSuccessed
                });
            } else {
                $.ajax({
                    url: "LoadUsers/",
                    type: "POST",
                    dataType: "json",
                    data: { AreaID: areaID == 0 ? 1 : areaID, PlaceID: userType },
                    success: usersSuccessed
                });
            }
        }

        function usersSuccessed(result) {
            $("#users1").empty();
            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#users1"));
                });
            }

            $("#divIframe").dialog("close");
        }

        function submitUserInfo() {
            var idArray = $("#popedom1").val().split(',');
            var leaderType = idArray[0];
            var userType = idArray[1];

            var areaArray = $("#area1").val().split(',');
            var areaID = areaArray[0];
            var areaCode = areaArray[1];

            var leaderArray = $("#leader1").val().split(',');
            var leaderID = leaderArray[0];
            var leaderAccount = leaderArray[1];


            var userID = $("#users1").val();
            var username = $('#users1 option:selected').text();

            leaderAccount = userType == 5 ? areaCode : leaderAccount;

            $.ajax(
             {
                 url: "AccountAdd/",
                 type: "POST",
                 dataType: "json",
                 data: { LeaderID: leaderID, LeaderAccount: leaderAccount, UserID: userID, UserName: username, AreaID: areaID, PopedomID: userType },
                 success: addUsersSuccessed
             });
        }

        function addUsersSuccessed(result) {
            if (result.isSuccessed == 0) {
                alert("上级用户不存在");
            } else if (result.isSuccessed == 1) {
                $("#uaccount").html(result.Accounts);
                $("#password").html(result.Password);
            } else if (result.isSuccessed == 2) {
                alert("该用户已经拥有帐号!");
                $("#uaccount").html(result.Accounts);
                $("#password").html(result.Password);
            } else if (result.isSuccessed == 3) {
                alert("上级用户人员编制已满!");
            }
              else if (result.isSuccessed == 4) {
                  alert("没有数据!");
              }
              else if (result.isSuccessed ==5) {
                  alert("太多行!");
              }
             else if (result.isSuccessed ==6) {
                  alert("索引冲突!");
              }
             else if (result.isSuccessed == 7) {
                  alert("添加失败!");
              }
        }


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
