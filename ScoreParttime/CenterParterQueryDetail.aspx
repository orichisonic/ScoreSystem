<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
 <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];

        %>
	<%="�ƹ����ļ�ְ�ƹ�ҵ����ϸ"%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divIframe" title="ҵ����ϸ">
  <div id="ChargeCondition">
  <form>
   <fieldset>
    <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.TGSOutAchiveAreaCondition condtion = (TGProject.Models.TGSOutAchiveAreaCondition)ViewData["condition"];
            int selectIdx = 0;
            int areaID = 0;
            decimal sortkinds = 0;
            string strDate = string.Empty;
            if (condtion != null)
            {
                areaID = condtion.AreaID;
                selectIdx = condtion.selectIndex;
                sortkinds = condtion.ORDERKIND;
            }
            else
            {
              //  areaID = condtion.AreaID;
               // selectIdx = 0;
            }
        %>
        <span id="areaid"><%=areaID%></span>
        <span id="selectID"><%=selectIdx%></span>
        <span id="sortkinds"><%=sortkinds %></span>
    <legend><% ="�ƹ����ļ�ְ�ƹ�ҵ����ϸ"%></legend>
     <div style="text-align: left">
      <ul class="verticality">
    <li>����ѯʱ��:
        <span id="beginTime"><%=Session["begintime"].ToString()%></span>��<span id="endTime"><%=Session["endtime"].ToString()%></span>
    </li>
            <li style=" vertical-align:bottom">���:                       <select  style="width:226px;" name="GAME" id="GAME">

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
                    ��ѯ</button>  
            </li>
      </ul>
     </div>
    </fieldset>
   </div>
   <div id="tabs"> 
    <ul>
     <li><a href="#tabs1">��ҵ������</a></li>
     <li><a href="#tabs1">����ְ�ƹ�Ա��������</a></li>    
    </ul> 
        <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
    </div>

 </div>
   
       <center>
       <p style="font-weight: bold">������´����Ʋ鿴������ϸ</p>
       <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">����</button></center>
       </from>
 <script type="text/javascript">
     var newdefineid = "";
     var strcondition;
     $('#areaid').hide();
     $('#selectID').hide();
     $('#sortkinds').hide();
     var idx = $("#selectID").html();
     var mygrid;
     var tabindex = 0;
     $('#tabs').tabs();
     $('#tabs').bind('tabsselect', function(event, ui) { tabindex = ui.index; class_onclick() });
     $('#Gclass').tabs({ selected: 0 });

     $("#Gclass").attr("value", idx)
//     if (($('#sortkinds').html() == 1)) {
//         $('#tabs').tabs('option', 'selected', 0);
//     }
//     else {

