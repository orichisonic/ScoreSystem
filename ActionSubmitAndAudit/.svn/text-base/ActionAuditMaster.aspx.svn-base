<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动审核
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
       
        <span id="ukey">
            <%=account.UKEY %></span>
          <span id="myareaid"><%=account.AREAID%></span>
             <%--<%
    
                 TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
                 DateTime dteBegin;
                 DateTime dteEnd;
            int selectIdx = 0;
            string strByMonth = "";
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                dteBegin = condtion.START;
                dteEnd = condtion.END;
                strByMonth = condtion.bymonth;
            }
            else
            {
                dteBegin = Convert.ToDateTime("2009-9-1");
                dteEnd = Convert.ToDateTime("2010-12-1");
                selectIdx = 0;
            }
        %>--%>
       <%--   <span id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span id="endtime"><%=dteEnd.ToShortDateString()%></span>--%>

       <div id="tabs">
         <ul>
            <li><a href="#tabs1">未审核</a></li>
            <li><a href="#tabs2">已审核</a></li>
         </ul>
       <div id="tabs1">
       <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager" class="scroll" style="text-align: center;"></div>
       </div>
       <div id="tabs2">
       <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager2" class="scroll" style="text-align: center;"></div>
      </div>
      
     <ul>
            <li>点击条目进入审核页面</li>
        </ul>
    </div>
    
     <script type="text/javascript">
     
      $('#tabs').tabs();
    var mygrid;
    var mygrid2;
    var tabsIndex;
    var power;
    $("#power").hide();
    $("#ukey").hide();
    $("#myareaid").hide();
    $(document).ready(function() {
        ///////////////////
        $("#Select2").bind('click', function() {
            if ($("#Select2").val() == 0) {
                $("#uaccount").val('');
            }
        });
      
        var power = $('#userpopdem').html();
        if (power <= 4) {
        
            $('#excelall').show();
        }
        //////////////////////
        $("#zone").change(function() { loadArea() });
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
        $('#userAccount').show();
        $("#condition").hide();
//        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        //        if($("#"))
        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'ActiveAuditNetBarQuery/',
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
            colNames: ['执行方', '提交日期', '活动游戏', '活动类型', '活动单号', '活动场次','活动单号ID'],

            colModel: [{ name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                                        { name: 'refertime', index: 'REFERTIME', width: 160, align: 'center' },
                                        { name: 'gamename', index: 'GAMENAME', width: 160, align: 'center' },
                                        { name: 'typename', index: 'TYPENAME', width: 160, align: 'center' },
                                        { name: 'asnumber', index: 'ASNUMBER', width: 160, align: 'center' },
                                        { name: 'fieldnum', index: 'FIELDNUM', width: 160, align: 'center' },
                                        { name: 'actsid', index: 'ACTSID', width: 160, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }

            },
            onSelectRow: function(rowid) {
                DisplayDetails(rowid);
            }
        });
        mygrid2 = $("#list2").jqGrid({
            width: 800,
            height: 450,
            url: 'ActiveAuditNetBarQuery/',
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
            colNames: ['执行方', '提交日期', '活动游戏', '活动类型', '活动单号', '活动场次', '活动单号ID'],

            colModel: [{ name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                                        { name: 'refertime', index: 'REFERTIME', width: 160, align: 'center' },
                                        { name: 'gamename', index: 'GAMENAME', width: 160, align: 'center' },
                                        { name: 'typename', index: 'TYPENAME', width: 160, align: 'center' },
                                        { name: 'asnumber', index: 'ASNUMBER', width: 160, align: 'center' },
                                        { name: 'fieldnum', index: 'FIELDNUM', width: 160, align: 'center' },
                                        { name: 'actsid', index: 'ACTSID', width: 160, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list2").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }

            },
            onSelectRow: function(rowid) {
//                DisplayDetails(rowid);
            }
        });
//        loadDelay();
    });

//    function loadDelay() {
//        setTimeout("loadData(0)", 1000)
//    }
//    
    function DisplayDetails(rowIndex) {
        //获取ID
        var rowData = mygrid.getRowData(rowIndex);
        var netBarID = rowData.actsid;
      
        var prm64 = BASE64.encode(netBarID);

        if (netBarID != null)
            str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadActionAuditDetail/" + prm64;
        location.reload(str);

    }
    function loadData(index) {

        if (index == "undefined" || index == undefined) {

            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            index = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }
        if (index == 0) {
            mygrid.appendPostData({ Status: index });
            mygrid.trigger('reloadGrid');
        }
        else {
            mygrid2.appendPostData({ Status: index });
            mygrid2.trigger('reloadGrid');
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