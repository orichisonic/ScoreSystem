<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    用户登陆
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divIframe" title="用户登陆" style="text-align: center;">
        <form id="form1">
        <br />
        <p><strong>用户名:<%= Html.TextBox("username") %></strong></p>
        <span><strong>密&nbsp;&nbsp;&nbsp;&nbsp;码:</strong><%= Html.Password("password") %></span><br />
        <span id = "loginShow"><img src="../../Content/images/login.gif" /></span><br />
        <span id="msg" style="color: Red"></span>
        </form>
    </div>
    <style type="text/css" media="screen" >
        .removeCloseBtn .ui-dialog-titlebar-close
        {
            display: none;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginShow").hide();
        });

        // 字符过滤
        jQuery.validator.addMethod("filterChar", function(value, element) {
            var flag = true;
            var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
            for (var i = 0; i < charArray.length; i++) {
                if (value.indexOf(charArray[i]) != -1) { flag = false; break; }
            }
            return this.optional(element) || flag;
        }, "&nbsp;&nbsp;[含有非法字符]");
        
        
        function logOn() {
            if ($("#form1").valid()) {
                var uName = $("#username").val();
                var pwd = $("#password").val();
                $("#loginShow").show();
                $.ajax({
                    type: "POST",
                    url: "LogOn/",
                    data: { username: uName, password: pwd },
                    dataType: "json",
                    success: function(result) {
                        if (result.isSuccessed == 1 || result.isSuccessed == 4 || result.isSuccessed == 5) {
                            $("#msg").html("");
                            $("#loginShow").hide();
                            $("#divIframe").dialog("close");
                            location.href = '/Home.aspx/Index';
                        }
                        else {
                            $("#loginShow").hide();
                            if (result.isSuccessed == 0) {
                                $("#msg").html("该帐号不存在!");
                            } else if (result.isSuccessed == 2) {
                                $("#msg").html("该帐号密码错误!");
                            } else if (result.isSuccessed == 3) {
                                $("#msg").html("该帐号已被锁定!");
                            }
                        }
                    }
                });
            }
        }

        $(function() {
            $("#divIframe").dialog({
                height: 230,
                width: 370,
                minHeight: 230,
                minWidth: 370,
                show: 'drop',
                bgiframe: false,
                autoOpen: true,
                draggable: true,
                resizable: true,
                modal: true,
                dialogClass: "removeCloseBtn",
                closeOnEscape: false,
                buttons: {
                    "登陆": function() {
                        logOn();
                    }
                }
            });
        });



        $("#form1").validate({
            rules:
             {
                 username: { required: true, filterChar: true },
                 password: { required: true }
             },
            messages:
            {
                username: { required: "非空!" },
                password: { required: "非空!" }
            }
        });
    </script>

</asp:Content>
