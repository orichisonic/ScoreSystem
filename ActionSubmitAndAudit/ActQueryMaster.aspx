<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	办事处活动
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
        %>
         <span id="power"><%=account.POPEDOMID%></span>
    <fieldset>
        <legend>查询条件</legend>
        <div id="frm1" style="text-align: center">
            <ul class="horizontal" id="by_day_id" >
            <% if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3)
                { %>
                <li id="zoneHide">大区<select name="zone" id="zone">
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
                </select>
                </li>
                <%} %>
                
                <% 
                    if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3||account.POPEDOMID == 4)
                    { 
                %>
                <li id="areaHide">办事处
                    <select id="area">
                        <option value="<%=account.AREAID %>">默认</option>
                    </select>
                <%  } %>
                </li> 
                <li style="color:Blue">开始日期
                    <input type="text" name="beginTime" id="begintime" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" />
                </li>
                
                <li style="color:Blue">结束日期
                    <input type="text" name="endTime" id="endtime" style="width: 90px" onfocus="setday(this)" value="2010-12-1" />
                </li>
                
                <li>
                   <button class="ui-state-default ui-corner-all" type="submit" style=" margin-left:10px" onclick="loaddata()">查询</button>
                </li>
            </ul>
        </div>
    </fieldset>
    
             
                

        
     <div id="tabs">
        <div id="tabs1">
            <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
            <div id="pager" class="scroll" style="text-align: center;"></div>
        </div>
    </div>
    <center>  
         <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
    </center>
     <script type="text/javascript">
         //////////////////
         $('#zone').val('2');
            function initialize() {
            $('#area').val('16');
            loaddata(0);
         }
         setTimeout('initialize()', 800);
         setTimeout('initialize()', 1400);
         ///////////////////////
        $('#tabs').tabs();
        var mygrid;
        var tabsIndex;
        var powernew;
    //检查函数
    function checkAllowChange(id) {
        var today = new Date();
        var day = today.getDate();
        var month = today.getMonth() + 1;
        var year = today.getYear();
        var date = year + "-" + month + "-" + day;
        var rowData = mygrid.getRowData(id);
         var result = compareDate(rowData.STARTTIME, date, "-");
        if (result <= 2) {
            return false;
        }
        else {
            return true;
        }
    }
    function compareDate(first, second, sign) {
        fArray = first.split(sign);
        sArray = second.split(sign);
        var fDate = new Date(fArray[0], fArray[1], fArray[2]);
        var sDate = new Date(sArray[0], sArray[1], sArray[2]);

        var t = fDate.getTime() - sDate.getTime();
        var days = t / (1000 * 60 * 60 * 24);
       
        return days;
    }


    /////////////////
    $(document).ready(function() {
        ///////////////////
        $('#power').hide();
        $('#zoneHide').hide();
        $('#areaHide').hide()
        powernew = $('#power').html()
        $("#searchtype").bind('change', function() {
            //alert($("#searchtype").val());
            if ($("#searchtype").val() == 0) {
                $("#searchcontent").val('');
            }
        });

        var power = $('#userpopdem').html();
        if (power <= 4) {
            $('#excelall').show();
        }
        //////////////////////
        $("#zone").change(function() { loadArea() });
        $('#tabs').bind('tabsselect', function(event, ui) { loaddata(ui.index) });
        $('#userAccount').show();
        $("#condition").hide();
        //        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        if ($("#area").text().indexOf("默认") > -1) {
            // alert("请选择办事处");
            loadArea();
            // return;
        }
        if (powernew == 8) {
            $('#btnHide').hide();
        }

        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'ActQueryMaster/',
            datatype: 'json',
            mtype: 'POST',
            //pager: jQuery('#pager'),
            rowNum: 100,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询结果：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['办事处', '确认活动', '变更活动', '已执行活动','办事处ID'],

            colModel: [{ name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                       { name: 'ASNUMBER', index: 'ASNUMBER', width: 160, align: 'center' },
                       { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                       { name: 'BARNAME', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'AREAID', index: 'AREAID', width: 50, align: 'center',hidden:true }
                       ],

            onSelectRow: function(rowid) {
                var rowdata = mygrid.getRowData(rowid);
                if (rowdata.UACCOUNT != "合计") {
                    DisplayDetails(rowid);

                }
            }
        });
    });

    //显示详细信息
    function DisplayDetails(rowIndex) {
        //获取审批ID
        var rowData = mygrid.getRowData(rowIndex);
        var sAreaID = rowData.AREAID;
        $.ajax({
        url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActQuerySlave",
            type: "POST",
            dataType: "json",
            data: { strMessage: sAreaID },
            success: QueryDetail
        });
    }

    function QueryDetail() {
        var str = ""

        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionQuery";
        location.href(str);
    }
    
    function loaddata(index) {
       
        var beginTime = $("#begintime").val();
        var endTime = $("#endtime").val();
        var areaid = $("#area").val();
        var power = $('#userpopdem').html();
        if (power < 5) {
            mygrid.appendPostData({ dtStart: beginTime, dtEnd: endTime });
           
        }
        else {
            mygrid.appendPostData({ dtStart: beginTime, dtEnd: endTime });
        }
        mygrid.trigger('reloadGrid');
    }
    ///////////////////////////////////
    
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