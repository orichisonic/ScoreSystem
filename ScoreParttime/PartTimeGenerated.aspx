<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
兼职推广员帐号生成
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="form1">
<fieldset>
    <% Account account = null;
    if (Session["Account"] != null) { account = (Account)Session["Account"]; }%>
    <legend>生成兼职推广员帐号</legend>
    <ul class="verticality">
        <li style="font-size:small; height: 20px; vertical-align:middle;">
            <b>兼职推广员信息（以下信息均为必填）</b>
        </li>
        <li>*久游戏通行证
            <input name="nyoupass" id="nyoupass"/>
            <span>成为久游兼职推广员必须拥有久游通行证</span><br />
            <a href="http://register.9you.com/regist1.jsp" target="_blank">还没有注册久游通行证的请点此注册</a>
        </li>
        <li>*真实姓名 
            <input name="Uname" id="Uname" onpropertychange="with(this)if(/[^\u3447-\uFA29]/ig.test(value))value=value.replace(/[^\u3447-\uFA29]/ig,'')"/>
        </li>
        <li>*性别
            <input type="radio" name="sex" checked="checked" value="0" />男
            <input type="radio" name="sex" value="1" />女
        </li>
        <li>*身份证号  
            <input name="idcard" id="idcard" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
        </li>
         <li>*联系电话
            <input type="text" name="mobile" id="mobile"  onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
         </li>
         
         <li style="font-size:small;height: 36px;vertical-align:middle; height: 21px;">
            <b>推广员信息</b>
        </li>
         <li>*推广员帐号 
            <input name="tgaccount" id="tgaccount"/>
        </li>
        <li>
            <input id="chk" type="checkbox" /><a href="">我所发展的兼职推广员已阅读并同意接受《久游推广员协议》</a>
        </li>
        
    </ul>

