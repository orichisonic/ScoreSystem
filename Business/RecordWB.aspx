<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	考核记录
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;%>
        <%
            string strZAid = (string)ViewData["ZoneAreaForRecordWBQuery"];
            string strUACCOUNT = (string)ViewData["UACCOUNT"];
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
       if (strUACCOUNT == null)
       {
           strUACCOUNT = string.Empty;
       }
    %>
    <span id="power"><%=account.POPEDOMID %></span>
    <span id="areaid"><%=account.AREAID %></span>
    <span id="popomname"><%=account.POPEDOMNAME %></span>
    <span id="countname"><%=account.UACCOUNT%></span>
    <span id="ZidFromMaster"><% =Zid%></span>
    <span id="AidFromMaster"><% =Aid%></span>
    <span id="UACCOUNT"><% =strUACCOUNT%></span>
    <div id="tabs-1" style="text-align: center">
    <div id="ChargeCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
            <ul class="horizontal">
             <% if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3)
                { %>
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
                </select></li><%} %>
                
                 <% if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3||account.POPEDOMID == 4)
                { %>
                <li>办事处
                    <select id="area">
                       
                        <option value="<%=account.AREAID %>">默认</option>
                     
                    </select><%} %>
                </li> 
                <li>开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/></li>
                <li>结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2010-12-1"/></li>
                    
                <li id="tuiguangbianhao" style="">
                    <select name="SearchType" id="Select2">
                     <option value="0">搜索全部</option>
                    <option value="1">按网吧名称搜索</option>
                    <option value="2">按网吧编号搜索</option>
                    <option value="3">按锁定人姓名搜索</option>
                    <option value="4">按考核人姓名搜索</option>
     
                    </select>
                    <input type="text" name="TuiGuangName" id="TuiGuangName" style="width: 90px"/></li>
                  
                <li>
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                        查询</button></li>
            </ul>
        </div>
    </fieldset>
</div>


    <div id="tabs">
        <%Html.RenderPartial("DataGridControl"); %>
    </div>
        
      <%Html.RenderPartial("RecordDetailShow"); %>   

    
<center>
    <p style="font-weight: bold">点击条目查看单个网吧考核详细</p>
</center>
    
</div>
 <div id="loadallexcel" >
 <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
 <button  style=" display:none;margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelall()" id="excelall">导出全部办事处数据</button>
 <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()" id="excelarea">导出办事处数据</button>
 <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="excelone">导出个人数据</button>
 <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelrecordDetail()" id="excelrecordDetail">导出考核详细信息</button></div>
