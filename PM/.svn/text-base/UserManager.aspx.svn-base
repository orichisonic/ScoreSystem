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
            <li><a href="#tabs-1">底薪申请</a></li>
            <li><a href="#tabs-2">入编申请</a></li>
            <li><a href="#tabs-3">职位调整</a></li>
            <li><a href="#tabs-4">离职登记</a></li>
        </ul>
        <div id="tabs-1">
            <fieldset >
                <legend>底薪申请</legend>
                <ul class="verticality">
                    <li>员工姓名<br />
                        <select name="name1" id="name1">
                            <%
                                
                                List<TGProject.Models.TGSUSERQUERYALL> userList4 = (List<TGProject.Models.TGSUSERQUERYALL>)ViewData["UsersByApplicant"];
                                foreach (TGProject.Models.TGSUSERQUERYALL user in userList4)
                                {
                                    //string values = user.USERID + "," + user.PLACEID + "," + user.AREAPOS + "," + user.WTYPE;
                                    string values = user.USERID + "," + user.PLACEID + "," + account.AREAID + "," + user.WTYPE + "," + account.POPEDOMID + "," + account.POPEDOMNAME;
                            %>
                            <option value="<%=values %>">
                                <%= user.USERNAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>员工账号<br />
                        <span id="tab1-account"></span></li>
                    <!--<li>前30天业绩: <span style="font-size: 13px;" id="tab1-score">1234567</span>&nbsp;/&nbsp; 是否留用:
                        <input type="radio" name="tab1-reserve" checked="checked" value="1" readonly=readonly/>是<input type="radio" name="tab1-reserve" id="tab1-reserve" value="2" readonly=readonly/>否</li>-->
                    <li>基本工资<br />
                        <%=Html.DropDownList("wage", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>&nbsp;
                        <%=Html.TextBox("tab1-wagetxt") %></li><li id="remark3">请在最大值和最小值薪资中填写中间基本工资</li>
                    <li id="Postswage1">岗位工资<br />
                        <%=Html.TextBox("tab1-Postswagetxt") %></li>
                    <li>备注<br />
                        <%=Html.TextArea("tab1-remark")%></li>
                </ul>
            </fieldset>
            <p style="text-align: center">
                <button id="tab1-button" class="fg-button ui-state-default ui-corner-left" type="button"
                    onclick="tab1submitInfo()">
                    提交</button>
            </p>
        </div>
        <div id="tabs-2">
            <fieldset>
                <legend>入编申请</legend>
                <ul class="verticality" id="tab2-userinfo">
                    <li>员工姓名<br />
                        <select name="name2" id="name2">
                            <%List<TGProject.Models.TGSUSERQUERYALL> userList3 = (List<TGProject.Models.TGSUSERQUERYALL>)ViewData["UsersByApplicant"];
                              foreach (TGProject.Models.TGSUSERQUERYALL user in userList3)
                              {
                                  string values = user.USERID + "," + user.PLACEID + "," + account.AREAID + "," + user.WTYPE + "," + account.POPEDOMID + "," + account.POPEDOMNAME;
                            %>
                            <option value="<%=values %>">
                                <%=user.USERNAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>员工账号<span id="tab2-account"></span></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--前6个月业绩<span style="font-size: 13px;">&nbsp;&nbsp;1000元</span>-->
                    <li>基本工资<br />
                        <%=Html.DropDownList("tab2-salary", new SelectList(new List<SelectListItem>() 
                    { 
                         new SelectListItem() { Text = "请选择", Value = "1"}
                        
                    }, "Value", "Text"))%></li>
                     
                    <li>
                        <input type="text" name="wagetbx2" id="wagetbx2" /></li><li id="remark1">请在最大值和最小值薪资中填写中间基本工资</li>
                        
                     <li id="Postswage3">岗位工资<br />
                     <input type="text" name="wagetPostsbx2" id="wagetPostsbx2" /></li>
                    <li>编制<br />
                        <select name="bzlist" id="bzlist">
                            <%
                                List<TGProject.Models.TGSBZTYPESHOW> bzlist = (List<TGProject.Models.TGSBZTYPESHOW>)ViewData["BZ"];
                                foreach (TGProject.Models.TGSBZTYPESHOW bz in bzlist)
                                {
                                    string values = bz.BZID.ToString();
                            %>
                            <option value="<%=values%>">
                                <%=bz.BZNAME%>
                            </option>
                            <%}%>
                            
                       
                        </select>
                    </li>
                
                    <li>备注<br />
                        <%=Html.TextArea("tab2-remark")%></li>
                    <li>
                        <button id="rarUpload" class="fg-button ui-state-default ui-corner-left">
                            上传入职申请资料</button><span id="rarMsg" style="margin: 10px; color: Black;">文件类型 : [*.RAR
                                | 大小1 - 500k]</span> </li>
                                <% if (account.POPEDOMID == 5){ %>
                    <li>入编申请<input type="radio" name="tab2-pass" value="1" />是<input type="radio" name="tab2-pass"
                        id="tab2-pass" value="2" />否</li>
                        <%}
                                   else{  %>
                           
                   <li><button id="tab4-button" class="fg-button ui-state-default ui-corner-left" type="button"
                        onclick="tab2submitInfo()">
                        提交</button></li>
                <%}  %>
                </ul>
            </fieldset>
            <br />
            <div id="tab2-upgrade">
                <fieldset>
                    <legend>升职调整</legend>
                    <ul class="verticality" id="tab4-account">
                        <li>申请直接升职为高级推广员:
                            <input type="radio" name="tab2-expert" checked="checked" value="1" />是<input type="radio"
                                name="tab2-expert" id="tab2-expert" value="2" />否</li>
                        <li>基本工资调整为<br />
                            <%=Html.DropDownList("tab3-setSalary", new SelectList(new List<SelectListItem>() 
                        { 
                           new SelectListItem() { Text = "请选择", Value = "1" }
                        }, "Value", "Text"))%>
                        </li>
                        <li>
                        <input type="text" name="wagetbx3" id="wagetbx3" /></li><li id="Li1">请在最大值和最小值薪资中填写中间基本工资</li>
                       
                        <li>申请理由<br />
                            <%=Html.TextArea("tab2-reason")%></li>
                    </ul>
                </fieldset>
                <p style="text-align: center">
                    <button id="tab2-button" class="fg-button ui-state-default ui-corner-left" type="button"
                        onclick="tab2submitInfo()">
                        提交</button>
                </p>
            </div>
        </div>
        <div id="tabs-3">
            <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
                申请日期:<%=DateTime.Now.ToLongDateString() %></p>
            <fieldset>
                <legend>职位调整</legend>
                <ul class="verticality">
                    <li>员工姓名<br />
                        <select name="name3" id="name3">
                            <%List<TGProject.Models.TGSUSERQUERYALL> userList2 = (List<TGProject.Models.TGSUSERQUERYALL>)ViewData["UsersByApplicant"];
                              foreach (TGProject.Models.TGSUSERQUERYALL user in userList2)
                              {
                                  string values = user.USERID + "," + user.PLACEID + "," + account.AREAID + "," + user.WTYPE + "," + account.POPEDOMID + "," + account.POPEDOMNAME;
                                  
                            %>
                            <option value="<%=values %>">
                                <%=user.USERNAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>员工账号: <span style="font-size: 13px;" id="tab3-account"></span></li>
                    &nbsp;&nbsp;
                    <li>原职位:<span style="font-size: 13px;" id="PlaceName"></span> </li>
                    <%-- <li>薪资评定<br />
                        <%=Html.DropDownList("tab3-salary", new SelectList(new List<SelectListItem>() 
                    { 
                      new SelectListItem() { Text = "请选择", Value = "1"}
                    }, "Value", "Text"))%></li>--%>
                    <li>原薪资<span style="font-size: 13px;" id="oldwage"></span>元</li>
                    <!--<li>备注<br />
                        <%=Html.TextArea("tab3-remark")%></li>  -->
                    <li>现申请职位<br />
                        <select name="place" id="place">
                            <%List<TGProject.Models.TGSPLACESHOW> placeList = (List<TGProject.Models.TGSPLACESHOW>)ViewData["Place"];
                              foreach (TGProject.Models.TGSPLACESHOW place in placeList)
                              {
                                  string PlaceValues = place.PLACEID + "," + place.WTYPE;
                            %>
                            <option value="<%=PlaceValues %> ">
                                <%=place.PLACENAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>现申请基本工资<br />
                        <%=Html.DropDownList("wage2", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                        <input type="text" name="wagetbx" id="wagetbx" />
                    </li>
                    <li id="remark2">请在最大值和最小值薪资中填写中间基本工资</li>
                    <li id="Postswage4">现申请岗位工资<br />
                        <input type="text" name="wagetPosts2bx" id="wagetPosts2bx" />
                    </li>
                   
                    <li>申请理由<br />
                        <%=Html.TextArea("tab3-reason")%></li>
                </ul>
            </fieldset>
            <p style="text-align: center">
                <button id="tab3-button" class="fg-button ui-state-default ui-corner-left" type="button"
                    onclick="tab3submitInfo()">
                    提交</button>
            </p>
        </div>
        <div id="tabs-4">
            <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
                提交日期:<%=DateTime.Now.ToLongDateString() %></p>
            <fieldset>
                <legend>离职登记</legend>
                <ul class="verticality">
                    <li>离职日期<br />
                        <input type="text" name="tab3-dragit" id="datepicker" onfocus="setday(this)" />
                    </li>
                    <li>员工姓名<br />
                        <select name="name4" id="name4">
                            <%List<TGProject.Models.TGSUSERQUERYALL> userList1 = (List<TGProject.Models.TGSUSERQUERYALL>)ViewData["UsersByApplicant"];
                              foreach (TGProject.Models.TGSUSERQUERYALL user in userList1)
                              {
                                  string values = user.USERID + "," + user.PLACEID + "," + account.AREAID + "," + user.WTYPE + "," + account.POPEDOMID + "," + account.POPEDOMNAME;
                            %>
                            <option value="<%=values %>">
                                <%=user.USERNAME %></option>
                            <%} %>
                        </select>
                    </li>
                    <li>员工账号: <span style="font-size: 13px;" id="tab5-account"></span></li>
                    <li>员工职位:<span style="font-size: 13px;" id="place1"></span>
                        <hr />
                    </li>
                    <li>薪资结算</li>
                    <li>
                        <table style="width: 80%;">
                            <tr>
                                <td>
                                    工作时间
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="worktime"></span>天
                                </td>
                                <td id="BasicWage">
                                    工资
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="BasicWageNum"></span>元
                                </td>
                                <td>
                                    考核时间
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="AssessmentTime"></span>天
                                </td>
                                <td>
                                    绩效奖金
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="	PerformanceBonus"></span>元
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    奖励
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="rewardnum"></span>元
                                </td>
                                <td>
                                    罚款
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="punishnum"></span>元
                                </td>
                                <td>
                                    考勤扣款
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="checkdeduct"></span>元
                                </td>
                                <td>
                                    总计
                                </td>
                                <td>
                                    <span style="font-size: 13px;" id="sumwage"></span>元
                                </td>
                            </tr>
                        </table>
                    </li>
                    <li>备注<br />
                        <%=Html.TextArea("tab6-reason")%></li>
                </ul>
            </fieldset>
            <p style="text-align: center">
                <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button"
                    onclick="tab4submitInfo()">
                    提交</button>
            </p>
        </div>
    </div>

    <script type="text/javascript">
        $('#tabs').tabs();

        var GloalAreaPos;
        var max = 0;
        var min = 0;
        var Postsmax = 0;
        var Postsmin = 0;
        var docFileName = "";
        var rarFileName = "";
        var imgFileName;
        var docObj;
        var imgObj;
        var isSelectedRar = false;
        var isSelectedImg = false;
        var i1 = false;
        var i2 = false;
        var i3 = false;
        var i4 = false;
        var popom;
        var intExp = /^[1-9]\d*$/;
        var wagePosts = 0;
        var NoPosts = 0;
     
        $(document).ready(function() {

            $("input[type*='text']").mouseenter(function() { txtenter(this) });
            $("input[type*='text']").mouseout(function() { txtout(this) });
            //tab1
            $("#tab1-username").css("width", "255");
            $("#tab1-salary").css("width", "255");

            //tab2
            $("#tab2-username").css("width", "255");
            $("#tab2-salary").css("width", "255");
            $("#tab2-setSalary").css("width", "255");

            $("#tab2-upgrade").hide();

            $("#tab1-wagetxt").hide();

            //装载全局变量GloalArea
            loadArea();


            //选择tab单击
            $("#tabs-1").click(function() {

                if (i1 == false) {
                    loadUserInfo1();
                    i1 = true;
                }
            });
            $("#tabs-2").click(function() {

                if (i2 == false) {
                    loadUserInfo2();
                    i2 = true;
                }
            });

            $("#tabs-3").click(function() {

                if (i3 == false) {
                    loadUserInfo3();
                    i3 = true;
                }
            });
            $("#tabs-4").click(function() {

                if (i4 == false) {
                    loadUserInfo4();
                    i4 = true;
                }
            });

            //            $("#tabs-1").change(loadUserInfo1);
            //            $("#tabs-2").change(loadUserInfo2);
            //            $("#tabs-3").change(loadUserInfo3);
            //            $("#tabs-4").change(loadUserInfo4);

            $.fn.selVal = function(v) {

                if ($(this).val() != v) {
                    $(this).val(v).trigger("change");
                }
            }
            $("#name1").change(
                loadUserInfo1
            );
            $("#name2").change(
                loadUserInfo2
           );
            $("#name3").change(
                loadUserInfo3
            );
            $("#name4").change(
                loadUserInfo4
           );





            //            $("#test").selVal(2);

            $("#tab2-userinfo li:last-child > input:first").click(loadAdvanced);

            //权限对选项卡进行屏蔽
            if ($("#name1").val() == null) {

                //                $("#tabs-3").hide();
                //                $("#tabs-1").hide();
                //                $("#tabs-2").hide();
                //                $("#tabs-4").hide();

                //                $("#tabs-3").hide();
                //                $("#tabs-1").hide();
                //                $("#tabs-2").hide();
                //                $("#tabs-4").hide();


            }

            //            var GrobalstrArray = $("#name1").val().split(",");
            //            var popom = GrobalstrArray[4];
            popom = $("#power").html();
            $("#power").hide();

            if (popom == 5) {

                $("#tabs-3").show();
                $("#tabs-1").show();
                $("#tabs-2").show();
                $("#tabs-4").show();


            }

            if (popom == 2) {
                $("#tabs-3").hide();
                $("#tabs-1").show();
                $("#tabs-2").show();
                $("#tabs-4").show();


            }
            if (popom == 3 || popom == 4) {
                $("#tabs").hide();
                alert("您没有权限访问该页面！");
                //                $("#tabs-3").hide();
                //                $("#tabs-1").hide();
                //                $("#tabs-2").hide();
                //                $("#tabs-4").hide();

            }
            if (popom == 6 || popom == 7 || popom == 8) {
                $("#tabs").hide();
                alert("您没有权限访问该页面！");
            }


            //增加底薪申请,入编申请,职位调整申请和离职申请地区变动
            //            $("#zone1").change(function() { loadArea1() });
            //            $("#zone2").change(function() { loadArea2() });
            //            $("#zone3").change(function() { loadArea3() });
            //            $("#zone4").change(function() { loadArea4() });


            //增加底薪申请,入编申请,职位调整申请和离职申请地区变动影响员工姓名

            //            $("#area1").change(function() { loadname1() });
            //            $("#area2").change(function() { loadname2() });
            //            $("#area3").change(function() { loadname3() });
            //            $("#area4").change(function() { loadname4() });

            //增加底薪申请，入编申请，职位调整申请和离职申请员工姓名变动
            //            $("#name1").change(function() { loadUserInfo1(); });
            //            $("#name2").change(function() { loadUserInfo2(); });
            //            $("#name3").change(function() { loadUserInfo3(); });
            //            $("#name4").change(function() { loadUserInfo4(); });

            //上传入编申请资料

            docObj = new AjaxUpload("#rarUpload",
            {
                action: 'UpdataWageRuBianApply',
                data: { 'FOLDER': '/Upload/Rar/'

                },
                autoSubmit: true,
                responseType: 'json',
                onChange: function(file, extension) {
                    if (extension && /^(rar)$/.test(extension)) {
                        $('#rarMsg').text('[文件名： ' + file + ']').css("color", "black");
                        isSelectedRar = true;
                    }
                    else {
                        $('#rarMsg').text('文件扩展名必须为 *.rar ').css("color", "red");
                        isSelectedRar = false;
                        return false;
                    }
                },
                onComplete: function(file, response) {
                    if (response.isSuccess == true) {
                        rarFileName = response.result;
                    }
                    else {
                        isSelectedRar = false;
                        $("#rarMsg").text(response.result).css("color", "red");
                    }
                }
            });

            $("#wage2").hide();
            $("#place").change(function() { loadWage() });

            function loadWage() {

                if ($("#name3").val() == null) {
                }
                else {
                    var strArray2 = $("#name3").val().split(",");
                    var userID = strArray2[0];
                    var placeID = strArray2[1];
                    var areaid = strArray2[2];
                }
                if ($("#place").val() == null)
                { }
                else {
                    var strArray = $("#place").val().split(",");
                    var placeid = strArray[0];
                    var placetype = strArray[1];

                    if (placetype == 1) {


                        $("#wage2").show();
                        $("#wagetbx").show();
                        $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: wageSuccessed
                 });
                    }
                    else if (placetype == 2) {
                        $("#wage2").show();
                        $("#wagetbx").hide();

                        $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: wageSuccessed
                 });
                    }
                    else {
                        $("#wage2").hide();
                        $("#wagetbx").show();
                        $("#wagetbx").empty();

                        $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: wageSuccessed
                 });
                    }
                }
            }


            function wageSuccessed(result) {

                $("#Postswage4").hide();
                $("#wage2").empty();
                
        ////////////////////////////////////////////////////////
                $("#wagetPosts2bx").empty();
//               <li id="Postswage4">现申请岗位工资<br />
//                        <input type="text" name="wagetPosts2bx" id="wagetPosts2bx" />
//                    </li>
       /////////////////////////////////////////////////////////
                if (result.rows.length > 0) {
                    $.each(result, function(i, items) {
                        $.each(items, function(j, item) {
                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#wage2"));
                        ////////////////////////////////
                        if (item.cell[5] == 0) {
                            $("#Postswage4").hide();

                            NoPosts = 1;
                        }
                        else {
                            $("#Postswage4").show();


                            Postsmin = item.cell[4];
                            Postsmax = item.cell[5];
                            NoPosts = 0;
                        }
                        ////////////////////////////////

                        });
                    });
                }
            }
        });



        //modify by 王琳 2009年8月26日

        $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

            $("#tab2-upgrade").show(400);
        });

        $("#tab2-userinfo li:last-child > input:last").bind("click", function() {
            //        $("#tab2-upgrade").hide(400);

            tab2submitInfo();

        });

        //选择高级推广员
        //选择是
        $("#tab4-account li:first-child >input:first").bind("click", function() {

            //        alert($("#tab2-userinfo li:last-child > input:first").val());



            if ($("#name2").val() == null) {
            }
            else {
                var strArray = $("#name2").val().split(",");
                var userID = strArray[0];

                var areaid = strArray[2];
                var wType = strArray[3];

                //数据库高级推广员的placeID为4
                var placeID = 4;

                $.ajax({
                    url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                    type: "POST",
                    dataType: "json",
                    success: SelectAdvancedSuccessed
                });
            }
        });

        function SelectAdvancedSuccessed(result) {


            $("#tab3-setSalary").empty();
            
            ///////////////////////////////////////////////////
            $("#tab1 - Posts2wagetxt").empty();
            
            //////////////////////////////////////////////////
            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {
                    $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#tab3-setSalary"));

                
                    });
                });
            }
        }
        //选择否
        $("#tab4-account li:first-child >input:last").bind("click", function() {

            tab2submitInfo();

        });

        //最大薪资
        var maxWage = 1000;



        //选择底薪申请的员工姓名
        function loadUserInfo1() {
            $("#rarUpload").attr("disabled", true); //设为不可用 
            if ($("#name1").val() == null) {
            }
            else {
                var strArray = $("#name1").val().split(",");
                var userID = strArray[0];
                var placeID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];
            

                if (wType == "1") {
                    $("#tab1-wage").show();
                    $("#tab1-wagetxt").show();
                    $("#remark3").show();
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: wage2Successed
                    });
                }
                else if (wType == "2") {
                    $("#tab1-wagetxt").hide();
                    $("#tab1-wage").show();
                    $("#remark3").hide();
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: wage2Successed
                    });

                }
                else {
                    $("#wage").hide();
                    $("#tab1-wagetxt").show();
                    $("#tab1-wagetxt").empty();
                    $("#remark3").hide();



                    $("#Postswage1").show();
                    Postsmin = 0;
                    Postsmax = 999999;
                    NoPosts = 1;
//                    if ($("#name1").val() == null)
//                    { }
//                    else {
//                        var strArray = $("#name1").val().split(",");
//                        var userID2 = strArray[0];

//                        $.ajax({
//                            url: "LoadUserDetail/" + userID2,
//                            type: "POST",
//                            dataType: "json",
//                            success: userSuccessed
//                        });
                    //                    }
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: wage2Successed
                    });
                }
            }

        }

        function wage2Successed(result) {

            
            $("#wage").empty();
            //////////////////////////////////////
            $("Postswage1").empty();
            //////////////////////////////////////
            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {
                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#wage"));
                        ////////////////////////////////////////////

                        //                        $("<option></option>").val(item.cell[2]).text(item.cell[2]).appendTo($("#Postswage"));

                        if (item.cell[5] == 0) {
                            $("#Postswage1").hide();
                           
                            NoPosts = 1;
                        }
                        else {
                            $("#Postswage1").show();
                          
                         
                            Postsmin = item.cell[4];
                            Postsmax = item.cell[5];
                            NoPosts = 0;
                        }


                        ////////////////////////////////////////////
                    });
                });
                //                    maxWage = maxWage > item[0].cell[1] ? item[0].cell[1] : maxWage;

            }

            if ($("#name1").val() == null)
            { }
            else {
                var strArray = $("#name1").val().split(",");
                var userID2 = strArray[0];

                $.ajax({
                    url: "LoadUserDetail/" + userID2,
                    type: "POST",
                    dataType: "json",
                    success: userSuccessed
                });
            }
        }

        function userSuccessed(result) {


            $("#tab1-account").html(result.uaccount);

            //            $("#tab2-salary").attr("value", "1");
        }

        //选择入编申请的员工姓名
        function loadUserInfo2() {
            $("#bzlist").val("益元堂");
            $("#rarUpload").attr("disabled", false); //设为不可用 
            if ($("#name2").val() == null)
            { }
            else {
                
                var strArray = $("#name2").val().split(",");
                var userID = strArray[0];
                var placeID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];

                if (wType == "1") {
                    $("#tab2-salary").show();
                    $("#wagetbx2").show();
                    $("#remark1").show();
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: loadUserInfo2Successed
                    });
                }
                else if (wType == "2") {
                    $("#wagetbx2").hide();
                    $("#tab2-salary").show();
                    $("#remark1").hide();
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: loadUserInfo2Successed
                    });

                }
                else {
                    $("#tab2-salary").hide();
                    $("#wagetbx2").show();
                    $("#wagetbx2").empty();
                    $("#remark1").hide();
                   
//                    if ($("#name2").val() == null)
//                    { }
//                    else {
//                        
//                        var strArray = $("#name2").val().split(",");
//                        var userID2 = strArray[0];
//                        
//                        $.ajax({
//                            url: "LoadUserDetail/" + userID2,
//                            type: "POST",
//                            dataType: "json",
//                            success: loadUserInfo10Successed
//                        });
                    //                    }
                    $("#Postswage3").show();
                    Postsmin = 0;
                    Postsmax = 999999;
                    NoPosts = 1;
                    $.ajax({
                        url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                        type: "POST",
                        dataType: "json",
                        success: loadUserInfo2Successed
                    });
                }
            }
        }

        function loadUserInfo2Successed(result) {


         
            $("#tab2-salary").empty();
            /////////////////////////////////////////////
            $("#wagetPostsbx2").empty();
            /////////////////////////////////////////////
            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {
                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#tab2-salary"));
                        //////////////////////////////////////
                       
                        if (item.cell[5] == 0) {
                            $("#Postswage3").hide();

                            NoPosts = 1;
                        }
                        else {
                            $("#Postswage3").show();


                            Postsmin = item.cell[4];
                            Postsmax = item.cell[5];
                            NoPosts = 0;
                        }
                        //////////////////////////////////////   

                    });
                });
            }
            
            if ($("#name2").val() == null)
            { }
            else {
                var strArray = $("#name2").val().split(",");
                var userID2 = strArray[0];

                $.ajax({
                    url: "LoadUserDetail/" + userID2,
                    type: "POST",
                    dataType: "json",
                    success: loadUserInfo10Successed
                });
            }
        }

        function loadUserInfo10Successed(result) {


            $("#tab2-account").html(result.uaccount);

            //            $("#tab2-salary").attr("value", "1");
        }
        //选择职位调整的员工姓名
        function loadUserInfo3() {
            $("#rarUpload").attr("disabled", true); //设为不可用 
            if ($("#name3").val() == null)
            { }
            else {
                var strArray = $("#name3").val().split(",");
                var userID = strArray[0];
                var placeID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];

                //                $.ajax({
                //                    url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                //                    type: "POST",
                //                    dataType: "json",
                //                    success: loadUserInfo3Successed
                //                });
                //            }
                //        }


                //        function loadUserInfo3Successed(result) {

                //            $("#tab3-salary").empty();
                //            if (result.rows.length > 0) {
                //                $.each(result, function(i, items) {
                //                    $.each(items, function(j, item) {
                //                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#tab3-salary"));
                //                    });
                //                });
                //            }

                //显示某个员工的职位，备注信息以及目前薪资情况

                //            if ($("#name3").val() == null)
                //            { }
                //            else {
                //                var strArray = $("#name3").val().split(",");
                var userID2 = strArray[0];

                $.ajax({
                    url: "LoadUserDetail/" + userID2,
                    type: "POST",
                    dataType: "json",
                    success: user3Successed
                });
            }
        }

        function user3Successed(result) {
            $("#PlaceName").html(result.placename);
            $("#tab3-account").html(result.uaccount);
            $("#oldwage").html(result.wagenum);
            //             $("#tab2-salary").attr("value", result.wagenum);


            //loadWage代码
            if ($("#name3").val() == null) {
            }
            else {
                var strArray2 = $("#name3").val().split(",");
                var userID = strArray2[0];
                var placeID = strArray2[1];
                var areaid = strArray2[2];
            }
            if ($("#place").val() == null)
            { }
            else {
                var strArray = $("#place").val().split(",");
                var placeid = strArray[0];
                var placetype = strArray[1];

                if (placetype == 1) {
                    $("#wage2").show();
                    $("#wagetbx").show();
                    $("#remark2").show();
                    $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: LoadwageSuccessed
                 });
                }
                else if (placetype == 2) {
                    $("#wage2").show();
                    $("#wagetbx").hide();
                    $("#remark2").hide();
                    $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: LoadwageSuccessed
                 });
                }
                else {
                    $("#wage2").hide();
                    $("#wagetbx").show();
                    $("#wagetbx").empty();
                    $("#remark2").hide();
                    $.ajax(
                 {
                     url: "LoadWage/" + encodeURIComponent(placeid + "," + GloalAreaPos),
                     type: "POST",
                     dataType: "json",
                     success: LoadwageSuccessed
                 });
                }
            }

        }

        function LoadwageSuccessed(result) {
            $("#Postswage4").hide();
            $("#wage2").empty();
            ////////////////////////////////////////////////
            $("#wagetPosts2bx").empty();
            ////////////////////////////////////////////////
            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {
                        $("<option></option>").val(item.cell[1]).text(item.cell[1]).appendTo($("#wage2"));
                        //////////////////////////////////////
                     
                        if (item.cell[5] == 0) {
                            $("#Postswage4").hide();

                            NoPosts = 1;
                        }
                        else {
                            $("#Postswage4").show();


                            Postsmin = item.cell[4];
                            Postsmax = item.cell[5];
                            NoPosts = 0;
                        }
                        //////////////////////////////////////
                    });
                });
            }

        }

        //选择离职申请员工姓名
        function loadUserInfo4() {
            $("#rarUpload").attr("disabled", true); //设为不可用 
            if ($("#name4").val() == null)
            { }
            else {
                var strArray = $("#name4").val().split(",");
                var userID = strArray[0];
                var placeID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];

                $.ajax({
                    url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                    type: "POST",
                    dataType: "json",
                    success: loadUserInfo4Successed
                });
            }
        }

        function loadUserInfo4Successed(result) {


            //显示某个员工的职位，备注信息以及目前薪资情况
            if ($("#name4").val() == null)
            { }
            else {
                var strArray = $("#name4").val().split(",");
                var userID2 = strArray[0];

                $.ajax({
                    url: "LoadUserDetail/" + userID2,
                    type: "POST",
                    dataType: "json",
                    success: user4Successed
                });
            }
        }

        function user4Successed(result) {


            $("#place1").html(result.placename);
            $("#sumwage").html(result.sumwage);
            $("#BasicWageNum").html(result.wagenum);
            $("#checkdeduct").html(result.checkdeduct);
            $("#rewardnum").html(result.rewardnum);
            $("#punishnum").html(result.punishnum);
            $("#tab5-account").html(result.uaccount);
            $("#worktime").html(result.workday);
            //             $("#AssessmentTime").html(result.workday);

        }


        function tab1submitInfo() {
            //            var applyID = $("#tabs").tabs().tabs("option", "selected");

            if ($("#name1").val() == null)
            { }
            else {
                var applyID = "2";
                var strArray = $("#name1").val().split(",");
                var userID = strArray[0];
                var PlaceID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];
                var newBZID = "0";


                var applicant = strArray[5];
                var applyDesc = $("#tab1-remark").val();
                var dimTime = "";



                //判断备注是否填写

                if (applyDesc == "") {
                    alert("请填写底薪申请备注！");
                    return;
                }
                if (applyDesc != null) {
                    if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                        alert("备注含有非法字符!");
                        return;
                    }
                }
                var demo = /^[\u0391-\uFFE5\w]+$/;
                if (!demo.test(applyDesc)) {

                   /// alert("底薪申请备注只能包括中文字、英文字母、数字和下划线!");
                   /// return;
                
                
                }

                //-----------------------------------------------------------------------------
                //获得薪资
                // wtype=0 任意输入，1 最高最低，2 只能选择

                //                if (intExp.test(applicant)!=1)
                //                {
                //                    alert("输入的工资必须为数字！");
                //                    return;
                //                }
               
                var intExp = /^[1-9]\d*$/;
                if (wType == 0) {
                    if ($("#tab1-wagetxt").val().length < 1) {
                        alert("请输入基本工资!");
                        return false;
                    }
                    else {
                        wage = $("#tab1-wagetxt").val();

                        

                        if (!intExp.test($("#tab1-wagetxt").val())) {
                            alert("请输入以数字构成的基本工资！");

                            return;
                        }
                        AETYPE = "1";


                        ///////////////////////////////////////////////////////////
                        if (NoPosts == 1)
                        { wagePosts = 0; }
                        else {
                            wagePosts = $("#tab1-Postswagetxt").val();
                            if (!intExp.test($("#tab1-Postswagetxt").val())) {
                                alert("请输入以数字构成的岗位工资！");

                                return;
                            }

                            if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                return false;

                            }

                        }
                        ///////////////////////////////////////////////////////////
                        
                        
                        
                    }
                } else if (wType == 1) {
                    if ($("#tab1-wagetxt").val().length < 1) {
                        alert("请输入基本工资!");
                        return false;
                    } else {


                        wage = $("#tab1-wagetxt").val();
                        AETYPE = "2";
                     

                        if (!intExp.test($("#tab1-wagetxt").val())) {
                            alert("请输入以数字构成的工资！");

                            return;
                        } 
                      
                        
                        if ($("#wage")[0].options(0).text != undefined) {
                            min = $("#wage")[0].options(1).text;
                            max = $("#wage")[0].options(0).text;

                            if (!(wage >= min && wage <= max)) {
                                alert("超出基本工资范围[" + min + "~" + max + "]");
                                return false;
                            }
                        }

                        ///////////////////////////////////////////////////////////

                        if (NoPosts == 1)
                        { wagePosts = 0; }
                        else {
                            wagePosts = $("#tab1-Postswagetxt").val();
                            if (!intExp.test($("#tab1-Postswagetxt").val())) {
                                alert("请输入以数字构成的岗位工资！");

                                return;
                            }

                            if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                return false;

                            }

                        }
                        ///////////////////////////////////////////////////////////
                       
                    }
                } else {
                    wage = $("#wage").val();
                    AETYPE = "3";
                  
                   

                    if (!intExp.test($("#wage").val())) {
                        alert("请输入以数字构成的基本工资！");

                        return;
                    }

                    ///////////////////////////////////////////////////////////
                    if (NoPosts == 1)
                    { wagePosts = 0; }
                    else {
                        wagePosts = $("#tab1-Postswagetxt").val();
                  
                        if (!intExp.test($("#tab1-Postswagetxt").val())) {
                            alert("请输入以数字构成的岗位工资！");

                            return;
                        }

                        if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                            alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                            return false;

                        }

                    }
                    ///////////////////////////////////////////////////////////
                }


                //                if (intExp.test(wage) == 1) {
                //                    alert("输入的工资必须为数字！");
                //                    return;
                //                }
                //-----------------------------------------------------------------------------
                $.ajax({
                    url: "UpdataWageApply2/",
                    type: "POST",
                    data: {
                        ApplyID: applyID,
                        AETYPE: AETYPE,
                        UserID: userID,
                        NEWWAGENUM: wage,
                        NEWPOSTWAGE:wagePosts,
                        NewPlaceID: PlaceID,
                        NewBZID: newBZID,
                        Applicant: applicant,
                        ApplyDesc: applyDesc,
                        DimTime: dimTime
                    },
                    dataType: "json",
                    success: uploadWageApply
                });
            }
        }


        function uploadWageApply(result) {

            if (result.isSuccess) {
                alert("提交成功!");
            } else {
                alert("提交失败（如果是入编和离职信息由于只能提交一次）!");
            }
        }
        function tab2submitInfo() {
            //var applyID = $("#tabs").tabs().tabs("option", "selected");
            //var newWageID = $("#tab2-setSalary").val();



            if ($("#name2").val() == null)
            { }
            else {
                var strArray = $("#name2").val().split(",");
                var userID = strArray[0];
                var newPlaceID = strArray[1];
                //var areaid = strArray[2];
                var wType = strArray[3];
                var AETYPE = 1;
                var applicant = strArray[5];

                var dimTime = "";

                var applyDesc;

                var demo = /^[\u0391-\uFFE5\w]+$/;

                if ($(":radio[name='tab2-pass']:checked").val() == 2) {
                    applyDesc = $("#tab2-remark").val();
                    if (applyDesc == "") {
                        alert("请填写备注！");
                        return;
                    }

                    if (applyDesc != null) {
                        if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                            alert("备注含有非法字符!");
                            return;
                        }
                    }
                    if (!demo.test(applyDesc)) {

                      ///  alert("备注只能包括中文字、英文字母、数字和下划线!");
                       /// return;


                    }

                }
                else if ($(":radio[name='tab2-expert']:checked").val() == 2) {


                    applyDesc = $("#tab2-remark").val();
                    if (applyDesc == "") {
                        alert("请填写备注！");
                        return;
                    }

                    if (applyDesc != null) {
                        if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                            alert("备注含有非法字符!");
                            return;
                        }
                    }
                    if (!demo.test(applyDesc)) {

                      ///  alert("备注只能包括中文字、英文字母、数字和下划线!");
                     ///   return;


                    }

                }
                else if ($(":radio[name='tab2-expert']:checked").val() == 1 && popom != 2) {
                
                    applyDesc = $("#tab2-reason").val();
                    if (applyDesc == "") {
                        alert("请填写申请理由备注！");
                        return;
                    }
                    if (applyDesc != null) {
                        if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                            alert("备注含有非法字符!");
                            return;
                        }
                    }
                    if (!demo.test(applyDesc)) {

                     ///   alert("申请理由备注只能包括中文字、英文字母、数字和下划线!");
                     ///   return;


                    }

                }
                else {
                
                    applyDesc = $("#tab2-remark").val();
                    if (applyDesc == "") {
                        alert("请填写备注！");
                        return;
                    }

                    if (applyDesc != null) {
                        if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                            alert("备注含有非法字符!");
                            return;
                        }
                    }
                    if (!demo.test(applyDesc)) {

                      ///  alert("备注只能包括中文字、英文字母、数字和下划线!");
                      ///  return;


                    }
                }


                var intExp = /^[1-9]\d*$/;