</fieldset>
</form>
<p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitUserInfo()">生成账号</button></p>
    
 
    
        <script type="text/javascript" language="javascript">
            $(document).ready(function() {
            // 字符过滤
            jQuery.validator.addMethod("filterChar", function(value, element) {
                var flag = true;
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < charArray.length; i++) {
                    if (value.indexOf(charArray[i]) != -1) { flag = false; break; }
                }
                return this.optional(element) || flag;
            }, "&nbsp;&nbsp;[含有非法字符]");

            jQuery.validator.addMethod("isIdCardNo", function(value, element) {
                return this.optional(element) || /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test(value);
            }, "&nbsp;&nbsp;[请正确输入您的身份证号码!]");

            jQuery.validator.addMethod("userName", function(value, element) {
                return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
            }, "&nbsp;&nbsp;[用户名只能包括中文字、英文字母、数字和下划线!]");
            });



            function submitUserInfo() {

                if ($("#chk").attr("checked") == false) {
                    alert("请确认兼职推广员已阅读并同意接受《久游推广员协议》");
                }
                else {
                    if ($("#form1").valid()) {
                        var userName = $("#Uname").val();
                        var idcard = $("#idcard").val();
                        var nypass = $("#nyoupass").val();
                        var sex = $("input[name*='sex']")[0].checked ? 0 : 1;
                        var tel = $("#mobile").val();
                        var remark = "生成兼职推广员账号";
                        var leaderAccount = $("#tgaccount").val();
                        ////////////////////////////

                        $.ajax(
                     {
                         url: "PartTimeGenerated2/",
                         type: "POST",
                         dataType: "json",
                         data: { LeadAccount: leaderAccount, UserName: userName, IDCard: idcard, NYPass: nypass, Sex: sex, Tel: tel, Remark: remark },
                         success: addUsersSuccessed
                     });
                    }
                }
         }

         $("#form1").validate({
             rules:
             {
                 nyoupass: { required: true, filterChar: true },
                 Uname: { required: true, userName: true, filterChar: true },
                 idcard: { required: true, isIdCardNo: true, filterChar: true },
                 mobile: { required: true, number: true, filterChar: true },
                 tgaccount: { required: true, filterChar: true }
             },
             messages:
            {

                nyoupass: { required: "&nbsp;&nbsp;[久游通行证不能为空!]" },
                Uname: { required: "&nbsp;&nbsp;[真实姓名不能为空!]" },
                idcard: { required: "&nbsp;&nbsp;[身份证号不能为空!]" },
                mobile: { required: "&nbsp;&nbsp;[联系电话不能为空!]", number: "&nbsp;&nbsp;[电话必须是数字!]" },
                tgaccount: { required: "&nbsp;&nbsp;[推广员账号不能为空!]" }
            }
         });

            function addUsersSuccessed(result) {
                if (result.isSuccessed == 0) {
                    alert("上级用户不存在");
                } else if (result.isSuccessed == 1) {
                    //$("#uaccount").html(result.Accounts);
                //$("#password").html(result.Password);
                var parm = result.FromEncode;
                var str = "http://" + location.host + "/ScoreParttime.aspx/PartTimeAddResult/" + parm;
                location.reload(str);
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
                else if (result.isSuccessed == 5) {
                    alert("太多行!");
                }
                else if (result.isSuccessed == 6) {
                    alert("索引冲突!");
                }
                else if (result.isSuccessed == 7) {
                    alert("添加失败!");
                }
                else if (result.isSuccessed == 8) {
                    alert("该推广员帐号不存在!");
                }
            }
            var BASE64 = {
                /**
                * 此变量为编码的key，每个字符的下标相对应于它所代表的编码。
                */
                enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
                /**
                * 此变量为解码的key，是一个数组，BASE64的字符的ASCII值做下标，所对应的就是该字符所代表的编码值。
                */
                deKey: new Array(
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
        -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
        -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1
    ),
                /**
                * 编码
                */
                encode: function(src) {
                    //用一个数组来存放编码后的字符，效率比用字符串相加高很多。
                    var str = new Array();
                    var ch1, ch2, ch3;
                    var pos = 0;
                    //每三个字符进行编码。
                    while (pos + 3 <= src.length) {
                        ch1 = src.charCodeAt(pos++);
                        ch2 = src.charCodeAt(pos++);
                        ch3 = src.charCodeAt(pos++);
                        str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                        str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
                    }
                    //给剩下的字符进行编码。
                    if (pos < src.length) {
                        ch1 = src.charCodeAt(pos++);
                        str.push(this.enKey.charAt(ch1 >> 2));
                        if (pos < src.length) {
                            ch2 = src.charCodeAt(pos);
                            str.push(this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                            str.push(this.enKey.charAt(ch2 << 2 & 0x3f), '=');
                        } else {
                            str.push(this.enKey.charAt(ch1 << 4 & 0x3f), '==');
                        }
                    }
                    //组合各编码后的字符，连成一个字符串。
                    return str.join('');
                },
                /**
                * 解码。
                */
                decode: function(src) {
                    //用一个数组来存放解码后的字符。
                    var str = new Array();
                    var ch1, ch2, ch3, ch4;
                    var pos = 0;
                    //过滤非法字符，并去掉'='。
                    src = src.replace(/[^A-Za-z0-9\+\/]/g, '');
                    //decode the source string in partition of per four characters.
                    while (pos + 4 <= src.length) {
                        ch1 = this.deKey[src.charCodeAt(pos++)];
                        ch2 = this.deKey[src.charCodeAt(pos++)];
                        ch3 = this.deKey[src.charCodeAt(pos++)];
                        ch4 = this.deKey[src.charCodeAt(pos++)];
                        str.push(String.fromCharCode(
                (ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2), (ch3 << 6 & 0xff) + ch4));
                    }
                    //给剩下的字符进行解码。
                    if (pos + 1 < src.length) {
                        ch1 = this.deKey[src.charCodeAt(pos++)];
                        ch2 = this.deKey[src.charCodeAt(pos++)];
                        if (pos < src.length) {
                            ch3 = this.deKey[src.charCodeAt(pos)];
                            str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2)));
                        } else {
                            str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4)));
                        }
                    }
                    //组合各解码后的字符，连成一个字符串。
                    return str.join('');
                }
            };
        </script>
</asp:Content>
