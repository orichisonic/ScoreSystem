<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
��ѯ��ְ�ƹ�Աҵ��
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      
             <%
                 TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
                 TGProject.Models.WModels.TgsPTOutachiveCondition condtion = (TGProject.Models.WModels.TgsPTOutachiveCondition)ViewData["condition"];
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
        <span id="areaid"><%=account.AREAID%></span>
       <span id="power"><%=account.POPEDOMID%></span>
        <span id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span id="endtime"><%=dteEnd.ToShortDateString()%></span>

        <span id="selectID"><%=selectIdx%></span>
        <span id="username"><%=account.USERNAME %></span>
        <span id="areaname"><%=account.AREANAME %></span>
           <span id="bymonth"><%=strByMonth%></span>
 <%--<asp:ScriptManager ID="ScriptManager1" runat="server"
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    </ContentTemplate>
    <Triggers></Triggers>
    </asp:UpdatePanel>--%>
    <div><span id="spanusername"><%=account.USERNAME %></span><span>����չ��ְ�ƹ�Ա</span><span id="parternum"></span><span>��</span></div>
    <div>
    <form>
     <fieldset>
        <legend visible="false">��ѯ����</legend>
        <div id="frm1">
        <div style="text-align: left">
            <ul class="verticality"  id="by_day_id">
             <li style=" vertical-align:bottom">
             <input id="dayselect" style="vertical-align:bottom" name="rd1" type="radio" value="1" checked="checked"/>�����ڲ�ѯ������Ϊ24Сʱˢ�£���ʼ����    
             <input style="vertical-align:bottom" type="text" name="beginTime" id="beginTimenew" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/>
             �������� <input type="text" name="endTime" id="endTimenew" style="width: 90px" onfocus="setday(this)" value="2010-12-1"/></li>
           </ul>
            <ul class="verticality">
                <li>
                    <input name="rd1" id="monthselect" type="radio" value="0" style="margin-top:6px" />���·ݲ�ѯ��ÿ��25����ɲ�ѯ�������ݣ�
                    <select style="width:95px" name="beginTime2" id="beginTime2">
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

                </li>

            </ul>
            <ul class="verticality">
            
            <li style=" vertical-align:bottom">���:
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
            </li>
                   
            </ul>
           </div>
           </div>
             </fieldset>

</div>
<br />
   
           <div id="tabs">
             <ul>
        <li><a id="tabsfirst" href="#tabs-1">���´������ѯ</a></li>
     
        
    </ul>
    <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
    </div>
    </div>
<center>  
     <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">�鿴��ϸ</button>
      <button style="margin-top:10px;margin-left:20px" class="ui-state-default ui-corner-all" type="submit" onclick=" history.go(-1);">����</button>
