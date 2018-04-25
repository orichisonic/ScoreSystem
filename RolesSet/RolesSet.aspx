<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    模块及权限分配</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
    <%
        TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span>
    <div id="tabs" style=" text-align:left">
        <ul>
            <li><a href="#tabs-1">角色分配</a></li>
        </ul>
        <div id="tabs-1">
        <div style=" ">
                    <fieldset >
                     <legend>选择角色</legend>
                     <input id="anjibie" type=checkbox value="1" checked=checked style="display:none" /><span>按级别选择:</span>              
                      <select id="Select1" style="width:150px" onchange="loaddata()">
                        <option class="roles" value="2">总部帐号</option>
                        <option class="roles" value="3">督察经理</option>
                        <option class="roles" value="4">大区经理</option>
                        <option class="roles" value="5">办事处经理</option>
                        <option class="roles" value="6">网吧主管</option>
                        <option class="roles" value="7">推广专员</option>
                        <option class="roles" value="8">督察专员</option>
                        <option class="roles" value="9">线推人员</option>
                        <option class="roles" value="10">兼职推广员</option>
                        <option class="roles" value="1">人事系统监察帐号</option>
                    </select><br />
                 <%--   <input id="anzhanghao" type=checkbox /><span style="margin-right:0px; display:none">按帐号选择:</span>     --%>                   <select name="name1" id="name1" style="display:none">
