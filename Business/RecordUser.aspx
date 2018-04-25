<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	考核记录
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;%>
    <%
       string strZAid = (string)ViewData["ZoneAreaForRecordBSQuery"];
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
    <span id="areaid"><%=account.AREAID %></span>
    <span id="popomname"><%=account.POPEDOMNAME %></span>
    <span id="countname"><%=account.UACCOUNT%></span>
    <span id="ZidFromMaster"><% =Zid%></span>
    <span id="AidFromMaster"><% =Aid%></span>
    <div style="text-align: center">
    
        <%Html.RenderPartial("ExamineComboConditionControl"); %>
        <br />

        <div id="tabs">
                <%Html.RenderPartial("DataGridControl"); %>
        </div>
    </div>
    <center>
        <center>
        <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="DisplayDetailsALL()">查看详细</button>
        <p style="font-weight: bold">点击人员姓名查看个人详细</p>
        </center>
    </center>
 <div id="loadallexcel" >
    <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelnow()" id="excelnow">导出本页数据</button>
    <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()" id="excelarea">导出办事处数据</button>
    <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="excelone">导出个人数据</button>
    <button  style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelrecordDetail()" id="excelrecordDetail">导出详细信息</button>
   
</div>
<script type="text/javascript">
    ////////////////

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

        $('#qd').remove();

        areaid2 = $("#areaid").html();
        popomname = $("#popomname").html();
        countname = $('#countname').html();

        $("#power").hide();
        $("#areaid").hide();
        $("#popomname").hide();
        $('#countname').hide();
        $("#ZidFromMaster").hide();
        $('#AidFromMaster').hide();

        //        if (power == 7) {
        //            document.getElementById("tuiguangbianhao").style.display = "none";
        //        }

        if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
            $('#excelarea').show();
            $('#excelnow').show();
            $('#excelone').show();
            $('#excelrecordDetail').show();
        }
        else if (power == 5 || power == 6) {
            $('#excelarea').hide();
            $('#excelnow').show();
            $('#excelone').show();
            $('#excelrecordDetail').show();
        }
        else {
            $('#excelarea').hide();
            $('#excelnow').hide();
            $('#excelone').hide();
            $('#excelrecordDetail').hide();
        }
        ////////////////////////////////////////////////////////
        var szoneid = $('#ZidFromMaster').html();
        if (szoneid != "") {

            //根据Master传过来的AreaID,显示相对应的数据
            if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {

                $('#zone').attr('value', szoneid);
            }
        }
        ///////////////////////////////////////////////////////
        loadArea();
        //办事处，网吧主管，推广员帐号隐藏办事处选项
        if (power == 5 || power == 6 || power == 7) {
            $('#areaHide1').hide();
        }
        mygrid = $("#list").jqGrid({
            width: 790,
            height: 450,
            url: 'RecordDetailUser/',
            datatype: 'json',
            mtype: 'POST',
            //pager: '#pager',
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',

            colNames: ['责任人', '责任人帐号', '考核次数', '主管考核', '督察考核', '客情关系', '网吧信息', '网吧宣传品', '客户端覆盖', '1V1拉新', '总得分'],
            colModel: [{ name: 'USERNAME', index: 'USERNAME', width: 160, align: 'center' },
                        { name: 'UACCOUNT', index: 'UACCOUNT', width: 160, align: 'center' },
                        { name: 'ZKH', index: 'ZKH', width: 160, align: 'center' },
                        { name: 'ZGKH', index: 'ZGKH', width: 160, align: 'center' },
                        { name: 'DCKH', index: 'DCKH', width: 160, align: 'center' },
                        { name: 'APOINT', index: 'APOINT', width: 160, align: 'center' },
                        { name: 'BPOINT', index: 'BPOINT', width: 160, align: 'center' },
                        { name: 'CPOINT', index: 'CPOINT', width: 160, align: 'center' },
                        { name: 'DPOINT', index: 'DPOINT', width: 160, align: 'center' },
                        { name: 'EPOINT', index: 'EPOINT', width: 160, align: 'center' },
                        { name: 'ZPOINT', index: 'ZPOINT', width: 160, align: 'center'}],

            onSelectRow: function(rowid) {
                var rowdata = mygrid.getRowData(rowid);
                if (rowdata.UACCOUNT != "合计") {

                    DisplayDetails(rowid);

                }
            }
        });

        setTimeout('loadData()', 1000);
    });

    function DisplayDetails(rowIndex) {
        var rowData = mygrid.getRowData(rowIndex);
        var umane = "";
        if (rowData.USERNAME == "") {
            umane = "0";
        }

        else {
            umane = rowData.UACCOUNT;
        }
        var sareaid = $('#area').val() + "," + umane;
        $.ajax({
            url: "RecordUserSlave/",
            type: "POST",
            dataType: "json",
            data: { strMessage: sareaid },
            success: QueryDetail
        });
    }


    function DisplayDetailsALL() {

        var sareaid = $('#area').val() + "," + "";
        $.ajax({
            url: "RecordUserSlave/",
            type: "POST",
            dataType: "json",
            data: { strMessage: sareaid },
            success: QueryDetail
        });
    }

    function QueryDetail() {
    
        var str = "http://" + location.host + "/Business.aspx/RecordWB";
        location.href(str);
    }
    
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
                //根据Master传过来的AreaID,显示相对应的数据
                var sareaid = $('#AidFromMaster').html();
                if (sareaid != "") {
                    if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
                        $('#area').attr('value', sareaid);
                        $('#AidFromMaster').html("");
                    }
                }
        }
        
    }
    
    function loadData() {
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
        var searchstring = $('#uaccount').val();
        var said = $('#area').val();
        mygrid.appendPostData({ AreaID:said,Start: begintime, End: endtime, SearchString: searchstring, SearchType: searchtype });
        mygrid.trigger('reloadGrid');
    }

   

    ///////////////////////////////////load excel
    function loadexcel() {
        str = "http://" + location.host + "/Business.aspx/showexcel/";
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

    function loadexcelnow() {


        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        tabsIndex = tabsIndex;
        var parm642 = BASE64.encode($("#beginTime").val() + "," + $("#endTime").val());
        str = "http://" + location.host + "/Business.aspx/showexcelRecordDetailUser/";
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