</center>
</from>
 <script type="text/javascript">
     var newdefineid = "";
     var selectindex = 0;
     var power = 0;
     var defineIndex = $("#span1").val();
     var mygrid;
     //// add by ����� 090924
     $(document).ready(function() {
         // LoadContent();
         $('#tabs').tabs();
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
                 newdefineid = "0;";
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
         ////////////////////////////
         //////////////////////////////////////
         ///////////////////////////////////////
         ///////////////////////////
         $("#areaid").hide()
         $("#selectID").hide()
         $("#begintime").hide()
         $("#endtime").hide()
         $("#by_day_id").show();
         $("#power").hide();
         $('#username').hide();
         $('#areaname').hide();
         //return;
         /*
         $("#bymonth").show();
         $("#beginTime").attr("value", sTime)
         $("#endTime").attr("value", eTime)
         var sbymonth = $("#bymonth").html()
         if (sbymonth != "") {
         $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
         $("#beginTime2").val(sbymonth);
         }*/
         var power = $('#power').html();
         // alert(power);
         if (power == 5) {
             $('#tabsfirst').html('���´������ѯ');
             var areaname = $('#areaname').html();
             $('#spanusername').html(areaname + '���´�');

         }
         if (power == 6) {
             $('#tabsfirst').html('�������ܲ�ѯ');
             // $('#spanusername').html($('#areaname').html() + '���´�');
         }

         ///////////////////////////////////////////

         var url = 'NetbarParterQuery/';
         mygrid = $("#list").jqGrid({
             width: 790,
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

             colNames: ['����', '���´�', '����', '��ְ�ƹ�Ա����', '��ȡ��', '�����û���', '���ѽ��', '����ת����', '��Ч�û���', '��Чת����', 'ҵ��', '��������', '������'],
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

                        ],

             footerrow: true,
             shrinkToFit: false,
             toolbar: [true, "bottom"],
             loadComplete: function() {
                 var data = mygrid.getRowData(1);
                 var num = data.PTNUM;
                 var areaname = data.AREANAME + "���´�";
                 //alert(data.PTNUM);
                 if (num == null) {
                     $('#parternum').html(0);
                 }
                 else {
                     $('#parternum').html(num);
                 }
                 if (power < 5) {
                     $('#spanusername').html(areaname);
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
    function loaddata() {
        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var areaID = 0;
        var DefineID = 0;
        var OrderKind = 0;
        mygrid.appendPostData({ areaID: areaID == 0 ? 1 : areaID, DefineID:DefineID,Type:Type,OrderKind:OrderKind, beginTime: beginTime, endTime: endTime });
        mygrid.trigger('reloadGrid');
    }
    function class_onclick() {
        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();
        var areaID = 0;
        var DefineID =  $("#Gclass").val();
        var OrderKind = 0;
        var Type =1;
        if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
            beginTime = $("#beginTimenew").val();
            endTime = $("#endTimenew").val();
            
        }
        else {
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

           // define = $("#Gclass option:selected").val();
            //                define = GCombobox;
            beginTime = timeindex[0] + "-" + timespan + "-" + "25";
            endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
        }
       //alert(beginTime);
       // alert(endTime);
        //alert(OrderKind);
        DefineID = newdefineid;
        mygrid.appendPostData({ areaID: areaID, DefineID: DefineID, Type: Type, OrderKind: OrderKind, Start: beginTime, End: endTime });
        mygrid.trigger('reloadGrid');
    }
     /////////////////////////////////////////////
     function LoadContent() {
         var define;
         var beginTime;
         var endTime;
         var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
         //alert($("#beginTimenew").val());
         selectindex = $("#Gclass").val();
         if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {

             if (!datedemo.test($("#beginTimenew").val())) {
                 alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                 return;
             }

             if (!datedemo.test($("#endTimenew").val())) {
                 alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                 return;
             }

             define = $("#Gclass option:selected").val()
             beginTime = $("#beginTime").val();
             endTime = $("#endTime").val();
             //�id,��ʼʱ��,����ʱ��,������ѡ��index,����,����id,���²��ҵ�����,��������ukey,���ఴť��index
             //str = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + define + "," + beginTime + "," + endTime + ',' + selectindex + "," + 1 + "," + $("#areaid").html() + "," + "" + "," + "" + "," + defineIndex;
             str = "http://" + location.host + "/ScoreParttime.aspx/CenterParterQuery";
             location.replace(str);

         }
         else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {


             var timeindex = $("#beginTime2").val().split('-');
             var timespan = 0;
             if (timeindex[1] == 1) {
                 timespan = 12;
             } else {
                 timespan = timeindex[1] - 1;
             }

             define = $("#Gclass option:selected").val()
             beginTime = timeindex[0] + "-" + timespan + "-" + "25";
             endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
             var bymonth = $("#beginTime2").val();
             //�id,��ʼʱ��,����ʱ��,������ѡ��index,����,����id,���²��ҵ�����,��������ukey,���ఴť��index
             // str = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + define + "," + beginTime + "," + endTime + "," + selectindex + "," + 1 + "," + $("#areaid").html() + "," + bymonth + "," + "" + "," + defineIndex;
             str = "http://" + location.host + "/ScoreParttime.aspx/CenterParterQuery";
          
             location.replace(str);
         }
     }
     function QueryDetail() {
     
        
         var define;
         var beginTime;
         var endTime;
         var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;

         selectindex = $("#Gclass").val();
         if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {

             if (!datedemo.test($("#beginTimenew").val())) {
                 alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                 return;
             }

             if (!datedemo.test($("#endTimenew").val())) {
                 alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                 return;
             }

             define = $("#Gclass option:selected").val()
             beginTime = $("#beginTime").val();
             endTime = $("#endTime").val();
             //�id,��ʼʱ��,����ʱ��,������ѡ��index,����,����id,���²��ҵ�����,��������ukey,���ఴť��index
             // str = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + define + "," + beginTime + "," + endTime + ',' + selectindex + "," + 1 + "," + $("#areaid").html() + "," + "" + "," + "" + "," + defineIndex;
             class_onclick();
             str = "http://" + location.host + "/ScoreParttime.aspx/NetbarManagerParterQueryDetail";
             location.replace(str);

         }
         else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {


             var timeindex = $("#beginTime2").val().split('-');
             var timespan = 0;
             if (timeindex[1] == 1) {
                 timespan = 12;
             } else {
                 timespan = timeindex[1] - 1;
             }

             define = $("#Gclass option:selected").val()
             beginTime = timeindex[0] + "-" + timespan + "-" + "25";
             endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
             var bymonth = $("#beginTime2").val();
            
             //�id,��ʼʱ��,����ʱ��,������ѡ��index,����,����id,���²��ҵ�����,��������ukey,���ఴť��index
             // str = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + define + "," + beginTime + "," + endTime + "," + selectindex + "," + 1 + "," + $("#areaid").html() + "," + bymonth + "," + "" + "," + defineIndex;
             class_onclick();
             str = "http://" + location.host + "/ScoreParttime.aspx/NetbarManagerParterQueryDetail";
          
             location.replace(str);
         }

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