<%--                            <%
                                
                                List<TGProject.Models.TGSCHANGEPASSQUERY> userList4 = (List<TGProject.Models.TGSCHANGEPASSQUERY>)ViewData["TGSallusers"];
                                foreach (TGProject.Models.TGSCHANGEPASSQUERY user in userList4)
                                {
                                    //string values = user.USERID + "," + user.PLACEID + "," + user.AREAPOS + "," + user.WTYPE;
                                    string values = user.UKEY.ToString();
                            %>
                            <option value="<%=values %>">
                                <%= user.USERNAME %></option>
                            <%} %>--%>
                        </select>
  
            </fieldset>
            <fieldset style="width:300px">
              <legend>权限列表</legend><ur>    
            <% List<TGProject.Models.newallRolesReturn> allzoneList = (List<TGProject.Models.newallRolesReturn>)ViewData["allmodels"];
                 List<TGProject.Models.newspecialRolesReturn> zoneListnow = (List<TGProject.Models.newspecialRolesReturn>)ViewData["models"];
                 foreach (TGProject.Models.newallRolesReturn zone in allzoneList)
                 {
                if(zone.MTYPE==2||zone.MTYPE==4||zone.MTYPE==6)
                {
                      %>
              
               <li style="color:Blue"  class="allroles"><span class="checklist" style="display:none"><%=zone.CHECKED %></span><span class="zoneidlist" style="display:none"><%=zone.MID%></span><input class="allcheckbox" type="checkbox"  /><%=zone.MNAME%></li><br />
               
               
                        
                         <%}}%></ur>
            </fieldset>
                        <fieldset style="width:300px; vertical-align:top" id="append">
                         <legend>已有权限</legend>    
                                   <%
                                       foreach (TGProject.Models.newspecialRolesReturn zone in zoneListnow)
                                       {
                                           
                                           if (zone.MTYPE == 2 || zone.MTYPE == 4 || zone.MTYPE == 6)
                                           {
                                               
                                               //if(zone.POPDOM.IndexOf("2")>=0)
                                               // {
                    %>
                    <ur>
               <li class="haveroles"><span style="display:none"><%=zone.MAID%></span><%=zone.MNAME%></li><br />
               </ur>
                          <%}
                                       }// }%>
            </fieldset>
            </div>
            <p style="text-align: center">
                <button id="tab1-button" class="fg-button ui-state-default ui-corner-left" type="button"
                    onclick="savedata()">
                    提交</button>
            </p>
        </div>
    </div>

    <script type="text/javascript">
        var username = 0;
        var useracount = 0;
        var userpwd = 0;
        $('#tabs').tabs();
        ////通过读取url，查看上一次选择的模块信息
        function checkselect() {
            var href = location.href;
            ////////////////////
            var lastindex = href.lastIndexOf("/");
           // alert(lastindex);
           // lastindex = BASE64.decode(lastindex[lastindex.length - 1]);
            var templastindex = href.substring(lastindex + 1, href.length);
           // var douhaoindex = templastindex.indexOf(",");
            // var selectedvalue = templastindex.substring(0, douhaoindex);
            templastindex = BASE64.decode(templastindex);
            for (var i = 0; i < $('.roles').length; i++) {
            if($('.roles').eq(i).attr('value')==templastindex) {
                $('#Select1')[0].selectedIndex = i;
            }
            }
            
            
            ////////////////////
        }
        /////选择下拉列表框加载模块数据
        function loaddata() {
            var str;
            var pop = $('#Select1').val();
            var parm64x = BASE64.encode(pop);
            //alert(pop);
            str = "http://" + location.host + "/RolesSet.aspx/RolesSet/" + parm64x;
            location.replace(str);
        }
        /////检查是否已有对应的角色模块
        function checkishave() {
            //alert($(".allcheckbox").eq(1).attr('checked'));
            //alert($(".allcheckbox").length);
            var sum = $(".allcheckbox").length;
            for (var i = 0; i < sum; i++) {
                //if($(".haveroles:contains")
                //alert($(".checklist").eq(i).html());
                if ($(".checklist").eq(i).html() == "1") {
                    $(".allcheckbox").eq(i).attr('checked', 'true');
                }
            }
        }
        ////////////提交请求
        function savedata() {
            $('#tab1-button').attr('disabled', 'false');
            var datalist = $('#Select1').val()+",";
            var sum = $(".allcheckbox").length;
            for (var i = 0; i < sum; i++) {
                //if($(".haveroles:contains")
                //alert($(".checklist").eq(i).html());
                if ($(".allcheckbox").eq(i).attr('checked')) {
                    datalist += $(".zoneidlist").eq(i).html() + ",";
                   // alert($(".zoneidlist").eq(i).html());
                }
            }
            //alert(datalist);
            //return;
            var url = "http://" + location.host + "/RolesSet.aspx/UpdateRoles/";
            var parm641 = BASE64.encode(datalist);
            $.ajax({
            url: url + parm641,
                type: "POST",
                dataType: "json",
                success: Successed
            });
            //alert(datalist);
        }
        function Successed(result) {
            // alert(result.result);
            $('#tab1-button').attr('disabled', false);
            alert("操作成功！");
            loaddata();
        }
        $(document).ready(function() {
            checkselect();
            checkishave();
            $('.allroles').bind('mouseover', function() {
                //alert("选择");
                $(this).css("color", "red");
            });
            $('.allroles').bind('mouseout', function() {
                //alert("选择");
                $(this).css("color", "blue");
            });
            $('.allroles').bind('click', function() {
                // $('#append').after("<span >生成账号</span><br />");
            });
            $('#anjibie').bind('click', function() {
                $('#anzhanghao').attr('checked',false);
            });
            $('#anzhanghao').bind('click', function() {
                $('#anjibie').attr('checked', false);
            });

            $("#zone").hide();
            $('#area').hide();
            $("#zone").change(function() { loadArea() });
            //$("#area").change(function() { () });
            $("#name1").change(function() { loaduserinfor() });
            $('#power').hide();
            $('#firstpassword').bind('blur', function() {
                $('#passfilter').html("");
                var regx = "^[\\x00-\\xFF]+$";
                var regs = "/^[A-Z]$/g";
                var psd = $('#firstpassword').val();
                //alert(psd.search(regx));
                if (psd == "") {
                    // alert("不能为空！");
                    $('#passfilter').html("不能为空！");
                    $('#firstpassword').val('');

                    return;
                }
                if (psd.search(regx) < 0) {
                    // alert("含有非法字符！");
                    $('#passfilter').html("含有非法字符！");
                    $('#firstpassword').val('');
                    return;
                }
                if (psd.length != 8) {
                    // alert("你输入的不是8位密码！");
                    $('#passfilter').html("你输入的不是8位密码！");
                    $('#firstpassword').val('');
                    return;
                }
                var rs;
                rs = psd.match(regs);
                //alert(rs);
                //alert(/^[\dA-Z]+$/.test(psd));
                if (psd.indexOf("A") < 0 && psd.indexOf("B") < 0 && psd.indexOf("C") < 0 && psd.indexOf("D") < 0 && psd.indexOf("E") < 0 && psd.indexOf("F") < 0 && psd.indexOf("G") < 0 && psd.indexOf("H") < 0 && psd.indexOf("I") < 0 && psd.indexOf("J") < 0 && psd.indexOf("K") < 0 && psd.indexOf("L") < 0 && psd.indexOf("M") < 0 && psd.indexOf("N") < 0 && psd.indexOf("O") < 0 && psd.indexOf("P") < 0 && psd.indexOf("Q") < 0 && psd.indexOf("R") < 0 && psd.indexOf("S") < 0 && psd.indexOf("T") < 0 && psd.indexOf("U") < 0 && psd.indexOf("V") < 0 && psd.indexOf("W") < 0 && psd.indexOf("X") < 0 && psd.indexOf("Y") < 0 && psd.indexOf("Z") < 0) {
                    //  alert("请包含大写字母！");
                    $('#passfilter').html("请包含大写字母！");
                    $('#firstpassword').val('');
                    return;
                }
                if (psd.indexOf("0") < 0 && psd.indexOf("1") < 0 && psd.indexOf("2") < 0 && psd.indexOf("3") < 0 && psd.indexOf("4") < 0 && psd.indexOf("5") < 0 && psd.indexOf("6") < 0 && psd.indexOf("7") < 0 && psd.indexOf("8") < 0 && psd.indexOf("9") < 0) {
                    // alert("请包含数字！");
                    $('#passfilter').html("请包含数字！");
                    $('#firstpassword').val('');
                    return;
                }
                //alert(psd.match(/[a-z]/ig).length);
                //  alert([ABCDEFGHIGKLMNOPQISTUVWSYZ].test(psd));   
                //                if (rs == null) {
                //                    alert("请包含大写字母！");
                //                    return;
                //                }
            });
            $('#secondpassword').bind('blur', function() {
                $('#passfilter2').html("");
                var regx = "^[\\x00-\\xFF]+$";
                var regs = "/^[A-Z]$/g";
                var psd = $('#secondpassword').val();
                //alert(psd.search(regx));
                if (psd == "") {
                    // alert("不能为空！");
                    $('#passfilter12').html("不能为空！");
                    $('#secondpassword').val('');

                    return;
                }
                if (psd.search(regx) < 0) {
                    // alert("含有非法字符！");
                    $('#passfilter2').html("含有非法字符！");
                    $('#secondpassword').val('');
                    return;
                }
                if (psd.length != 8) {
                    // alert("你输入的不是8位密码！");
                    $('#passfilter2').html("你输入的不是8位密码！");
                    $('#secondpassword').val('');
                    return;
                }
                var rs;
                rs = psd.match(regs);
                //alert(rs);
                //alert(/^[\dA-Z]+$/.test(psd));
                if (psd.indexOf("A") < 0 && psd.indexOf("B") < 0 && psd.indexOf("C") < 0 && psd.indexOf("D") < 0 && psd.indexOf("E") < 0 && psd.indexOf("F") < 0 && psd.indexOf("G") < 0 && psd.indexOf("H") < 0 && psd.indexOf("I") < 0 && psd.indexOf("J") < 0 && psd.indexOf("K") < 0 && psd.indexOf("L") < 0 && psd.indexOf("M") < 0 && psd.indexOf("N") < 0 && psd.indexOf("O") < 0 && psd.indexOf("P") < 0 && psd.indexOf("Q") < 0 && psd.indexOf("R") < 0 && psd.indexOf("S") < 0 && psd.indexOf("T") < 0 && psd.indexOf("U") < 0 && psd.indexOf("V") < 0 && psd.indexOf("W") < 0 && psd.indexOf("X") < 0 && psd.indexOf("Y") < 0 && psd.indexOf("Z") < 0) {
                    //  alert("请包含大写字母！");
                    $('#passfilter2').html("请包含大写字母！");
                    $('#secondpassword').val('');
                    return;
                }
                if (psd.indexOf("0") < 0 && psd.indexOf("1") < 0 && psd.indexOf("2") < 0 && psd.indexOf("3") < 0 && psd.indexOf("4") < 0 && psd.indexOf("5") < 0 && psd.indexOf("6") < 0 && psd.indexOf("7") < 0 && psd.indexOf("8") < 0 && psd.indexOf("9") < 0) {
                    // alert("请包含数字！");
                    $('#passfilter2').html("请包含数字！");
                    $('#secondpassword').val('');
                    return;
                }
                if ($('#secondpassword').val() != $('#firstpassword').val()) {
                    $('#passfilter2').html("两次输入的密码不同");
                    $('#secondpassword').val('');
                }
                //alert(psd.match(/[a-z]/ig).length);
                //  alert([ABCDEFGHIGKLMNOPQISTUVWSYZ].test(psd));   
                //                if (rs == null) {
                //                    alert("请包含大写字母！");
                //                    return;
                //                }
            });

        });
        loaduserinfor();
    function loadArea() {
        $.ajax({
            url: "LoadArea/" + $("#zone").val(),
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
    }
    function loadAreaId() {
        var id = 0;
        id = $('#myareaid').html();
        //alert(id);
        $.ajax({
            url: "LoadArea/" + id,
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
    }
    function loaduserinfor() {
        var id = 0;
        id = $('#name1').val();
        //alert(id);
        $.ajax({
        url: "loaduserinfor/" + id,
            type: "POST",
            dataType: "json",
            success: inforSuccessed
        });
    }
    function inforSuccessed(result) {
        if (result.rows.length == 1) {
            $.each(result.rows, function(i, item) {
                //alert(item.cell[0]);
                // alert(item.cell[1]);
                useraccount = item.cell[0];
               // userpwd = item.cell[1];
                username = item.cell[2];
                $('#yuangongname').html(username);
                $('#yuangongaccount').html(useraccount);
            });
        }
    }
    function changeuserinfor() {
        var id = 0;
        id = $('#name1').val();
        var oldpassword = $('#oldpassword').val();
        userpwd = $('#firstpassword').val();
        var secondpwd = $('#secondpassword').val();
        useracount = $('#yuangongaccount').html();
        var secondpassword = $('#secondpassword').val();
       // alert(userpwd);
        // alert(useraccount);
        if (userpwd != 0 && useracount != 0 && userpwd != "" && secondpwd!="") {
            //  alert("test");
            var data = useracount + "," + userpwd+","+oldpassword;
       // alert(data);
        $.ajax({
        url: "changeuserinfor/" + data,
            type: "POST",
            dataType: "json",
            success: changeSuccessed
        });
    }
    }
    function changeSuccessed(result) {
        $('#oldpassword').val('');
        $('#firstpassword').val('');
        $('#secondpassword').val('');
        if (result.rows.length == 1) {
            $.each(result.rows, function(i, item) {
                // alert(item.cell[0]);
                if (item.cell[0] == 1) {
                    alert("修改密码成功，请仔细保存密码");
                    loaduserinfor();
                }
                else if (item.cell[0] == -1) {
                    alert("旧密码输入不正确，请重新输入！");
                }
                else {
                    alert("更改密码失败，请刷新页面尝试重新更改！");
                }
            });
        }
    }
    function loadAreaDaQu() {

        $.ajax({
            url: "LoadArea/" + areaid,
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
        //          if (power == 2) {
        //              $("<option></option>").val('').text('').appendTo($("#zone"));
        //          }

    }
    function areaSuccessed(result) {

        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                //alert($("<option></option>").val(item.cell[0]).text(item.cell[1]));
            });
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

    </form>
</asp:Content>

