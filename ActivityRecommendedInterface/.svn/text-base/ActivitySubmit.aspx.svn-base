<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	网吧活动导入
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
<% string SaveSelected = (string)Session["SaveSelected"];
   if (SaveSelected == null)
   {
       SaveSelected = string.Empty;
   }
    %>
    <span id="power"><%=account.POPEDOMID %></span> 
    <span id="ukey"><%=account.UKEY %></span>
    <span id="myareaid"><%=account.AREAID%></span>
    <span id="saved"><%=SaveSelected%></span>  --%>  
    <div>
     <ul style="text-align:left">
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
                  办事处
        
          <select id="area"><option value="">默认</option></select><%--  查询时间:
                     <select style="width:95px;margin-left:1px; vertical-align:bottom" name="beginTime2" id="beginTime2">
                        <%
                            System.DateTime t = System.DateTime.Now;
                            var tempMonth = 0;
                            var YearMonth = "";
                            if (t.Day >= 25)
                            {
                                tempMonth = t.Month + 1;

                            }
                            else
                            {
                                tempMonth = t.Month;
                            }
                            for (int z = 1; z < tempMonth; z++)
                            {

                                YearMonth = t.Year.ToString() + "-" + z.ToString();
                        %>
                         <option value="<%=YearMonth%>">
                            <%=YearMonth%></option>
                        <%  } %>
                    </select>--%>
           <select name="Select2" id="Select2">
               <option value="0">搜索全部</option>
               <option value="1">网吧名称</option>
               <option value="2">网吧编号</option>
                 
                  <%--  <option value="3">推广员姓名</option>
                    <option value="4">推广员帐号</option>--%>
                    </select><input type="text" name="TuiGuang" id="TuiGuang" style="width: 90px"/>
           <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                           查询
                       </button>
               
                </ul>
       
       </div>
        <br />
       <div style="color:Blue">查询总计:<span id="totalsum"></span></div>
  <div id="tabs">
        <ul>
            <li><a href="#tabs1">查询结果</a></li>
            
        </ul>
        <div id="tabs1">
       <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager" class="scroll" style="text-align: center;"></div>
      </div>
     
           
    </div>
    <p></p>
   <%-- <div style="text-align: center">
        点击网吧名称查看网吧具体信息
    </div>--%>
    <center style="margin-top:10px">
        <button  id="btn1" style="margin-left:15px" class="ui-state-default ui-corner-all" type="button" onclick="svRow()">确认提交</button>
    </center>
        <div id="divIframe" title="信息提交中...." style="text-align: center;  width: 670px">
        <span id="displayInfo">
        <img src="/Content/images/ajax-loader.gif" /><br /></span>
            <span id="msg"></span>
            <span id="msg1"></span>
            <span id="msg2"></span>
            <span id="msg3"></span>
            <span id="msg4"></span>
            <span id="msg5"></span>
            <span id="msg6"></span>
        <p id="closeDailog" style="text-align: center">
            <button  id="okbtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="init()">
                确定</button>
        </p>
    </div>
