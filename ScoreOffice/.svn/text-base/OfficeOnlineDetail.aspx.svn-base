<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
 <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];

        %>
	<%=account.AREANAME + "办事处,线上推广业绩明细"%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            int selectIdx = 0;
            string gameidx = "0";
            string strDefines = "0,";
            decimal sortkinds = 0;
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                gameidx = condtion.gameidx;
                strDefines = condtion.DEFINEID;
                sortkinds = condtion.ORDERKIND;
            }
            else
            {

                selectIdx = 0;
                strDefines = "0,";
            }
        %>
          <span id="ukey"><%=condtion.UKEY%></span>
          <span id="selectID"><%=selectIdx%></span>
        <span id="gameidx"><%=gameidx%></span>
        <span id="definesstr"><%=strDefines%></span>
         <span id="sortkinds"><%=sortkinds %></span>
    <fieldset>
        <legend><% =account.AREANAME + "办事处,线上推广业绩明细"%></legend>
  <div id="tab2-userinfo">
   <ul class="verticality">
     <li>所查询时间:
                <span id="startt"><%=condtion.START.ToShortDateString()%></span>至<span id="endt"><%=condtion.END.ToShortDateString()%></span>
    </li>
   </ul>
            <ul class="verticality">
   
            <li style=" vertical-align:bottom">类别:
                <select  style="width:226px;" name="GAME" id="GAME">

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
                
                
                
                <span id="test" style="color:Black;"><select name="class" id="class">
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                        {
                    %>
                    <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%>
                    <%
                        }
                    %>      
                </select></span>
               <button style="margin-left:57px;" class="ui-state-default ui-corner-all"  id="btnSearch"  >查询</button>
                    <br />
                </li>
            </ul>
  </div>
 </fieldset><br />
 <div id="tabs">
  <ul>
   <li><a  href="#tabs-1">按消费时间排列</a></li>
   <li><a  href="#tabs-1">按消费金额排列</a></li>
   <li><a  href="#tabs-1">按消费游戏排列</a></li>
  </ul>
  <div id="tabs-1">
    <%Html.RenderPartial("DataGridControl"); %>
 </div> 
<center>
 
<button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">
                       返回</button></center>
</div>
 <script type="text/javascript">
        $('#tabs').tabs();
        $('#areaid').hide();
        $('#selectID').hide();
        $('#sortkinds').hide();
        $("#ukey").hide();
        $("#definesstr").hide();
        $("#class").attr("value", idx)
        


        
        $("#gameidx").hide();
        $("definesstr").hide();
        var power = 0;
        var selectindex = 0;
        var idx = $("#selectID").html();
        var UKEYGLOBAL;
        
        var actionstring;
        var gameidx = $("#gameidx").html();
     $(document).ready(function() {
         $("#GAME").attr("value", gameidx)

         $("#class").empty();
         $('#tabs').tabs();
         if (($('#sortkinds').html() == 1)) {
             $('#tabs').tabs('option', 'selected', 0);
         }
         else if (($('#sortkinds').html() == 2)) {
             $('#tabs').tabs('option', 'selected', 1);
         }
         else {
             $('#tabs').tabs('option', 'selected', 2);
         }
         if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
             $("<option></option>").val(0).text("所有活动").appendTo($("#class"));
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

         UKEYGLOBAL = $("#ukey").html();

         $("#power").hide();
         $("#ukey").hide();

         var idx = $("#selectID").html();
         $("#class").attr("value", idx);

         $("#selectID").hide();



         $("#power").hide();
         $("#ukey").hide();
         $("#btnSearch").bind('click', function() {
             loadData(1);
         });
         $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

         var url = "http://" + location.host + "/ScoreOffice.aspx/OfficeOnlineDetail2/";
         mygrid = $("#list").jqGrid({
             width: 800,
             height: 450,
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
             caption: '查询条件：',
             recordtext: '条记录',
             loadtext: '加载数据请稍候....',
             colNames: ['大区', '办事处', '职务', '姓名', '消费用户', '消费时间', '消费金额', '消费游戏', '消费类型'],
             colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 160, align: 'center' },
                          { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                          { name: 'POPEDOMNAME', index: 'POPEDOMNAME', width: 160, align: 'center' },
                          { name: 'USERNAME', index: 'USERNAME', width: 160, align: 'center' },
                          { name: 'PACCOUNT', index: 'PACCOUNT', width: 160, align: 'center' },
                          { name: 'DETAILTIME', index: 'DETAILTIME', width: 160, align: 'center' },
                          { name: 'DVALUE', index: 'DVALUE', width: 160, align: 'center' },
                          { name: 'GAMENAME', index: 'GAMENAME', width: 160, align: 'center' },
                          { name: 'DKIND', index: 'DKIND', width: 160, align: 'center'}]
         });

         //$("#class").change(function() { loadData($("#class").val()) });



     });
     function loadData(index) {

         actionString = "";
         for (k = 0; k <=$('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ";";
             }
         }

         if (actionString == undefined || actionString == "undefined" || actionString == "") {
             alert("请选择要查询的活动！");
             return;
         }
             
         if (index == undefined) {
             tabsIndex = $("#tabs").tabs().tabs("option", "selected");
         } else {
             tabsIndex = index;
         }


         //var DEFINEID = $("#class").val();

         var begintime = $("#startt").html();
         var endtime = $("#endt").html();
         var type = 2;
         var selectindex = $("#class").val();

         mygrid.appendPostData({ TypeID: tabsIndex, ORDERKIND: tabsIndex + 1, DEFINEID: actionString, TYPE: type, UKEY: UKEYGLOBAL, START: begintime, END: endtime, selectIndex: selectindex });
        mygrid.trigger('reloadGrid');
     }

     function ReturnPrevious() {

         history.go(-1);

     }
     function loadDefine() {
         //定义全局URL以便返回能够找到controls
         $('#test').html('<span id="test" style="color:Black;"><select    style="  width:226px;" name="class" id="class" onchange="return;return class_onclick()"   multiple="multiple"></select></span>');
         $.ajax(
             {
                 url: "http://" + location.host + "/ScoreOffice.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
     }

     function loadSuccessed(result) {
         $("#class").empty();
         var definestr = $("#definesstr").html();
         var definesArray = definestr.split(',');

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
                     $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#class"));
                 }
                 else {
                     $("<option ></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#class"));
                 }
             });
             $("#class").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
         }
         else if ($("#class").val() == 0 || $("#GAME").val() == "0") {
             $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#class"));
             $("#class").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
         }
         else {
             $("#class").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '没有该游戏活动', oneOrMoreSelected: '% 个活动已被选择' });
         }

     }
     
 </script>

</asp:Content>
