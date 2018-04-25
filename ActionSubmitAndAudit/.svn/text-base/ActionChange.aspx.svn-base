<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动变更
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
        %>
         <span id="power"><%=account.POPEDOMID%></span>
    <ul style="color:Blue" >
        <li id="l1">下表显示为已提交但未开始执行的活动单号。</li>
        <li id="l2">如已经有活动开始执行，则此活动单号相关信息不得再进行修改。</li>
        <li id="l3">点击“删除”直接删除该活动单号信息。</li>
        <li id="l4">如活动单号部分信息变更，点击活动条目进行更改。</li>
    </ul>
    <div id="tabs1">
        <%Html.RenderPartial("DataGridControl"); %>
    </div>

<center>
        <p style="font-weight: bold">点击网吧名称查看网吧具体信息</p>
</center>
<script>
    var mygrid;
    var power
    $(document).ready(function() {

        $('#power').hide();
        power = $('#power').html()

        if (power == 2) {
            $('#l1').html("下表显示为已提交但未开始执行的活动单号");
            $('#l2').html("如已经有活动开始执行，则此活动单号相关信息不得再进行修改");
            $('#l3').html("点击“删除”直接删除该活动单号信息");
            $('#l4').html("如活动单号部分信息变更，点击活动条目进行更改。");
        }
        else {
            $('#l1').html("下表显示为已提交但尚未执行的活动。");
            $('#l2').html("在活动开始前的2天内，活动变更将无法提交。");
            $('#l3').html("如该活动取消，点击“删除”直接删除该活动信息");
            $('#l4').html("如活动信息变更，点击活动条目进行活动信息更改。");
        }
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'LoadActionChange/',
            //editurl: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionDel/",
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',
            colNames: ['活动游戏', '活动类型', '活动单号', '网吧名称', '活动日期', '活动开始时间', '活动结束时间', '包机数量', '活动费用', '删除', 'barid', 'actdid', 'actsid','actid'],
            //colNames: ['活动游戏'],
            colModel: [{ name: 'gamename', index: 'GAMENAME', width: 100, align: 'center', sortable: false },
                                                    { name: 'TYPENAME', index: 'TYPENAME', width: 100, align: 'center', sortable: false },
                                                    { name: 'ASNUMBER', index: 'ASNUMBER', width: 100, align: 'center', sortable: false },
                                                    { name: 'NETBARNAME', index: 'NETBARNAME', width: 160, align: 'center', sortable: false },
                                                    { name: 'ACTDATE', index: 'ACTDATE', width: 100, align: 'center', sortable: false },
                                                    { name: 'BEGINTIME', index: 'BEGINTIME', width: 140, align: 'center', sortable: false },
                                                    { name: 'ENDTIME', index: 'ENDTIME', width: 140, align: 'center', sortable: false },
                                                    { name: 'MACNUM', index: 'MACNUM', width: 100, align: 'center', sortable: false },
                                                    { name: 'ACTCOST', index: 'ACTCOST', width: 100, align: 'center', sortable: false },
                                                    { name: 'act', index: 'act', width: 60, align: 'center', sortable: false },
                                                    { name: 'barid', index: 'barid', width: 0, align: 'center', sortable: false, hidden: true },
                                                    { name: 'actdid', index: 'actdid', width: 0, align: 'center', sortable: false, hidden: true },
                                                    { name: 'actsid', index: 'actsid', width: 0, align: 'center', sortable: false, hidden: true },
                                                    { name: 'actid', index: 'actid', width: 0, align: 'center', sortable: false, hidden: true }
                                        ],
            loadComplete: function() {
                var ids = jQuery("#list").getDataIDs();
                for (var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    se = "<input id=" + i + "_DelBtn" + "style='height:22px;width:40px;' type='button' value='删除' onclick=deleterow(" + i + "); />";
                    $("#list").setRowData(cl, { act: se });
                }
            },
            //            onSelectRow: function(id) {
            //                DisplayDetails(id);
            //            }
            onCellSelect: function(rowid, iCol, cellcontent) {
                if (iCol != 9) {
                    DisplayDetails(rowid);
                }
            }

        });
        loadData();
    });
    //检查函数
    function checkAllowChange(id){
        var today = new Date();    
        var day = today.getDate();    
        var month = today.getMonth() + 1;    
        var year = today.getYear();    
        var date = year + "-" + month + "-" + day; 
        var rowData = mygrid.getRowData(id);
        var result = compareDate(rowData.ACTDATE, date, "-");
      
        if (result <= 2) {
            return false;
        }
        else {
            return true;
        }
    }
    function compareDate(first,second,sign)
    {
        fArray = first.split(sign);
        sArray = second.split(sign);
        var fDate = new Date(fArray[0],fArray[1],fArray[2]);
        var sDate = new Date(sArray[0],sArray[1],sArray[2]);

        var t = fDate.getTime()-sDate.getTime();
        var days = t/(1000*60*60*24);
        return days;
    }
    //修改某行
    function DisplayDetails(rowIndex) {
        if (power == 5) {
            if (checkAllowChange(rowIndex) == false) {
                alert("在活动开始前的2天内，活动内容不允许变更！");
                return;
            }
        }
        if (power == 5) {
            //办事处
            //获取ID
            var rowData = mygrid.getRowData(rowIndex);
            var prm = rowData.actsid + "," + rowData.actdid;
            var prm64 = BASE64.encode(prm);

            if (power == 2) {

            }
            else {
                location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChangeDetail/" + prm64;
            }
        }
        else {
            //总部
            var rowData = mygrid.getRowData(rowIndex);
            var prm = rowData.actsid + "," + rowData.actid;
            var prm64 = BASE64.encode(prm);

            if (power == 2) {
                location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActChangingByAsNumber/" + prm64;
            }
            else {

            }
        }

    }
    
   
    function loadData() {
        mygrid.appendPostData({ GameCode: 1, TypeID: 2, NetBarID: 3 });
        mygrid.trigger('reloadGrid');
    }
    //删除某行
    var needReomoveRow;
    function deleterow(id) {
        if (power == 5) {
            if (checkAllowChange(id+1) == false) {
                alert("在活动开始前的2天内，活动内容不允许变更！");
                return;
            }
        }
        if (power == 5) {
            //办事处;
            var r = confirm("确认删除？");
            if (r == true) {
                needReomoveRow = id + 1;
                var rowData = mygrid.getRowData(id + 1);
                var gr = jQuery("#list").getGridParam('selrow');
                var pm64 = BASE64.encode(rowData.actdid);
                $.ajax({
                    url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionDel/" + pm64,
                    type: "POST",
                    dataType: "json",
                    success: delSuccessed
                });
            }
            else {
            }
        }
        else if (power == 2) {
            //总部
            var r = confirm("确认删除？");
            if (r == true) {
                needReomoveRow = id + 1;
                var rowData = mygrid.getRowData(id + 1);
                var gr = jQuery("#list").getGridParam('selrow');
                var pm64 = BASE64.encode(rowData.actdid);
                $.ajax({
                    url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionDel/" + pm64,
                    type: "POST",
                    dataType: "json",
                    success: delSuccessed
                });
            }
            else {
            }
        }
           

    }

    function delSuccessed(result) {
        if (result.isSuccessed == 1) {
            $('#list').delRowData(needReomoveRow);
            alert("删除成功!");
        } else {
            alert("删除失败!");
        }
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