<script type="text/javascript">

     $('#tabs').tabs();
     $("#power").hide();
     $("#ukey").hide();
     $("#myareaid").hide();
     $("#saved").hide();
     
    var mygrid;
    var tabsIndex;
    var power;
    var idstring;
    var selectedRows = "";

    var PROV = "";
    var CITY = "";
    var ACTDATE = "";
    var PERIOD = "";
    var BARNAME = "";
    var ADDRESS = "";
    var GAMECODE = "";
    $.timeEntry.setDefaults({ show24Hours: true, separator: ':',
        ampmPrefix: '', ampmNames: ['AM', 'PM'],
        spinnerTexts: ['当前', '左移', '右移', '加一', '减一']
    });


    $(function() {
        $("#divIframe").dialog({
            width: 500,
            //height: 600,
            show: 'drop',
            bgiframe: false,
            autoOpen: false,
            draggable: true,
            resizable: true,
            modal: true,
            dialogClass: "removeCloseBtn",
            closeOnEscape: false
        });
    });
    $(document).ready(function() {
        loadArea();
      
        $("#zone").change(function() { loadArea(); });
        var a = $('#saved').html();
        if (a == null) {
            a = "";
        }
        selectedRows = a;
        ///////////////////
        $("#Select2").bind('click', function() {
            if ($("#Select2").val() == 0) {
                $("#uaccount").val('');
            }
        });



        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        var lastsel3;

        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'http://' + location.host + '/ActivityRecommendedInterface.aspx/NetBarQuery2/',
            //            editurl: 'http://' + location.host + '/ActivityRecommendedInterface.aspx/NetBarQuery2/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',
            loadtext: 'loading....',
            colNames: ['省份', '城市', '日期', '时段', '网吧名', '网吧地址', '游戏产品', '选择导入', '网吧编号'],

            colModel: [{ name: 'prov', index: 'PROV', width: 80, align: 'center' },
                       { name: 'city', index: 'CITY', width: 80, align: 'center' },
                       { name: 'actdate', index: 'ACTDATE', width: 100, align: 'center', sorttype: "date", editable: true, sortable: false },
                       { name: 'period', index: 'PERIOD', width: 80, align: 'center', editable: true },
                       { name: 'barname', index: 'BARNAME', width: 200, align: 'center' },
                       { name: 'address', index: 'ADDRESS', width: 240, align: 'center' },
                       { name: 'gamecode', index: 'GAMECODE', width: 100, align: 'center', editable: true },
                       { name: 'importbool', index: 'IMPORTBOOL', align: 'center', width: 60, editable: true, edittype: "checkbox", editoptions: { value: "True:False"} },
                       { name: 'netbarid', index: 'NETBARID', width: 1, align: 'center', hide: "true" },
                       ],

            loadComplete: function() {
                var sumrecords = $("#list").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                for (icount = $("#list")[0].rows.length - 1; icount >= 1; icount--) {
                    jQuery('#list').editRow(icount);
                    //记录所有行号
                    if (icount == $("#list")[0].rows.length - 1) {
                        idstring = icount;
                    }
                    else {
                        idstring = idstring + "," + icount;
                    }
                    //把已沟选的行，打上沟
                    var rowNetbarid = mygrid.getRowData(icount).netbarid;
                    if (selectedRows.indexOf(";" + rowNetbarid + ";") >= 0) {
                        $('#' + icount + "_importbool").attr('checked', 'true');
                    }

                }

            },
            onSelectRow: function(id) {

                if (id && id !== lastsel3) {
                    //                    $("#list").restoreRow(idstring);
                    //                    jQuery('#list').editRow(id);
                    //                    lastsel3 = lastsel3 + "," + id;


                    jQuery('#list').saveRow(lastsel3);
                    jQuery('#list').editRow(id, true, pickdates);

                    lastsel3 = id;

                }
                if ($('#' + id + "_importbool").attr('checked') == true) {
                    selectedRows = selectedRows + ";" + mygrid.getRowData(id).netbarid + ";" + ",";
                    PROV = PROV + ";" + mygrid.getRowData(id).prov + ";" + ",";
                    CITY = CITY + ";" + mygrid.getRowData(id).city + ";" + ",";
                    tmp = mygrid.getRowData(id).actdate;
                    if (tmp.indexOf('value=') >= 0)
                        ACTDATE = ACTDATE + ";" + mygrid.getRowData(id).actdate.substring(mygrid.getRowData(id).actdate.indexOf('value=') + 6, mygrid.getRowData(id).actdate.indexOf(">")) + ";" + ",";
                    else
                        ACTDATE = ACTDATE + ";" + "" + ";" + ",";


                    tmp = mygrid.getRowData(id).period;
                    if (tmp.indexOf('value=') >= 0)
                        PERIOD = PERIOD + ";" + mygrid.getRowData(id).period.substring(mygrid.getRowData(id).period.indexOf('value=') + 6, mygrid.getRowData(id).period.indexOf(">")) + ";" + ",";
                    else
                        PERIOD = PERIOD + ";" + "" + ";" + ",";
                    BARNAME = BARNAME + ";" + mygrid.getRowData(id).barname + ";" + ",";
                    ADDRESS = ADDRESS + ";" + mygrid.getRowData(id).address + ";" + ",";
                    tmp = mygrid.getRowData(id).gamecode;
                    if (tmp.indexOf('value=') >= 0)
                        GAMECODE = GAMECODE + ";" + mygrid.getRowData(id).gamecode.substring(mygrid.getRowData(id).gamecode.indexOf('value=') + 6, mygrid.getRowData(id).gamecode.indexOf(">")) + ";" + ",";
                    else
                        GAMECODE = GAMECODE + ";" + "" + ";" + ",";
                }
                else {
                    if (selectedRows.indexOf(";" + mygrid.getRowData(id).netbarid + ";") >= 0) {
                        selectedRows = selectedRows.replace(";" + mygrid.getRowData(id).netbarid + ";" + ",", "");
                        PROV = PROV.replace(";" + mygrid.getRowData(id).prov + ";" + ",", "");
                        CITY = CITY.replace(";" + mygrid.getRowData(id).city + ";" + ",", "");
                        tmp = mygrid.getRowData(id).actdate;
                        if (tmp.indexOf('value=') >= 0)
                            ACTDATE = ACTDATE.replace(";" + mygrid.getRowData(id).actdate.substring(mygrid.getRowData(id).actdate.indexOf('value=') + 6, mygrid.getRowData(id).actdate.indexOf(">")) + ";" + ",", "");
                        else
                            ACTDATE = ACTDATE.replace(";" + "" + ";" + ",", "");
                        tmp = mygrid.getRowData(id).period;
                        if (tmp.indexOf('value=') >= 0)
                            PERIOD = PERIOD.replace(";" + mygrid.getRowData(id).period.substring(mygrid.getRowData(id).period.indexOf('value=') + 6, mygrid.getRowData(id).period.indexOf(">")) + ";" + ",", "");
                        else
                            PERIOD = PERIOD.replace(";" + "" + ";" + ",", "");
                        BARNAME = BARNAME.replace(";" + mygrid.getRowData(id).barname + ";" + ",", "");
                        ADDRESS = ADDRESS.replace(";" + mygrid.getRowData(id).address + ";" + ",", "");
                        tmp = mygrid.getRowData(id).gamecode;
                        if (tmp.indexOf('value=') >= 0)
                            GAMECODE = GAMECODE.replace(";" + mygrid.getRowData(id).gamecode.substring(mygrid.getRowData(id).gamecode.indexOf('value=') + 6, mygrid.getRowData(id).gamecode.indexOf(">")) + ";" + ",", "");
                        else
                            GAMECODE = GAMECODE.replace(";" + "" + ";" + ",", "");
                    }
                }

            }
        });



        $("#list").hideCol("netbarid");

    });


    function loadArea() {
        $.ajax({
            url: "http://" + location.host + "/ActivityRecommendedInterface.aspx/LoadArea/" + $("#zone").val(),
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
    }

    function areaSuccessed(result) {

        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });
        }
    }

