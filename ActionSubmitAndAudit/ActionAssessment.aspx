<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动评估
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power" style="display:none">
        <%=account.POPEDOMID %></span> 
        <span style="display:none" id="ukey">
            <%=account.UKEY %></span>
          <span style="display:none" id="myareaid"><%=account.AREAID%></span>
             <%
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
        %>
          <span style="display:none" id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span style="display:none" id="endtime"><%=dteEnd.ToShortDateString()%></span>

  <fieldset>
        <legend>查询条件</legend>
        <div id="frm1">
            <ul class="horizontal" id="by_day_id">
                <li style="color:blue">
                    开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" /></li>
                    <li style="color:blue">
                    结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2010-12-1" /></li>
                    <li><span>搜索条件</span><select name="searchtype" id="searchtype" style="width: 90px">
                    <option value="0">搜索全部</option>
                    <option value="1">网吧名称</option>
                    <option value="2">活动游戏</option>
                    <option value="3">活动单号</option>
                    <option value="4">活动执行方</option>
                    </select>
                      <input type="text" name="searchcontent" id="searchcontent" style="width: 90px"/>
                       <button class="ui-state-default ui-corner-all" type="submit" style=" margin-left:10px" onclick="loaddata()">
                           查询
                       </button>
                </li>
            </ul>
        
            <ul style="text-align:right">
                   <li id="userAccount">
                    
                   </li>
               
                </ul>
        </div>
    </fieldset>
     <ul class="horizontal" style="text-align:right; display:none">
             
                <li>
                    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="$('#main').hide();$('#divIframe').hide();$('#netbarinfor').show();">
                        查看所选列网吧详细信息
                    </button></li>
            </ul>
            <div id="main">
     <div id="tabs">
        <ul>
            <li><a href="#tabs1">活动评估</a></li>

        </ul>
        <div id="tabs1">
       <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager" class="scroll" style="text-align: center;"></div>
      </div>
      <div id="tabs2">
       <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager2" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs3">
       <table id="list3" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager3" class="scroll" style="text-align: center;"></div>
      </div>
           
    </div>
                    <div style="text-align:left">
                    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="showexcel()">
                        导出数据
                    </button>
                    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelActAchive()" id="excelActAchive">
                        导出活动评估
                    </button>
                      
                     <span style="margin-left:220px; font-weight:bold">点击条目查看评估详细信息和网吧具体信息</span>   
                    </div>