//         $('#tabs').tabs('option', 'selected', 1);
//     }

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
         // $("#Gclass").change(function() { loadData(1) });
         //  $('#tabs').bind('tabsselect', function(event, ui) {alert(ui.index) });
         //////////////////////////////////////
         $('td > a').bind('click', function() { });
         ////////////////////////////////////////
         $('#tabs').tabs('option', 'selected', 0);
         ////////////////////////////////////////
         //             var begintime = $("#startt").html();
         //             //alert(begintime);
         //             var endtime = $("#endt").html();
         //             //alert(endtime);
         //             var href = $(this).attr('href');
         //             var username = $(this).text();
         //             var hrefindex = href.split(",");
         //             var ukey = hrefindex[1];
         //             var popid = hrefindex[0];
         //             var content = $($(this).parents().parents()).html();

         //var pos, str, para, parastr;
         // var str = window.location.href;
         //var pos = str.indexOf("/S");
         // var parastr = str.substring(0, pos + 1);
         var url = 'CenterParterQueryDetail/';
         mygrid = $("#list").jqGrid({
             width: 750,
             height: 200,
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

             colNames: ['����', '���´�', '����', '��ְ�ƹ�Ա����', '��ȡ��', '�����û���', '���ѽ��', '����ת����', '��Ч�û���', '��Чת����', 'ҵ��', '��������', '������', '���´�id', '���´�ukey'],
             colModel: [
                         { name: 'ZONENAME', index: 'ZONENAME', width: 90, align: 'center' },
                         { name: 'AREANAME', index: 'AREANAME', width: 80, align: 'center' },
                         { name: 'USERNAME', index: 'USERNAME', width: 80, align: 'center' },
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
 { name: 'AREAID', index: 'AREAID', width: 0, align: 'center' },
 { name: 'UKEY', index: 'UKEY', width: 0, align: 'center' },
                        ],

             footerrow: true,
             shrinkToFit: false,
             toolbar: [true, "bottom"],
             onSelectRow: function(rowid) {
                 var rowData = mygrid.getRowData(rowid);
                 var poststring = rowData.AREAID;
                 //alert(rowData.UKEY);
                 var UKEY = rowData.UKEY;
                 // var str;
                 //  str = "http://" + location.host + "/ScoreParttime.aspx/NetbarManagerParterQuery/" + rowData.AREAID;
                 //  location.replace(str);
                 mygrid.appendPostData({ poststring: poststring, ukey: UKEY });
                 mygrid.trigger('reloadGrid');
                 str = "http://" + location.host + "/ScoreParttime.aspx/NetbarManagerParterQuery";
                 location.replace(str);
             },
             loadComplete: function() {

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
         /////////////////////////////////////////////////////////
         //             if (popid == "7") {
         //                 href = "http://" + location.host + "\\ScoreQuery.aspx\\LoadTGPerformanceInfo\\" + ukey + "," + "0," + begintime + "," + endtime + "," + "";
         //                 //alert(href);
         //                 $(this).attr('href', href);
         //             }
         //             else if (popid == "6") {
         //                 href = "http://" + location.host + "\\ScoreQuery.aspx\\LoadNetbarManagerPerformanceInfo\\" + ukey + "," + "0," + begintime + "," + endtime + "," + "";
         //                 $(this).attr('href', href);
         //             }
         //             else if (popid == "8") {
         //                 href = "http://" + location.host + "\\ScoreQuery.aspx\\LoadOfficeOnlineDetail\\" + "0," + begintime + "," + endtime + "0," + "1,0,0," + ukey + ",1";
         //                 $(this).attr('href', href);
         //             }
     });
         ///////////////////////////////////////

     function class_onclick() {
         if (newdefineid == "x") {
             alert("�㻹û��ѡ����");
             return ;
         }
             var beginTime = $("#beginTime").val();
             var endTime = $("#endTime").val();
             var areaID = 0;
             var DefineID = $("#Gclass").val();
             var OrderKind = 0; //= $("#tabs").tabs().tabs("option", "selected");
             OrderKind = tabindex+1;
             var Type = 2;
             // alert(OrderKind);
             //alert(beginTime);
             //alert(endTime);
             DefineID = newdefineid;
             mygrid.appendPostData({ areaID: areaID, DefineID: DefineID, v_Type: Type, OrderKind: OrderKind, Start: beginTime, End: endTime });
             mygrid.trigger('reloadGrid');
         }
 

     function loadData(index) {

         var selectindex = $("#Gclass").val();
         var define = $("#Gclass option:selected").val()
         var beginTime = $("#startt").html();
         var endTime = $("#endt").html();
         //         var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
         //         if (tabsIndex == 0) {
         //            //ҵ������
         //             tabsIndex = 2            //  ���򷽷� 1����ҵ������ 2��Ա
         //         }
         //         else {
         //            //��Ա����
         //             tabsIndex = 1          //    ���򷽷� 1����ҵ������ 2��Ա
         //         }
         var tabsIndex = $("#tabs").tabs().tabs("option", "selected") + 1;
         parm = define + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + index;
         // var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + parm;
         //var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + parm;
         //location.replace(str);
     }


     function loadData2(index) {
         var selectindex = $("#Gclass").val();
         var define = $("#Gclass option:selected").val()
         var beginTime = $("#startt").html();
         var endTime = $("#endt").html();

         var tabsIndex = index + 1;
         parm = define + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + 1;
         //var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + parm;
         //location.replace(str);



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


