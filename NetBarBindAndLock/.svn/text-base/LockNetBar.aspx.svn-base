<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	锁定网吧
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">锁定日期:<%=DateTime.Now.ToLongDateString() %></p>
<fieldset>
    <legend>人员信息</legend>
    <div style="text-align:center">
        <ul class="horizontal">
            <li>推广人员姓名
                <select name="user" id="user">
                            <option value="0,0">请选择</option>
                            <%List<AccountResult> usersList = (List<AccountResult>)ViewData["Users"];
                                if (usersList != null)
                                foreach (AccountResult user in usersList){ %>
                            <option value="<%=user.UKEY.ToString() + "," + user.UACCOUNT%>"><%=user.USERNAME %></option>
                            <%}%>
                </select>
            </li>
            <%NetBarLockAndBind netbarInfo = (NetBarLockAndBind)ViewData["NetBarInfo"];
                AccountResult account = (AccountResult)ViewData["UserInfo"];
                if (netbarInfo != null && account != null) { %>
                <li>
                   账号: <span id="account"><%=account.UACCOUNT %></span>
                </li>
                <li>
                    锁定网吧数量: <span id="lockcount"><%=
                                                     netbarInfo.LOCKNUM%></span>
                </li>
                <li>
                   其中A级: <span id="levelA"><%=netbarInfo.AGRADE%></span>个
                </li>
                <li>
                    其中B级: <span id="levelB"><%=netbarInfo.BGRADE%></span>个
                </li>
            <%} %>
        </ul>
    </div>
    </fieldset>
    <br />
    <fieldset>
        <legend>网吧锁定</legend> 
            <div style="text-align:center">
            <table style="text-align:center; width:80%;">
                <tr>
                    <td>网吧名称</td>
                    <td>城市</td>
                    <td>区/县</td>
                    <td>网吧编号</td>
                    <td>锁定</td>
                </tr>
                 <%List<TGSNetBarQueryStr> netbarList = (List<TGSNetBarQueryStr>)ViewData["NetBars"];
                   if (netbarList != null)
                       foreach (TGSNetBarQueryStr netbar in netbarList)
                       {%>
                <tr>
                    <td><%=netbar.BARNAME %></td>
                    <td><%=netbar.CITY %></td>
                    <td><%=netbar.COUNTY %></td>
                    <td><%=netbar.NETBARID %></td>
                    <td><input type="checkbox" id="<%=netbar.NETBARID %>" /></td>
                </tr>
                
               <%} %>
                <tr>
                    <td colspan="10" style="text-align:left">备注<br /><input type="text" id="remark" style="width:98%; height:35px;" maxlength="500"/></td>
                </tr>
            </table>
            </div>
    </fieldset>

 <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">锁定</button></p>

<script language="javascript" type="text/javascript">
    var idStr = "";
    $(document).ready(function() {
 
        $("#user").change(function() { loadUserInfo(); });
        arrestingUser();
    });

    function loadUserInfo() {
        
        var str = "http://" + location.host + "/NetBarBindAndLock.aspx/LoadLockUserInfo/" + $("#user").val();
        location.replace(str);
       
    }

    function arrestingUser() {
        var account = $("#account").html();
        var users = $("#user");
        $.each(users, function(index, items) {
            $.each(items, function(index, item) {
                if (item.value.indexOf(account) != -1) {
                    document.getElementById("user").options[index].selected = true;
                }
            });
        });
    }

    function submitInfo() {
        idStr = "";
        var netbars = $("input[type *= 'checkbox']")
        $.each(netbars, function(index, item) {
            if (item.checked == true) {
                idStr += item.id + ','
            }
        });

        if (idStr.length < 1) {
            alert("请选择锁定的网吧后提交!");
            return false;
        }

        var userAccount = $('#account').html();
        if (userAccount == '') {
            alert("请选择锁定的用户后提交!");
            return false;
        }
        
        var account = $("#account").html();
        var remark = $("#remark").val();
        var name = $('#user option:selected').text();

        $.ajax({
            url: "../LockNetBar/",
            type: "POST",
            dataType: "json",
            data: { NetBarID: idStr, Account: account, Name: name, Remark: remark },
            success: lockSuccessed
        });
    }

    function lockSuccessed(result) {
        if (result.isSuccessed == 1) {
            alert("锁定成功!");
        }
        else if (result.isSuccessed == 2) {
            alert("锁定失败, 锁定网吧不存在");
        } else if (result.isSuccessed == 3) {
            alert("该网吧已经被绑定或锁定，解除之后才可已重新分配");
        }
        history.go(0);
    }
</script>
</asp:Content>
