<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
���������ƹ�ҵ����ϸ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
    <div id="divIframe" title="ҵ����ϸ">
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
  <legend>**��ְ�ƹ�Ա�ƹ�ҵ����ϸ***</legend>          
   <div id="tab2-userinfo" style="float: left;">
    <ul class="verticality">
     <li>����ѯʱ��:  <span id="Start">
     <%=Session["begintime"].ToString()%></span>��<span id="End"><%=Session["endtime"].ToString()%></span>
     </li><br/> 
    </ul>
    <ul class="verticality">
    <li>���:
                <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">������Ϸ</option>
                        
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
                    ��ѯ</button>   <br />
               <%-- <button class="ui-state-default ui-corner-all" type="button" onclick="LoadTGPerformanceInfo2()">��ѯ</button>--%>
                </li>
    </ul>              
   </div>
  </fieldset> <br />
  <div id="tabs">
   <ul>
    <li><a href="#tabs-1">��ҵ������</a></li>
    <li><a href="#tabs-1">����ְ�ƹ�Ա��������</a></li>  
    </ul>
    <div id="tabs-1" style="text-align: center">
  <%Html.RenderPartial("DataGridControl"); %>
     <center style="margin-top:6px">
     <p style="font-weight: bold">�����Ա�����鿴������ϸ </p>
     <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">
                       ����</button></center>
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
      $("#Gclass").multiSelect({ selectAll: false, noneSelected: '��ѡ��', oneOrMoreSelected: '% ����ѱ�ѡ��' });
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
              alert("�㻹û��ѡ����");
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
      $("#querytime").html(begintime + "��" + endtime);
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
          caption: '��ѯ������',
          recordtext: '����¼',
          loadtext: '�����������Ժ�....',

          colNames: ['����', '���´�', 'ְ��', '����', '�ʺ�', '��ְ�ƹ�Ա����', '��ȡ��', '�����û���', '���ѽ��', '����ת����', '��Ч�û���', '��Чת����', 'ҵ��', '��������', '������', '�ƹ�Աukey'],
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
              //                var n = mygrid.getGridParam('rowNum');     //ȡ�����ڱ������ʾ����������
              //                for (i = 1; i <= n + 1; i++) {
              //                    var data = mygrid.getRowData(i);
              //                    if (data.ENTERTIME == "0001-1-1" && data.ZONENAME == "�ܼ�") {
              //                        mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
              //                        mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
              //                        //&& data.ZONENAME == "�ܼ�"
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
              // $("#list").html("�ܼ�:" +  " Total: " +  "&nbsp;&nbsp;&nbsp;");
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
          alert("�㻹û��ѡ����");
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

      //����ȫ��URL�Ա㷵���ܹ��ҵ�controls
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
          $("#Gclass").multiSelect({ selectAll: true, selectAllText: "ȫѡ", noneSelected: '��ѡ��', oneOrMoreSelected: '% ����ѱ�ѡ��' });
      }
      else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
          $("<option selected='selected'></option>").val(0).text("���л").appendTo($("#Gclass"));
          $("#Gclass").multiSelect({ selectAll: false, noneSelected: '��ѡ��', oneOrMoreSelected: '���л�ѱ�ѡ��' });
      }
      else {
          $("#Gclass").multiSelect({ selectAll: false, noneSelected: 'û�и���Ϸ�', oneOrMoreSelected: '% ����ѱ�ѡ��' });
      }

      // $("#Gclass").multiSelect({ selectAll: false, noneSelected: 'û�и���Ϸ�', oneOrMoreSelected: '% ����ѱ�ѡ��' });


  }
  
  
</script>




</asp:Content>

