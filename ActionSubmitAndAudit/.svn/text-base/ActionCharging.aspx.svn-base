<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动打卡
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset>
        <legend>查询条件</legend>
        <div style="text-align:left">
            <ul class="horizontal">
                <li style=" vertical-align:bottom">
                    <select name="class" id="GAME" >
                        <option  value="0">所有游戏</option>
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GamesList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Games"];
                        foreach (TGProject.Models.TGSGAMESHOW gameinfo in GamesList)
                        {    
                    %>
                        <option  value="<%=gameinfo.GAMECODE%>">
                        <%=gameinfo.GAMENAME%></option>
                    <%
                        }
                     %>
                    </select>
                </li>
                <li style=" vertical-align:bottom">
                    <select name="class" id="gtype">
                        <option  value="0">所有类型</option>
                    <%
                       List<TGProject.Models.TGSACTTYPEQUERY> Typelist = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["Typelist"];
                       foreach (TGProject.Models.TGSACTTYPEQUERY Typeinfo in Typelist)
                        {    
                    %>
                        <option  value="<%=Typeinfo.TYPEID%>">
                        <%=Typeinfo.TYPENAME%></option>
                    <%
                        }
                    %>
                    </select>
                </li>
                <li style=" vertical-align:bottom">
                    <select name="class" id="netbar">
                        <option  value="0">所有网吧</option>
                    <%
                        List<TGProject.Models.WModels.TGSNETBARBYTYPE> Netbarlist = (List<TGProject.Models.WModels.TGSNETBARBYTYPE>)ViewData["Netbarlist"];
                        foreach (TGProject.Models.WModels.TGSNETBARBYTYPE Netbarinfo in Netbarlist)
                        {    
                    %>
                        <option  value="<%=Netbarinfo.NETBARID%>">
                        <%=Netbarinfo.BARNAME%></option>
                    <%
                        }
                    %>
                    </select>
                </li>
                <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">查询</button>
            </ul>
        </div>
    </fieldset>
<div id="tabs1">
        <%Html.RenderPartial("DataGridControl"); %>
</div>
<script>

    $(document).ready(function() {
        mygrid = $("#list").jqGrid({
            width: 828,
            height: 450,
            url: 'ActionCharging/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询结果：',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',
            editurl: "ActionChange/",
            colNames: ['活动游戏', '活动类型', '活动单号', '网吧名称','网吧地址', '活动日期', '活动开始时间', '活动结束时间', '包机数量','活动ID'],
            //colNames: ['活动游戏', '活动类型', '活动单号', '网吧名称'],
            colModel: [{ name: 'gamename', index: 'GAMENAME', width: 160, align: 'center', sortable: false },
                                        { name: 'typename', index: 'TYPENAME', width: 100, align: 'center', sortable: false },
                                        { name: 'asnumber', index: 'ASNUMBER', width: 160, align: 'center', sortable: false },
                                        { name: 'barname', index: 'BARNAME', width: 200, align: 'center', sortable: false },
                                        { name: 'address', index: 'ADDRESS', width: 160, align: 'center', sortable: false },
                                        { name: 'actdate', index: 'ACTDATE', width: 160, align: 'center', sortable: false },
                                        { name: 'starttime', index: 'STARTTIME', width: 160, align: 'center', sortable: false },
                                        { name: 'endtime', index: 'ENDTIME', width: 160, align: 'center', sortable: false },
                                        { name: 'cnum', index: 'CNUM', width: 100, align: 'center', sortable: false },
                                        { name: 'actdid', index: 'ACTDID', width: 0, align: 'center', sortable: false, hidden: true }
                                        ],
            onSelectRow: function(rowid) {
                ActionChargingDetail(rowid);
            }
        });
    });
    function ActionChargingDetail(rowIndex) {
        //获取ID
        var rowData = mygrid.getRowData(rowIndex);
        var strBarname = rowData.barname.substring(rowData.barname.indexOf('>') + 1, rowData.barname.indexOf('</'));
        //var queryString=rowData.gamename+","+rowData.typename+","+rowData.asnumber+","+rowData.actdate+","+rowData.starttime+","+rowData.endtime+","+rowData.barname.substring(rowData.barname.indexOf('>')+1,rowData.barname.indexOf('</'))+","+rowData.address+","+rowData.actdid;

//        if (prm64 != null)
//            location.href = "ActionChargingDetail/" + prm64;

        $.ajax(
             {
                 url: "ActionChargingDetail/",
                 type: "POST",
                 dataType: "json",
                 data: { GAMENAME: rowData.gamename, TYPENAME: rowData.typename, ASNUMBER: rowData.asnumber, strActdate: rowData.actdate, strBegintime: rowData.starttime, strEndtime: rowData.endtime, BARNAME: strBarname, ADDRESS: rowData.address, ACTDID: rowData.actdid, CNUM: rowData.cnum },
                 success: loadSuccessed
             });
    }

    function loadSuccessed(result) {

        if (result.isSuccessed == 1) {
            location.href = "ActionChargingDetail/" ;
        }
                  
    }

    function loadData() {
        var gameCode = $("#GAME").val();
        var typeID = $("#gtype").val();
        var netBarID = $("#netbar").val();


        mygrid.appendPostData({ GameCode: gameCode, TypeID: typeID, NetBarID: netBarID });
        mygrid.trigger('reloadGrid');
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
