<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	网吧导入
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
<% string SaveSelected = (string)Session["SaveSelected"];
   if (SaveSelected == null)
   {
       SaveSelected = string.Empty;
   }
    %>
    <span id="power"><%=account.POPEDOMID %></span> 
    <span id="ukey"><%=account.UKEY %></span>
    <span id="myareaid"><%=account.AREAID%></span>
    <span id="saved"><%=SaveSelected%></span>    
    <div>
     <ul style="text-align:right">
                   <li id="userAccount">
                    <select name="Select2" id="Select2">
                    <option value="0">搜索全部</option>
                    <option value="1">网吧名称</option>
                    <option value="2">网吧编号</option>
                    <option value="3">推广员姓名</option>
                    <option value="4">推广员帐号</option>
                    </select>
                    <input type="text" name="uaccount" id="uaccount" style="width: 90px"/>
                       <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                           搜索
                       </button>
                   </li>
               
                </ul>
                <ul style="color:Blue">
                  <li>下表显示为办事处或合作方辖区内已经录入的网吧</li>
                 <li>如未找需要进行活动的网吧，请通过推广平台进行网吧信息的录入和审核后，再进行活动提交。</li>
                
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
    
       <center style="margin-top:10px">
                <button class="ui-state-default ui-corner-all" type="submit" onclick="ImorptCallback()">
                    确定导入</button>
                <button style="margin-left:15px" class="ui-state-default ui-corner-all" type="button" onclick="ReturnPrevious()">
                    取消返回</button>
            </center>
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

    $(document).ready(function() {
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
            url: 'http://' + location.host + '/ActionSubmitAndAudit.aspx/NetBarQuery2/',
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
            colNames: ['网吧名称', '网吧地址', '录入途径', '选择导入', '网吧编号'],

            colModel: [{ name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                       { name: 'address', index: 'ADDRESS', width: 220, align: 'center' },
                       { name: 'basefrom', index: 'basefrom', width: 100, align: 'center' },
                       { name: 'importbool', index: 'IMPORTBOOL', width: 260, align: 'center', width: 60, editable: true, edittype: "checkbox", editoptions: { value: "True:False"} },
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
                    $("#list").restoreRow(idstring);
                    jQuery('#list').editRow(id);
                    lastsel3 = lastsel3 + "," + id;
                }
                if ($('#' + id + "_importbool").attr('checked') == true) {
                    selectedRows = selectedRows + ";" + mygrid.getRowData(id).netbarid + ";" + ",";
                }
                else {
                    if (selectedRows.indexOf(";" + mygrid.getRowData(id).netbarid + ";") >= 0) {
                        selectedRows = selectedRows.replace(";" + mygrid.getRowData(id).netbarid + ";" + ",", "");
                    }
                }
            }
        });
        loadDelay();
        $("#list").hideCol("netbarid");
    });
    function sndInfo() {
        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/sndInfo/" + selectedRows,
            type: "POST",
            dataType: "json"
        });

    }
    function ImorptCallback() {
        var nid = selectedRows.replace(new RegExp(';', "gm"), '');
        nid = nid.substr(0, nid.length - 1);
        var prm64 = BASE64.encode(nid);
        //location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadNetbar/" + prm64;
        $.ajax({
        url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/saveInfo/" + prm64,
            type: "POST",
            dataType: "json",
            success: Successed
        });
    }
    function Successed(result) {
        location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadNetbar/";
    }


    function ReturnPrevious() {

        history.go(-1);

    }

    function loadDelay() {
        setTimeout("loadData(0)", 1000)
    }

    function loadData(index) {
     
        if (index == "undefined" || index == undefined) {

            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            index = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }


        var areaID = $("#myareaid").html();
        d = new Date();
        var s = "";
        s = s + d.getYear() + "-";
        s += (d.getMonth() + 1) + "-";
        s += d.getDate()-1;
        var s2 = "";
        s2 = s2 + d.getYear() + "-";
        s2 += (d.getMonth() + 1) + "-";
        s2 += d.getDate();

//        s += d.getHours() + "时"
//        s += d.getMinutes() + "分"
        var beginTime = "2009-9-1";
        var endTime = "2012-12-1";
        var account = $("#uaccount").val();
        var searchtype = $("#Select2").val();
        var NetBarID = $("#uaccount").val();

        
        if (account == "") {
            searchtype = 0;
        }
        mygrid.clearGridData();
        mygrid.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });


            if ($("#list").getGridParam("records") != null)
                $("#totalsum").text($("#list").getGridParam("records"));
            else
                $("#totalsum").text(0);
            mygrid.trigger('reloadGrid');
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