</div>
<div style="display:none; vertical-align:middle; text-align:left" id="divIframe" title="详细信息">
    <fieldset>
        <legend>活动评估详细信息</legend>
      
            <div id="tab2-userinfo" style="float: left; vertical-align:middle">
                <ul class="verticality">
                    <li>活动游戏: <span style="margin-right:15px" id="GAMENAME">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>活动类型: <span id="TYPENAME"></span></li><br /> 
                    <li>活动单号: <span style="margin-right:15px" id="ASNUMBER">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>执行方: <span id="AREANAME"></span></li><br /> 
                    <li>网吧名称: <span style="margin-right:15px" id="BARNAME">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>活动日期: <span id="STARTTIME"></span></li><br /> 
                    <li>活动开始打卡人1: <span style="margin-right:15px" id="FIRSTACCOUNT">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>活动开始打卡人2:  <span id="SECONDACCOUNT"></span>活动结束打卡人:<span style="margin-right:15px" id="ENDACCOUNT"></span></li><br /> 
                    <li>活动费用: <span style="margin-right:15px" id="ACTCOST">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>活动评分: <span style="margin-right:15px" id="ACTGRADE"></span>扣款参考: <span id="Span5"></span></li><br /> 
                   
                 </ul>
               <div style="border: 1px solid #000000; border-collapse: collapse;text-align: center; width:100%; vertical-align:middle">

    <table align="center" cellpadding="0" 
        style="border-collapse: collapse; width:100%; text-align:center; vertical-align:middle">
        <tr style="background-color: #E3E3E1;  font-weight:bold" >
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center; width:90px">
                项目&nbsp</td>
            <td colspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;" >
                活动申请信息&nbsp;</td>
            <td colspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                活动执行信息&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                参考值&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                实际值&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                比例&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                评分&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                活动时长&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                活动开始时间&nbsp;</td>
            <td id="tdSTARTTIME" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                开始打卡时间&nbsp;</td>
            <td id="tdCLOCKSTARTTIME" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td id="tdREFERTIME" rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                <span>小时</span>&nbsp;</td>
            <td id="tdREALTIME" rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                小时&nbsp;</td>
            <td id="tdTIMERATIO" rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                XX%&nbsp;</td>
            <td id="tdACTGRADE" rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                -&nbsp;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                活动结束时间&nbsp;</td>
            <td id="tdENDTIME" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td  style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                结束打卡时间&nbsp;</td>
            <td id="tdCLOCKENDTIME" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
        </tr>
        <tr>
            <td rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                活动人数&nbsp;</td>
            <td rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                包机数量&nbsp;</td>
            <td id="tdCNUM" rowspan="2" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;vertical-align:middle">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                最高在线人数&nbsp;</td>
            <td id="tdMAXONLINENUM" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td  style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td  style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                平均在线人数&nbsp;</td>
            <td id="tdAVGONLINENUM" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>

        </tr>
        <tr>
            <td rowspan="3" style="border: 1px solid #000000; border-collapse: collapse;text-align: center; vertical-align:middle">
                活动效果&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                玩家数量&nbsp;</td>
            <td id="tdPLAYERNUM" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                玩家平均等级&nbsp;</td>
            <td id="tdAVGLEVEL" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>

        </tr>
        <tr>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                120小时后玩家平均等级&nbsp;</td>
            <td id="tdOTAVGLEVEL" style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                总计&nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
            <td style="border: 1px solid #000000; border-collapse: collapse;text-align: center;">
                &nbsp;</td>
        </tr>
    </table>