//    function loadDelay() {
//        
//          setTimeout("loadData(0)", 1000);
//      }

    function loadData(index) {

        if (index == "undefined" || index == undefined) {

            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            index = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }


        var areaID = $("#area").val();
        d = new Date();
        var s = "";
        s = s + d.getYear() + "-";
        s += (d.getMonth() + 1) + "-";
        s += d.getDate() - 1;
        var s2 = "";
        s2 = s2 + d.getYear() + "-";
        s2 += (d.getMonth() + 1) + "-";
        s2 += d.getDate();

        //        s += d.getHours() + "时"
        //        s += d.getMinutes() + "分"
        var beginTime = "2009-9-1";
        var endTime = "2012-12-1";
        var account = $("#TuiGuang").val();
        var searchtype = $("#Select2").val();
        var NetBarID = $("#TuiGuang").val();


        if (account == "") {
            searchtype = 0;
        }
        mygrid.clearGridData();
        mygrid.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 16 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });


        if ($("#list").getGridParam("records") != null)
            $("#totalsum").text($("#list").getGridParam("records"));
        else
            $("#totalsum").text(0);
        mygrid.trigger('reloadGrid');
    }

    //单击某行出现开始时间和结束时间
    function pickdates(id) {
        jQuery("#" + id + "_ACTIONBEGINTIME", "#list").timeEntry({ spinnerImage: '/Script/jqtentry/spinnerDefault.png' });
        jQuery("#" + id + "_ACTIONENDTIME", "#list").timeEntry({ spinnerImage: '/Script/jqtentry/spinnerDefault.png' });
        jQuery("#" + id + "_ACTIONDATE", "#list").datepicker({ dateFormat: "yy-mm-dd" });
    }


    //删除某行
    function deleterow(id) {
        var gr = jQuery("#list").getGridParam('selrow');
        if (id != null) {

            var r = confirm("确认删除？");
            if (r == true) {
                $('#list').delRowData(id + 1);
                var ids = jQuery("#list").getDataIDs();
                $("#ImportedNum").html(ids.length);
                var json_data;

                $.ajax({
                    url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ClearModels/",
                    type: "POST",
                    dataType: "json"
                });
                if (ids.length > 0) {
                    for (var i = 0; i < ids.length; i++) {
                        rowdata = mygrid.getRowData(ids[i]);
                        json_data = { sNetbarId: rowdata.NETBARID, NETBARNAME: rowdata.NETBARNAME.substring(rowdata.NETBARNAME.indexOf('>') + 1, rowdata.NETBARNAME.indexOf("</A>")), ACTIONDATE: rowdata.ACTIONDATE, ACTIONBEGINTIME: rowdata.ACTIONBEGINTIME, ACTIONENDTIME: rowdata.ACTIONENDTIME, FLIGHTSNUMBER: rowdata.FLIGHTSNUMBER, ACTIONFEES: rowdata.ACTIONFEES, act: '' };

                        $.ajax({
                            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/SaveModels/",
                            type: "POST",
                            dataType: "json",
                            data: json_data
                        });
                    }
                }
            }
        }
        else alert("请选择要删除的行!");
    }


    function svRow() {

        var ids = jQuery("#list").getDataIDs();
        for (var ki = 0; ki < ids.length; ki++) {
            jQuery('#list').saveRow(ids[ki]);
        }
        setTimeout("submitInfo()", 700);
        jQuery('#list').resetSelection();
    }
    //提交数据
    var countResult = 0;
    var vErr = "";
    function submitInfo() {


        $('#msg').text("");
        $('#msg1').text("");
        $('#msg2').text("");
        $('#msg3').text("");
        $('#msg4').text("");
        $('#msg5').text("");
        $('#msg6').text("");

        var ids = jQuery("#list").getDataIDs();

        if (ids.length <= 0) {
            alert("请先查询网吧再提交推荐网吧!");
            return;
        }



        $("#displayInfo").show();
        $("#msg").text("信息处理中");

        $("#closeDailog").hide();
        $("#divIframe").dialog("open");



        //var ids = jQuery("#list").getDataIDs();
        $("#ImportedNum").html(ids.length);


        $("#btn1").attr("disabled", true);

        var nid = selectedRows.replace(new RegExp(';', "gm"), '');
        nid = nid.substr(0, nid.length - 1);

        
        var provid = PROV.replace(new RegExp(';', "gm"), '');
        provid = provid.substr(0, provid.length - 1);
        provid = provid.split(",");


        var cityid = CITY.replace(new RegExp(';', "gm"), '');
        cityid = cityid.substr(0, cityid.length - 1);
        cityid = cityid.split(",");


        var actdateid = ACTDATE.replace(new RegExp(';', "gm"), '');
        actdateid = actdateid.substr(0, actdateid.length - 1);
        actdateid = actdateid.split(",");

        var periodid = PERIOD.replace(new RegExp(';', "gm"), '');
        periodid = periodid.substr(0, periodid.length - 1);
        periodid = periodid.split(",");


        var barnameid = BARNAME.replace(new RegExp(';', "gm"), '');
        barnameid = barnameid.substr(0, barnameid.length - 1);
        barnameid = barnameid.split(",");

        var addressid = ADDRESS.replace(new RegExp(';', "gm"), '');
        addressid = addressid.substr(0, addressid.length - 1);
        addressid = addressid.split(",");

        var gamecodeid = GAMECODE.replace(new RegExp(';', "gm"), '');
        gamecodeid = gamecodeid.substr(0, gamecodeid.length - 1);
        gamecodeid = gamecodeid.split(",");



        //发送参数保存数据
        var vErr = "";

     
        for (var i = 0; i < provid.length; i++) {

            var json_data;

            json_data = { V_PROV: provid[i], V_CITY: cityid[i], V_COUNTRY: cityid[i], V_ACTDATE: actdateid[i], V_BARNAME: barnameid[i], V_ADDRESS: addressid[i], V_AREAID: $("#area").val(), V_PERIOD: periodid[i],V_GAMECODE:gamecodeid[i] };
       
            
            $.ajax({
            url: "http://" + location.host + "/ActivityRecommendedInterface.aspx/SubmitActivityBar/",
                type: "POST",
                dataType: "json",
                data: json_data,
                success: fActionSubmitSuccessed
            });

        }
    }


    var provid = PROV.replace(new RegExp(';', "gm"), '');
    provid = provid.substr(0, provid.length - 1);
    provid = provid.split(",");
    function fActionSubmitSuccessed(result) {
        if (result.isSuccess == 1) {
            countResult = countResult + 1;
            vErr = vErr + "1" + "," + result.barid + "@"
        }
        else if (result.isSuccess == 0) {
            //alert("同一网吧同一单号的活动一个星期之内超过了两次！  网吧ID:" + result.barid);
            vErr = vErr + "0" + "," + result.barid + "@"
        }
        else if (result.isSuccess == 2) {
            //alert("没有数据！网吧ID:" + result.barid);
            vErr = vErr + "2" + "," + result.barid + "@"
        }
        else if (result.isSuccess == 3) {
            //alert("太多行！网吧ID:" + result.barid);
            vErr = vErr + "3" + "," + result.barid + "@"
        }
        else if (result.isSuccess == 4) {
            //alert("索引冲突！网吧ID:" + result.barid);
            vErr = vErr + "4" + "," + result.barid + "@"
        }
        else if (result.isSuccess == 5) {
            //alert("添加失败！网吧ID:" + result.barid);
            vErr = vErr + "5" + "," + result.barid + "@"
        }
        var ids = jQuery("#list").getDataIDs();
        var m0 = "";
        var m1 = "";
        var m2 = "";
        var m3 = "";
        var m4 = "";
        var m5 = "";

        if (result.detailcount == provid.length) {
            if (countResult == provid.length) {
                $("#btn1").attr("disabled", false);
                $("#displayInfo").hide();
                $("#closeDailog").show();
                $("#msg").text("");
                $("#msg").text("活动提交成功！");
                $("#msg").append("<br/>")

                glogActId = "";
                //alert("活动提交成功！");
                //str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionSubmit/";
                //location.reload(str);

            }
            else {
                $("#displayInfo").hide();
                $("#closeDailog").show();
                $("#btn1").attr("disabled", false);
                vErr = vErr.substr(0, vErr.length - 1);
                var resultAll = vErr.split('@');
                for (idx = 0; idx < resultAll.length; idx++) {
                    var msgone = resultAll[idx].split(',');

                    if (msgone[0] == 0) {
                        //同一网吧同一单号的活动一个星期之内超过了两次
                        if (m0 == "") {
                            m0 = "同一网吧同一单号的活动一个星期之内超过了两次！网吧ID:"
                        }
                        m0 = m0 + msgone[1] + ",";
                    }
                    else if (msgone[0] == 1) {
                        //提交成功
                        if (m1 == "") {
                            m1 = "提交成功的网吧！网吧ID:"
                        }
                        m1 = m1 + msgone[1] + ",";
                    }
                    else if (msgone[0] == 2) {
                        //没有数据
                        if (m2 == "") {
                            m2 = "没有数据！网吧ID:"
                        }
                        m2 = m2 + msgone[1] + ",";
                    }
                    else if (msgone[0] == 3) {
                        //太多行
                        if (m3 == "") {
                            m3 = "太多行！网吧ID:"
                        }
                        m3 = m3 + msgone[1] + ",";
                    }
                    else if (msgone[0] == 4) {
                        //索引冲突
                        if (m4 == "") {
                            m4 = "索引冲突！网吧ID:"
                        }
                        m4 = m4 + msgone[0] + ",";
                    }
                    else if (msgone[0] == 5) {
                        //添加失败
                        if (m5 == "") {
                            m5 = "添加失败的网吧！网吧ID:"
                        }
                        m5 = m5 + msgone[0] + ",";
                    }
                }
                $("#msg").text("");
                if (m0 != "") {
                    $("#msg").text(m0.substr(0, m0.length - 1));
                    $("#msg").append("<br/>")
                }
                if (m1 != "") {
                    $("#msg1").text(m1.substr(0, m1.length - 1));
                    $("#msg1").append("<br/>")
                }
                if (m2 != "") {
                    $("#msg2").text(m2.substr(0, m2.length - 1));
                    $("#msg2").append("<br/>")
                }
                if (m3 != "") {
                    $("#msg3").text(m3.substr(0, m3.length - 1));
                    $("#msg3").append("<br/>")
                }
                if (m4 != "") {
                    $("#msg4").text(m4.substr(0, m4.length - 1));
                    $("#msg4").append("<br/>")
                }
                if (m5 != "") {
                    $("#msg5").text(m5.substr(0, m5.length - 1));
                    $("#msg5").append("<br/>")
                }

                if (m1 == "") {
                    $("#msg6").text("活动提交失败！");
                }
                else {
                    $("#msg1").text("提交的活动单号为" + glogActId + "！");
                    glogActId = "";
                }

            }
        }

    }

    function init() {
        
        if ($("#msg").text() == "活动提交成功！") {
            $('#msg').text("");
            $('#msg1').text("");
            $('#msg2').text("");
            $('#msg3').text("");
            $('#msg4').text("");
            $('#msg5').text("");
            $('#msg6').text("");
      
            var str = "http://" + location.host + "/ActivityRecommendedInterface.aspx/ActivitySubmit/";
            location.reload(str);
        }
        else {

            $('#msg').text("");
            $('#msg1').text("");
            $('#msg2').text("");
            $('#msg3').text("");
            $('#msg4').text("");
            $('#msg5').text("");
            $('#msg6').text("");
      
            var str = "http://" + location.host + "/ActivityRecommendedInterface.aspx/ActivitySubmit/";
            location.reload(str);
            $('#divIframe').dialog('close');
        }
    }

    //网吧导入按钮
    function NetbarImport() {

        var ids = jQuery("#list").getDataIDs();
        var json_data;

        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ClearModels/",
            type: "POST",
            dataType: "json"
        });
        if (ids.length > 0) {
            for (var i = 0; i < ids.length; i++) {
                rowdata = mygrid.getRowData(ids[i]);
                json_data = { sNetbarId: rowdata.NETBARID, NETBARNAME: rowdata.NETBARNAME.substring(rowdata.NETBARNAME.indexOf('>') + 1, rowdata.NETBARNAME.indexOf("</A>")), ACTIONDATE: rowdata.ACTIONDATE, ACTIONBEGINTIME: rowdata.ACTIONBEGINTIME, ACTIONENDTIME: rowdata.ACTIONENDTIME, FLIGHTSNUMBER: rowdata.FLIGHTSNUMBER, ACTIONFEES: rowdata.ACTIONFEES, act: '' };

                $.ajax({
                    url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/SaveModels/",
                    type: "POST",
                    dataType: "json",
                    data: json_data
                });
            }
        }
        var prm1 = BASE64.encode($('#GAME').val() + ',' + $('#ActiveType').val() + ',' + $('#ASNumber').val() + ',' + $('#FieldNum').val() + ',' + "" + ',' + s);
        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadNetbarImport/" + prm1;
        location.reload(str);
    }



    function loadActivity() {
        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/loadActivity/" + encodeURIComponent($("#GAME").val()),
            type: "POST",
            dataType: "json",
            success: loadSuccessed
        });
    }


    function loadSuccessed(result) {

        $("#ASNumber").empty();
        $("#FieldNum").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {

                //根据返回存放活动场次和活动单号
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#ASNumber"));

                $("<option></option>").val(item.cell[2]).text(item.cell[2]).appendTo($("#FieldNum"));
            });
        }
    }

    function LoadFieldNum() {
        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadFieldNum/" + encodeURIComponent($("#GAME").val() + "," + $("#ASNumber").find('option:selected').val()),
            type: "POST",
            dataType: "json",
            success: loadFieldNumSuccessed
        });
    }
    function loadFieldNumSuccessed(result) {
        $('#FieldNum').attr('value', result.fieldnum)
    }

    function isDate(dateString) {
        if (dateString.trim() == "") return true;
        //年月日正则表达式
        var r = dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (r == null) {
            alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2008-08-08\n\r");
            return false;
        }
        var d = new Date(r[1], r[3] - 1, r[4]);
        var num = (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
        if (num == 0) {
            alert("请输入格式正确的日期\n\r日期格式：yyyy-mm-dd\n\r例    如：2008-08-08\n\r");
        }
        return (num != 0);

    }



        ///////////////////////////////////
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