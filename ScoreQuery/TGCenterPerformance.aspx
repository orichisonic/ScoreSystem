<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广中心
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.WModels.TgsOutachiveCondition condtion = (TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            string gameidx = "0";
            string strByMonth = "";
            string strDefines = "0,"; 
            DateTime dteBegin;
            DateTime dteEnd;
            if (condtion != null)
            {
                dteBegin = condtion.START;
                dteEnd = condtion.END;
                strByMonth = condtion.bymonth;
                gameidx = condtion.gameidx;
                strDefines = condtion.DEFINEID;
            }
            else
            {
                dteBegin = Convert.ToDateTime("2010-1-1");
                dteEnd = DateTime.Now;
                strDefines = "0,";
            }
        %>
        <span id="power"><%=account.POPEDOMID %></span>
        <span id="beginDate"><%=dteBegin.ToShortDateString() %></span>
        <span id="endDate"><%=dteEnd.ToShortDateString()%></span>
        <span id="bymonthFlg"><%=condtion.bymonth %></span>
        <span id="gameIdx"><%=condtion.gameidx %></span>
        <span id="defineStr"><%=condtion.DEFINEID %></span>
        
    <fieldset>
        <legend visible="false">查询条件</legend>
        <div id="frm1" style="text-align: left">
            <ul class="verticality"  id="by_day_id">
             <li style=" vertical-align:bottom"><input style="vertical-align:bottom" name="rd1" type="radio" value="1" checked="checked"/>按日期查询（数据为24小时刷新）开始日期    <input style="vertical-align:bottom" type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2010-1-1"/>
             结束日期 <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>"/></li>
           </ul>
            <ul class="verticality">
                <li>
                    <input name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
                    <select style="width:95px;margin-left:1px; vertical-align:bottom" name="beginTime2" id="beginTime2">
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
                            for (int z =1; z <= tempMonth; z++)
                            {

                                YearMonth = t.Year.ToString() + "-" + z.ToString();
                        %>
                        <option value="<%=YearMonth%>">
                            <%=YearMonth%></option>
                        <%  } %>
                    </select>
                    <br />
                </li>
            </ul>
            <ul class="verticality">
            
            <li style=" vertical-align:bottom">类别:              
                 <select  style="width:226px;" name="GAME" id="GAME">
                    <option  value="0">所有游戏</option>
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                        { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
                <span id="test" style="color:#000000">
                    <select  style="width:150px;" name="Gclass" id="Gclass" onchange="return class_onclick()">
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                        {
                    %>
                    <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%></option>
                    <%
                        }
                     %>
                    </select>
                </span> 
                <button style="margin-left:57px;" class="ui-state-default ui-corner-all" type="button" onclick="LoadData()">查询</button>    <br />
            </li>

            </ul>
           </div>
    </fieldset>
            
    <div id="Div1">

    <div id="tabs"  style="text-align: center">
          <table cellpadding="0" cellspacing="0" border="0" style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
            <tr style="background-color:#FFFFFF; font-weight:bold" >
                
                <td rowspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle; color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                办事处</td>
                <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                直接推广</td>
                <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                间接推广</td>
                <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                线上推广</td>
                <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                其他推广</td>
                <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                总业绩</td>
            </tr>
            <tr style="background-color:#FFFFFF; font-weight:bold">
                <%--直接推广--%>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                金额</td>
                
                <%--间接推广--%>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                金额</td>

                <%--线上推广--%>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                金额</td>
                
                <%--其它推广--%>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                金额</td>
            </tr>
            <tbody id="tbd">
                <%
                    List<TGProject.Models.WModels.TGSOUTACHIVEAREA> AreaList = (List<TGProject.Models.WModels.TGSOUTACHIVEAREA>)ViewData["AREA"];
                    if (AreaList != null && AreaList.Count > 0)
                    {
                        decimal RowNum = 0;
                        foreach (TGProject.Models.WModels.TGSOUTACHIVEAREA rows in AreaList)
                        {
                            RowNum = RowNum + 1;
                            rows.ZJCONSSUM = Math.Round(rows.ZJCONSSUM / 100);
                            rows.IDCONSSUM = Math.Round(rows.IDCONSSUM / 100);
                            rows.XTCONSSUM = Math.Round(rows.XTCONSSUM / 100);
                            rows.QTCONSSUM = Math.Round(rows.QTCONSSUM / 100);
                            rows.OUTACHIVE = Math.Round(rows.OUTACHIVE / 100);
                %>
                    <tr id=<%="tr" + RowNum%>>
                        <%-- 办事处--%>
<%
                        if (rows.AREANAME == "合计" || rows.AREANAME == "总部")
                        {
%>
                        <td  style="border: 1px solid #000000;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                          <b><%=rows.AREANAME%></b>
                        </td>
<% 
                        }
                        else
                        {
%>
                        <td  style="border: 1px solid #000000;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                           <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>  
<%
                        } 
%>
                        <%--直接推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSSUM%>
                        </td>
                        
                        <%--间接推广--%>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%>
                        </td>

                        <%--线上推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSSUM%>
                        </td>
                        
                        <%--其他推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSSUM%>
                        </td>
                        
                        <%--总业绩--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.OUTACHIVE%>
                        </td>
                    </tr>                          
<%
                        }
                    }
%>
</tbody>
        </table> 
    </div>
    </div>
    <%if (AreaList != null)
      {
          if (AreaList.Count != 0)
          { %>
    <center>  
         <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
         <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
    </center>
    <div id="loadallexcel" >
       <button style="margin-top:10px;" id="excelarea" class="ui-state-default ui-corner-all" type="submit" onclick="loadexcelarea()">导出办事处数据</button> 
                <button style="margin-top:10px;" id="excelone" class="ui-state-default ui-corner-all" type="submit" onclick="loadexcelone()">导出个人数据</button>
              
    </div>
    <%}
      } %>
 <script type="text/javascript">
     var selectindex = 0;
     var power = 0;
     var GCombobox = 0;
     $('#Div1').tabs();

     $(document).ready(function() {
         $("#power").hide();
         $("#beginDate").hide();
         $("#endDate").hide();
         $("#bymonthFlg").hide();
         $("#gameIdx").hide();
         $("#defineStr").hide();
         //画面条件初始化
         //查找时间
         var sTime = $("#beginDate").html();
         var eTime = $("#endDate").html();
         $("#beginTime").attr("value", sTime);
         $("#endTime").attr("value", eTime);

         var sbymonth = $("#bymonthFlg").html()
         if (sbymonth != "") {
             $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
             $("#beginTime2").val(sbymonth);
         }

         //所选择的游戏
         var gameidx = $("#gameIdx").html();
         $("#GAME").attr("value", gameidx);

         //所选择的活动
         $("#Gclass").empty();
         if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
             $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
         else {

             loadDefine($("#GAME").val());
         }
         $("#GAME").bind('change', function() {
             loadDefine($("#GAME").val());
             if ($("#GAME").val() == 0) {
             }
             else {
             }
         });

         $('#Gclass')[0].selectedIndex = 1;


         //////////////////////////点击大区连接跳转页面
         $("td > a").bind('click', function() {
             var begintime = $("#beginTime").val();
             var endtime = $("#endTime").val();
             //活动ID串
             var actionStrings = "";
             for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                 var chkName = "mst" + k;
                 if ($("#" + chkName).attr("checked") == true) {
                     actionStrings = actionStrings + $("#" + chkName).val() + ",";
                 }
             }
             if (actionStrings == undefined || actionStrings == "undefined" || actionStrings == "") {
                 alert("请选择要查询的活动！");
                 return;
             }

             //所选择游戏
             var gameidx = $("#GAME").val();

             //办事处ID
             var href = $(this).attr('href');
             var hrefindex = href.split(",");
             var href1 = hrefindex[0];
             var href2 = hrefindex[1];
             
             //活动ID串+开始时间+结束时间+按月查找区分+游戏code+办事处ID
             var parm641 = BASE64.encode(actionStrings + ";" + begintime + ";" + endtime + ";" + "" + ";" + gameidx + ";" + href1);
             href = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + parm641;

             $(this).attr('href', href);
         });


     });

     function QueryDetail() {
         var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeLst";
         location.href(str);
     }
 var define = 0;
 var areaID = 0;

 //给查询按钮查询
 function LoadData() {
  
     var define;
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

         //所选择游戏
         var gameidx = $("#GAME").val();
         
         //活动ID串
         actionString = "";
         for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ",";
             }
         }
         if (actionString == undefined || actionString == "undefined" || actionString == "") {
             alert("请选择要查询的活动！");
             return;
         }
         
         //查找时间
         beginTime = $("#beginTime").val();
         endTime = $("#endTime").val();
         
         //活动ID串+开始时间+结束时间+按月查找区分+游戏名
         var parm644 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";" + "" + ";" + gameidx);
         str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGCenterPerformanceInfo/" + parm644;
         location.replace(str);
     }
     else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
        //按月查找
     
        //查找时间
         var timeindex = $("#beginTime2").val().split('-');
         var timebegin;
         var timespan = 0;
         if (timeindex[1] == 1) {
             timespan = 12;
             timebegin = timeindex[0] - 1;
         } else {
             timespan = timeindex[1] - 1;
             timebegin = timeindex[0] - 1;
         }

         //所选择游戏
         var gameidx = $("#GAME").val();
         
         //活动ID串
         actionString = "";
         for (k = 0; k <=$('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ",";
             }
         }
         if (actionString == undefined || actionString == "undefined" || actionString == "") {
         
             alert("请选择要查询的活动！");
             return;
         }
             beginTime = timeindex[0] + "-" + timespan + "-" + "25";
             endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
             var bymonth = $("#beginTime2").val();
             var parm645 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";"  + bymonth + ";" + gameidx);
             str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGCenterPerformanceInfo/" + parm645;
             location.replace(str);
         
     }
 }





 function loadexcelone() {
     actionString = "";
     for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
         var chkName = "mst" + k;
         if ($("#" + chkName).attr("checked") == true) {
             actionString = actionString + $("#" + chkName).val() + ",";
         }
     }
     if (actionString == undefined || actionString == "undefined" || actionString == "") {
         alert("请选择要查询的活动！");
         return;
     }
     var beginTime = $("#beginTime").val();
     var endTime = $("#endTime").val();
     var strP64ea = BASE64.encode(actionString+";"+beginTime + ";" + endTime);
     str = "http://" + location.host + "/ScoreQuery.aspx/showexcelone/" + strP64ea;
     location.replace(str);
 
 }


 function loadexcelarea() {
     actionString = "";
     for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
         var chkName = "mst" + k;
         if ($("#" + chkName).attr("checked") == true) {
             actionString = actionString + $("#" + chkName).val() + ",";
         }
     }
     if (actionString == undefined || actionString == "undefined" || actionString == "") {
         alert("请选择要查询的活动！");
         return;
     }
     var beginTime = $("#beginTime").val();
     var endTime = $("#endTime").val();
     var strP64ea = BASE64.encode(actionString+";"+beginTime + ";" + endTime);
     
     str = "http://" + location.host + "/ScoreQuery.aspx/showexcelarea/" + strP64ea;
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
 function loadDefine() {


     $("#Gclass").empty();
     $('#test').html('');
     $('#test').html('<span id="test"  style="color:#000000"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()"  multiple="multiple"></select></span>');
     $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
 }

 function loadSuccessed(result) {
     
     $("#Gclass").empty();
     var defineStr = ""
     defineStr = $("#defineStr").html();

     var definesArray = defineStr.split(',');

     if (result.rows.length > 0) {
         $.each(result.rows, function(i, item) {
            
             var hasFlg = 0;
             var routelong = definesArray.length;
             for (idef = 0; idef < routelong; idef++) {
                 if (definesArray[idef] == item.cell[0]) {
                   
                     hasFlg = 1;
                     break;
                 }
                 else {
                     hasFlg = 0
                 }
             }
             if (hasFlg == 1) {
                 $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
             }
             else {
                 $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
             }
         });
     }
     else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
     //$("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
     if ($("#view_more_result").val() != undefined) {
             $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
         else {
             $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
     $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
    }
            $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
           
  
 }
       </script>
</asp:Content>
