<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    �����޸�
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>�����޸�</legend>
            <form id="form1">
                <ul class="verticality">
                    <li>������<br />
                        <input type="password" name="oldPwd" style="width:225px" id="oldPwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>������<br />
                        <input type="password" name="newPwd" style="width:225px" id="newPwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>�ظ�������<br />
                        <input type="password" name="retypePwd" style="width:225px" id="retypePwd" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                </ul>
            </form>
    </fieldset>
    <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitPwd()">�޸�����</button></p>
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
        
        // �ַ�����
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break; }
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[���зǷ��ַ�]");
        
      $("#form1").validate({
            rules:
             {
                 oldPwd: { required: true, filterChar: true},
                 newPwd: { required: true, minlength: 8, filterChar: true },
                 retypePwd: { required: true, minlength: 8, equalTo: "#newPwd", filterChar: true}
             },
            messages:
            {
                oldPwd: { required: "&nbsp;&nbsp;[�����벻��Ϊ��!]"},
                newPwd: { required: "&nbsp;&nbsp;[�����벻��Ϊ��!]", 
                                minlength: "&nbsp;&nbsp;[���볤�ȱ������8λ!]" },
                retypePwd: { required: "&nbsp;&nbsp;[�ظ������벻��Ϊ��!]",
                                minlength: "&nbsp;&nbsp;[���볤�ȱ������8λ!]",
                                equalTo: "&nbsp;&nbsp;[������������벻һ��!]"}
            }
        });
    </script>
</asp:Content>