//                alert($("#tab2-userinfo li:last-child > input:first").val());
//                alert($("#tab4-account li:first-child >input:first").val());
                if ($(":radio[name='tab2-pass']:checked").val() =="1") {

                    if ($(":radio[name='tab2-expert']:checked").val() == "1") {


                        //                        newPlaceID = strArray[1];
                        newPlaceID = 4;
//                        wage = $("#tab3-setSalary").val();
                        newBZID = $("#bzlist").val();
                        applyID = "3";
                        AETYPE = "1";
                        wage = $("#wagetbx3").val();
                        ///////////////////////////////////////////////////////////
                        if ($("#tab3-setSalary")[0].options(0).text != undefined) {
                            min = $("#tab3-setSalary")[0].options(1).text;
                            max = $("#tab3-setSalary")[0].options(0).text;
                            if (!(wage >= min && wage <= max)) {
                                alert("超出高级推广员基本工资范围[" + min + "~" + max + "]");
                                return false;
                            }
                        }
                        ////////////////////////////////////////////////////////////
                  
                    }
                    else {
                    

                        newPlaceID = strArray[1];

                        newBZID = $("#bzlist").val();
                        applyID = "3";

                        //-----------------------------------------------------------------------------
                        //获得薪资
                        // wtype=0 任意输入，1 最高最低，2 只能选择

              
                        if (wType == 0) {
                            if ($("#wagetbx2").val().length < 1) {
                                alert("请输入基本工资!");
                                return false;
                            }
                            else {

                                wage = $("#wagetbx2").val();
                                AETYPE = "1";



                                if (!intExp.test($("#wagetbx2").val())) {
                                    alert("请输入以数字构成的工资！");

                                    return;
                                }


                                ///////////////////////////////////////////////////////////
                                if (NoPosts == 1)
                                { wagePosts = 0; }
                                else {
                                    wagePosts = $("#wagetPostsbx2").val();
                                    if (!intExp.test($("#wagetPostsbx2").val())) {
                                        alert("请输入以数字构成的岗位工资！");

                                        return;
                                    }

                                    if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                        alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                        return false;

                                    }

                                }
                                ////////////////////////////////////////////////////////////
                                
                            }
                        } else if (wType == 1) {
                            if ($("#wagetbx2").val().length < 1) {
                                alert("请输入基本工资!");
                                return false;
                            } else {


                                wage = $("#wagetbx2").val();
                                AETYPE = "2";



                                if (!intExp.test($("#wagetbx2").val())) {
                                    alert("请输入以数字构成的工资！");

                                    return;
                                }



                                if ($("#tab2-salary")[0].options(0).text != undefined) {
                                    min = $("#tab2-salary")[0].options(1).text;
                                    max = $("#tab2-salary")[0].options(0).text;
                                    if (!(wage >= min && wage <= max)) {
                                        alert("超出基本工资范围[" + min + "~" + max + "]");
                                        return false;
                                    }
                                }

                                ///////////////////////////////////////////////////////////
                                if (NoPosts == 1)
                                { wagePosts = 0; }
                                else {
                                    wagePosts = $("#wagetPostsbx2").val();
                                    if (!intExp.test($("#wagetPostsbx2").val())) {
                                        alert("请输入以数字构成的岗位工资！");

                                        return;
                                    }

                                    if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                        alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                        return false;

                                    }

                                }
                                ////////////////////////////////////////////////////////////
                             

                            }
                        } else {
                            wage = $("#tab2-salary").val();
                            AETYPE = "3";



                            //                            if (!intExp.test($("#wagetbx2").val())) {
                            //                                alert("请输入以数字构成的工资！");

                            //                                return;
                            //                            }


                            applyDesc = $("#tab2-remark").val();

                            ///////////////////////////////////////////////////////////
                            if (NoPosts == 1)
                            { wagePosts = 0; }
                            else {
                                wagePosts = $("#wagetPostsbx2").val();
                                if (!intExp.test($("#wagetPostsbx2").val())) {
                                    alert("请输入以数字构成的岗位工资！");

                                    return;
                                }

                                if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                    alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                    return false;

                                }

                            }
                            ////////////////////////////////////////////////////////////


                          
                        }
                        //-----------------------------------------------------------------------------

                    }

                }
                else if (popom == 5) {
               
                    newPlaceID = 0;

                    newBZID = 0;
                    applyID = "2";
                    wage = 0;
                    AETYPE = 0;
                    //////////////////
                    wagePosts = 0;
                    /////////////////
               
                }
                else if (popom == 2) {
                

                newPlaceID = strArray[1];

                newBZID = $("#bzlist").val();
                applyID = "2";
                wage = $("#wagetbx2").val();
                var intExp = /^[1-9]\d*$/;
                if (!intExp.test($("#wagetbx2").val())) {
                    alert("请输入以数字构成的工资！");

                    return;
                }

                ///////////////////////////////////////////////////////////
                if (NoPosts == 1)
                { wagePosts = 0; }
                else {
                    wagePosts = $("#wagetPostsbx2").val();
                    if (!intExp.test($("#wagetPostsbx2").val())) {
                        alert("请输入以数字构成的岗位工资！");

                        return;
                    }

                    if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                        alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                        return false;

                    }

                }
                ////////////////////////
                if (newPlaceID == 7)
                    AETYPE = 3;
                else if (newPlaceID == 8)
                    AETYPE = 2;
                else AETYPE = 1;
               
                
                
                ////////////////////////
                
                
                }


                if (isSelectedRar == false) {
                    alert("请先上传入编申请资料！");
                    return;
                }

                //                if (intExp.test(wage) != 1) {
                //                    alert("输入的工资必须为数字！");
                //                    return;
                //                }
                $.ajax({
                    url: "UpdataWageApply/",
                    type: "POST",
                    data: {

                        ApplyID: applyID,
                        AETYPE: AETYPE,
                        UserID: userID,
                        NEWWAGENUM: wage,
                        NEWPOSTWAGE: wagePosts,
                        NewPlaceID: newPlaceID,
                        RARFILE: rarFileName,
                        NewBZID: newBZID,
                        Applicant: applicant,
                        ApplyDesc: applyDesc,
                        DimTime: dimTime
                    },
                    dataType: "json",
                    success: uploadWageApply
                });
            }
        }


        //职位调整提交
        function tab3submitInfo() {


            //            if (intExp.test(applicant) != 1) {
            //                alert("输入的工资必须为数字！");
            //                return;
            //            }
            if ($("#name3").val() == null)
            { }
            else {
                //var applyID = $("#tabs").tabs().tabs("option", "selected");
                var applyID = 4;
                var newWageID = $("#tab3-salary").val();
                var strArray = $("#name3").val().split(",");
                var userID = strArray[0];
                var arrPlaceWagetype = $('#place').val().split(",");
                
                //var newPlaceID = strArray[1];
                var newPlaceID = arrPlaceWagetype[0];       //新的职位ID
                //var wType = strArray[3];;
                var wType = arrPlaceWagetype[1];            //新的工资类型
                
                var areaid = strArray[2];
                var newBZID = "0";
                var applicant = strArray[5];
                var applyDesc = $("#tab3-reason").val();
                var dimTime = "";

                if (applyDesc == "") {
                    alert("请填写职位调整备注！");
                    return;
                }
                if (applyDesc != null) {
                    if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                        alert("备注含有非法字符!");
                        return;
                    }
                }
                var demo = /^[\u0391-\uFFE5\w]+$/;
                if (!demo.test(applyDesc)) {

                  ///  alert("职位调整备注只能包括中文字、英文字母、数字和下划线!");
                  ///  return;


                }

                //            var ddl = document.getElementById("tab3-setSalary");
                //            var index = ddl.seletedIndex;
                //            alert(index);
                //            var value = ddl.options[index].value;
                //            var Text = ddl.options[index].text;


                //-----------------------------------------------------------------------------
                //获得薪资
                // wtype=0 任意输入，1 最高最低，2 只能选择

                var strArray = $("#place").val().split(",");
                var placeid = strArray[0];
                var placetype = strArray[1];

                var intExp = /^[1-9]\d*$/;

                if (placetype == 0) {
                    if ($("#wagetbx").val().length < 1) {
                        alert("请输入基本工资!");
                        return false;
                    }
                    else {
                        wage = $("#wagetbx").val();
                        AETYPE = 1;


                     

                        if (!intExp.test($("#wagetbx").val())) {
                            alert("请输入以数字构成的工资！");

                            return;
                        }

                        ///////////////////////////////////////////////////////////
                        if (NoPosts == 1)
                        { wagePosts = 0; }
                        else {
                            wagePosts = $("#wagetPosts2bx").val();
                            if (!intExp.test($("#wagetPosts2bx").val())) {
                                alert("请输入以数字构成的岗位工资！");

                                return;
                            }

                            if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                return false;

                            }

                        }
                        ////////////////////////////////////////////////////////////

                    }
                } else if (placetype == 1) {
                    if ($("#wagetbx").val().length < 1) {
                        alert("请输入基本工资!");
                        return false;
                    } else {
                        wage = $("#wagetbx").val();
                        AETYPE = 2;

                

                        if (!intExp.test($("#wagetbx").val())) {
                            alert("请输入以数字构成的工资！");

                            return;
                        } 
                        
                        
                        if ($("#wage2")[0].options(0).text != undefined) {
                            min = $("#wage2")[0].options(1).text;
                            max = $("#wage2")[0].options(0).text;
                            if (!(wage >= min && wage <= max)) {
                                alert("超出基本工资范围[" + min + "~" + max + "]");
                                return false;
                            }
                        }

                        ///////////////////////////////////////////////////////////
                        if (NoPosts == 1)
                        { wagePosts = 0; }
                        else {
                            wagePosts = $("#wagetPosts2bx").val();
                            if (!intExp.test($("#wagetPosts2bx").val())) {
                                alert("请输入以数字构成的岗位工资！");

                                return;
                            }

                            if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                                alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                                return false;

                            }

                        }
                        ////////////////////////////////////////////////////////////

                    }
                } else {
                wage = $("#wage2").val();

              

                if (!intExp.test($("#wage2").val())) {
                    alert("请输入以数字构成的工资！");

                    return;
                }

                AETYPE = 3;
                ///////////////////////////////////////////////////////////
                if (NoPosts == 1)
                { wagePosts = 0; }
                else {
                    wagePosts = $("#wagetPosts2bx").val();
                    if (!intExp.test($("#wagetPosts2bx").val())) {
                        alert("请输入以数字构成的岗位工资！");

                        return;
                    }

                    if (!(wagePosts >= parseInt(Postsmin) && wagePosts <= parseInt(Postsmax))) {
                        alert("超出岗位工资范围[" + Postsmin + "~" + Postsmax + "]");
                        return false;

                    }

                }
                ////////////////////////////////////////////////////////////
                }


                //                if (intExp.test(wage) != 1) {
                //                    alert("输入的工资必须为数字！");
                //                    return;
                //                }
                //                
                //-----------------------------------------------------------------------------

                $.ajax({
                    url: "UpdataWageApply2/",
                    type: "POST",
                    data: {
                        ApplyID: applyID,
                        AETYPE: AETYPE,
                        UserID: userID,
                        NEWWAGENUM: wage,
                        NEWPOSTWAGE: wagePosts,
                        NewPlaceID: newPlaceID,
                        NewBZID: newBZID,
                        Applicant: applicant,
                        ApplyDesc: applyDesc,
                        DimTime: dimTime
                    },
                    dataType: "json",
                    success: uploadWageApply
                });

            }
        }

        //离职申请提交
        function tab4submitInfo() {


            //            if (intExp.test(applicant) != 1) {
            //                alert("输入的工资必须为数字！");
            //                return;
            //            }
            //            var applyID = $("#tabs").tabs().tabs("option", "selected");
            if ($("#name4").val() == null)
            { }
            else {
                var applyID = 5;


                //            var newWageID =1;// $("#tab2-setSalary").text()离职没有工资
                var strArray = $("#name4").val().split(",");
                var userID = strArray[0];
                var newPlaceID = strArray[1];
                var areaid = strArray[2];
                var wType = strArray[3];
                var newBZID = "0";
                var applicant = strArray[5];
                //                var applyDesc = $("#tab6-reason").attr("value");
                var dimTime = $("#datepicker").val();
                var AETYPE = 2;
                var wage = 2;
                var applyDesc = $("#tab6-reason").val();
                if (applyDesc == "") {
                    alert("请填写离职申请备注！");
                    return;
                }
                if (applyDesc != null) {
                    if ((applyDesc.toLowerCase().indexOf("script") >= 0)) {
                        alert("备注含有非法字符!");
                        return;
                    }
                }
                var demo = /^[\u0391-\uFFE5\w]+$/;
                if (!demo.test(applyDesc)) {

                 ///   alert("离职申请备注只能包括中文字、英文字母、数字和下划线!");
                 ///   return;


                }
                if (dimTime == "") {

                    alert("请填写离职时间！");
                    return;

                }

                var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
                if (!datedemo.test(dimTime)) {

                    alert("离职日期不对！");
                    return;


                }


                //                $("#form1").validate({
                //               rules:
                //                {
                //                 datepicker: { required: true, datepicker: true },
                //                 applydesc: { required: true,  tab3-reason:true}
                //               
                //                },
                //              messages:
                //               {
                //                datepicker: { required: "&nbsp;&nbsp;[离职日期不能为空!]" },
                //                applydesc: { required: "&nbsp;&nbsp;[备注不能为空!]" }
                //              
                //               }
                //                });

                //                if (intExp.test(wage) != 1) {
                //                    alert("输入的工资必须为数字！");
                //                    return;
                //                }
                $.ajax({
                    url: "UpdataWageApply2/",
                    type: "POST",
                    data: {
                        ApplyID: applyID,
                        AETYPE: AETYPE,
                        UserID: userID,
                        NEWWAGENUM: wage,
                        NEWPOSTWAGE: wagePosts,
                        NewPlaceID: newPlaceID,
                        NewBZID: newBZID,
                        Applicant: applicant,
                        ApplyDesc: applyDesc,
                        DimTime: dimTime
                    },
                    dataType: "json",
                    success: uploadWageApply
                });
            }
        }


        //离职信息日期JQUERY
        //        $(function() {
        //            $("#datepicker").datepicker();
        //        });

        //areaid转areapos
        function loadArea() {

            if ($("#name1").val() == null) {

            }
            else {
                var strArray = $("#name1").val().split(",");
                var userID = strArray[0];
                var newPlaceID = strArray[1];
                var areaid = strArray[2];
                $.ajax({
                    url: "LoadArea/" + areaid,
                    type: "POST",
                    dataType: "json",
                    success: areaSuccessed
                });
            }
        }

        function areaSuccessed(result) {

            if (result.rows.length > 0) {
                $.each(result, function(i, item) {
                    GloalAreaPos = item[0].cell[2];

                });
            }
        }


        function loadAdvanced() {

            if ($("#name2").val() == null) {
            }
            else {
                var strArray = $("#name2").val().split(",");
                var userID = strArray[0];

                var areaid = strArray[2];
                var wType = strArray[3];

                //数据库高级推广员的placeID为4
                var placeID = 4;


                $.ajax({
                    url: "LoadWage/" + encodeURIComponent(placeID + "," + GloalAreaPos),
                    type: "POST",
                    dataType: "json",
                    success: SelectAdvancedSuccessed
                });
            }


        }
    
    </script>

    </form>
</asp:Content>
