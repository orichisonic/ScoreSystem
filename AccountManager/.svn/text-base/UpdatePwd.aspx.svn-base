<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    密码修改
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>密码修改</legend>
            <form id="form1">
                <ul class="verticality">
                    <li>旧密码<br />
                        <input type="password" name="oldPwd" style="width:225px" id="oldPwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>新密码<br />
                        <input type="password" name="newPwd" style="width:225px" id="newPwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>重复新密码<br />
                        <input type="password" name="retypePwd" style="width:225px" id="retypePwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                </ul>
            </form>
    </fieldset>
    <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitPwd()">修改密码</button></p>
    <script type="text/javascript">
        function submitPwd() {
            var oldPwd = $("#oldPwd").val();
            var newPwd = $("#retypePwd").val();
            
            if ($("#form1").valid()) {
                $.ajax({
                    url: "UpdatePwd/",
                    data: { OldPwd: oldPwd, NewPwd: newPwd },
                    dataType: 'json',
                    type: 'POST',
                    success: updateSuccessed
                });
            }
        }

        function updateSuccessed(result) {
            alert(result.isSuccessed);
            $("input[type*='password']").val("");
        }
        
        // 字符过滤
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break; }
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[含有非法字符]");
        
      $("#form1").validate({
            rules:
             {
                 oldPwd: { required: true, filterChar: true},
                 newPwd: { required: true, minlength: 8, filterChar: true },
                 retypePwd: { required: true, minlength: 8, equalTo: "#newPwd", filterChar: true}
             },
            messages:
            {
                oldPwd: { required: "&nbsp;&nbsp;[旧密码不能为空!]"},
                newPwd: { required: "&nbsp;&nbsp;[新密码不能为空!]", 
                                minlength: "&nbsp;&nbsp;[密码长度必须大于8位!]" },
                retypePwd: { required: "&nbsp;&nbsp;[重复新密码不能为空!]",
                                minlength: "&nbsp;&nbsp;[密码长度必须大于8位!]",
                                equalTo: "&nbsp;&nbsp;[两次输入的密码不一致!]"}
            }
        });
    </script>
</asp:Content>
