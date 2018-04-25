<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
网吧主管推广业绩明细
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
    <div id="divIframe" title="业绩明细">
     <%
    
         //TGProject.Models.WModels.TgsPTOutachiveCondition condtion = (TGProject.Models.WModels.TgsPTOutachiveCondition)ViewData["condition"];
         //   int selectIdx = 0;
         //   decimal sortkinds = 0;
         //   if (condtion != null)
         //   {
         //       selectIdx = condtion.selectIndex;
         //       sortkinds = condtion.ORDERKIND;
         //   }
         //   else
         //   {
         //       selectIdx = 0;
         //   }
        %>
          <span id="ukey"></span>
        <span id="selectID"></span>
          <span id="begintime"></span>
          <span id="endtime"></span>
          <span id="sortkinds"></span>
          <form>
 <fieldset>
  <legend>**兼职推广员推广业绩明细***</legend>          
   <div id="tab2-userinfo" style="float: left;">
    <ul class="verticality">
     <li>所查询时间:  <span id="Start">
     <%=Session["begintime"].ToString()%></span>至<span id="End"><%=Session["endtime"].ToString()%></span>
     </li><br/> 
    </ul>
    <ul class="verticality">
    <li>类别:
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
                    查询</button>   <br />
               <%-- <button class="ui-state-default ui-corner-all" type="button" onclick="LoadTGPerformanceInfo2()">查询</button>--%>
                </li>
    </ul>              
   </div>
  </fieldset> <br />
  <div id="tabs">
   <ul>
    <li><a href="#tabs-1">按业绩排列</a></li>
    <li><a href="#tabs-1">按兼职推广员数量排列</a></li>  
    </ul>
    <div id="tabs-1" style="text-align: center">
  <%Html.RenderPartial("DataGridControl"); %>
     <center style="margin-top:6px">
     <p style="font-weight: bold">点击人员姓名查看个人详细 </p>
     <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">
                       返回</button></center>
                           </div>    
    
   </div>
  </div>
  </form>
 <script type="text/javascript">
     var newdefineid = "";
      $('#tabs').tabs();
      var mygrid;
      var tabindex = 0;
      var power = 0;
     
      var selectindex = 0;

      
      var UKEYGLOBAL;
      var begintime;
      var endtime;
     
      
      $('.selector').tabs({ selected: 0 });
      if (($('#sortkinds').html() == 1)) {
          $('#tabs').tabs('option', 'selected', 0);
      }
      else if (($('#sortkinds').html() == 2)) {

          $('#tabs').tabs('option', 'selected', 1);
      }
      else if (($('#sortkinds').html() == 3)) {

          $('#tabs').tabs('option', 'selected', 2);
      }
      else if (($('#sortkinds').html() == 4)) {


      $('#tabs').tabs('option', 'selected', 3);

  }
  $("#sortkinds").hide();
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
          }
          // alert(newdefineid);
          class_onclick();
          return false;
      });
      //////////////////////
      /////////////////////

      UKEYGLOBAL = $("#ukey").html();

      $("#power").hide();
      $("#ukey").hide();

      begintime = $("#begintime").html();
      endtime = $("#endtime").html();



      var idx = $("#selectID").html();
      $("#selectID").hide();

      //$("#class").attr("value", idx);
      $("#querytime").html(begintime + "至" + endtime);
      $("#selectID").hide();
      $("#begintime").hide();
      $("#endtime").hide();


      $("#power").hide();
      $("#ukey").hide();

      $("#class").change(function() { });
      $('#tabs').bind('tabsselect', function(event, ui) { tabindex = ui.index; class_onclick() });

      ///////////////////////////////////////////

      var url = 'NetbarManagerParterQueryDetail/';
      mygrid = $("#list").jqGrid({
          width: 750,
          height: 450,
          url: url,
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
          loadtext: '加载数据请稍候....',

          colNames: ['大区', '办事处', '职务', '姓名', '帐号', '兼职推广员人数', '领取数', '消费用户数', '消费金额', '消费转换率', '有效用户数', '有效转换率', '业绩', '大区排名', '总排名', '推广员ukey'],
          colModel: [
                         { name: 'ZONENAME', index: 'ZONENAME', width: 90, align: 'center' },
                         { name: 'AREANAME', index: 'AREANAME', width: 80, align: 'center' },
                         { name: 'posNAME', index: 'USERNAME', width: 80, align: 'center' },
                         { name: 'USERNAME', index: 'USERNAME', width: 60, align: 'center' },
                         { name: 'UACCOUNT', index: 'PTNUM', width: 80, align: 'center' },
                           { name: 'PTNUM', index: 'PTNUM', width: 110, align: 'center' },
                         { name: 'GETNUM', index: 'GETNUM', width: 80, align: 'center' },
                         { name: 'CONSNUM', index: 'CONSNUM', width: 80, align: 'center' },
                         { name: 'CONSSUM', index: 'CONSSUM', width: 80, align: 'center' },
                         { name: 'CONSCONV', index: 'CONSCONV', width: 80, align: 'center' },
                         { name: 'AVAILNUM', index: 'AVAILNUM', width: 80, align: 'center' },
                         { name: 'AVAILCONV', index: 'AVAILCONV', width: 80, align: 'center' },
                         { name: 'OUTACHIVE', index: 'OUTACHIVE', width: 80, align: 'center' },
                         { name: 'ZONEORDER', index: 'AVAILCONV', width: 60, align: 'center' },
                         { name: 'ALLORDER', index: 'OUTACHIVE', width: 60, align: 'center' },
{ name: 'UKEY', index: 'UKEY', width: 0, align: 'center' },
                        ],

          footerrow: true,
          shrinkToFit: false,
          toolbar: [true, "bottom"],
          onSelectRow: function(rowid) {
              var rowData = mygrid.getRowData(rowid);
              var poststring = 1;
              var beginTime = $("#Start").html();
              var endTime = $("#End").html();
              var UKEY = rowData.UKEY;
              mygrid.appendPostData({ poststring: poststring, ukey: UKEY, Start: beginTime, End: endTime });
              mygrid.trigger('reloadGrid');
              str = "http://" + location.host + "/ScoreParttime.aspx/TGParterQuery";
              location.replace(str);
          },
          loadComplete: function() {
              var data = mygrid.getRowData(1);
              var num = data.PTNUM;
              //alert(data.PTNUM);
              if (num == null) {
                  $('#parternum').html(0);
              }
              else {
                  $('#parternum').html(num);
              }
              // alert('k');
              //                var n = mygrid.getGridParam('rowNum');     //取得现在表格中显示的数据条数
              //                for (i = 1; i <= n + 1; i++) {
              //                    var data = mygrid.getRowData(i);
              //                    if (data.ENTERTIME == "0001-1-1" && data.ZONENAME == "总计") {
              //                        mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
              //                        mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
              //                        //&& data.ZONENAME == "总计"
              //                    }
              //                    if (data.ENTERTIME == "0001-1-1") {
              //                        mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
              //                    }
              //                    if (data.DIMISSIONTIME == "0001-1-1") {
              //                        mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
              //                    }
              //                }
              //  var udata = $("#list").getPostData();
              // alert(udata);
              // $("#list").html("总计:" +  " Total: " +  "&nbsp;&nbsp;&nbsp;");
              //mygrid.setGridWidth(900);
              // jQuery("#grid_id").setColProp('colname', { editoptions: { value: "True:False"} })
              // $("#list").jqGridExport({ impurl: "testme.xml" }); 
          },
          userDataOnFooter: true
      });
      ////////////////////////////////////////////

  });
  function class_onclick() {
      if (newdefineid == "x") {
          alert("你还没有选择活动！");
          return;
      }
             var beginTime = $("#Start").html();
             var endTime = $("#End").html();
             var areaID = 0;
             var DefineID = $("#class").val();
             var OrderKind =1;//= $("#tabs").tabs().tabs("option", "selected");
               OrderKind = tabindex+1;
               var Type = 2;
               //alert(DefineID);
               DefineID = newdefineid;
             mygrid.appendPostData({ areaID: areaID, DefineID: DefineID, v_Type: Type, OrderKind: OrderKind, Start: beginTime, End: endTime });
             mygrid.trigger('reloadGrid');
         }
 function loadData(index)
  {
      begintime = $("#begintime").html();
      endtime = $("#endtime").html();

      var tabsselect=$("#tabs").tabs().tabs("option", "selected")+1;

      var pram = UKEYGLOBAL + "," + $("#class").val() + "," + begintime + "," + endtime + "," + index + "," + tabsselect;
      
    //  str = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceDetailInfo2/" + pram;
     
     // location.replace(str);
  
  
  
  }

  function loadData2(index) {
      begintime = $("#begintime").html();
      endtime = $("#endtime").html();

      var tabsselect = index + 1;

      var pram = UKEYGLOBAL + "," + $("#class").val() + "," + begintime + "," + endtime + "," + 1 + "," + tabsselect;
    
     // str = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceDetailInfo2/" + pram;

     // location.replace(str);



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