</div>
                <ul>
                  <li>
                       </li>
                 <li></li>
                 <li>最高在线人数:开始打卡时间至结束打卡时间内玩家在线的最高值。</li>
                 <li>平均在线人数:开始打卡时间至结束打卡时间内玩家在线的平均值。</li>
                 <li>玩家数量:开始打卡时间至结束打卡时间内所有登录过游戏的玩家帐号总量(需保存玩家帐号)。</li>
                 <li>玩家平均等级：开始打卡时间至结束打卡时间内所有登录过游戏的玩家帐号的平均等级。</li>
                 <li>120小时后玩家平均等级：开始打卡时间至结束打卡时间内所有登录过游戏的玩家帐号在活动结束后的120小时平均等级。</li>
                </ul>
                </div>
             </fieldset>
             <center>
                     <button style="margin-left:20px; margin-top:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="$('#main').show();$('#divIframe').hide()">
                      隐藏详细
                    </button>
                       <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="$('#main').hide();$('#divIframe').hide();$('#netbarinfor').show();searchLoad()">
                        查看所选列网吧详细信息
                    </button>
                      
                    </center>
               </div>
               
               
        <div id="netbarinfor" style="display:none">
                <fieldset>
            <legend>网吧详细信息</legend>
            <div>
                <ul class="verticality">
                    <li>网吧申请人:<span id='applicant'></span></li>
                     <li>网吧状态:<span id='status'></span></li>
                      <li>网吧绑定/锁定人:<span id='banname'></span></li>
                    <li>网吧名称: <span id='barName'></span></li>
                    <li>网吧所在地:<span id='province'></span>(省)<span id='city'></span>(市)<span id='county'></span>(县/区) </li>
                    <li>网吧地址:<span id='netbarAddr'></span></li>
                    <li>联系人: <span id='linkMan'></span></li>
                    <li>联系电话: <span id='phone'></span></li>
                    <li>电脑数量: <span id='macNum'></span></li>
                    <li>IP 类型: <span id='iptype'></span></li>
                    <li>IP 地址: <span id='ipaddress'></span></li>
                    <li>备注: <span id='remark'></span></li>
                </ul>
            </div>
        </fieldset>
                     <center>
                     <button style="margin-left:20px; margin-top:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="$('#netbarinfor').hide();$('#main').show();$('#divIframe').hide()">
                      隐藏详细
                    </button>
                        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="$('#netbarinfor').hide();$('#main').hide();$('#divIframe').show();">
                        查看详细评估信息
                    </button>
                
                    </center>
        </div>



     <script type="text/javascript">

         $('#tabs').tabs();
         var mygrid;
         var netbarid;
         var tabsIndex;
         var power;
         $(document).ready(function() {
             // $('tr').css({"border": "1px solid  #000000","text-align":"center","vertical-align":"middle", "color": "#000000", "font-size": "14px","border-style":"ridge","border-width":"1px","text-align":"center","font-size":"small"});
             ///////////////////
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
             $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
             $('#userAccount').show();
             $("#condition").hide();
             //        loadArea();
             //tabsIndex = $("#tabs").tabs().tabs("option", "selected");

             //        if($("#"))
             //所有通过审核的网吧信息
             mygrid = $("#list").jqGrid({
                 width: 750,
                 height: 450,
                 url: 'ActionAssessment/',
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
                 colNames: ['活动游戏', '活动类型', '活动单号', '执行方', '网吧名称', '活动日期', '包机数量', '活动费用', '活动评分', '', '', '', ''],
                 //  { name: 'NETBARID', index: 'NETBARID', width:0, align: 'center' },
                 colModel: [{ name: 'GAMENAME', index: 'GAMENAME', width: 160, align: 'center' },
                       { name: 'TYPENAME', index: 'TYPENAME', width: 160, align: 'center' },
                       { name: 'ASNUMBER', index: 'ASNUMBER', width: 160, align: 'center' },
                       { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                       { name: 'BARNAME', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'STARTTIME', index: 'STARTTIME', width: 160, align: 'center', sorttype: "date" },
                       { name: 'CNUM', index: 'CNUM', width: 160, align: 'center' },
                           { name: 'ACTCOST', index: 'ACTCOST', width: 160, align: 'center' },
                       { name: 'ACTGRADE', index: 'ACTGRADE', width: 160, align: 'center' },
                       { name: 'NETBARID', index: 'NETBARID', width: 0, align: 'center', hidden: true },
                        { name: 'ACTDID', index: 'ACTDID', width: 0, align: 'center', hidden: true },
                        { name: 'ENDTIME', index: 'ENDTIME', width: 0, align: 'center', hidden: true },
                         { name: 'CHECKTIME', index: 'CHECKTIME', width: 0, align: 'center', hidden: true }

                       ],
                 loadComplete: function() {
                     //                 var ids = mygrid.getDataIDs();
                     //                
                     //                     for (var i = 0; i < ids.length; i++) {
                     //                        // var cl = ids[i];
                     //                        // alert(ids[1]);
                     //                         be = "<input style='height:22px;width:60px;' type='button' value='评估详细' onclick= mygrid.editRow(" + ids[1] + "); ></ids>";
                     //                         se = "<input style='height:22px;width:60px;' type='button' value='网吧详细信息' onclick= mygrid.saveRow(" + ids[1] + "); />";
                     //                         //ce = "<input style='height:22px;width:20px;' type='button' value='C' onclick= mygrid.restoreRow(" + ids[1] + "); />";
                     //                         mygrid.setRowData(ids[i], { act: be + se }) 
                     //                     }
                     var sumrecords = $("#list").getGridParam("records");

                     if (sumrecords != null) {
                         $('#totalsum').text(sumrecords);
                     }

                 },

                 beforeEditCell: function(id, name, val, iRow, iCol) {
                     //alert(name);
                 },
                 onSelectRow: function(id) {
                     //alert(iRow);
                     var rowData = mygrid.getRowData(id);
                     var GAMENAME = rowData.GAMENAME;
                     var TYPENAME = rowData.TYPENAME;
                     var ACTID = rowData.ACTID;
                     var BARNAME = rowData.BARNAME;
                     var STARTTIME = rowData.STARTTIME;
                     var CNUM = rowData.CNUM;
                     var ACTCOST = rowData.ACTCOST;
                     var NETBARID = rowData.NETBARID;
                     var ENDTIME = rowData.ENDTIME;
                     var CHECKTIME = rowData.CHECKTIME;
                     $('#GAMENAME').html(GAMENAME);
                     $('#TYPENAME').html(TYPENAME);
                     $('#ACTID').html(ACTID);
                     $('#BARNAME').html(BARNAME);
                     $('#STARTTIME').html(STARTTIME);
                     $('#CNUM').html(CNUM);
                     $('#ACTCOST').html(ACTCOST);
                     $('#NETBARID').html(NETBARID);
                     netbarid = rowData.NETBARID;
                     //alert(netbarid);
                     effectLoad(rowData.ACTDID);
                     $('#main').hide();
                     $('#divIframe').show();
                     //DisplayDetails(rowid);
                 }
             });
         });
         //////具体评估信息显示 开始
         function effectLoad(id) {
             var strUrl = "http://" + location.host + "/ActionSubmitAndAudit.aspx/TGSActAchiveByIDDetail/"+id;
             $.ajax({
                 url: strUrl,
                 dataType: 'json',
                 type: 'POST',
                 success: effectSuccessed
             });
         }

         function effectSuccessed(result) {
             if (result.isSuccessed != 0) {
                 //alert(result.STARTTIME);
                $('#tdACTCOST').html(result.ACTCOST); 
                $('#tdACID').html(result.ACID);  
                    $('#tdACTGRADE').html(result.ACTGRADE);   
                    $('#tdACTID').html(result.ACTID);   
                    $('#tdACTSID').html(result.ACTSID);   
                    $('#tdADDRESS').html(result.ADDRESS);   
                    $('#tdAREACODE').html(result.AREACODE);   
                    $('#tdAREAID').html(result.AREAID);  
                    $('#tdAREANAME').html(result.AREANAME);   
                    $('#tdAREAPOS').html(result.AREAPOS);   
                    $('#tdASNUMBER').html(result.ASNUMBER);  
                    $('#tdAVGLEVEL').html(result.AVGLEVEL);   
                    $('#tdAVGONLINENUM').html(result.AVGONLINENUM);   
                    $('#tdBARNAME').html(result.BARNAME);   
                    $('#tdCHECKSTATUS').html(result.CHECKSTATUS);   
                    $('#tdCHECKTIME').html(result.CHECKTIME);  
                    $('#tdCLOCKENDTIME').html(result.CLOCKENDTIME);   
                    $('#tdCLOCKNUM').html(result.CLOCKNUM);   
                    $('#tdCLOCKSTARTTIME').html(result.CLOCKSTARTTIME);   
                    $('#tdCNUM').html(result.CNUM);   
                    $('#tdCREATETIME').html(result.CREATETIME);   
                    $('#tdENDACCOUNT').html(result.ENDACCOUNT);   

                    $('#tdENDTIME').html(result.ENDTIME);   
                    $('#tdEXAMTIME').html(result.EXAMTIME);   
                    $('#tdEXECAREA').html(result.EXECAREA);   
                    $('#tdFIELDNUM').html(result.FIELDNUM);   
                    $('#tdFIRSTACCOUNT').html(result.FIRSTACCOUNT);   
                    $('#tdGAMECODE').html(result.GAMECODE);   
                    $('#tdGAMENAME').html(result.GAMENAME);  
                    $('#tdISCHECKED').html(result.ISCHECKED);   
                    $('#tdMAXONLINENUM').html(result.MAXONLINENUM);  
                    $('#tdNETBARID').html(result.NETBARID);  
                    $('#tdOTAVGLEVEL').html(result.OTAVGLEVEL);  
                    $('#tdPLAYERNUM').html(result.PLAYERNUM);  
                    $('#tdREALTIME').html(result.REALTIME);  


                    $('#tdRECORDTIME').html(result.RECORDTIME);
                    $('#tdREFERTIME').html(result.REFTIME);  
                    $('#tdREFTIME').html(result.REFTIME);   
                    $('#tdSECONDACCOUNT').html(result.SECONDACCOUNT);  
                    $('#tdSTARTTIME').html(result.STARTTIME);   
                    $('#tdSUBTIME').html(result.SUBTIME);   
                    $('#tdTIMERATIO').html(result.TIMERATIO);  
                    $('#tdTYPENAME').html(result.TYPENAME);
                    $('#tdZONEID').html(result.ZONEID);
                   
                   
                   
                     $('#ACTCOST').html(result.ACTCOST); 
                $('#ACID').html(result.ACID);  
                    $('#ACTGRADE').html(result.ACTGRADE);   
                    $('#ACTID').html(result.ACTID);   
                    $('#ACTSID').html(result.ACTSID);   
                    $('#ADDRESS').html(result.ADDRESS);   
                    $('#AREACODE').html(result.AREACODE);   
                    $('#AREAID').html(result.AREAID);  
                    $('#AREANAME').html(result.AREANAME);   
                    $('#AREAPOS').html(result.AREAPOS);   
                    $('#ASNUMBER').html(result.ASNUMBER);  
                    $('#AVGLEVEL').html(result.AVGLEVEL);   
                    $('#AVGONLINENUM').html(result.AVGONLINENUM);   
                    $('#BARNAME').html(result.BARNAME);   
                    $('#CHECKSTATUS').html(result.CHECKSTATUS);   
                    $('#CHECKTIME').html(result.CHECKTIME);  
                    $('#CLOCKENDTIME').html(result.CLOCKENDTIME);   
                    $('#CLOCKNUM').html(result.CLOCKNUM);   
                    $('#CLOCKSTARTTIME').html(result.CLOCKSTARTTIME);   
                    $('#CNUM').html(result.CNUM);   
                    $('#CREATETIME').html(result.CREATETIME);   
                    $('#ENDACCOUNT').html(result.ENDACCOUNT);   

                    $('#ENDTIME').html(result.ENDTIME);   
                    $('#EXAMTIME').html(result.EXAMTIME);   
                    $('#EXECAREA').html(result.EXECAREA);   
                    $('#FIELDNUM').html(result.FIELDNUM);   
                    $('#FIRSTACCOUNT').html(result.FIRSTACCOUNT);   
                    $('#GAMECODE').html(result.GAMECODE);   
                    $('#GAMENAME').html(result.GAMENAME);  
                    $('#ISCHECKED').html(result.ISCHECKED);   
                    $('#MAXONLINENUM').html(result.MAXONLINENUM);  
                    $('#NETBARID').html(result.NETBARID);  
                    $('#OTAVGLEVEL').html(result.OTAVGLEVEL);  
                    $('#PLAYERNUM').html(result.PLAYERNUM);  
                    $('#REALTIME').html(result.REALTIME);  


                    $('#RECORDTIME').html(result.RECORDTIME);
                    $('#REFERTIME').html(result.REFTIME);  
                    $('#REFTIME').html(result.REFTIME);   
                    $('#SECONDACCOUNT').html(result.SECONDACCOUNT);  
                    $('#STARTTIME').html(result.STARTTIME);   
                    $('#SUBTIME').html(result.SUBTIME);   
                    $('#TIMERATIO').html(result.TIMERATIO);  
                    $('#TYPENAME').html(result.TYPENAME);
                    $('#ZONEID').html(result.ZONEID);
             }
             else {
               $('#tdACTCOST').html(''); 
                     $('#tdACID').html('');  
                    $('#tdACTGRADE').html('');   
                    $('#tdACTID').html('');   
                    $('#tdACTSID').html('');   
                    $('#tdADDRESS').html('');   
                    $('#tdAREACODE').html('');   
                    $('#tdAREAID').html('');  
                    $('#tdAREANAME').html('');   
                    $('#tdAREAPOS').html('');   
                    $('#tdASNUMBER').html('');  
                    $('#tdAVGLEVEL').html('');   
                    $('#tdAVGONLINENUM').html('');   
                    $('#tdBARNAME').html('');   
                    $('#tdCHECKSTATUS').html('');   
                    $('#tdCHECKTIME').html('');  
                    $('#tdCLOCKENDTIME').html('');   
                    $('#tdCLOCKNUM').html('');   
                    $('#tdCLOCKSTARTTIME').html('');   
                    $('#tdCNUM').html('');   
                    $('#tdCREATETIME').html('');   
                    $('#tdENDACCOUNT').html('');   

                    $('#tdENDTIME').html('');   
                    $('#tdEXAMTIME').html('');   
                    $('#tdEXECAREA').html('');   
                    $('#tdFIELDNUM').html('');   
                    $('#tdFIRSTACCOUNT').html('');   
                    $('#tdGAMECODE').html('');   
                    $('#tdGAMENAME').html('');  
                    $('#tdISCHECKED').html('');   
                    $('#tdMAXONLINENUM').html('');  
                    $('#tdNETBARID').html('');  
                    $('#tdOTAVGLEVEL').html('');  
                    $('#tdPLAYERNUM').html('');  
                    $('#tdREALTIME').html('');  


                    $('#tdRECORDTIME').html('');  
                    $('#tdREFERTIME').html('');  
                    $('#tdREFTIME').html('');   
                    $('#tdSECONDACCOUNT').html('');  
                    $('#tdSTARTTIME').html('');   
                    $('#tdSUBTIME').html('');   
                    $('#tdTIMERATIO').html('');  
                    $('#tdTYPENAME').html('');  
                    $('#tdZONEID').html('');  
                    
                    
                    
                    
                    
                     $('#ACTCOST').html(''); 
                     $('#ACID').html('');  
                    $('#ACTGRADE').html('');   
                    $('#ACTID').html('');   
                    $('#ACTSID').html('');   
                    $('#ADDRESS').html('');   
                    $('#AREACODE').html('');   
                    $('#AREAID').html('');  
                    $('#AREANAME').html('');   
                    $('#AREAPOS').html('');   
                    $('#ASNUMBER').html('');  
                    $('#AVGLEVEL').html('');   
                    $('#AVGONLINENUM').html('');   
                    $('#BARNAME').html('');   
                    $('#CHECKSTATUS').html('');   
                    $('#CHECKTIME').html('');  
                    $('#CLOCKENDTIME').html('');   
                    $('#CLOCKNUM').html('');   
                    $('#CLOCKSTARTTIME').html('');   
                    $('#CNUM').html('');   
                    $('#CREATETIME').html('');   
                    $('#ENDACCOUNT').html('');   

                    $('#ENDTIME').html('');   
                    $('#EXAMTIME').html('');   
                    $('#EXECAREA').html('');   
                    $('#FIELDNUM').html('');   
                    $('#FIRSTACCOUNT').html('');   
                    $('#GAMECODE').html('');   
                    $('#GAMENAME').html('');  
                    $('#ISCHECKED').html('');   
                    $('#MAXONLINENUM').html('');  
                    $('#NETBARID').html('');  
                    $('#OTAVGLEVEL').html('');  
                    $('#PLAYERNUM').html('');  
                    $('#REALTIME').html('');  


                    $('#RECORDTIME').html('');  
                    $('#REFERTIME').html('');  
                    $('#REFTIME').html('');   
                    $('#SECONDACCOUNT').html('');  
                    $('#STARTTIME').html('');   
                    $('#SUBTIME').html('');   
                    $('#TIMERATIO').html('');  
                    $('#TYPENAME').html('');  
                    $('#ZONEID').html('');  
                    
             }
         }
         /////具体评估信息显示 结束
         //////////网吧信息显示
         function searchLoad() {
             if (netbarid == null) {
                 return;
             }
             var strUrl = "http://" + location.host + "/ActionSubmitAndAudit.aspx/LoadNetBarByIDALL/"+netbarid;
                 $.ajax({
                     url: strUrl,
                     dataType: 'json',
                     type: 'POST',
                     success: netbarSuccessed
                 });
             }

         function netbarSuccessed(result) {
             if (result.isSuccessed != 0) {
                 $("#applicant").html(result.applicant);
                 $("#banname").html(result.lockname);
                 $("#barName").html(result.barname);
                 $("#province").html(result.province);
                 $("#city").html(result.city);
                 $("#county").html(result.county);
                 $("#linkMan").html(result.linkman);
                 $("#netbarAddr").html(result.address);
                 $("#phone").html(result.phone);
                 $("#macNum").html(result.macnum);
                 $("#status").html(result.status);
                 $("#lockname").html(result.lockname);
                 $("#iptype").html(result.iptype);
                 $("#ipaddress").html(result.ipaddress);
                 $("#remark").html(result.remark);
                 if (result.iptype == '固定IP') {
                 }
                 else if (result.iptype == 'IP段') {
                 }
                 else if (result.iptype == 'ADSL') {

                 }

                 if (result.ipaddress.length > 0) {
                     var ipArray = result.ipaddress.split(',');
                     if (result.iptype == '固定IP') {
                         $.each(ipArray, function(i, item) {
                             //$("#ip input")[i].value = item;
                         });
                     } else if (result.iptype == 'IP段') {
                         //$("#wobbleIP input")[0].value = ipArray[0];
                         //$("#wobbleIP input")[1].value = ipArray[ipArray.length - 2];
                     }
                 }
             }
             else {

                 $("#barName").val("");
                 $("#province").val("");
                 $("#city").val("");
                 $("#county").val("");
                 $("#linkMan").val("");
                 $("#netbarAddr").val("");
                 $("#phone").val("");
                 $("#macNum").val("");
                 $("#status").html("");
                 $("#lockname").html("");

                 $("#ip input").val("");
                 $("#wobbleIP input").val("");
                 $('#form1').hide();
                 $('#netbarStatus').hide();
                 $('#form1').hide();
             }
         }
         /////////网吧信息显示结束
         /////////显示评估信息
         function showexcel() {
             var strUrl = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexceleffect";
             location.replace(strUrl);
         }
         ////////评估信息显示结束
         /////////查询信息
         function loaddata(index) {
             $('#netbarinfor').hide();
             $('#main').show();
             $('#divIframe').hide()
             var tabsIndex;
             if (index == "undefined" || index == undefined) {

                 tabsIndex = $("#tabs").tabs().tabs("option", "selected");
                 index = $("#tabs").tabs().tabs("option", "selected");
             } else {
                 tabsIndex = index;
             }

             var beginTime = $("#beginTime").val();
             var endTime = $("#endTime").val();
             var content = $("#searchcontent").val();
             var searchtype = $("#searchtype").val();
             if (content == "") {
                 searchtype = 0;
             }
            
             mygrid.appendPostData({ TypeID: tabsIndex, v_Start: beginTime, v_End: endTime, SearchType: searchtype, SearchContent: content });
             mygrid.trigger('reloadGrid');
         }


         function loadexcelActAchive() {

             var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
             tabsIndex = tabsIndex;
             var beginTime = $("#beginTime").val();
             var endTime = $("#endTime").val();
            
             var prm64 = beginTime + "," + endTime;
             var prm641 = BASE64.encode(prm64);
             str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcelActAchive/" + prm641;
             //location.relace(str);
             location = str;

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
