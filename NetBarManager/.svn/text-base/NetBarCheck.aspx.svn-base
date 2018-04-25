<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧审核
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("ExamineConditionControl"); %>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">未审核</a></li>
            <li><a href="#tabs1">已通过审核</a></li>
            <li><a href="#tabs1">未通过审核</a></li>
        </ul>
        <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
    </div>
    <div>
        <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
        <span id="power">
            <%=account.POPEDOMID %></span>
    </div>
    <script type="text/javascript">
        var currRowID = 0;
        var power = $("#power").html();
        var mygrid;
        var tabsIndex = 0;
        $('#tabs').tabs();
        setTimeout('loadData()', 900);
        $(document).ready(function() {

            $("#power").hide();

            if (power == 4)
                loadArea();

            if (power == 5) {
                $("#areaHide1").hide();
            }
            $("#zone").change(function() { loadArea() });
            $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
            loadArea();
            mygrid = $("#list").jqGrid({
                width: 800,
                height: 450,
                url: 'LoadNetBarCheckInfo/',
                datatype: 'json',
                mtype: 'POST',
                pager: jQuery('#pager'),
                rowNum: 20,
                rowList: [20, 40, 60, 80],
                sortname: 'Id',
                sortorder: "desc",
                viewrecords: true,
                imgpath: '/scripts/themes/steel/images',
                caption: '点击记录查看详细信息',
                recordtext: '条记录',
                loadtext: '加载数据请稍候....',
                colNames: ['序号', '网吧名称', '省份', '城市', '区/县', '申请人', '申请人帐号', '类型', '申请时间', '录入途径'],

                colModel: [{ name: 'NETBARID', index: 'NETBARID', width: 160, align: 'center' },
                                { name: 'BARNAME', index: 'BARNAME', width: 160, align: 'center' },
                                { name: 'PROVINCE', index: 'PROVINCE', width: 160, align: 'center' },
                                { name: 'CITY', index: 'CITY', width: 150, align: 'center' },
                                { name: 'COUNTY', index: 'COUNTY', width: 160, align: 'center' },
                                { name: 'APPLICANT', index: 'APPLICANT', width: 150, align: 'center' },
                                { name: 'APPLYACCOUNT', index: 'APPLYACCOUNT', width: 160, align: 'center' },
                                { name: 'NTYPE', index: 'NTYPE', width: 160, align: 'center' },
                                { name: 'HANDLETIME', index: 'HANDLETIME', width: 180, align: 'center' },
                                { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center'}],

                onSelectRow: function(rowid) {
                    DisplayDetails(rowid);
                }
            });
        });

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
            }
        }


        function loadData(index) {

            //获取当前tabsIndex;
            if (index == undefined) {
                tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            } else {
                tabsIndex = index;
            }

            var areaID = $("#area").val();
            var beginTime = $("#beginTime").val();
            var endTime = $("#endTime").val();

            mygrid.appendPostData({ AreaID: areaID, TypeID: tabsIndex + 1, BeginTime: beginTime, EndTime: endTime });
            mygrid.trigger('reloadGrid');
        }


        //显示详细信息
        function DisplayDetails(rowIndex) {
            //获取审批ID
            var rowData = mygrid.getRowData(rowIndex);
            var netBarID = rowData.NETBARID;
            var strprm64 = BASE64.encode(netBarID + "," + tabsIndex);
            location.href = "LoadNetBarCheckDetail/" + strprm64;
           // location.href = "LoadNetBarCheckDetail/" + netBarID + "," + tabsIndex;
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

        function loadDefine() {
            //定义全局URL以便返回能够找到controls
            //url = "http://" + location.host + "/ScoreOfficeController.aspx/loadDefine/";
            $('#test').html('<span id="test" style="color:Black;"><select    style="  width:226px;" name="Gclass" id="Gclass" onchange="return;return class_onclick()"   multiple="multiple"></select></span>');
            $.ajax(
             {
                 url: "http://" + location.host + "/ScoreOffice.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
        }
    </script>

</asp:Content>
