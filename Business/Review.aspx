<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	考核
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;%>
   <span id="power"><%=account.POPEDOMID %></span>
    <span id="UCACCOUNT"><%=account.UACCOUNT %></span>
    <span id="USERNAME"><%=account.USERNAME %></span>
    <span id="AREAID"><%=account.AREAID %></span>
       <span id="ip"><%=ViewData["ClientIp"].ToString()%></span>
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">主管考核</a></li>
        <li><a href="#tabs-2">督察考核</a></li>
        
    </ul>
    <div id="tabs-1" style="text-align: center">
   
    <div id="ChargeCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
            <ul class="horizontal">
              <% if (account.POPEDOMID != 6 && account.POPEDOMID != 5)
                 {%>
                      <li>大区<select name="zone2" id="zone2">
                    <%
                          List<TGProject.Models.TGSZONESHOW> zoneList2 = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList2)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%
                        }
                    %>
                     
                   
                </select></li>
                <li>办事处
                    <select id="area2">
                        
                        <option value="<%=account.AREAID %>">默认</option>
                      
                    </select>
                </li> <%} %>
                 <li>开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" /></li>
                <li>结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)"   value="2010-12-1"/></li>
                <li>
                
                    <select name="SearchType" id="Select1" style="width: 109px">
                    <option value="0">搜索全部</option>
                    <option value="1">按网吧名称搜索</option>
                    <option value="2">按网吧编号搜索</option>
                    <option value="3">按锁定人姓名搜索</option>
                    <option value="4">按锁定人帐号搜索</option>
                    </select>
                    <input type="text" name="netName" id="netName"/></li>
                    

                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                        查询</button>
            </ul>
            <br />
        </div>
    </fieldset>
    
</div>
     <div id="tabs1">
       <table id="list1" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager2" class="scroll" style="text-align: center;"></div>
      </div>
</div>
     <div id="tabs-2" style="text-align: center">
   
    <div id="InspectorCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
            <ul class="horizontal">
            <% 
            if ( account.POPEDOMID ==8)
                      {%>
                <li>大区<select name="zone" id="zone">
                    <%
                          List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%
                        }
                     %>
                </select></li>
                <li>办事处
                    <select id="area">
                        
                        <option value="<%=account.AREAID %>">默认</option>
                       
                    </select>
                </li> <% }%>
                <li>开始日期
                    <input type="text" name="beginTime" id="beginTime2" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" /></li>
                <li>结束日期
                    <input type="text" name="endTime" id="endTime2" style="width: 90px" onfocus="setday(this)" value="2010-12-1" /></li>
                 <li>                    
                    <select name="SearchType" id="Select2" style="width: 100px">
                    <option value="0">搜索全部</option>
                    <option value="1">按网吧名称搜索</option>
                    <option value="2">按网吧编号搜索</option>
                    <option value="3">按锁定人姓名搜索</option>
                    <option value="4">按锁定人帐号搜索</option>
                    </select>
                    <input type="text" name="netName2" id="netName2" style="width: 90px"/></li>
            
                <li>
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                        查询</button></li>
            </ul>
        </div>
    </fieldset>
</div>
     <div id="tabs2">
         <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
         <div id="pager3" class="scroll" style="text-align: center;"></div>

        </div>
</div>
 <%Html.RenderPartial("RecordDetailInfo"); %>
 
