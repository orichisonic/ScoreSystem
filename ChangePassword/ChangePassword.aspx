<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    人员管理</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
    <%
        TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span>
    <div id="tabs" style=" text-align:left">
        <ul>
            <li><a href="#tabs-1">更改密码</a></li>
        </ul>
        <div id="tabs-1">
            <fieldset >
                <legend>更改密码</legend>
                <ul class="verticality">
                                <li id="zoneHide1" style="display:none">大区<br />
                    <select name="zone" id="zone">
                    <%if (account.POPEDOMID == 1 || account.POPEDOMID == 2)
                      {
                          List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <% } } else { %>
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                    <%} %>
                </select></li>
                <li id="areaname"  style="display:none">办事处<br />
                    <select id="area">
  
                        <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                        
                    </select>
                </li>
                    <li>员工姓名<br />
                        <select name="name1" id="name1">
                            <%
                                
                                List<TGProject.Models.TGSCHANGEPASSQUERY> userList4 = (List<TGProject.Models.TGSCHANGEPASSQUERY>)ViewData["TGSCHANGEPASSQUERY"];
                                foreach (TGProject.Models.TGSCHANGEPASSQUERY user in userList4)
                                {
                                    //string values = user.USERID + "," + user.PLACEID + "," + user.AREAPOS + "," + user.WTYPE;
                                    string values = user.UKEY.ToString();
                            %>
                            <option value="<%=values %>">
                                <%= user.USERNAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>确认员工信息<br />
                    <span >员工姓名:</span><span id="yuangongname"></span><span style="padding-left:50px">员工账号:</span><span id="yuangongaccount"></span></li>
                     <li>请输入8位旧密码<br />
                     <input id="oldpassword" type="password" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                     </li>
                    <li>请输入8位新密码(一定要包含数字和大写字母)<br />
                    <input id="firstpassword" type="password" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/><span id="passfilter"></span></li>
                    <li>请再输入一次<br />
                    <input id="secondpassword" type="password" onkeyup="value=value.replace(/[\W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/><span id="passfilter2"></span></li>
                </ul>
            </fieldset>
            <p style="text-align: center">
                <button id="tab1-button" class="fg-button ui-state-default ui-corner-left" type="button"
                    onclick="changeuserinfor()">
                    提交</button>
            </p>
        </div>
    </div>

    <script type="text/javascript">
        var username = 0;
        var useracount = 0;
        var userpwd = 0;
        $('#tabs').tabs();
        $(document).ready(function() {
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
       var parm64 = BASE64.encode(data);
        $.ajax({
        url: "changeuserinfor/" + parm64,
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
                    alert("修改密码成功，修改后的密码为："+item.cell[01]+"   请仔细保存密码");
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
//        $(document).ready(function() {

//            $("input[type*='text']").mouseenter(function() { txtenter(this) });
//            $("input[type*='text']").mouseout(function() { txtout(this) });

//        //选择底薪申请的员工姓名
//        function loadUserInfo1() {
//            $("#rarUpload").attr("disabled", true); //设为不可用 
//            if ($("#name1").val() == null) {
//            }
//            else {
//                var strArray = $("#name1").val().split(",");
//                var userID = strArray[0];
//                var placeID = strArray[1];
//                var areaid = strArray[2];
//                var wType = strArray[3];
//            

//                if (wType == "1") {
//                    $("#tab1-wage").show();
//                    $("#tab1-wagetxt").show();
//                    $("#remark3").show();
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: wage2Successed
//                    });
//                }
//                else if (wType == "2") {
//                    $("#tab1-wagetxt").hide();
//                    $("#tab1-wage").show();
//                    $("#remark3").hide();
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: wage2Successed
//                    });

//                }
//                else {
//                    $("#wage").hide();
//                    $("#tab1-wagetxt").show();
//                    $("#tab1-wagetxt").empty();
//                    $("#remark3").hide();



//                    $("#Postswage1").show();
//                    Postsmin = 0;
//                    Postsmax = 999999;
//                    NoPosts = 1;
////                    if ($("#name1").val() == null)
////                    { }
////                    else {
////                        var strArray = $("#name1").val().split(",");
////                        var userID2 = strArray[0];

////                        $.ajax({
////                            url: "LoadUserDetail/" + userID2,
////                            type: "POST",
////                            dataType: "json",
////                            success: userSuccessed
////                        });
//                    //                    }
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: wage2Successed
//                    });
//                }
//            }

//        }

//        function wage2Successed(result) {

//            
//            $("#wage").empty();
//            //////////////////////////////////////
//            $("Postswage1").empty();
//            //////////////////////////////////////
//            if (result.rows.length > 0) {
//                $.each(result, function(i, items) {
//                    $.each(items, function(j, item) {
//                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#wage"));
//                        ////////////////////////////////////////////

//                        //                        $("<option></option>").val(item.cell[2]).text(item.cell[2]).appendTo($("#Postswage"));

//                        if (item.cell[5] == 0) {
//                            $("#Postswage1").hide();
//                           
//                            NoPosts = 1;
//                        }
//                        else {
//                            $("#Postswage1").show();
//                          
//                         
//                            Postsmin = item.cell[4];
//                            Postsmax = item.cell[5];
//                            NoPosts = 0;
//                        }


//                        ////////////////////////////////////////////
//                    });
//                });
//                //                    maxWage = maxWage > item[0].cell[1] ? item[0].cell[1] : maxWage;

//            }

//            if ($("#name1").val() == null)
//            { }
//            else {
//                var strArray = $("#name1").val().split(",");
//                var userID2 = strArray[0];

//                $.ajax({
//                    url: "LoadUserDetail/" + userID2,
//                    type: "POST",
//                    dataType: "json",
//                    success: userSuccessed
//                });
//            }
//        }

//        function userSuccessed(result) {


//            $("#tab1-account").html(result.uaccount);

//            //            $("#tab2-salary").attr("value", "1");
//        }

//        //选择入编申请的员工姓名
//        function loadUserInfo2() {
//            $("#bzlist").val("益元堂");
//            $("#rarUpload").attr("disabled", false); //设为不可用 
//            if ($("#name2").val() == null)
//            { }
//            else {
//                
//                var strArray = $("#name2").val().split(",");
//                var userID = strArray[0];
//                var placeID = strArray[1];
//                var areaid = strArray[2];
//                var wType = strArray[3];

//                if (wType == "1") {
//                    $("#tab2-salary").show();
//                    $("#wagetbx2").show();
//                    $("#remark1").show();
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: loadUserInfo2Successed
//                    });
//                }
//                else if (wType == "2") {
//                    $("#wagetbx2").hide();
//                    $("#tab2-salary").show();
//                    $("#remark1").hide();
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: loadUserInfo2Successed
//                    });

//                }
//                else {
//                    $("#tab2-salary").hide();
//                    $("#wagetbx2").show();
//                    $("#wagetbx2").empty();
//                    $("#remark1").hide();
//                   
////                    if ($("#name2").val() == null)
////                    { }
////                    else {
////                        
////                        var strArray = $("#name2").val().split(",");
////                        var userID2 = strArray[0];
////                        
////                        $.ajax({
////                            url: "LoadUserDetail/" + userID2,
////                            type: "POST",
////                            dataType: "json",
////                            success: loadUserInfo10Successed
////                        });
//                    //                    }
//                    $("#Postswage3").show();
//                    Postsmin = 0;
//                    Postsmax = 999999;
//                    NoPosts = 1;
//                    $.ajax({
//                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
//                        type: "POST",
//                        dataType: "json",
//                        success: loadUserInfo2Successed
//                    });
//                }
//            }
//        }

//        function loadUserInfo2Successed(result) {


//         
//            $("#tab2-salary").empty();
//            /////////////////////////////////////////////
//            $("#wagetPostsbx2").empty();
//            /////////////////////////////////////////////
//            if (result.rows.length > 0) {
//                $.each(result, function(i, items) {
//                    $.each(items, function(j, item) {
//                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#tab2-salary"));
//                        //////////////////////////////////////
//                       
//                        if (item.cell[5] == 0) {
//                            $("#Postswage3").hide();

//                            NoPosts = 1;
//                        }
//                        else {
//                            $("#Postswage3").show();


//                            Postsmin = item.cell[4];
//                            Postsmax = item.cell[5];
//                            NoPosts = 0;
//                        }
//                        //////////////////////////////////////   

//                    });
//                });
//            }
//            
//            if ($("#name2").val() == null)
//            { }
//            else {
//                var strArray = $("#name2").val().split(",");
//                var userID2 = strArray[0];

//                $.ajax({
//                    url: "LoadUserDetail/" + userID2,
//                    type: "POST",
//                    dataType: "json",
//                    success: loadUserInfo10Successed
//                });
//            }
//        }

//        function loadUserInfo10Successed(result) {


//            $("#tab2-account").html(result.uaccount);

//            //            $("#tab2-salary").attr("value", "1");
//        }
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

