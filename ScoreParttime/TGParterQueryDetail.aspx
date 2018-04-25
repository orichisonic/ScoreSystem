<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广员推广业绩明细
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.WModels.TgsPTOutachiveCondition condtion = (TGProject.Models.WModels.TgsPTOutachiveCondition)ViewData["condition"];
            int selectIdx = 0;
            decimal ukey = 0;
            decimal sortkinds = 0;
            string strDate = string.Empty;
            if (condtion != null)
            {
                ukey = condtion.UKEY;
                selectIdx = condtion.selectIndex;
                sortkinds = condtion.ORDERKIND;
            }
            else
            {
                ukey = account.UKEY;
                selectIdx = 0;
            }
        %>
          <span id="ukey"><%=condtion.UKEY%></span>
        <span id="selectID"><%=selectIdx%></span>
        <span id="sortkinds"><%=sortkinds %></span>
        <form>
    <fieldset>
  <div id="tab2-userinfo">
   <ul class="verticality">
 <li>所查询时间:
        <span id="startt"><%=condtion.START.ToShortDateString()%></span>至<span id="endt"><%=condtion.END.ToShortDateString()%></span>
    </li><br /> 
   </ul>
   <ul class="verticality"><li>
   <select  style="width:226px;" name="GAME" id="GAME">

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
                    查询</button> 
               <%-- <button class="ui-state-default ui-corner-all" type="button" onclick="LoadTGPerformanceInfo2()">查询</button>--%>
                </li>
            </ul>
  </div>
 </fieldset><br />
 <div id="tabs">
  <ul>
   <li><a  href="#tabs-1">按业绩排列</a></li>
   <li><a  href="#tabs-1">按兼职推广员数量排列</a></li>
  </ul>
  <div id="tabs-1">
 <fieldset> 
  <div id="tabs2">
   <table id="list" class="scroll" cellpadding="0" cellspacing="0">
   </table>
   <div id="Div1" class="scroll" style="text-align: center;">
  </div>  
 </div>
</fieldset>
</div>
<center>
    <p style="font-weight: bold">点击人员查看个人详细</p>
    <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">返回</button>
</center>
</div>
</form>
 <script type="text/javascript">
     var newdefineid = "";
     var power = 0;
     var mygrid;
     var selectindex = 0;
     var idx = $("#selectID").html();
     var UKEYGLOBAL;

     $('#tabs').tabs();
     $('#selectID').hide();
     $('#sortkinds').hide();
     $('#ukey').hide();
     $("#power").hide();
     $("#Gclass").attr("value", idx)
     $('#tabs').tabs();
     $(document).ready(function() {

         ///////////////////
         //////////////////
         $("#Gclass").multiSelect({ selectAll: false, noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
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
                 newdefineid = "x";
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
                 // alert(newdefineid);
             }
             loadData();
             return false;
         });
         //////////////////////
         /////////////////////
         UKEYGLOBAL = $("#ukey").html();
         $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
         var url = "http://" + location.host + "/ScoreParttime.aspx/TGParterQueryDetail2/";
         mygrid = $("#list").jqGrid({
             width: 750,
             height: 400,
             //         url: 'LoadTGPerformanceInfo2/',
             url: url,
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
             colNames: ['大区', '办事处', '推荐人', '职务', '姓名', '账号', '领取数', '消费用户数', '消费金额', '消费转换率', '有效用户数', '有效转换率', '业绩', '办事处排名', '大区排名', '总排名'],
             colModel: [{ name: 'zonename', index: 'ZONENAME', width: 70, align: 'center' },
                        { name: 'areaname', index: 'AREANAME', width: 70, align: 'center' },
                        { name: 'leadername', index: 'LEADERNAME', width: 70, align: 'center' },
                        { name: 'popedomname', index: 'POPEDOMNAME', width: 100, align: 'center' },
                        { name: 'username', index: 'USERNAME', width: 70, align: 'center' },
                        { name: 'uaccount', index: 'UACCOUNT', width: 70, align: 'center' },
                        { name: 'getnum', index: 'GETNUM', width: 100, align: 'center' },
                        { name: 'consnum', index: 'CONSNUM', width: 100, align: 'center' },
                        { name: 'conssum', index: 'CONSSUM', width: 100, align: 'center' },
                        { name: 'consconv', index: 'CONSCONV', width: 100, align: 'center' },
                        { name: 'availnum', index: 'AVAILNUM', width: 100, align: 'center' },
                        { name: 'availconv', index: 'AVAILCONV', width: 100, align: 'center' },
                        { name: 'outachive', index: 'OUTACHIVE', width: 70, align: 'center' },
                        { name: 'bsorder', index: 'BSORDER', width: 70, align: 'center' },
                        { name: 'zoneorder', index: 'ZONEORDER', width: 70, align: 'center' },
                        { name: 'allorder', index: 'ALLORDER', width: 70, align: 'center'}],
             shrinkToFit: false,
             onSelectRow: function(rowid) {
                 DisplayDetails(rowid);
             }
         });

         $("#Gclass").change(function() { loadData($("#Gclass").val()) });
         jQuery("#list").hideCol("tax");

     });

     function loadData(index) {
         if (newdefineid == "x") {
             alert("你还没有选择活动！");
             return;
         }
         if (index == undefined) {
             tabsIndex = $("#tabs").tabs().tabs("option", "selected");
         } else {
             tabsIndex = index;
         }


         var DEFINEID = $("#Gclass").val();
         var begintime = $("#startt").html();
         var endtime = $("#endt").html();
         var selectindex = $("#Gclass").val();
         DEFINEID = newdefineid;
         mygrid.appendPostData({ ORDERKIND: tabsIndex, DEFINEID: DEFINEID, UKEY: UKEYGLOBAL, START: begintime, END: endtime, selectIndex: selectindex });
         mygrid.trigger('reloadGrid');
     }

     function ReturnPrevious() {
         history.go(-1);
     }


     //显示详细信息
     function DisplayDetails(rowIndex) {
         //获取ID
         var rowData = mygrid.getRowData(rowIndex);
         var param = newdefineid +","+rowData.uaccount+","+$("#startt").html()+","+ $("#endt").html();
         var parm64 = BASE64.encode(param);
         if (parm64 != null)
             location.href = "http://" + location.host + "/ScoreParttime.aspx/PartTimeScore2/" + parm64;
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
        // alert($('#test').html());
         $('#test').html('<span id="test"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()"></select></span>');

         //定义全局URL以便返回能够找到controls
         //url = "http://" + location.host + "/ScoreOfficeController.aspx/loadDefine/";
         $.ajax(
             {
                 url: "http://" + location.host + "/ScoreParttime.aspx/loadDefine/" + $("#GAME").val(),
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