</div>
<script type="text/javascript">

 
    $('#tabs').tabs();
    var userID = 0;
    var tabsIndex = 0;
    var power = 0;
    var AREAID2=0;
    var mygrid;
    var mygrid2;
    var usernameglobal;
    var uaccountglobal;
    var ip;
    $(document).ready(function() {
        $("#zone").change(function() { loadArea() });
        $("#zone2").change(function() { loadArea2() });
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });



        //根据评分算出小计
        $("#divIframe input[type *= 'radio'][name='rd1']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd1']:checked").val() == -1 || $("input[name='rd2']:checked").val() == -1 || $("input[name='rd3']:checked").val() == -1)
                $("#bigClass1").html(-1);
            else
                $("#bigClass1").html(0);

            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));


        });
        $("#divIframe input[type *= 'radio'][name='rd2']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd1']:checked").val() == -1 || $("input[name='rd2']:checked").val() == -1 || $("input[name='rd3']:checked").val() == -1)
                $("#bigClass1").html(-1);
            else
                $("#bigClass1").html(0);

            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));

        });

        $("#divIframe input[type *= 'radio'][name='rd3']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd1']:checked").val() == -1 || $("input[name='rd2']:checked").val() == -1 || $("input[name='rd3']:checked").val() == -1)
                $("#bigClass1").html(-1);
            else
                $("#bigClass1").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));


        });


        $("#divIframe input[type *= 'radio'][name='rd4']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd4']:checked").val() == -1 || $("input[name='rd5']:checked").val() == -1)
                $("#bigClass2").html(-1);
            else
                $("#bigClass2").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));


        });
        $("#divIframe input[type *= 'radio'][name='rd5']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd4']:checked").val() == -1 || $("input[name='rd5']:checked").val() == -1)
                $("#bigClass2").html(-1);
            else
                $("#bigClass2").html(0);

            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));

        });

        $("#divIframe input[type *= 'radio'][name='rd6']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd6']:checked").val() == -1 || $("input[name='rd7']:checked").val() == -1 || $("input[name='rd8']:checked").val() == -1 || $("input[name='rd9']:checked").val() == -1)
                $("#bigClass3").html(-1);
            else
                $("#bigClass3").html(0);

            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));

        });

        $("#divIframe input[type *= 'radio'][name='rd7']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd6']:checked").val() == -1 || $("input[name='rd7']:checked").val() == -1 || $("input[name='rd8']:checked").val() == -1 || $("input[name='rd9']:checked").val() == -1)
                $("#bigClass3").html(-1);
            else
                $("#bigClass3").html(0);


            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));
        });

        $("#divIframe input[type *= 'radio'][name='rd8']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd6']:checked").val() == -1 || $("input[name='rd7']:checked").val() == -1 || $("input[name='rd8']:checked").val() == -1 || $("input[name='rd9']:checked").val() == -1)
                $("#bigClass3").html(-1);
            else
                $("#bigClass3").html(0);

            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));

        });
        $("#divIframe input[type *= 'radio'][name='rd9']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd6']:checked").val() == -1 || $("input[name='rd7']:checked").val() == -1 || $("input[name='rd8']:checked").val() == -1 || $("input[name='rd9']:checked").val() == -1)
                $("#bigClass3").html(-1);
            else
                $("#bigClass3").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));


        });

        $("#divIframe input[type *= 'radio'][name='rd10']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd10']:checked").val() == -1 || $("input[name='rd11']:checked").val() == -1)
                $("#bigClass4").html(-1);
            else
                $("#bigClass4").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));
        });


        $("#divIframe input[type *= 'radio'][name='rd11']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd10']:checked").val() == -1 || $("input[name='rd11']:checked").val() == -1)
                $("#bigClass4").html(-1);
            else
                $("#bigClass4").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));
        });


        $("#divIframe input[type *= 'radio'][name='rd12']").click(function() {
            //        alert($("input[name='rd1']:checked").val());
            if ($("input[name='rd12']:checked").val() == -1)
                $("#bigClass5").html(-1);
            else
                $("#bigClass5").html(0);
            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));
        });


        //        $("#divIframe input[type *= 'radio'][name='rd13']").click(function() {
        //            //        alert($("input[name='rd1']:checked").val());
        //            if ($("input[name='rd13']:checked").val() == -1)
        //                $("#bigClass6").html(-1);
        //            else
        //                $("#bigClass6").html(0);
        //            $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()) + Number($("#bigClass6").html()));
        //        });
        $("#tab4-account").show(400);

        ip = $("#ip").html();
        $("#ip").hide();
        AREAID2 = $("#AREAID").html();
        // 权限设置
        power = $("#power").html();


        switch (power) {
            //            case "2": $("#tabs").show();                        
            //                $("#tabs-1").show();                        
            //                $("#tabs-2").show();                        
            //                break;                         


            case "8":
                $("#tabs-2").show();
                $("#tabs-1").hide();
                break;
            case "6":

                $("#tabs-2").hide();
                $("#tabs-1").show();
                break;

            case "5":
                $("#tabs-2").hide();
                $("#tabs-1").show();
                break;
            default:

                $("#tabs").hide();
                $("#tabs-1").hide();
                $("#tabs-2").hide();
                alert("您没有权限查看该页面!");

        }



        //隐藏power字段

        uaccountglobal = $("#UCACCOUNT").html();
        usernameglobal = $("#USERNAME").html();
        $("#AREAID").hide();
        $("#power").hide();
        $("#UCACCOUNT").hide();
        $("#USERNAME").hide();

        //初始化时把进入考核隐藏
        $("#tab4-account").hide();




        //点击进入考核为是////pppppppppp
        $("#tab2-userinfo li:last-child > input:first").bind("click", function() {
            if (power == 6) {
                $("#tab4-account").show(400);
            }
            if (power == 8) {

                var netBarId = $("#netNumber").html();
                var netBarName = $("#netName3").html();
                var account = uaccountglobal;
                var popom = 8;



                var newip = ip;

                var type;
                type = 3;


                $("#TextBox1").val("");
                $("#TextBox2").val("");
                $("#TextBox3").val("");
                $("#TextBox4").val("");
                $("#TextBox5").val("");
                $("#TextBox6").val("");
                $("#TextBox7").val("");
                $("#TextBox8").val("");
                $("#TextBox9").val("");
                $("#TextBox10").val("");
                $("#TextBox11").val("");
                $("#TextBox12").val("");
                $("#Text13").val("");


                $.ajax({
                    url: "UpdataCardApply/",
                    type: "POST",
                    data: {
                        NETBARID: netBarId,
                        ACCOUNT: account,
                        NEWIP: ip,
                        TYPE: type

                    },
                    dataType: "json",
                    success: UpdataCardApplySuccess
                });
            }

        });

        function UpdataCardApplySuccess(result) {

            d = new Date();
            var s = "";
            s = s + d.getYear() + "年";
            s += (d.getMonth() + 1) + "月";
            s += d.getDate() + "日  ";


            s += d.getHours() + "时"
            s += d.getMinutes() + "分"

            if (result.isSuccess == 0) {
                $("#PunchCardTime").html(s);
                if (power == 8) {
                    alert("打卡失败(督察员IP与数据库保存的IP不匹配!)");
                    //                    $("#divIframe").dialog("close");
                    return;
                    //                                $("#PunchCardStatus").html("打卡失败(推广员IP与数据库保存的IP不匹配!)");
                }
                //                            else if (power == 6 || power == 8) {
                //                                alert("推广主管和督察主管打卡成功！");
                //                                $("#PunchCardStatus").html("推广主管和督察主管打卡成功！");

                //                            }

            }
            else {
                alert("打卡成功!");



            }
            $("#tab4-account").show(400);


            //                         if (result.isSuccess == 1) {
            //                            $("#PunchCardTime").html(s);
            //                            alert("打卡成功！");
            //                            $("#PunchCardStatus").html("打卡成功！");

            //                        }
            //                        else if (result.isSuccess == 2) {
            //                            alert("该网吧不存在！");
            //                            $("#PunchCardStatus").html("该网吧不存在！");
            //                        }
            //                        else if (result.isSuccess == 3) {
            //                            alert("当天打卡的网吧数量到达了10家！");
            //                            $("#PunchCardStatus").html("当天打卡的网吧数量到达了10家！");
            //                        }
            //                        else if (result.isSuccess == 4) {
            //                            alert("ADSL网吧打卡次数到达了五次！");
            //                            $("#PunchCardStatus").html("ADSL网吧打卡次数到达了五次！");
            //                        }
            //                        else if (result.isSuccess == 5) {

            //                            alert("推广员当天已经打过卡了！");
            //                            $("#PunchCardStatus").html("推广员当天已经打过卡了！");
            //                        }
            //                        else {
            //                            alert("打卡失败，请重试！");
            //                            $("#PunchCardStatus").html("打卡失败，请重试！");
            //                        }



        }


        //点击进入考核为否
        $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

        //            $("#tab4-account").hide(400);
        $("#SearchType").removeClass("test"); 
            $("#divIframe").dialog("close");
        });
        //p
        loadArea();
        //p
        //主管考核页面jqGrid装载
        mygrid = $("#list1").jqGrid({
            width: 790,
            height: 450,
            url: 'RecordReview/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager2'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '已锁定：',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',
            colNames: ['网吧ID', '网吧名称', '省', '市', '所属区/县', '锁定人帐号', '锁定人','录入途径', '上次考核日期'],
            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                       { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'province', index: 'PROVINCE', width: 160, align: 'center' },
                       { name: 'city', index: 'CITY', width: 160, align: 'center' },
                       { name: 'county', index: 'COUNTY', width: 160, align: 'center' },
                       { name: 'bindaccount', index: 'BINDACCOUNT', width: 160, align: 'center' },
                       { name: 'bindname', index: 'BINDNAME', width: 160, align: 'center' },
                       { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center' },
                       { name: 'assigntime', index: 'ASSIGNTIME', width: 160, align: 'center'}],


            onSelectRow: function(rowid) {
                DisplayDetails(rowid);
            }
        });


        //督察考核页面jqGrid装载
        mygrid2 = $("#list2").jqGrid({
            width: 790,
            height: 450,
            url: 'RecordReview/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager3'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '已锁定：',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',
            colNames: ['网吧ID', '网吧名称', '省', '市', '所属区/县', '锁定人帐号', '锁定人', '录入途径', '上次考核日期'],
            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                       { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'province', index: 'PROVINCE', width: 160, align: 'center' },
                       { name: 'city', index: 'CITY', width: 160, align: 'center' },
                       { name: 'county', index: 'COUNTY', width: 160, align: 'center' },
                       { name: 'uaccount', index: 'UACCOUNT', width: 160, align: 'center' },
                       { name: 'username', index: 'USERNAME', width: 160, align: 'center' },
                       { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center' },
                       { name: 'assigntime', index: 'ASSIGNTIME', width: 160, align: 'center'}],


            onSelectRow: function(rowid) {
                DisplayDetails2(rowid);
            }
        });
    });

    //加载督察城市
    function loadArea() {
     
        $.ajax(
             {
                 url: "LoadArea/" + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
    }

    function loadSuccessed(result) {
     
        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });
        }
    }

    //加载主管城市
    function loadArea2() {

        $.ajax(
             {
                 url: "LoadArea/" + $("#zone2").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed2
             });
    }

    function loadSuccessed2(result) {

        $("#area2").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area2"));
            });
        }
    }

    function loadData(index) {
        if (index == undefined) {
            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }

        var areaID;
        var netbarName;

        if (tabsIndex == 0) {
            if (power == 8 || power == 5||power==6)
            {areaID = AREAID2;}
            else if (power == 2)
            { areaID = $("#area").val(); }
       
        netbarName = $("#netName").val();
        if (netbarName != "") {
            if (netbarName != null) {
                if (netbarName.indexOf("script") >= 0) {
                    alert("备注含有非法字符!");
                    return;
                }
            }
            var demo = /^[\u0391-\uFFE5\w]+$/;
            if (!demo.test(netbarName)) {

              ///  alert("网吧名称只能包括中文字、英文字母、数字和下划线!");
              ///  return;


            }
        }
            var beginTime = $("#beginTime").val();
            var endTime = $("#endTime").val();
            var searchtype = $("#Select1").val();
            mygrid.appendPostData({ TypeID: tabsIndex - 1, AreaID: areaID == 0 ? 1 : areaID, Barname: netbarName, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
            mygrid.trigger('reloadGrid');
        }
        else if (tabsIndex == 1) {
        if ( power == 5 || power == 6)
        {areaID = AREAID2; }
        else if (power == 2 || power == 8)
        { areaID = $("#area").val(); }
         
        netbarName = $("#netName2").val();

        if (netbarName != "") {
            if (netbarName != null) {
                if (netbarName.indexOf("script") >= 0) {
                    alert("备注含有非法字符!");
                    return;
                }
            }
            var demo = /^[\u0391-\uFFE5\w]+$/;
            if (!demo.test(netbarName)) {

              ///  alert("网吧名称只能包括中文字、英文字母、数字和下划线!");
              ///  return;


            }
        }
        var beginTime2 = $("#beginTime2").val();
        var endTime2 = $("#endTime2").val();
        var searchtype = $("#Select2").val();
        mygrid2.appendPostData({ TypeID: tabsIndex - 1, AreaID: areaID == 0 ? 1 : areaID, Barname: netbarName, BeginTime: beginTime2, EndTime: endTime2, SearchType: searchtype });
        mygrid2.trigger('reloadGrid');
        }
    
    }

    //显示督察详细信息
    function DisplayDetails2(rowIndex) {

        //获取审批ID
        var rowData = mygrid2.getRowData(rowIndex);
        var userID = rowData.netbarid;

        $.ajax({
            url: "LoadNetDetail/" + userID,
            type: "POST",
            dataType: "json",
            success: NetBarDetailSuccessed
        });
    }


    //显示主管详细信息
    function DisplayDetails(rowIndex) {

        //获取审批ID
        var rowData = mygrid.getRowData(rowIndex);
        var userID = rowData.netbarid;
       
        $.ajax({
        url: "LoadNetDetail/"+userID,
        type: "POST",
        dataType: "json",
        success: NetBarDetailSuccessed
        });
    }

    function NetBarDetailSuccessed(result) {
        if (power == 8)
            $("#liid").html("打卡并进行考核");
        else $("#liid").html("点击进入考核页面");
        $("#netName3").html(result.barname);
        $("#netNumber").html(result.netbarid);
        $("#netlevel").html(result.grade);
        $("#region").html(result.province);
        $("#area2").html(result.city);
        $("#city").html(result.country);
        $("#adressDetail").html(result.address);
        $("#contract").html(result.linkman);
        $("#Tel").html(result.phone);

        $("#LockingPeople").html(result.lockname);
        $("#LockingAccount").html(result.lockaccount);
        $("#LockingTime").html(result.locktime);

        $("#ApplicantName").html(result.applicant);
        $("#ApplicantAccount").html(result.applaccount);
        $("#ApplicantDate").html(result.appltime);

        $("#ExamName").html(result.examinator);
        $("#ExamAccount").html(result.examaccount);
        $("#ExamDate").html(result.examtime);
        
        $("#RecentExaminationsOfPeople").html(result.examinator);
        $("#RecentExaminationsOfTime").html(result.examtime);
        $("#RemakBK").html(result.remark);
        $("#MachineNum").html(result.macnum);
        
        var strIP = result.ipaddress.split(",");
        $("#IPtxt input[type='text']").each(function(i) {
            $(this).remove();
        });

//        $("input[@type=radio]").attr("checked", '2');
        $("#divIframe input[type *= 'radio'][name='tab2-pass']").attr("checked", '');
        $("#tab4-account").hide();
        for (var i = 0; i < strIP.length; i++) {
            
            if(strIP[i]!="")
                $("#IPtxt").append("<input readonly=readonly type=\"text\" value=" + strIP[i] + " id=\"text" + i + "\" /><br/> ");
   
        }
      
        if (result.iptype=="固定IP")
            $("#IPType").attr("value", 1);
        else if (result.iptype == "ADSL")
            $("#IPType").attr("value", 3);
        else if (result.iptype == "IP段")
            $("#IPType").attr("value", 2);
        $("#SearchType").addClass("test"); 
        $("#divIframe").dialog("open");
         
    }

    $(function() {
        $("#divIframe").dialog({
            width: 1100,
            height: 700,
            show: 'drop',
            bgiframe: false,
            autoOpen: false,
            draggable: true,
            resizable: true,
            modal: true,
            dialogClass: "removeCloseBtn",
            closeOnEscape: false,
            position: 'top',
            buttons: {
                "提交": function(event, ui) {

                    if ($("#tab4-account").is(":hidden")) {
                        alert("打卡没有成功无法进行业务考核或您尚未选择“是”进行打卡和业务考核所以无法提交考核表单！");
                        return;
                    }
                    var assessid = "6,7,8,9,10,11,12,13,14,15,16,17";
                    var netbarid = $("#netNumber").html();
                    var point = $("input[name='rd1']:checked").val() + "," + $("input[name='rd2']:checked").val() + "," + $("input[name='rd3']:checked").val() + "," + $("input[name='rd4']:checked").val() + "," + $("input[name='rd5']:checked").val() + "," + $("input[name='rd6']:checked").val() + "," + $("input[name='rd7']:checked").val() + "," + $("input[name='rd8']:checked").val() + "," + $("input[name='rd9']:checked").val();
                    point = point + "," + $("input[name='rd10']:checked").val() + "," + $("input[name='rd11']:checked").val() + "," + $("input[name='rd12']:checked").val();
                    var username = "";
                    var atype;


                    if (power == 6 || power == 5)
                        atype = "1";
                    else if (power == 8)
                        atype = "2";

                    //                    var contract = $("#RecentExaminationsOfPeople").html();
                    var rmark = $("#Text13").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {

                        }
                    }

                    //////////////验证单项备注
                    rmark = $("#TextBox12").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {

                        if ($("input[name='rd12']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox11").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd11']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox10").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd10']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox9").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd9']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox8").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd8']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox7").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd7']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox6").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd6']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }


                    rmark = $("#TextBox5").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd5']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox4").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd4']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox3").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd3']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox2").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd2']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox1").val();

                    if (rmark != "") {
                        if (rmark != null) {
                            if (rmark.indexOf("script") >= 0) {
                                alert("备注含有非法字符!");
                                return;
                            }
                        }
                        var demo = /^[\u0391-\uFFE5\w]+$/;
                        if (!demo.test(rmark)) {
                        }
                    }
                    else {
                        if ($("input[name='rd1']:checked").attr("title") != "否") {
                            alert("单项备注不能为空！");
                            return;
                        }
                    }

                    rmark = $("#TextBox1").val() + "," + $("#TextBox2").val() + "," + $("#TextBox3").val() + "," + $("#TextBox4").val() + "," + $("#TextBox5").val() + "," + $("#TextBox6").val() + "," + $("#TextBox7").val() + "," + $("#TextBox8").val() + "," + $("#TextBox9").val() + "," + $("#TextBox10").val() + "," + $("#TextBox11").val() + "," + $("#TextBox12").val();
                    var rmark2 = $("#Text13").val();

                    ////////////


                    var pram = assessid + "@" + netbarid + "@" + uaccountglobal + "@" + usernameglobal + "@" + atype + "@" + point + "@" + rmark + "@" + rmark2;
                    var randomId = 1;
                    var sRequestUrl = "http://" + location.host + "/Business.aspx/SubmitScore/" + encodeURIComponent(pram);
                   
                    //                    location.replace(sRequestUrl);
                    //requestSvc("randomId", sRequestUrl, "editSuccessed");
                    //                    $.get(sRequestUrl, "", function(response) {
                    //                        alert("提示成功");
                    //                        $("#results").html(response);
                    //                    })

                                                            $.ajax({
                                                                url: "http://" + location.host + "/Business.aspx/SubmitScore/",
                                                                type: "POST",
                                                                data: {
                                                                    ASSESSID: assessid,
                                                                    NETBARID: netbarid,
                                                                    UACCOUNT: uaccountglobal,
                                                                    USERNAME: usernameglobal,
                                                                    ATYPE: atype,
                                                                    POINT: point,
                                                                    RMARK: rmark,
                                                                    RMARK2: rmark2

                                                                },
                                                                dataType: "json",
                                                                success: editSuccessed
                                                            });
                    //                                        

                }
                //                "关闭": function() { $("#divIframe").dialog("close") }
            }
        });
    });
    function requestSvc(id, url, funcName) {
        if (typeof (funcName) == 'undefined') { funcName = 'callbackFunc'; }
//        url += '&func_name=' + funcName;
        oScript = document.getElementById(id);
        var head = document.getElementsByTagName("head").item(0);
        if (oScript) {
            head.removeChild(oScript);
        }
        oScript = document.createElement("script");
        oScript.setAttribute("src", url);
        oScript.setAttribute("id", id);
        oScript.setAttribute("type", "text/javascript");
        oScript.setAttribute("language", "javascript");

        head.appendChild(oScript);
       
        return oScript;
    }
    function editSuccessed(result) {
       
        if (result.isSuccess) {
            alert("提交成功!");
            $("#divIframe").dialog("close");
        }
        else {
            alert("提交失败!");
            $("#divIframe").dialog("close");
         }
    }

</script>
</asp:Content>
