<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	��������
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">��������:<%=DateTime.Now.ToLongDateString() %></p>
<fieldset>
    <legend>��Ա��Ϣ</legend>
    <div style="text-align:center">
        <ul class="horizontal">
            <li>�ƹ���Ա����
                <select name="user" id="user">
                            <option value="0,0">��ѡ��</option>
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
                   �˺�: <span id="account"><%=account.UACCOUNT %></span>
                </li>
                <li>
                    ������������: <span id="lockcount"><%=
                                                     netbarInfo.LOCKNUM%></span>
                </li>
                <li>
                   ����A��: <span id="levelA"><%=netbarInfo.AGRADE%></span>��
                </li>
                <li>
                    ����B��: <span id="levelB"><%=netbarInfo.BGRADE%></span>��
                </li>
            <%} %>
        </ul>
    </div>
    </fieldset>
    <br />
    <fieldset>
        <legend>��������</legend> 
            <div style="text-align:center">
            <table style="text-align:center; width:80%;">
                <tr>
                    <td>��������</td>
                    <td>����</td>
                    <td>��/��</td>
                    <td>���ɱ��</td>
                    <td>����</td>
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
                    <td colspan="10" style="text-align:left">��ע<br /><input type="text" id="remark" style="width:98%; height:35px;" maxlength="500"/></td>
                </tr>
            </table>
            </div>
    </fieldset>

 <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">����</button></p>

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
            alert("��ѡ�����������ɺ��ύ!");
            return false;
        }

        var userAccount = $('#account').html();
        if (userAccount == '') {
            alert("��ѡ���������û����ύ!");
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
            alert("�����ɹ�!");
        }
        else if (result.isSuccessed == 2) {
            alert("����ʧ��, �������ɲ�����");
        } else if (result.isSuccessed == 3) {
            alert("�������Ѿ����󶨻����������֮��ſ������·���");
        }
        history.go(0);
    }
</script>
</asp:Content>
