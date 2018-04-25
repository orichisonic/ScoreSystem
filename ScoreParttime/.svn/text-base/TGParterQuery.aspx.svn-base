<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广员
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <%
           TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
           TGProject.Models.WModels.TgsPTOutachiveCondition condtion = (TGProject.Models.WModels.TgsPTOutachiveCondition)ViewData["condition"];

           decimal Ukey = 0;
           decimal Areaid = 0;
           DateTime dteBegin;
           DateTime dteEnd;
           string strByMonth = "";

           string uname = string.Empty;
           string uaccount = string.Empty;
           decimal ptnum = 0;
           if (condtion != null)
           {
               Ukey = condtion.UKEY;
               Areaid = condtion.AREAID;
               dteBegin = condtion.START;
               dteEnd = condtion.END;
               strByMonth = condtion.bymonth;
               uname = condtion.uname;
               uaccount=condtion.uaccount;
               ptnum = condtion.ptnum;
           }
           else
           {
               Ukey = account.UKEY;
               Areaid = account.AREAID;
               dteBegin = Convert.ToDateTime("2009-9-1");
               dteEnd = Convert.ToDateTime("2010-12-1");
               uname = account.USERNAME;
               uaccount=account.UACCOUNT;
           }
          

       %>
       
       <div id="hidearea">
        <span id="uk"><%=Ukey%></span>
        <span id="areaid"><%=Areaid%></span>
        <span id="bymonth"><%=strByMonth%></span>
        <span id="begint"><%=dteBegin.ToShortDateString()%></span>
        <span id="endt"><%=dteEnd.ToShortDateString()%></span>
        </div>
    <p id="titleP"><b><% ="推广员：" + uname + "        推广帐号：" + uaccount + "        共发展兼职推广员" + ptnum + "名"%></b></p>
    <form>
    <fieldset>
        <legend>查询条件</legend>
        <div id="frm1">
            <ul class="verticality" id="by_day_id">
                <li>
                    <input name="rd1" type="radio" value="1" checked="checked" />
                    按日期查询（数据为24小时刷新）开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" />
                    结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2010-12-1" />
                </li>
            </ul>
            <ul class="verticality">
                <li>
                    <input  name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
                    <select style="width:95px;margin-left:5px; vertical-align:bottom" name="beginTime2" id="beginTime2">
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
                            for (int z = 1; z < tempMonth; z++)
                            {

                                YearMonth = t.Year.ToString() + "-" + z.ToString();
                        %>
                        <option value="<%=YearMonth%>">
                            <%=YearMonth%></option>
                        <%} %>>
                    </select>
                     
                    <br />
                </li>
            </ul>
            <ul class="verticality">
                <li>类别:                         <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">所有游戏</option>
                        
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        List<TGProject.Models.TGSGAMESHOW> DefineListgame = (List<TGProject.Models.TGSGAMESHOW>)ViewData["gameshow"];
                        foreach (TGProject.Models.TGSGAMESHOW define in DefineListgame)
                          {
                    %>
                    <option  value="<%=define.GAMECODE%>">
                        <%=define.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
               

                                <span id="test"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()">

                       
                    <%
                      
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                          {
                    %>
                    <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%></option>
                    <%
                        }
                     %>
                </select></span>
              
                                   
                   <button style="margin-left:57px; " class="ui-state-default ui-corner-all" type="submit" onclick="">
                    查询</button>   <br /> 
               <%--<button style="margin-left:65px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadData()" >查询</button>--%>
                </li>
            </ul>
        </div>
    </fieldset>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">查询结果：</a></li>
        </ul>
        <div id="tabs-1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
    </div>

 <center style="margin-top:10px">
                <button class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">
                    查看详细</button>
                <button style="margin-left:15px" class="ui-state-default ui-corner-all" type="button" onclick="ReturnPrevious()">
                    返回</button>
</center>
</from>

    <script type="text/javascript">
        var newdefineid = "";
        $('#tabs').tabs();
        var sTime = $("#begint").html()
        var eTime = $("#endt").html()
        var sbymonth = $("#bymonth").html()

        $(document).ready(function() {
            $("#hidearea").hide();
            $("#Gclass").multiSelect({ selectAll: false, noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
            defineIndex = $("#span1").attr("value");
            loadDefine(0);

            $("#Gclass").empty();
            $("#GAME").bind('change', function() {
                loadDefine($("#GAME").val());
                if ($("#GAME").val() == 0) {
                }

            });
            $("FORM").submit(function() {
                var results = $(this).serialize().replace(/&/g, 'end');
                results = decodeURI(results);
                // alert(results);
                var href = results;
                ////////////////////
                var index = href.indexOf("class=");
                if (index < 0) {
                    newdefineid = "0;"
                    alert("你还没有选择活动！");
                    return false;
                }
                else {
                    var temp = href.substring(index, href.length);
                    //             while ((index = temp.indexOf("class=")) >= 0) {

                    //                 temp = temp.substring(index, temp.length);
                    //                 alert(temp);
                    //             }
                    var array = temp.split("end");
                    newdefineid = "";
                    for (var i = 0; i < array.length; i++) {
                        //alert(array[i]);
                        if (array[i] != null) {
                            newdefineid += array[i].substring(6, array[i].length) + ";";
                        }
                    }
                }
                // alert(newdefineid);
                loadData();
                return false;
            });
            ////////////////////////////
            //////////////////////////////////////
            ///////////////////////////////////////
            mygrid = $("#list").jqGrid({
                width: 740,
                height: 400,
                url: 'http://' + location.host + '/ScoreParttime.aspx/TGParterQuery/',
                datatype: 'json',
                mtype: 'POST',
                pager: '#pager',
                rowNum: 40,
                rowList: [20, 40, 60, 80],
                sortname: 'Id',
                sortorder: "desc",
                viewrecords: true,
                imgpath: '/scripts/themes/steel/images',
                recordtext: '条记录',
                loadtext: '加载数据请稍候..',
                colNames: ['大区', '办事处', '职务', '姓名', '账号', '兼职推广员人数', '领取数', '消费用户数', '消费金额', '消费转换率', '有效用户数', '有效转换率', '业绩', '办事处排名', '大区排名', '总排名'],

                colModel: [{ name: 'zonename', index: 'ZONENAME', width: 70, align: 'center' },
                                        { name: 'areaname', index: 'AREANAME', width: 70, align: 'center' },
                                        { name: 'popedomname', index: 'POPEDOMNAME', width: 100, align: 'center' },
                                        { name: 'username', index: 'USERNAME', width: 70, align: 'center' },
                                        { name: 'uaccount', index: 'UACCOUNT', width: 70, align: 'center' },
                                        { name: 'putnum', index: 'PTNUM', width: 150, align: 'center' },
                                        { name: 'getnum', index: 'GETNUM', width: 100, align: 'center' },
                                        { name: 'consnum', index: 'CONSNUM', width: 100, align: 'center' },
                                        { name: 'conssum', index: 'CONSSUM', width: 100, align: 'center' },
                                        { name: 'consconv', index: 'CONSCONV', width: 100, align: 'center' },
                                        { name: 'availnum', index: 'AVAILNUM', width: 100, align: 'center' },
                                        { name: 'availconv', index: 'AVAILCONV', width: 100, align: 'center' },
                                        { name: 'outachive', index: 'OUTACHIVE', width: 70, align: 'center' },
                                        { name: 'bsorder', index: 'BSORDER', width: 100, align: 'center' },
                                        { name: 'zoneorder', index: 'ZONEORDER', width: 70, align: 'center' },
                                        { name: 'allorder', index: 'ALLORDER', width: 70, align: 'center'}],
                shrinkToFit: false
                //                footerrow: true,
                //                toolbar: [true, "bottom"]
            });
            if (sbymonth != "") {
                $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
                $("#beginTime2").val(sbymonth);
            }
            $("#beginTime").attr("value", sTime);
            $("#endTime").attr("value", eTime);
            setTimeout("loadData()", 2000);
        });

        function loadData() {
            var defineID = $("#Gclass option:selected").val();
            var ukey = $("#uk").html();
            var beginTime;
            var endTime;
            var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;


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
                beginTime = $("#beginTime").val();
                endTime = $("#endTime").val();
                DefineID = newdefineid;
                mygrid.appendPostData({ DEFINEID: defineID, UKEY: ukey, START: beginTime, END: endTime});
                mygrid.trigger('reloadGrid');
            }
            else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
                var timeindex = $("#beginTime2").val().split('-');
                var timespan = 0;
                beginTime = timeindex[0] + "-" + timespan + "-" + "25";
                endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                var bymonth = $("#beginTime2").val();
                DefineID = newdefineid;
                mygrid.appendPostData({ DEFINEID: defineID, UKEY: ukey, START: beginTime, END: endTime,  bymonth: bymonth });
                mygrid.trigger('reloadGrid');
            }
        }

        function QueryDetail() {
            var str = "";
            var define = $("#class option:selected").val();
            define = newdefineid;
            var beginTime;
            var endTime;
            var parm;
            var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
            var ukey = $("#uk").html();

            if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {

                if (!datedemo.test($("#beginTime").val())) {
                    alert("按日期查询开始时间不正确！");
                    return;
                }

                if (!datedemo.test($("#endTime").val())) {
                    alert("按日期查询开始时间不正确！");
                    return;
                }
                beginTime = $("#beginTime").val();
                endTime = $("#endTime").val();
                //活动id,开始时间,结束时间,UKEY,按月查找的日期
                parm = define + "," + beginTime + "," + endTime + "," + ukey + ",";
            }
            else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
                var timeindex = $("#beginTime2").val().split('-');
                var timespan = 0;
                var tmyear;
                if (timeindex[1] == 1) {
                    timespan = 12;
                    tmyear = timeindex[0] - 1;
                } else {
                    timespan = timeindex[1] - 1;
                    tmyear = timeindex[0];
                }
                beginTime = tmyear + "-" + timespan + "-" + "25";
                endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";


                var bymonth = $("#beginTime2").val();
                //活动id,开始时间,结束时间,UKEY,按月查找的日期
                parm = define + "," + beginTime + "," + endTime + "," + ukey + "," + bymonth;      //defineID,开始时间，结束时间，选择index,排序，按时间段/按月查找
            }


            var parm64;
            //明细
            parm64 = BASE64.encode(parm);
            str = "http://" + location.host + "/ScoreParttime.aspx/LoadTGParterQueryDetail/" + parm64; 
            location.reload(str);

        }
        function ReturnPrevious() {
            history.go(-1);
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
            // $("#Gclass").empty();
            // $('#test').html('');
            $('#test').html('<span id="test"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()"></select></span>');

            //定义全局URL以便返回能够找到controls
            //url = "http://" + location.host + "/ScoreOfficeController.aspx/loadDefine/";
            $.ajax(
             {
                 url: "loadDefine/" + $("#GAME").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessedID
             });
        }

        function loadSuccessedID(result) {

            //     $("#Gclass").empty();


            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {
                    $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                });
                $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
            }
            else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
                $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
                $("#Gclass").multiSelect({ selectAll: false, noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
            }
            else {
                $("#Gclass").multiSelect({ selectAll: false, noneSelected: '没有该游戏活动', oneOrMoreSelected: '% 个活动已被选择' });
            }

            // $("#Gclass").multiSelect({ selectAll: false, noneSelected: '没有该游戏活动', oneOrMoreSelected: '% 个活动已被选择' });


        }
    </script>

</asp:Content>
