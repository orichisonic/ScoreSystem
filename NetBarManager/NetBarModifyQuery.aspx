<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧信息编辑
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <%
           int isModifyAll = (int)ViewData["IsModifyAll"];
           string strZAid = (string)ViewData["ZoneAreaForNBQuery"];
           string Zid=string.Empty;
           string Aid=string.Empty;
           if (strZAid == null)
           {
               Zid=string.Empty;
               Aid = string.Empty;
           }
           else
           {
               Zid = strZAid.Split(',')[0];
               Aid = strZAid.Split(',')[1];
           }
       %>
       <span id="power"><%=account.POPEDOMID %></span>
       <span id="id"><%=account.USERID%></span>
       <span id="ZidFromMaster"><% =Zid%></span>
       <span id="AidFromMaster"><% =Aid%></span>
       <span id="isModifyAll"><% =isModifyAll%></span>
    <div>
        <%Html.RenderPartial("ExamineComboConditionControl"); %></div>
        <br />
  <div style="color:Blue">查询总计:<span id="totalsum"></span></div>
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">总览</a></li>
            <li><a href="#tabs2">已审核</a></li>
            <li><a href="#tabs3">绑定</a></li>
            <li><a href="#tabs4">锁定</a></li>
            <li><a href="#tabs5">A级</a></li>
            <li><a href="#tabs6">B级</a></li>
        </ul>
        <div id="tabs1">
       <table id="list1" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager1" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs2">
       <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager2" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs3">
       <table id="list3" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager3" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs4">
       <table id="list4" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager4" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs5">
       <table id="list5" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager5" class="scroll" style="text-align: center;"></div>
      </div>
      <div id="tabs6">
       <table id="list6" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager6" class="scroll" style="text-align: center;"></div>
      </div>
           
    </div>
    
    <div id="loadallexcel" >
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
        <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelnetbararea()" id="excelbs">导出办事处数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelnetbarone()" id="excelone">导出个人数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadnetbarInfo()" id="excelnetbar">导出网吧数据</button>
    </div>
    <script type="text/javascript">
    $('#tabs').tabs();
    var mygrid;
    var mygrid2;
    var mygrid3;
    var mygrid4;
    var mygrid5;
    var mygrid6;
    
    var tabsIndex;
    var power = $('#power').html();
    var isModifyAll = $('#isModifyAll').html();
    $(document).ready(function() {
        $("#ZidFromMaster").hide();
        $("#AidFromMaster").hide();
        $("#power").hide();
        $("#id").hide();
        $('#isModifyAll').hide();

        if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8 || power == 99) {
            $('#excelnow').show();
            $('#excelbs').show();
            $('#excelone').show();
            $('#excelnetbar').show();

        }
        else if (power == 5 || power == 6) {
            $('#excelnow').show();
            $('#excelbs').hide();
            $('#excelone').show();
            $('#excelnetbar').show();
        }
        else {
            $('#excelbs').hide();
            $('#excelone').hide();
            $('#excelnetbar').show();
            $('#excelnow').show();
        }
        ///////////////////
        $("#zone").attr("value", 2);
        $("#Select2").bind('click', function() {
            if ($("#Select2").val() == 0) {
                $("#uaccount").val('');
            }
        });

        if (power <= 4) {
            $('#excelall').show();
        }
        //////////////////////
        $("#zone").change(function() {

            if ($("#zone").val() == -1) {

                $("#excelall").hide();
                $("#areaHide1").hide();
            }
            else {
                $("#excelall").show();
                $("#areaHide1").show();
                loadArea();
            }
        });
        //////////////////
        var szoneid = $('#ZidFromMaster').html();
        if (szoneid != "") {

            //根据UserQueryMaster传过来的AreaID,显示相对应的数据
            if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {

                $('#zone').val(szoneid);

            }
        }
        //////////////////
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
        $('#userAccount').show();
        $("#condition").hide();
        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        /////////////////////////////
        $("#Select2").change(function() {
            //        $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
            //        $("<option value='1'>按网吧名称搜索</option>").appendTo("#Select2")//添加下拉框的option
            //        $("<option value='3'>按网吧编号搜索</option>").appendTo("#Select2")//添加下拉框的option
            //        $("<option value='4'>按推广员姓名搜索</option>").appendTo("#Select2")//添加下拉框的option
            //        $("<option value='5'>按推广员帐号搜索</option>").appendTo("#Select2")//添加下拉框的option
//        if ($("#Select2").val() != 0 && power==2) {
//                $("#areaHide1").attr('disabled', 'false'); //不可用
//                $("#zoneHide1").attr('disabled', 'false'); //不可用
//            }
//            else {
//                $("#areaHide1").attr('disabled', false); //可用
//                $("#zoneHide1").attr('disabled', false); //可用
//            }

        });
        ////////////////////////////

        //所有通过审核的网吧信息
        mygrid = $("#list1").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager1'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '登记人', '登记人账号', '登记日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'applicant', index: 'APPLICANT', width: 100, align: 'center' },
                                        { name: 'applyaccount', index: 'APPLYACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list1").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },
            onSelectRow: function(rowid) {
                var rowData = mygrid.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);

                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
            }
        });
        mygrid2 = $("#list2").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager2'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '登记人', '登记人账号', '审核日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'applicant', index: 'APPLICANT', width: 100, align: 'center' },
                                        { name: 'applyaccount', index: 'APPLYACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list2").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },
            onSelectRow: function(rowid) {
                var rowData = mygrid2.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);

                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                location.href(strUrl);
            }
        });
        mygrid3 = $("#list3").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager3'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '绑定人', '绑定人账号', '绑定日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 100, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list3").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },
            onSelectRow: function(rowid) {
                var rowData = mygrid3.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);

                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                location.href(strUrl);
            }
        });

        mygrid4 = $("#list4").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager4'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '锁定人', '锁定人账号', '锁定日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 100, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list4").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },

            onSelectRow: function(rowid) {
                var rowData = mygrid4.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);
                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                location.href(strUrl);
            }
        });
        mygrid5 = $("#list5").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager5'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '绑定/锁定人', '绑定/锁定人账号', '绑定/锁定日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 100, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list5").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },

            onSelectRow: function(rowid) {
                var rowData = mygrid5.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);
                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                location.href(strUrl);
            }
        });

        mygrid6 = $("#list6").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager6'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '绑定/锁定人', '绑定/锁定人账号', '绑定/锁定日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 100, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 100, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 100, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 100, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 120, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 100, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 60, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 80, align: 'center' }
                                        ],
            loadComplete: function() {
                var sumrecords = $("#list6").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },

            onSelectRow: function(rowid) {
                var rowData = mygrid6.getRowData(rowid);
                var pm64 = BASE64.encode(rowData.netbarid);

                //                if (power == 2) {
                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                //                    location.href(strUrl);
                //                }
                //                else {

                //                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                //                    location.href(strUrl);
                //                }
                if (isModifyAll == "1") {
                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModifyAll2/" + pm64
                    location.href(strUrl);
                }
                else {

                    var strUrl = "http://" + location.host + "/NetBarManager.aspx/NetBarModify2/" + pm64
                    location.href(strUrl);
                }
                location.href(strUrl);
            }
        });
        loadDelay();
    });

    function loadDelay() {
        setTimeout("loadData(0)", 1000)
    }
    function loadArea() {
          $.ajax({
              url: "LoadArea/" + $("#zone").val(),
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
              
              //根据UserQueryMaster传过来的AreaID,显示相对应的数据
              var sareaid = $('#AidFromMaster').html();
              if (sareaid != "") {
                  if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
                      $('#area').val(sareaid);
                  }
              }
          }
      }

      function loadData(index) {
          if (index == "undefined" || index == undefined) {
              tabsIndex = $("#tabs").tabs().tabs("option", "selected");
              index = $("#tabs").tabs().tabs("option", "selected");
          } 
          else {
              tabsIndex = index;
          }

          if ($("#zone").val() == "-1") {
              var areaID = "-1";
          }
          else {
              var areaID = $("#area").val();
             
          }
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var account = $("#uaccount").val();
          if (account != "") {
              account = account;  //+ ';' + 'ModifyQ';
          }
          var searchtype = $("#Select2").val();
          var NetBarID = $("#uaccount").val();

          if (account == "") {
              searchtype = 0;
          }
          if (index == 0) {
              mygrid.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });


              if ($("#list1").getGridParam("records")!=null)
                  $("#totalsum").text($("#list1").getGridParam("records"));
              else 
              $("#totalsum").text(0)
              mygrid.trigger('reloadGrid');

           
          }
          else if (index == 1) {

          mygrid2.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list2").getGridParam("records") != null)
              $("#totalsum").text($("#list2").getGridParam("records"));
          else
              $("#totalsum").text(0)
          mygrid2.trigger('reloadGrid');
          }
          else if (index == 2) {

          mygrid3.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list3").getGridParam("records") != null)
          $("#totalsum").text($("#list3").getGridParam("records"));
           else 
              $("#totalsum").text(0)
          mygrid3.trigger('reloadGrid');


          }
          else if (index == 3) {

          mygrid4.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list4").getGridParam("records") != null)
              $("#totalsum").text($("#list4").getGridParam("records"));
          else
              $("#totalsum").text(0)
          mygrid4.trigger('reloadGrid');
       
          
          }
          else if (index == 4) {

          mygrid5.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list5").getGridParam("records") != null)
              $("#totalsum").text($("#list5").getGridParam("records"));
          else
              $("#totalsum").text(0)
          mygrid5.trigger('reloadGrid');

      
          
          }
          else if (index == 5) {

          mygrid6.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list6").getGridParam("records") != null)
          $("#totalsum").text($("#list6").getGridParam("records"));
             else
              $("#totalsum").text(0)
          mygrid6.trigger('reloadGrid');
        
          
      }
      ///////////////////////////
      return;
      ////////////////////////
          if (tabsIndex == 0 || tabsIndex == 1) {
              //清空下拉框
              $("#Select2").empty();
              $("#Select2").html('');
              $("<option value='1'>网吧名称</option>").appendTo("#Select2")//添加下拉框的option
          }
          else {
              //清空下拉框
              $("#Select2").empty();
              $("#Select2").html('');
              $("<option value='0'>用户帐号</option>").appendTo("#Select2")//添加下拉框的option
              $("<option value='1'>网吧名称</option>").appendTo("#Select2")//添加下拉框的option 
          }
      }
        
        //显示详细信息
      function DisplayDetails(rowIndex) {
          //获取ID
          var rowData = mygrid.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if(netBarID!=null)
              location.href = "LoadNetBarDetail/" + prm64;
      
      }

      function DisplayDetails2(rowIndex) {
          //获取ID
          var rowData = mygrid2.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadNetBarDetail/" + prm64;
        
      }

      function DisplayDetails3(rowIndex) {
          //获取ID
       
          var rowData = mygrid3.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadNetBarDetail/" + prm64;
        
      }

      function DisplayDetails4(rowIndex) {
          //获取ID
          var rowData = mygrid4.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadNetBarDetail/" + prm64;
   
      }

      function DisplayDetails5(rowIndex) {
          //获取ID
         
          var rowData = mygrid5.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadNetBarDetail/" + prm64;
    
      }
      function DisplayDetails6(rowIndex) {
          //获取ID
          var rowData = mygrid6.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadNetBarDetail/" + prm64;
   
      }

      // 字符过滤
      jQuery.validator.addMethod("filterChar", function(value, element) {
          var flag = true;
          var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
          for (var i = 0; i < charArray.length; i++) {
              if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
          }
          return this.optional(element) || flag;
      }, "&nbsp;&nbsp;[含有非法字符]");

      $("#form1").validate({
          rules: { uaccount: { filterChar: true } }
      });
      ///////////////////////////////////load excel
      function loadexcel() {
          tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex + 1;
          var prm64 = "evc"+tabsIndex+"yUJ";
          var prm641 = BASE64.encode(prm64);
//          alert(prm641);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcel/" + prm641;
          location.replace(str);
      }
      function loadexcelall() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex ;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 = tabsIndex + "," + beginTime + "," + endTime;
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelall/" +prm641 ;
          //location.relace(str);
          location = str;
      }

      function loadnetbarInfo() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 = $("#area").val();
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelnetbar2/" + prm641;
          //location.relace(str);
          location = str;

      }


      function loadexcelnetbarone() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 = $("#area").val() + "," + beginTime + "," + endTime;
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelonenetbar2/" + prm641;
          //location.relace(str);
          location = str;

      }

      function loadexcelnetbararea() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 =  $("#area").val()+","+beginTime + "," + endTime;
        
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelareanetbar2/" + prm641;
          //location.relace(str);
          location = str;

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
