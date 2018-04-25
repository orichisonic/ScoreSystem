<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧业绩
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% 
    TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
    TGProject.Models.TGSNetBarAchiveCondition condtion = (TGProject.Models.TGSNetBarAchiveCondition)ViewData["condition"];
    
    string gameidx = "0";
    string strByMonth = "";
    string strDefines = "0,";
    DateTime dteBegin;
    DateTime dteEnd;
    int iAreaID = 221;
    int iZoneID = 2;
    string strAccount = string.Empty;
    if (condtion != null)
    {
        dteBegin = condtion.BeginTime;
        dteEnd = condtion.EndTime;
        strByMonth = condtion.byMonth;
        gameidx = condtion.GameIdx;
        strDefines = condtion.DefineIDs;
        iAreaID = condtion.AreaID;
        iZoneID = condtion.ZoneID;
        strAccount = condtion.UAccount;
    }
    else
    {
        dteBegin = Convert.ToDateTime("2010-1-1");
        dteEnd = DateTime.Now;
        strDefines = "0,";
    }
%>
        <span id="power"><%=account.POPEDOMID %></span>
        <span id="beginDate"><%=dteBegin.ToShortDateString()%></span>
        <span id="endDate"><%=dteEnd.ToShortDateString()%></span>
        <span id="bymonthFlg"><%=strByMonth %></span>
        <span id="gameIdx"><%=gameidx %></span>
        <span id="defineStr"><%=strDefines%></span>
        <span id="iAid""><%=iAreaID%></span>
        <span id="iZid"><%=iZoneID %></span>
        <span id="account"><%=strAccount%></span>
<fieldset>
    <legend visible="false">查询条件</legend>
    <div id="frm1" style="text-align: left">
    <ul class="horizontal" id="zonehide">
            <li id="zoneHide1">大区
                <select name="zone" id="zone" style="width: 116px">
                <%
                    if (account.POPEDOMID == 1 || account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 8 || account.POPEDOMID ==99)
                    {
                        List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                        foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                        {
                %>
                        <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%>
                        </option>
                <%  
                        }
                    }
                else 
                    { 
                %>
                        <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                <%
                    } 
                %>
                </select>
            </li>
            <li id="areaHide1">办事处
                <select id="area" style="width: 116px">
                <%
                    if (account.POPEDOMID == 5 || account.POPEDOMID == 6 || account.POPEDOMID == 7)
                    { 
                %>
                        <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                <%
                    }
                %>
                </select>

            </li>
            <li id="userAccount">
                <select name="SearchType" id="searchType" style="width: 94px">
                    <option value="0">全部</option>
                    <option value="1">锁定/绑定人名</option>
                    <option value="2">网吧编号</option>
                    <option value="3">网吧名称</option>
                </select>
                <input type="text" name="uaccount" id="uaccount" style="width: 155px"/>
                
            </li>
        </ul>
        <ul class="verticality"  id="by_day_id">
            <li style=" vertical-align:bottom">
                <input style="vertical-align:bottom" name="rd1" type="radio" value="1" checked="checked"/>按日期查询（数据为24小时刷新）开始日期 
                <input style="vertical-align:bottom;width: 90px" type="text" name="beginTime" id="beginTime" onfocus="setday(this)" value="2010-1-1"/>结束日期 
                <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>"/>
            </li>
        </ul>
        <ul class="verticality">
            <li>
                <input name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
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
                        for (int z =1; z <= tempMonth; z++)
                        {

                            YearMonth = t.Year.ToString() + "-" + z.ToString();
                    %>
                    <option value="<%=YearMonth%>">
                        <%=YearMonth%></option>
                    <%  } %>
                </select><br />
            </li>
        </ul>
        <ul class="verticality">
            <li style=" vertical-align:bottom">类别:              
                <select  style="width:226px;" name="GAME" id="GAME">
                    <option  value="0">所有游戏</option>
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
                </select>
                <span id="test" style="color:#000000">
                    <select  style="width:150px;" name="Gclass" id="Gclass" onchange="return class_onclick()">
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                        {
                    %>
                        <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%></option>
                    <%
                        }
                    %>
                    </select>
                </span> 
              <button style="margin-left:57px;" class="ui-state-default ui-corner-all" type="button" onclick="loadData(0)">查询</button>
            </li>
        </ul>
        
    </div>
