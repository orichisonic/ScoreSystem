<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	 <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];

        %>
	兼职推广员推广业绩明细 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <form>
 <div id="divIframe" title="业绩明细">
  <div id="ChargeCondition">
 
   <fieldset>
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
        <span id="ukey"><%=ukey%></span>
        <span id="selectID"><%=selectIdx%></span>
        <span id="sortkinds"><%=sortkinds %></span>
    <legend><% ="兼职推广员业绩明细"%></legend>
     <div style="text-align: left">
      <ul class="verticality">
    <li>所查询时间:
        <span id="startt"><%=condtion.START.ToShortDateString()%></span>至<span id="endt"><%=condtion.END.ToShortDateString()%></span>
    </li>
            <li style=" vertical-align:bottom">类别:
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
            </li>
      </ul>
     </div>
    </fieldset>
   </div>
   <div id="tabs"> 
    <ul>
    <li><a  href="#tabs-1">按消费时间排列</a></li>
    <li><a  href="#tabs-1">按消费金额排列</a></li>
    <li><a  href="#tabs-1">按消费游戏排列</a></li>   
    </ul> 
   <div id="tabs-1" style="text-align: center"> 
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
      </div>
      <table width="100%"></table>
       <center>
       <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">返回</button></center>
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
    // $("#Gclass").empty();
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
         }
         // alert(newdefineid);
         loadData();
         return false;
     });
     //////////////////////
     /////////////////////
     ////////////////////////////

         UKEYGLOBAL = $("#ukey").html();
         $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
         var url = "http://" + location.host + "/ScoreParttime.aspx/PartTimeScoreDetail2/";
         mygrid = $("#list").jqGrid({
             width: 800,
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
             colNames: ['大区', '办事处', '职务', '姓名', '消费用户', '消费时间', '消费金额', '消费游戏'],
             colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 160, align: 'center' },
                      { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                       { name: 'POPEDOMNAME', index: 'POPEDOMNAME', width: 160, align: 'center' },
                        { name: 'USERNAME', index: 'USERNAME', width: 160, align: 'center' },
                          { name: 'PACCOUNT', index: 'PACCOUNT', width: 160, align: 'center' },
                           { name: 'DETAILTIME', index: 'DETAILTIME', width: 160, align: 'center' },
                          { name: 'DVALUE', index: 'DVALUE', width: 160, align: 'center' },
                          { name: 'GAMENAME', index: 'GAMENAME', width: 160, align: 'center' }],
                          shrinkToFit: false
         });

         $("#Gclass").change(function() { loadData($("#Gclass").val()) });
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
        // alert(DEFINEID);
         mygrid.appendPostData({ORDERKIND: tabsIndex, DEFINEID: DEFINEID,UKEY: UKEYGLOBAL, START: begintime, END: endtime, selectIndex: selectindex });
         mygrid.trigger('reloadGrid');
     }

     function ReturnPrevious() {
         history.go(-1);
     }
     function loadDefine() {
         // $("#Gclass").empty();
       
         // $('#test').html('');
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
