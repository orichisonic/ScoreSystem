<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动提交
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
       
        <span id="ukey">
            <%=
                account.UKEY %></span>
          <span id="myareaid"><%=account.AREAID%></span>
          <span id="AREANAME"><%=account.AREANAME%></span>
             <%
    
            TGProject.Models.WModels.ActionSubmitBackCondition condtion = (TGProject.Models.WModels.ActionSubmitBackCondition)ViewData["SubmitCondition"];
            string sGameids = "0";
            string sActTypes = "1";
            string sAsNums = "";
            string sFieldNums = "";
            string sActSids = "";
            string submitDates = "";
            if (condtion != null)
            {
                sGameids = condtion.GameId;
                sActTypes = condtion.ActTypeId;
                sAsNums = condtion.ActDanHao;
                sFieldNums = condtion.ActChangCi;
                sActSids = condtion.ActSid;
                submitDates = condtion.SubmitDate;
            }
            else
            {
                sGameids = "0";
                sActTypes = "1";
                sAsNums = "";
                sFieldNums = "";
                sActSids = "";
                submitDates = "";
            }
        %>
        <span id="gamids"><%=sGameids%></span>
        <span id="acttypes"><%=sActTypes%></span>
        <span id="asnums"><%=sAsNums%></span>
        <span id="fieldnums"><%=sFieldNums%></span>
        <span id="actsids"><%=sActSids%></span>
 <div id="ChargeCondition">
    <fieldset>
        <legend>活动提交（办事处帐号）</legend>
        <div style="text-align: center">
         <ul class="vertical" style="text-align: left; color:Blue;">
             <li></li>
            <li style="vertical-align:bottom; text-align: left;">
             执行方：<span id="Implementation" style=" color:Red; "><b><%=account.AREANAME%></b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动提交日期：<b><span style=" color:Red; "id="ActiveSubmitDate"><%=DateTime.Now.ToShortDateString() %></span></b></li>
             <li></li>
            <li style="vertical-align:bottom; text-align: left;">同一单号的不同类型活动请分别提交。</li>
             <li></li>
            <li style="vertical-align:bottom; text-align: left;">活动游戏：<select  style="width:106px;" name="GAME" id="GAME">
                  <%--  <option  value="0">所有游戏</option>    --%>
                   <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                          { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                活动类型： 
                <select name="ActiveType" id="ActiveType">
                <%  List<TGProject.Models.TGSACTTYPEQUERY> ActiveTypeList = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["ActiveType"];
                  foreach (TGProject.Models.TGSACTTYPEQUERY ActiveType in ActiveTypeList)
                  {%>
                  <option value="<%=ActiveType.TYPEID%>"><%= ActiveType.TYPENAME%></option>
                <%}  %></select>&nbsp;&nbsp;&nbsp;&nbsp; 
                活动单号：<select name="ASNumber" id="ASNumber" style="width: 131px"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                活动场次： 
                <select name="FieldNum" id="FieldNum" 
                    style="width: 48px"  disabled="disabled"></select>
            </li> 
            <li></li>
            <ul style="text-align: left; vertical-align:bottom;">
            <li>
                <button style="margin-left:2px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="NetbarImport()">网吧导入</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                已导入网吧：<span style=" color:Red; "  id="ImportedNum"><b></b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 同一网吧不得导入超过2次（允许2次）
            </li>
            </ul>
</ul>
        </div>
    </fieldset>
</div>
<div id="tabs">
    <ul>
        <li><a href="#tabs1">查询结果</a></li>
    </ul>
    <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
    </div>
    </div>
    <p></p>
    <div style="text-align: center">
        点击网吧名称查看网吧具体信息
    </div>
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
    $("#pager").hide();

    $("#gamids").hide();
    $("#acttypes").hide();
    $("#asnums").hide();
    $("#fieldnums").hide();
    $("#actsids").hide()
    $("#ImportedNum").html("0")
    $("#AREANAME").hide()
    
    var mygrid;
    var tabsIndex;
    var power;
    var idstring;
    //时间控件初始化
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
        
        $("#pager").hide();
        $("#GAME").change(function() { loadActivity() });
        $("#ASNumber").change(function() { LoadFieldNum() }); 

        //////////////////////
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        $("#pager").hide();
        var gid = $('#gamids').html();
        var atype = $('#acttypes').html();
        var asnum = $('#asnums').html();
        var fnums = $('#fieldnums').html();
        var submitdates = $('#submitDates').html();
        $('#GAME').attr('value', gid);
        $('#ActiveType').attr('value', atype);
        $('#ASNumber').attr('value', asnum);
        $('#FieldNum').attr('value', fnums);
        $('#ActiveSubmitDate').attr('value', submitdates);
        loadActivity();

        //网吧信息
        var lastsel3;
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadActionSubmit/",
            editurl: "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadActionSubmit/",
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 1200,
            rowList: [20, 40, 60, 1200],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            recordtext: '条记录',
            sortorder: "desc",
            loadtext: 'loading....',
            colNames: ['网吧ID', '网吧名称', '活动日期', '活动开始时间', '活动结束时间', '包机数量', '活动费用', '删除'],

            colModel: [{ name: 'NETBARID', index: 'NETBARID', width: 50, align: 'center', sortable: false },
                        { name: 'NETBARNAME', index: 'NETBARNAME', width: 160, align: 'center', sortable: false },
                        { name: 'ACTIONDATE', index: 'ACTIONDATE', width: 100, align: 'center', sorttype: "date", editable: true, sortable: false },
                        { name: 'ACTIONBEGINTIME', index: 'ACTIONBEGINTIME', width: 100, align: 'center', editable: true, sortable: false },
                        { name: 'ACTIONENDTIME', index: 'ACTIONENDTIME', width: 100, align: 'center', editable: true, sortable: false },
                        { name: 'FLIGHTSNUMBER', index: 'FLIGHTSNUMBER', width: 100, align: 'center', editable: true, sortable: false },
                        { name: 'ACTIONFEES', index: 'ACTIONFEES', width: 100, align: 'center', editable: true, sortable: false },
                        { name: 'act', index: 'act', width: 50, align: 'center', sortable: false}],
            loadComplete: function() {
                //                var sumrecords = $("#list").getGridParam("records");
                //                if (sumrecords != null) {
                //                    $('#totalsum').text(sumrecords);
                //                }
                var ids = jQuery("#list").getDataIDs();
                $("#ImportedNum").html(ids.length);
                for (var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    se = "<input id=" + i + "_DelBtn" + "style='height:22px;width:40px;' type='button' value='删除' onclick=deleterow("+i+"); />";
                    $("#list").setRowData(cl, { act: se });
                }
            },
            onSelectRow: function(id) {
                if (id && id !== lastsel3) {
                    jQuery('#list').saveRow(lastsel3);
                    jQuery('#list').editRow(id, true, pickdates);
                    lastsel3 = id;
                }
            }
        })
        $("#pager").hide();

    });
    
    
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
    function submitInfo() {

        if ($("#ASNumber").val() == "" || $("#ASNumber").val() == null) {
            alert("请选择有游戏活动的游戏来获得游戏单号!");
            return;
        }
        if ($("#FieldNum").val() == "" || $("#FieldNum").val() == null) {
            alert("请选择有游戏活动的游戏来获得游戏场次!");
            return;
        }
        $('#msg').text("");
        $('#msg1').text("");
        $('#msg2').text("");
        $('#msg3').text("");
        $('#msg4').text("");
        $('#msg5').text("");
        $('#msg6').text("");

        var ids = jQuery("#list").getDataIDs();

        if (ids.length <= 0) {
            alert("请先导入网吧再进行操作!");
           return;
        }

        //检查数据合法性
        var ids = jQuery("#list").getDataIDs();
//        for (var ki = 0; ki < ids.length; ki++) {
//            jQuery('#list').saveRow(ids[ki]);
//        }

        for (var i = 0; i < ids.length; i++) {
            
            rowdata = mygrid.getRowData(ids[i]);

            if (rowdata.ACTIONDATE == "") {
                alert("活动日期不可为空!");
                return false;
            }

            if (rowdata.ACTIONBEGINTIME == "") {
                alert("开始时间不可为空!");
                return false;
            }

            if (rowdata.ACTIONENDTIME == "") {
                alert("结束时间不可为空!");
                return false;
            }

            if (rowdata.FLIGHTSNUMBER == "" || rowdata.FLIGHTSNUMBER == 0 || rowdata.FLIGHTSNUMBER == "0") {
                alert("包机数量不可为0或空!");
                return false;
            }

            if (rowdata.ACTIONFEES == "" || rowdata.ACTIONFEES == 0 || rowdata.ACTIONFEES == "0") {
                alert("活动费用不可为0或空!");
                return false;
            }

            if (rowdata.ACTIONBEGINTIME >= rowdata.ACTIONENDTIME) {
                alert("开始时间不大于结束时间!");
                return false;
            }
        }

        $("#displayInfo").show();
        $("#msg").text("信息处理中");

        $("#closeDailog").hide();
        $("#divIframe").dialog("open");
        
        
        
        //var ids = jQuery("#list").getDataIDs();
        $("#ImportedNum").html(ids.length);

        
        $("#btn1").attr("disabled", true);
        var pram = $("#ASNumber").val() + "," + $("#ActiveType").val() + "," + $("#ukey").html();
        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActSingleAdd/" + encodeURIComponent(pram),
            type: "POST",
            dataType: "json",
            success: ActSingleAddSuccessed
        });
    }

    var glogActId = "";
    function ActSingleAddSuccessed(result) {
        glogActId = "";
        d = new Date();
        var s = "";
        s = s + d.getYear() + "-";
        s += (d.getMonth() + 1) + "-";
        s += d.getDate() + "  ";

        s += d.getHours() + "-"
        s += d.getMinutes() + ""

        $("#ActiveSubmitDate").html(s);
        if (result.isSuccess == 0) {

            alert("添加失败！");
            $("#btn1").attr("disabled", false);
        }

        else if (result.isSuccess == 1) {
        //alert("成功！");
            glogActId = result.sActSID;
            var ids = jQuery("#list").getDataIDs();
            if (ids.length > 0) {
                fActionSubmit(result.sActSID);
            }
        }
        else if (result.isSuccess == 2) {
            alert("没有数据！");
            $("#btn1").attr("disabled", false);
        }
        else if (result.isSuccess == 3) {
            alert("太多行！");
            $("#btn1").attr("disabled", false);
        }
        else if (result.isSuccess == 4) {
            alert("索引冲突！");
            $("#btn1").attr("disabled", false);
        }
        else if (result.isSuccess == 5) {
            alert("添加失败！");
            $("#btn1").attr("disabled", false);
        }
        
    }
    var countResult=0;

    //发送参数保存数据
    var vErr = "";
    function fActionSubmit(v_ActSid) {
        var ids = jQuery("#list").getDataIDs();
        vErr = "";
        countResult = 0;
        for (var i = 0; i < ids.length; i++) {

            var json_data;
            rowdata = mygrid.getRowData(ids[i]);
            json_data = { intActSID: v_ActSid, intNetBarID: rowdata.NETBARID, sDate: rowdata.ACTIONDATE, sBtime: rowdata.ACTIONBEGINTIME, sEtime: rowdata.ACTIONENDTIME, intCNum: rowdata.FLIGHTSNUMBER, intActCost: rowdata.ACTIONFEES };
            $.ajax({
                url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/SubmitActDetail/",
                type: "POST",
                dataType: "json",
                data: json_data,
                success: fActionSubmitSuccessed
            });
        }
    }
   
    function fActionSubmitSuccessed(result) {
        if (result.isSuccess == 1) {
            countResult = countResult + 1;
            vErr =vErr + "1" +","+ result.barid + "@"
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
        var m0="";
        var m1="";
        var m2="";
        var m3="";
        var m4="";
        var m5="";
        if (result.detailcount == ids.length) {
            if (countResult == ids.length) {
                $("#btn1").attr("disabled", false);
                $("#displayInfo").hide();
                $("#closeDailog").show();
                $("#msg").text("");
                $("#msg").text("活动提交成功！");
                $("#msg").append("<br/>")
                $("#msg1").text("提交的活动单号为" + glogActId + "！");
                glogActId = "";
                //alert("活动提交成功！");
                //str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionSubmit/";
                //location.reload(str);
                
            }
            else {
                $("#displayInfo").hide();
                $("#closeDailog").show();
                $("#btn1").attr("disabled", false);
                vErr=vErr.substr(0, vErr.length - 1);
                var resultAll=vErr.split('@');
                for (idx = 0; idx < resultAll.length; idx++) {
                    var msgone = resultAll[idx].split(',');

                    if (msgone[0] == 0) {
                        //同一网吧同一单号的活动一个星期之内超过了两次
                        if (m0 == "") {
                            m0 = "同一网吧同一单号的活动一个星期之内超过了两次！网吧ID:"
                        }
                        m0 = m0 +msgone[1] + ",";
                    }
                    else if (msgone[0] ==1) {
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
                    $("#msg").text(m0.substr(0,m0.length-1));
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
            var str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionSubmit/";
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
            var str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionSubmit/";
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
      url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadFieldNum/" + encodeURIComponent($("#GAME").val() + "," +$("#ASNumber").find('option:selected').val()),
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