</fieldset>
<div id="tabs">
    <ul>
       <li><a  href="#tabs-1">所有</a></li>
       <li><a  href="#tabs-1" id="yl">游离</a></li>
       <li><a  href="#tabs-1">绑定</a></li>
       <li><a  href="#tabs-1">锁定</a></li>
    </ul>
    <div id="tabs-1">
        <%Html.RenderPartial("DataGridControl"); %>
    </div>
    <center>  
        <p style="font-weight: bold">点击网吧称直接查询该网吧详细</p>
    </center>
    
</div>
<div id="loadallexcel" >
        <button style="margin-top:10px;" id="excelnow" class="ui-state-default ui-corner-all" type="submit" onclick="loadExcel()">导出本页数据</button>
</div>
 <script type="text/javascript">
     var mygrid;
     var power = $("#power").html();
     $(document).ready(function() {
         $("#power").hide();
         $("#beginDate").hide();
         $("#endDate").hide();
         $("#bymonthFlg").hide();
         $("#gameIdx").hide();
         $("#defineStr").hide();
         $("#iAid").hide();
         $("#iZid").hide();
         $("#account").hide();
         //tab控件初始化
         $('#tabs').tabs();


         //查找时间
         var sTime = $("#beginDate").html();
         var eTime = $("#endDate").html();
         $("#beginTime").attr("value", sTime);
         $("#endTime").attr("value", eTime);

         var sbymonth = $("#bymonthFlg").html()
         if (sbymonth != "") {
             $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
             $("#beginTime2").val(sbymonth);
         }

         //所选择的游戏
         var gameidx = $("#gameIdx").html();
         $("#GAME").attr("value", gameidx);

         //所选择的活动
         $("#Gclass").empty();
         if ($("#gameIdx").html() == "0" || $("#gameIdx").html() == 0) {
             $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
         else {
             loadDefine($("#GAME").val());
         }

         //如果是办事处帐号隐藏大区选项
         if (power == 5 || power == 6 || power == 7) {
             $('#zoneHide1').hide();
         }
         else {
             $('#zoneHide1').show();
         }

         //绑定大区下拉框事件
         $("#zone").change(function() {

             loadArea();
         });

         //绑定游戏下拉框事件
         $("#GAME").bind('change', function() {
             loadDefine($("#GAME").val());
             if ($("#GAME").val() == 0) {
             }
             else {
             }
         });

         //绑定tab切换事件
         $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

         //根据Control传过来的ZoneID,显示相对应的数据
         var szoneid = $('#iZid').html();
         if (szoneid != "") {
             $('#zone').attr('value', szoneid);
         }

         if (power == 1 || power == 2 || power == 3 || power == 4) {
             loadArea();
         }
         $('#Gclass')[0].selectedIndex = 0;
         if ($("#gameIdx").html() == "0" || $("#gameIdx").html() == 0) {
             $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
         }


         //如果有UACCOUNT的话，隐藏游离选项卡
         var strUaccount = $("#account").html();
         if (strUaccount != "") {
             $("#yl").hide();
             $("#zonehide").hide();

         }

         //如果是办事处帐号隐藏大区选项
         if (power == 5 || power == 6 || power == 7) {
             $('#zoneHide1').hide();
         }
         else {
             $('#zoneHide1').show();
         }

         mygrid = $("#list").jqGrid({
             width: 800,
             height: 450,
             url: 'http://' + location.host + '/ScoreQuery.aspx/NetbarOutAchive/',
             datatype: 'json',
             mtype: 'POST',
             pager: jQuery('#pager'),
             rowNum: 40,
             rowList: [20, 40, 60, 80],
             sortname: 'Id',
             sortorder: "desc",
             viewrecords: true,
             imgpath: '/scripts/themes/steel/images',
             caption: '查询条件：',
             recordtext: '条记录',
             loadtext: '加载数据请稍候....',
             colNames: ['编号', '网吧名称', '网吧登记', '状态', '绑定/锁定人', '绑定/锁定日期', '直接推广', '间接推广', '总业绩', '游戏登陆'],

             colModel: [{ name: 'BASE_ID', index: 'BASE_ID', width: 160, align: 'center', sortable: false },
                        { name: 'BASE_NAME', index: 'BASE_NAME', width: 160, align: 'center', sortable: false },
                        { name: 'BASE_GRADE', index: 'BASE_GRADE', width: 160, align: 'center', sortable: false },
                        { name: 'BASE_STATUS', index: 'BASE_STATUS', width: 160, align: 'center', sortable: false },
                        { name: 'UACCOUNT', index: 'UACCOUNT', width: 160, align: 'center', sortable: false },
                        { name: 'ASSIGNTIME', index: 'ASSIGNTIME', width: 160, align: 'center', sortable: false },
                        { name: 'ZJACHIVE', index: 'ZJACHIVE', width: 150, align: 'center', sortable: false },
                        { name: 'IDACHIVE', index: 'IDACHIVE', width: 150, align: 'center', sortable: false },
                        { name: 'OUTACHIVE', index: 'OUTACHIVE', width: 180, align: 'center', sortable: false },
                        { name: 'LOGINTIMES', index: 'LOGINTIMES', width: 160, align: 'center', sortable: false }
                    ]
         });
         setTimeout("loadData(0)", 1000);
     });
    
    //读取大区
    function loadArea() {
        //定义全局URL以便返回能够找到controls
        url = "http://" + location.host + "/ScoreOffice.aspx/LoadArea/";
        $.ajax(
             {
                 url: url + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: sss
             });
    }

    //读取大区成功处理函数
    function sss(result) {
        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });

            //根据Control传过来的AreaID,显示相对应的数据
            var sareaid = $('#iAid').html();
            //alert(sareaid);
            if (sareaid != "") {
                $('#area').attr('value', sareaid);
                //alert($('#area').val());
                $('#iAid').html("");
            }
        }
    }
    
    //读取活动
    function loadDefine() {
        $("#Gclass").empty();
        $('#test').html('');
        $('#test').html('<span id="test"  style="color:#000000"><select style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()"  multiple="multiple"></select></span>');
        $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             }
        );
    }

    //活动读取成功处理函数
    function loadSuccessed(result) {
         $("#Gclass").empty();
         var defineStr = ""
         defineStr = $("#defineStr").html();

         var definesArray = defineStr.split(',');

         if (result.rows.length > 0) {
             $.each(result.rows, function(i, item) {

                 var hasFlg = 0;
                 var routelong = definesArray.length;
                 for (idef = 0; idef < routelong; idef++) {
                     if (definesArray[idef] == item.cell[0]) {

                         hasFlg = 1;
                         break;
                     }
                     else {
                         hasFlg = 0
                     }
                 }
                 if (hasFlg == 1) {
                     $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                 }
                 else {
                     $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                 }
             });
         }
         else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
            $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
            $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
         }
         $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
     }

     //网吧业绩明细读取函数
     function loadData(index) {
        var tabsIndex;      //taba控件的index,0全部，1游离，2绑定,3锁定
        var beginTime;      //开始时间
        var endTime;        //结束时间
        var byMonth;        //是否按月查找
        var actionString;   //游戏活动字符串
        var areaid;         //办事处ID
        var searchType;     //条件匹配的类型 0按绑定/锁定人名，1按网吧编号，2按网吧名
        var searchString;   //条件匹配的条件
        var straccount;     //用户帐号
        var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
         
         
        //taba空间的index,0全部，1游离，2绑定,3锁定
        if (index == undefined) {
            tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        } else {
            tabsIndex = index;
        }

        //开始时间，结束时间
        if ($("#frm1 input[type *= 'radio'][checked]").val() == 1){
          
            //按时间区间查找
            if (!datedemo.test($("#beginTime").val())) {
                alert("按日期查询开始时间不正确！");
                return;
            }
            if (!datedemo.test($("#endTime").val())) {
                alert("按日期查询开始时间不正确！");
                return;
            }
            //开始时间
            beginTime = $("#beginTime").val();
            //结束时间
            endTime = $("#endTime").val();
            //是否按月查找
            byMonth = "";
        }
        else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
        
            //按月查找
            var timeindex = $("#beginTime2").val().split('-');
            var timebegin;
            var timespan = 0;
            if (timeindex[1] == 1) {
                timespan = 12;
                timebegin = timeindex[0] - 1;
            } else {
                timespan = timeindex[1] - 1;
                timebegin = timeindex[0] - 1;
            }
            //开始时间
            beginTime = timeindex[0] + "-" + timespan + "-" + "25";
            //结束时间
            endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
            //是否按月查找
            byMonth = $("#beginTime2").val();
        }


        //游戏活动字符串
        actionString = "";
        for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
            var chkName = "mst" + k;
            if ($("#" + chkName).attr("checked") == true) {
                actionString = actionString + $("#" + chkName).val() + ",";
            }
        }
        if (actionString == undefined || actionString == "undefined" || actionString == "") {

            alert("请选择要查询的活动！");
            return;
        }
        
         //办事处ID
        areaid = $('#area').val();

        //条件匹配的类型 0按绑定/锁定人名，1按网吧编号，2按网吧名
        searchType = $('#searchType').val();

        //条件匹配的条件
        searchString = $('#uaccount').val();

        //用户帐号
        straccount = $('#account').html();
        mygrid.appendPostData({ 
                                TabIdx: tabsIndex, 
                                BeginTime: beginTime,
                                EndTime: endTime,
                                byMonth: byMonth,
                                DefineIDs: actionString,
                                AreaID: areaid,
                                SearchType: searchType,
                                SearchString: searchString,
                                UACCOUNT: straccount
                            });
        mygrid.trigger('reloadGrid');
    }



    //导出Excel
    //网吧业绩明细读取函数
    function loadExcel() {
        var tabsIndex;      //taba控件的index,0全部，1游离，2绑定,3锁定
        var beginTime;      //开始时间
        var endTime;        //结束时间
        var byMonth;        //是否按月查找
        var actionString;   //游戏活动字符串
        var areaid;         //办事处ID
        var searchType;     //条件匹配的类型 0按绑定/锁定人名，1按网吧编号，2按网吧名
        var searchString;   //条件匹配的条件
        var straccount;     //用户帐号
        var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;


        //taba空间的index,0全部，1游离，2绑定,3锁定
         tabsIndex = $("#tabs").tabs().tabs("option", "selected");


        //开始时间，结束时间
        if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {

            //按时间区间查找
            if (!datedemo.test($("#beginTime").val())) {
                alert("按日期查询开始时间不正确！");
                return;
            }
            if (!datedemo.test($("#endTime").val())) {
                alert("按日期查询开始时间不正确！");
                return;
            }
            //开始时间
            beginTime = $("#beginTime").val();
            //结束时间
            endTime = $("#endTime").val();
            //是否按月查找
            byMonth = "";
        }
        else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {

            //按月查找
            var timeindex = $("#beginTime2").val().split('-');
            var timebegin;
            var timespan = 0;
            if (timeindex[1] == 1) {
                timespan = 12;
                timebegin = timeindex[0] - 1;
            } else {
                timespan = timeindex[1] - 1;
                timebegin = timeindex[0] - 1;
            }
            //开始时间
            beginTime = timeindex[0] + "-" + timespan + "-" + "25";
            //结束时间
            endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
            //是否按月查找
            byMonth = $("#beginTime2").val();
        }


        //游戏活动字符串
        actionString = "";
        for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
            var chkName = "mst" + k;
            if ($("#" + chkName).attr("checked") == true) {
                actionString = actionString + $("#" + chkName).val() + ",";
            }
        }
        if (actionString == undefined || actionString == "undefined" || actionString == "") {

            alert("请选择要查询的活动！");
            return;
        }

        //办事处ID
        areaid = $('#area').val();

        //条件匹配的类型 0按绑定/锁定人名，1按网吧编号，2按网吧名
        searchType = $('#searchType').val();

        //条件匹配的条件
        searchString = $('#uaccount').val();

        //用户帐号
        straccount = $('#account').html();

        var json_data = {
                            TabIdx: 0,
                            BeginTime: beginTime,
                            EndTime: endTime,
                            byMonth: byMonth,
                            DefineIDs: actionString,
                            AreaID: areaid,
                            SearchType: searchType,
                            SearchString: searchString,
                            UACCOUNT: straccount
                        };

         $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/NetBarAchiveQuery/",
                 type: "POST",
                 dataType: "json",
                 data: json_data
             });
             var url ="http://" + location.host + "/ScoreQuery.aspx/showexcelNetBar/";
             location.replace(url);

    }
</script>
</asp:Content>