<script type="text/javascript">

   $('#tabs').tabs();
    var userID = 0;
    var tabsIndex = 0;
    var power = $("#power").html();
    var areaid2 = 0;
    var mygrid;
    var popomname;
    var countname;

    $(document).ready(function() {
        $("#zone").change(function() { loadArea() });
        $('#Select2').bind('click', function() {
            if ($('#Select2').val() == 0) {
                $("#TuiGuangName").val('');
            }
        });
        areaid2 = $("#areaid").html();
        popomname = $("#popomname").html();
        countname = $('#countname').html();
        if (power == 2 || power == 5 || power == 3 || power == 4 || power == 6 || power == 8 || power == 1 || power == 7)
            $("#tabs-1").show();
        else
            $("#tabs-1").hide();
        $("#power").hide();
        $("#areaid").hide();
        $("#popomname").hide();
        $('#countname').hide();

        $("#ZidFromMaster").hide();
        $("#AidFromMaster").hide();
            $('#UACCOUNT').hide();

        if (power == 7) {
            document.getElementById("tuiguangbianhao").style.display = "none";
            $("#excelarea").hide();
            $("#excelone").hide();
        }
        ////////////////////////////////////////////////////////
        var szoneid = $('#ZidFromMaster').html();
        if (szoneid != "") {

            //根据Master传过来的AreaID,显示相对应的数据
            if (power == 1 || power == 2 || power == 3 || power == 4) {

                $('#zone').attr('value', szoneid);

            }
        }
        ///////////////////////////////////////////////////////
        loadArea();
        setTimeout('loadData()', 1000);
        mygrid = $("#list").jqGrid({
            width: 790,
            height: 450,
            url: 'RecordDetailWB/',
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
            colNames: ['网吧编号', '网吧名称', '责任人', '考核人', '考核日期', '客情关系', '网吧信息', '网吧宣传品', '客户端覆盖', '1V1拉新', '总得分'],
            colModel: [{ name: 'NETBARID', index: 'NETBARID', width: 160, align: 'center' },
                        { name: 'BARNAME', index: 'BARNAME', width: 160, align: 'center' },
                        { name: 'ZRR', index: 'ZRR', width: 160, align: 'center' },
                        { name: 'KHR', index: 'KHR', width: 160, align: 'center' },
                        { name: 'ASSESSTIME', index: 'ASSESSTIME', width: 160, align: 'center' },
                        { name: 'APOINT', index: 'APOINT', width: 160, align: 'center' },
                        { name: 'BPOINT', index: 'BPOINT', width: 160, align: 'center' },
                        { name: 'CPOINT', index: 'CPOINT', width: 160, align: 'center' },
                        { name: 'DPOINT', index: 'DPOINT', width: 160, align: 'center' },
                        { name: 'EPOINT', index: 'EPOINT', width: 160, align: 'center' },
                        { name: 'ZPOINT', index: 'ZPOINT', width: 160, align: 'center' }
                        ],
            onSelectRow: function(rowid) {
                var rowdata = mygrid.getRowData(rowid);
                if (rowdata.BARNAME != "合计") {
                    DisplayDetails(rowid);
                }
            }
        });
    });


    // --v_Type：考核记录：1、客情维护；2、网吧信息；3、网吧宣传；4、客户端覆盖；5、1V1拉新 0,总览
    function loadData(index) {
    
        var begintime = $("#beginTime").val();
        var endtime = $("#endTime").val();
        var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
        if (!datedemo.test(begintime)) {
            alert("开始日期不对！");
            return;
        }
        if (!datedemo.test(endtime)) {

            alert("结束日期不对！");
            return;
        }
        var searchtype = $('#Select2').val();
        var searchstring = $('#TuiGuangName').val();
        var said = $('#area').val();
        if (power == 5 || power == 6 || power == 7) {
            said = $('#AidFromMaster').html();
        }
       
        var sUACCOUNT = $('#UACCOUNT').html();
        mygrid.appendPostData({ AreaID: said, Start: begintime, End: endtime, SearchString: searchstring, SearchType: searchtype, UAccount: sUACCOUNT });
        mygrid.trigger('reloadGrid');
        $('#UACCOUNT').html("");
    }

    function loadArea() {
        if (power == 4) {

            $.ajax(
             {
                 url: "LoadArea/" + areaid2,
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });



        }
        else {
            $.ajax(
             {
                 url: "LoadArea/" + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
        }
    }

    function loadSuccessed(result) {

        $("#area").empty();

        if (result.rows.length > 0) {
           
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));

            });
            //根据Master传过来的AreaID,显示相对应的数据
            var sareaid = $('#AidFromMaster').html();
            if (sareaid != "") {
                if (power == 1 || power == 2 || power == 3 || power == 4) {
 
                    $('#area').attr('value', sareaid);
                    $('#AidFromMaster').html("");

                }
            }
        }
    }


    function DisplayDetails(rowIndex) {

        //获取ID

        var rowData = mygrid.getRowData(rowIndex);
        var netBarID = rowData.NETBARID;
        var sdr = rowData.ZRR;
        var assesstime = rowData.ASSESSTIME;


        dateArray = assesstime.split(" ");
        var parm = netBarID + "," + sdr + "," + dateArray[0] + "," + dateArray[1];

        if (dateArray != "") {
            dateArray2 = dateArray[1].split(":");
            $.ajax(
                 {
                     url: "NetBarDetailShow/" + encodeURIComponent(netBarID + "," + sdr + "," + dateArray[0] + "," + dateArray2[0] + "," + dateArray2[1] + "," + dateArray2[2]),
                     type: "POST",
                     dataType: "json",
                     success: NetBarDetailShowSuccessed
                 });

        }
    }

    function NetBarDetailShowSuccessed(result) {


        var dataArray = result.result.split(",");

        var dataArray2 = result.remark.split(",");
        var dataArray3 = result.remark2;
        $("#TextBox12").val(dataArray2[11]);
        $("#TextBox11").val(dataArray2[10]);
        $("#TextBox10").val(dataArray2[9]);
        $("#TextBox9").val(dataArray2[8]);
        $("#TextBox8").val(dataArray2[7]);
        $("#TextBox7").val(dataArray2[6]);
        $("#TextBox6").val(dataArray2[5]);
        $("#TextBox5").val(dataArray2[4]);
        $("#TextBox4").val(dataArray2[3]);
        $("#TextBox3").val(dataArray2[2]);
        $("#TextBox2").val(dataArray2[1]);
        $("#TextBox1").val(dataArray2[0]);
        $("#Text13").val(dataArray3);
        if (dataArray[0] == "-1")
            $("#rd1").html("是");
        else $("#rd1").html("否");


        if (dataArray[1] == "-1")
            $("#rd2").html("是");
        else $("#rd2").html("否");


        if (dataArray[2] == "-1")
            $("#rd3").html("是");
        else $("#rd3").html("否");


        if (dataArray[3] == "-1")
            $("#rd4").html("是");
        else $("#rd4").html("否");


        if (dataArray[4] == "-1")
            $("#rd5").html("是");
        else $("#rd5").html("否");

        if (dataArray[5] == "-1")
            $("#rd6").html("是");
        else $("#rd6").html("否");

        if (dataArray[6] == "-1")
            $("#rd7").html("是");
        else $("#rd7").html("否");

        if (dataArray[7] == "-1")
            $("#rd8").html("是");
        else $("#rd8").html("否");

        if (dataArray[8] == "-1")
            $("#rd9").html("是");
        else $("#rd9").html("否");

        if (dataArray[9] == "-1")
            $("#rd10").html("是");
        else $("#rd10").html("否");

        if (dataArray[10] == "-1")
            $("#rd11").html("是");
        else $("#rd11").html("否");

        if (dataArray[11] == "-1")
            $("#rd12").html("是");
        else $("#rd12").html("否");

        if (dataArray[12] == "-1")
            $("#rd13").html("是");
        else $("#rd13").html("否");

        if (dataArray[0] == "-1" || dataArray[1] == "-1" || dataArray[2] == "-1")
            $("#bigClass1").html("-1");



        else
            $("#bigClass1").html(0);

        if (dataArray[3] == "-1" || dataArray[4] == "-1")
            $("#bigClass2").html("-1");



        else
            $("#bigClass2").html(0);

        if (dataArray[5] == "-1" || dataArray[6] == "-1" || dataArray[7] == "-1" || dataArray[8] == "-1") {
            $("#bigClass3").html("-1");


        }
        else
            $("#bigClass3").html(0);

        if (dataArray[9] == "-1" || dataArray[10] == "-1") {
            $("#bigClass4").html("-1");


        }
        else
            $("#bigClass4").html(0);
        if (dataArray[11] == "-1") {
            $("#bigClass5").html("-1");


        }
        else
            $("#bigClass5").html(0);
        $("#bigClass7").html(Number($("#bigClass1").html()) + Number($("#bigClass2").html()) + Number($("#bigClass3").html()) + Number($("#bigClass4").html()) + Number($("#bigClass5").html()));
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

                "关闭": function() { $("#divIframe").dialog("close") }
            }
        });
    });
    ///////////////////////////////////load excel
    function loadexcel() {
        str = "http://" + location.host + "/Business.aspx/showexcelRecordDetailWB/";
        location.replace(str);
    }
    function loadexcelall() {
        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        tabsIndex = tabsIndex;
        str = "http://" + location.host + "/Business.aspx/showexcelall/0," + tabsIndex + ",3," + beginTime + "," + endTime;
        location.replace(str);
    }
    ///////////////////////////////////
    function loadexcelarea() {
        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        tabsIndex = tabsIndex;
        var parm642 = BASE64.encode($("#area").val() + "," + $("#beginTime").val() + "," + $("#endTime").val());
        str = "http://" + location.host + "/Business.aspx/showexcelarea2/" + parm642;
        location.replace(str);

    }


    function loadexcelone() {

        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        tabsIndex = tabsIndex;
        var parm642 = BASE64.encode($("#area").val() + "," + $("#beginTime").val() + "," + $("#endTime").val());
        str = "http://" + location.host + "/Business.aspx/showexcelone2/" + parm642;
        location.replace(str);

    }

    function loadexcelrecordDetail() {

        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        tabsIndex = tabsIndex;
        var parm642 = BASE64.encode($("#area").val() + "," + $("#beginTime").val() + "," + $("#endTime").val());
        str = "http://" + location.host + "/Business.aspx/showexcelrecordDetail2/" + parm642;
        location.replace(str);


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
