<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���ʲ�ѯ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
       
        <span id="ukey">
            <%=account.UKEY %></span>
          <span id="myareaid"><%=account.AREAID%></span>
             <%
    
                 TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
                 WageCondition DateCondition= (WageCondition)ViewData["WCondition"];
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

            if (DateCondition != null)
            {
                dteBegin = DateCondition.beginTime;
                dteEnd = DateCondition.endTime;
            }
        %>
        <%
           string strZAid = (string)ViewData["ZoneAreaForWageQuery"];
           string Zid=string.Empty;
           string Aid=string.Empty;
           if (strZAid == null)
           {
               Zid=string.Empty;
               Aid = string.Empty;
           }
           else
           {
               Zid = strZAid.Split(',')[0];
               Aid = strZAid.Split(',')[1];
           }
       %>
        <span id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span id="endtime"><%=dteEnd.ToShortDateString()%></span>
        
        <span id="beginMonth"><%=dteBegin.Month%></span>
        <span id="beginYear"><%=dteBegin.Year%></span>
        
        <span id="endMonth"><%=dteEnd.Month%></span>
        <span id="endDYear"><%=dteEnd.Year%></span>
        
        <span id="ZidFromMaster"><% =Zid%></span>
        <span id="AidFromMaster"><% =Aid%></span>

 <div id="ChargeCondition">
    <fieldset>
        <legend>��ѯ����</legend>
        <div style="text-align: center">
         <ul class="verticality" style="text-align: left">
         <li style="vertical-align:bottom; text-align: left;">
             <input name="rd1" id="monthselect" type="radio" value="0"/>
              <input  type="text" id="Text1" name="Text1" style="display:none;width: 90px; vertical-align:bottom; margin-left:1px" onfocus="setday(this)" value="2009-9-1"/>
              <input  type="text" id="Text2" name="Text2" style="display:none;width: 90px; vertical-align:bottom" onfocus="setday(this)" value="2010-12-1"/>
                ���²鿴�� 
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
                            for (int z = 1; z < tempMonth; z++)
                            {

                                YearMonth = t.Year.ToString() + "-" + z.ToString();
                        %>
                        <option value="<%=YearMonth%>">
                            <%=YearMonth%></option>
                        <%} %>>
                    </select>
             </li>
           <li style=" vertical-align:bottom; text-align: left;">
            <input name="rd1" id="dayselect" type="radio" value="1" checked="checked"/>
             ���׶β鿴����ʼ����:
            <select style="width:55px;margin-left:1px; vertical-align:bottom"  id="begintimeys">
           <%
               for (int i = 2003; i < 2029; i++)
               {
                   %>
                   <option value="<%=i%>"><%=i%>
                            </option>
                   <% 
               }
               %> 
            </select>��
                        <select style="width:55px;margin-left:1px; vertical-align:bottom"  id="begintimems">
           <%
               for (int i = 1; i < 13; i++)
               {
                   %>
                   <option value="<%=i%>"><%=i%>
                            </option>
                   <% 
               }
               %> 
            </select>��
             ��������: 
                         <select style="width:55px;margin-left:1px; vertical-align:bottom"  id="endtimeys">
           <%
               for (int i = 2003; i < 2029; i++)
               {
                   %>
                   <option value="<%=i%>"><%=i%>
                            </option>
                   <% 
               }
               %> 
            </select>��
                        <select style="width:55px;margin-left:1px; vertical-align:bottom"  id="endtimems">
           <%
               for (int i = 1; i < 13; i++)
               {
                   %>
                   <option value="<%=i%>"><%=i%>
                            </option>
                   <% 
               }
               %> 
            </select>��
           
            </li>
            </ul>
            <ul class="horizontal" style="text-align: left">
            <div id="zoneHide">
            
             <%  if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3 || account.POPEDOMID == 1)
                 { %>
                <li>����<select name="zone" id="zone">
                    <%
                        if (account.POPEDOMID != 3 && account.POPEDOMID != 8)
                        {
                            List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                            foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                            {
                                if (zone.AREAID != 2)
                                {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%
                                }
                                else if (zone.AREAID == 2)
                                {
                                                   %>
                    <option selected value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%   
                                }
                            }
                        }
                      
                      %>
                      <% if (account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 1 || account.POPEDOMID == 8)
                         {
                      %>
                      <option value="-5">�ܲ�</option>
                      <%} %>
                </select></li>
                  <%} %>

                  
                   <%  if (account.POPEDOMID == 4 || account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3 || account.POPEDOMID == 1)
                 { %>
                <li>���´�
                    <select id="area">
                       
                       <% if (account.POPEDOMID != 3)
                          {%>
                        <%--<option value="<%=account.AREAID %>">Ĭ��</option>--%>
                        <%} %>
                   <% if (account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 1 || account.POPEDOMID == 8)
                      {
                      %>
                      <option value="-5">����</option>
                      <%} %>
                    </select>

                </li>
                </div>
                <%} %>
                                     
                <li>
                <%if (account.POPEDOMID <= 3)
                  {
                    if (account.POPEDOMID == 3)
                    {
                %>
                  
                <select style=" width:200px" id="queryid">
                <option value=-1>ѡ���ѯ����</option>
                   <option value=2>����Ա���ʲ�ѯ</option>

                 </select>
                <%  }
                    else
                    {
                %>
                   <select style=" width:200px" id="queryid">
                   <option value=-1>ѡ���ѯ����</option>
                   <option value=0>��ѯ��ѡ���´�</option>
                   <option value=2>����Ա���ʲ�ѯ</option>
                   </select>
                <%
                    }  
                  } 
                %>
                 
                <%
                if (account.POPEDOMID == 4)
                  { 
                %>
                <select style=" width:200px" id="queryid">
                 <option value=-1>ѡ���ѯ����</option>
                 <option value=0>��ѯ��ѡ���´�</option>
                  <option value=1>��������ѯ</option>
     <%--               <option value=3>�������鹤�ʱ�</option>--%>
                   <%--   <option value=4>��ѯ���а��´�����</option>--%>
                 </select>
                 <%} %>
                <%
                    if (account.POPEDOMID == 5)
                    { 
                %>
                    <select style=" width:200px" id="queryid">
                    <option value=-1>ѡ���ѯ����</option>
                    <option  value=0>��ѯ��ѡ���´�</option>
                 </select>
                <%
                    } 
                %>
                <%
                    if (account.POPEDOMID == 6 || account.POPEDOMID == 7 || account.POPEDOMID == 8)
                    { 
                %>
                    <select style=" width:200px" id="queryid">
                    <option value=-1>ѡ���ѯ����</option>
                    <option  value=99>��ѯ������</option>
                 </select>
                <%
                    } 
                %>
                 
                 </li>
                 
       <%-- <li style="display:none">
                <button style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loaddata()">��ѯ��ѡ���´�</button>
                <button id="zonequery" style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loaddatazone()">��������ѯ</button>
             <button style="margin-left:25px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()">�������ʱ�</button> 
             <button id="loadallexcel" style=" display:none;margin-left:25px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelall()">�������а��´����ʱ�</button>
             <button id="duchayuan" style="display:none;margin-left:32px; vertical-align:bottom; margin-top:5px" class="ui-state-default ui-corner-all" type="button" onclick="loaddataducha()">����Ա���ʲ�ѯ</button> 
       </li>--%>
            </ul>
           
          
      </div>
    </fieldset>
</div>

<br />
    <div id="tabs">
        <ul>
            <li><a id="tabcontent" href="#tabs1">���ʲ�ѯ</a></li>
        </ul>
    <div id="tabs1" style="text-align: center">
            <%
                Html.RenderPartial("DataGridControl");
                 %>
    </div>
    <ul class="horizontal" style="text-align: left">                
        <li>

            <button id="excelnow" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="daochuexcel()">������ҳ����</button>
                 <button id="excelarea" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()">�������´�����</button>
                 <button id="excelone" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()">������������</button>
        </li>
    </ul>
   
    <div style=" display:none;text-align:left; padding-left:20px"><span>�ܼ�:</span><span>����:</span><span id="wagenum"></span><span>   ��λ����:</span><span id="postwage"></span><span>   ������ۿ�:</span><span id="deductnum"></span><span>   ���ڿۿ�:</span><span id="rpnum"></span><span></span>   ����:<span id="bonus"></span></div>
    </div>
    <script type="text/javascript">
    
        $('#begintimeys').val('2009');
        $('#endtimeys').val('2009');
        $('#tabs').tabs();
        var begintime, endtime;
        var areaID;
        var mygrid;
        var tabsIndex;
        var power = 0;
        var areaid = 0;
        var dayormonth = 0;
        var selectvalue;
        // Ȩ������
        power = $("#power").html();
        //�ܲ������죬�����ʺŵ�½
        if (power == 1 || power == 2 || power == 3 || power == 4) {
            $('#excelnow').show();
            $('#excelarea').show();
            $('#excelone').show();
        }
        else if (power == 5) {
            $('#excelnow').hide();
            $('#excelarea').hide();
            $('#excelone').show();
        }
        else {
            $('#excelnow').hide();
            $('#excelarea').hide();
            $('#excelone').hide();
        }
      
        $('#begintime').hide();
        $('#endtime').hide();
        $('#ukey').hide();
        $('#myareaid').hide();
        $("#ZidFromMaster").hide();
        $("#AidFromMaster").hide();
        
        if (power <= 4) {
            $('#loadallexcel').show();
        }
        
    function daochuexcel() {
        if (selectvalue == null) {
            loadexcel();
            $('#tabcontent').html('��ǰ�������������ʱ�');
        }
        if (selectvalue == 0) {
            loadexcel();
            $('#tabcontent').html('��ǰ�������������ʱ�');
           
        }
        else if (selectvalue == 1) {
        loadexcel();
        $('#tabcontent').html('��ǰ�������������ʱ�');

        }
        else if (selectvalue == 2) {
        loadexcel();
        $('#tabcontent').html('��ǰ�������������ʱ�');

    }
    else if (selectvalue == 4) {
    loadexcelall();
    $('#tabcontent').html('��ǰ��������ѯ���а��´����ʱ�');

    }
    }
    $(document).ready(function() {

        $('#beginYear').hide();
        $('#beginMonth').hide();
        $('#endDYear').hide();
        $('#endMonth').hide();
        var bYear = $('#beginYear').html();
        if (bYear != "") {
            $('#begintimeys').val(bYear);
        }

        var bMonth = $('#beginMonth').html();
        if (bMonth != "") {
            $('#begintimems').val(bMonth);
        }


        var bYear1 = $('#endDYear').html();
        if (bYear1 != "") {
            $('#endtimeys').val(bYear1);
        }

        var bMonth1 = $('#endMonth').html();
        if (bMonth1 != "") {
            $('#endtimems').val(bMonth1);
        }





        var powertemp = $("#power").html();
        //////////////////
        var szoneid = $('#ZidFromMaster').html();
        if (szoneid != "") {

            //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
            if (power == 1 || power == 2 || power == 3 || power == 4) {

                $('#zone').attr('value', szoneid);
            }
        }
        setTimeout("loaddata()", 2000);
        $('#queryid').bind('change', function() {
            if ($('#queryid').val() == 0) {
                if ($('#area').val() == -5) {
                    loaddataducha();
                    $('#tabcontent').html('��ǰ��������ѯ��ѡ���´�');
                    selectvalue = 0;
                    $('#queryid').val('-1');
                    return;
                }
                loaddata();
                $('#tabcontent').html('��ǰ��������ѯ��ѡ���´�');
                selectvalue = 0;
            }
            else if ($('#queryid').val() == 1) {
                if ($('#area').val() == -5) {
                    selectvalue = 4;
                    loaddata();
                    $('#tabcontent').html('��ǰ��������ѯ������Ϣ');
                    $('#queryid').val('-1');
                    return;
                }
                loaddatazone();
                $('#tabcontent').html('��ǰ��������������ѯ');
                selectvalue = 1;

            }
            else if ($('#queryid').val() == 2) {
                loaddataducha();
                $('#tabcontent').html('��ǰ����������Ա���ʲ�ѯ');
                selectvalue = 2;

            }
            else if ($('#queryid').val() == 3) {
                loadexcel();
                $('#tabcontent').html('��ǰ�������������ʱ�');

            }
            else if ($('#queryid').val() == 4) {
                selectvalue = 4;
                //loadexcelall();
                loaddata();
                $('#tabcontent').html('��ǰ��������ѯ���а��´����ʱ�');

            }
            else if ($('#queryid').val() == 99) {
                loaddata();
                $('#tabcontent').html('��ǰ�����������ʲ�ѯ');
                selectvalue = 2;

            }

            $('#queryid').val('-1');

        });
        $('#dayselect').bind('mousedown', function() {
            dayormonth = 0;
        });
        $('#monthselect').bind('mousedown', function() {
            dayormonth = 1;
        });
        $("#zone").change(function() { loadArea() });


        areaid = $("#areaId").html();
        if (power <= 4) {
            $('#zonequery').show();
        }
        else {
            $('#zonequery').hide();
        }
        if (power == 2 || power == 4 || power == 5 || power == 3 || power == 6 || power == 7 || power == 8) {
            //$("#ChargeCondition").show();
            // $("#tabs").show();
        }
        else {
            //  $("#ChargeCondition").hide();
            // $("#tabs").hide();
        }

        if (power == 8) {

            $("#zoneHide").hide();
        }
        $("#areaId").hide();

        $("#power").hide();
        if (power == 4) {
            loadAreaId();
        }
        if (power == 5 || power == 7 || power == 8) {
            areaid = $('#myareaid').html();
        }
        if (power == 3 || power == 2) {
            $('#duchayuan').show();

        }

        if (power != 3) {
            loadArea();
        }
        ///////////////////////////////////////


        var url = 'WageReview/';
        mygrid = $("#list").jqGrid({
            width: 770,
            height: 450,
            url: url,
            datatype: 'json',
            mtype: 'POST',
            pager: '#pager',
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '��ѯ�����',
            recordtext: '����¼',
            loadtext: '�����������Ժ�....',

            //colNames: ['����', '���´�', '����', 'ְλ', '��������', '��ְ״̬', '��ְʱ��', '��ְʱ��', '����', '��λ����', '����', '�ۿ�', '���ڿۿ�', '����', 'С��'],
            colNames: ['����', 'ְλ', '��������', '��ְ״̬', '��ְʱ��', '��ְʱ��', '����', '��λ����', '����', '�ۿ�', '���ڿۿ�', '��ͣ'],
            colModel: [{ name: 'USERNAME', index: 'City', width: 80, align: 'center', sortable: false },
                         { name: 'PLACENAME', index: 'County', width: 80, align: 'center', sortable: false },
                         { name: 'BZNAME', index: 'Province', width: 80, align: 'center', sortable: false },
                         { name: 'STATUS', index: 'City', width: 80, align: 'center', sortable: false },
                         { name: 'ENTERTIME', index: 'County', width: 80, align: 'center', sortable: false },
                         { name: 'DIMISSIONTIME', index: 'County', width: 80, align: 'center', sortable: false },
                         { name: 'WAGENUM', index: 'WAGENUM', width: 80, align: 'center', formatter: 'number', sortable: false },
                         { name: 'POSTWAGE', index: 'POSTWAGE', width: 80, align: 'center', formatter: 'number', sortable: false },
                         { name: 'REWARDNUM', index: 'REWARDNUM', width: 80, align: 'center', formatter: 'number', sortable: false },
                         { name: 'PUNISHNUM', index: 'PUNISHNUM', width: 80, align: 'center', formatter: 'number', sortable: false },
                         { name: 'DEDUCTNUM', index: 'DEDUCTNUM', width: 80, align: 'center', formatter: 'number', sortable: false },
                         { name: 'BANNUM', index: 'BANNUM', width: 80, align: 'center', formatter: 'number', sortable: false }
                        ],

            //            colModel: [{ name: 'ZONENAME', index: 'NETBARID', width: 80, align: 'center' },
            //                         { name: 'AREANAME', index: 'Province', width: 80, align: 'center' },
            //                         { name: 'USERNAME', index: 'City', width: 80, align: 'center' },
            //                         { name: 'PLACENAME', index: 'County', width: 80, align: 'center' },
            //                         { name: 'BZNAME', index: 'Province', width: 80, align: 'center' },
            //                         { name: 'STATUS', index: 'City', width: 80, align: 'center' },
            //                         { name: 'ENTERTIME', index: 'County', width: 80, align: 'center' },
            //                         { name: 'DIMISSIONTIME', index: 'County', width: 80, align: 'center' },
            //                         { name: 'WAGENUM', index: 'WAGENUM', width: 80, align: 'center', formatter: 'number' },
            //                         { name: 'POSTWAGE', index: 'POSTWAGE', width: 80, align: 'center', formatter: 'number' },
            //                         { name: 'REWARDNUM', index: 'REWARDNUM', width: 80, align: 'center', formatter: 'number' },
            //                         { name: 'PUNISHNUM', index: 'PUNISHNUM', width: 80, align: 'center', formatter: 'number' },
            //                         { name: 'DEDUCTNUM', index: 'DEDUCTNUM', width: 80, align: 'center', formatter: 'number' },
            //                         { name: 'BONUS', index: 'BONUS', width: 80, align: 'center', formatter: 'number' },
            //                          { name: 'SUM', index: 'SUM', width: 80, align: 'center', formatter: 'number' }
            //                        ],

            footerrow: true,
            shrinkToFit: false,
            toolbar: [true, "bottom"],
            loadComplete: function() {
                // alert('k');
                var n = mygrid.getGridParam('rowNum');     //ȡ�����ڱ������ʾ����������
                for (i = 1; i <= n + 1; i++) {
                    var data = mygrid.getRowData(i);
                    if (data.ENTERTIME == "0001-1-1" && data.ZONENAME == "�ܼ�") {
                        mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
                        mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
                    }
                    if (data.ENTERTIME == "0001-1-1") {
                        mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
                    }
                    if (data.DIMISSIONTIME == "0001-1-1") {
                        mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
                    }
                }
                //  var udata = $("#list").getPostData();
                // alert(udata);
                // $("#list").html("�ܼ�:" +  " Total: " +  "&nbsp;&nbsp;&nbsp;");
                //mygrid.setGridWidth(900);
                // jQuery("#grid_id").setColProp('colname', { editoptions: { value: "True:False"} })
                // $("#list").jqGridExport({ impurl: "testme.xml" }); 
            },
            userDataOnFooter: true
        });
    });

    function loadArea() {
       
        if ($('#zone').val() == -5) {
            if (power == 2 || power == 3 || power == 1) {
            
                $("#area").empty();
                $("<option></option>").val('-5').text('����').appendTo($("#area"));
            }
        }
          $.ajax({
              url: "LoadArea/" + $("#zone").val(),
              type: "POST",
              dataType: "json",
              success: areaSuccessed
          });
      }
      function loadAreaId() {
          var id = 0;
          id = $('#myareaid').html();
          //alert(id);
          $.ajax({
          url: "LoadArea/" + id,
              type: "POST",
              dataType: "json",
              success: areaSuccessed
          });
      }
      function loadAreaDaQu() {

          $.ajax({
          url: "LoadArea/" + areaid,
              type: "POST",
              dataType: "json",
              success: areaSuccessed
          });

      
      }
      function areaSuccessed(result) {

          $("#area").empty();
          if (result.rows.length > 0) {
              $.each(result.rows, function(i, item) {
                  if (item.cell[0] == 16) {
                      $("<option selected></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                  }
                  else {
                      $("<option ></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                  }
              });
          }
          //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
          var sareaid = $('#AidFromMaster').html();
          if (sareaid != "") {
              if (power == 1 || power == 2 || power == 3 || power == 4) {
                  //$('#area').attr('value', sareaid);
                  $("#area").val(sareaid);
              }
          }
      }


      function loadData(index) {
         
         
          if (index == undefined) {
              tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          } else {
              tabsIndex = index;
          }
          if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
              var areaID;
              if (tabsIndex == 2)
                  tabsIndex = 0;
              else
                  tabsIndex = tabsIndex + 1;
              if (power == 2 || power == 3 || power == 8 || power == 4) {
                  areaID = $("#area").val();
              }
              if (power == 5 || power == 6 || power == 7) {

                  areaID = areaid;
              }
              if (!datedemo.test($("#beginTime").val())) {
                  alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                  return;
              }

              if (!datedemo.test($("#endTime").val())) {
                  alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                  return;
              }
              begintime = $("#beginTime").val();
              endtime = $("#endTime").val();
           }
           else if($("#frm1 input[type *= 'radio'][checked]").val() == 0)
           {
            var areaID;
              if (tabsIndex == 2)
                  tabsIndex = 0;
              else
                  tabsIndex = tabsIndex + 1;
              if (power == 2 || power == 3 || power == 8 || power == 4) {
                  areaID = $("#area").val();
              }
              if (power == 5 || power == 6 || power == 7) {

                  areaID = areaid;
              }
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

                begintime = tmyear + "-" + timespan + "-" + "25";
                endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                
           }
       }
      
       begintime = $("#beginTime").val();
       endtime = $("#endTime").val();
       
       function loaddata() {

           if ($("#area").text().indexOf("Ĭ��")>-1) {
               alert("��ѡ����´�");
               loadArea();
               return;
           }

              begintime = $("#beginTime").val();
              endtime = $("#endTime").val();
              areaid = $("#area").val();

              dayormonth = $('#monthselect').val();

              var ifchecked=true;
              ifchecked=$('#monthselect').attr('checked');
              if (ifchecked) {
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

                  begintime = tmyear + "-" + timespan + "-" + "25";
                  endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";

              }
              if (!ifchecked) {
                  begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                  endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                 if ($('#begintimeys').val() > $('#endtimeys').val()) {
                   alert("��ʼʱ����ڽ���ʱ�䣡");

               }
               var datatime = new Date();
               var day = datatime.getDate();
               var year = datatime.getFullYear();
               var month = datatime.getMonth();
               if ($('#endtimeys').val() > year) {
                   alert("����ʱ����ڵ�ǰʱ��,���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                   return;
               }
               if ($('#endtimeys').val() == year && $('#endtimems').val() > (month+1)) {

                   alert("����ʱ����ڵ�ǰʱ�䣬���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                   return;
               }
               if (day <= 24) {
                   if ($('#endtimeys').val() == year && $('#endtimems').val()==(month+1)) {
                       alert("����ʱ����ڵ�ǰʱ�䣬���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                       return;
                   }
               }
              
              }
              if (($('#queryid').val() == 4 || $('#area').val() == -5) && power <= 3) {
                  areaid = -1;
              }
                
                  mygrid.appendPostData({ AreaID: areaid == 0 ? 1 : areaid, beginTime: begintime, endTime: endtime });
              if (power == 5 || power == 7 || power == 8) {
                 
                  areaid = $('#myareaid').html();
                  mygrid.appendPostData({ AreaID: areaid == 0 ? 1 : areaid, beginTime: begintime, endTime: endtime });
                  //mygrid.trigger('reloadGrid');

              }
              mygrid.trigger('reloadGrid');

            
              
          }
          function loaddatazone() {

              if ($("#area").text().indexOf("Ĭ��") > -1) {
                  alert("��ѡ����´�");
                  loadArea();
                  return;
              }

              begintime = $("#beginTime").val();
              endtime = $("#endTime").val();
              areaid = $("#area").val();
;
              dayormonth = $('#monthselect').val();


              var ifchecked = true;
              ifchecked = $('#monthselect').attr('checked');
              if (ifchecked) {
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

                  begintime = tmyear + "-" + timespan + "-" + "25";
                  endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                  //alert(areaid);
                  //alert(begintime);
                  //alert(endtime);
              }
              if (!ifchecked) {
                  begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                  endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  if ($('#begintimeys').val() > $('#endtimeys').val()) {
                      alert("��ʼʱ����ڽ���ʱ�䣡");
                      //  return;
                  }
                  var datatime = new Date();
                  var day = datatime.getDate();
                  var year = datatime.getFullYear();
                  var month = datatime.getMonth();
                  if ($('#endtimeys').val() > year) {
                      alert("����ʱ����ڵ�ǰʱ��,���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                      return;
                  }
                  if ($('#endtimeys').val() == year && $('#endtimems').val() > (month + 1)) {
                      // alert($('#endtimems').val()+"  "+month);
                      alert("����ʱ����ڵ�ǰʱ�䣬���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                      return;
                  }
                  if (day <= 24) {
                      if ($('#endtimeys').val() == year && $('#endtimems').val() == (month + 1)) {
                          alert("����ʱ����ڵ�ǰʱ�䣬���ʼ������ʱ�䲻�ܴ��ڱ���24��");
                          return;
                      }
                  }

              }

              if (power <= 3) {
                  areaid = $('#zone').val();
              }
              else if (power == 4) {
              areaid = $('#myareaid').html()+1033;
              }
              mygrid.appendPostData({ AreaID: areaid == 0 ? 1 : areaid, beginTime: begintime, endTime: endtime });
              mygrid.trigger('reloadGrid');



          }
          //////
          begintime = $("#beginTime").val();
          endtime = $("#endTime").val();
          function loadexcel() {
              str = "http://" + location.host + "/Query.aspx/showexcel/";
              location.replace(str);
          }
          function loadexcelall() {
              var mypower = 0;
              mypower = power;
              begintime = $("#beginTime").val();
              endtime = $("#endTime").val();
              begintime = $("#beginTime").val();
              endtime = $("#endTime").val();
              areaid = $("#area").val();
              dayormonth = $('#monthselect').val();

              var ifchecked = true;
              ifchecked = $('#monthselect').attr('checked');
              if (ifchecked) {
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

                  begintime = tmyear + "-" + timespan + "-" + "25";
                  endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
              }
              if (!ifchecked) {
                  begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                  endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  if ($('#begintimeys').val() > $('#endtimeys').val()) {
                      alert("��ʼʱ����ڽ���ʱ�䣡");
                  }
              }
              areaid = $("#area").val();
              var prm = areaid + "," + begintime + "," + endtime;
              var prm64 = BASE64.encode(prm);
              str = "http://" + location.host + "/Query.aspx/showexcelall/" + prm64;

              location.replace(str);
          }
          function loaddataducha() {
              if (power = 2 || power == 3) {
                 
                  begintime = $("#beginTime").val();
                  endtime = $("#endTime").val();
                  areaid = $("#area").val();
                  dayormonth = $('#monthselect').val();

                  var ifchecked = true;
                  ifchecked = $('#monthselect').attr('checked');
                  if (ifchecked) {
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

                      begintime = tmyear + "-" + timespan + "-" + "25";
                      endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                  }
                  if (!ifchecked) {
                      begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                      endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                      if ($('#begintimeys').val() > $('#endtimeys').val()) {
                          alert("��ʼʱ����ڽ���ʱ�䣡");
                          //  return;
                      }
                  }
                  areaid = 0;
                  
                  mygrid.appendPostData({ AreaID: areaid , beginTime: begintime, endTime: endtime });
                  if (power == 5 || power == 7 || power == 8) {

                      areaid = $('#myareaid').html();
                      mygrid.appendPostData({ AreaID: areaid == 0 ? 1 : areaid, beginTime: begintime, endTime: endtime });
                  }
                  mygrid.trigger('reloadGrid');

              }

          }

          function loadexcelarea() {
           var ifchecked=true;
           var begintime;
           var endtime;
              ifchecked=$('#monthselect').attr('checked');
              if (ifchecked) {
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

                  begintime = tmyear + "-" + timespan + "-" + "25";
                  endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
              }
              if (!ifchecked) {
                  begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                  endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  if ($('#begintimeys').val() > $('#endtimeys').val()) {
                      alert("��ʼʱ����ڽ���ʱ�䣡");
                      //  return;
                  }
              }
              var parm642 = BASE64.encode($("#area").val() + "," + begintime+ "," + endtime);
              str = "http://" + location.host + "/Query.aspx/showexcelarea2/" + parm642;
              location.replace(str);
          }


          function loadexcelone() {


              var ifchecked = true;
              var begintime;
              var endtime;
              ifchecked = $('#monthselect').attr('checked');
              if (ifchecked) {
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

                  begintime = tmyear + "-" + timespan + "-" + "25";
                  endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
              }
              if (!ifchecked) {
                  begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                  endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  if ($('#begintimeys').val() > $('#endtimeys').val()) {
                      alert("��ʼʱ����ڽ���ʱ�䣡");
                      //  return;
                  }
              }

              var parm642 = BASE64.encode($("#area").val() + "," + begintime + "," + endtime);
              str = "http://" + location.host + "/Query.aspx/showexcelone2/" + parm642;
              location.replace(str);
          }
          ///////////////////////////////////
          var BASE64 = {
              /**
              * �˱���Ϊ�����key��ÿ���ַ����±����Ӧ����������ı��롣
              */
              enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
              /**
              * �˱���Ϊ�����key����һ�����飬BASE64���ַ���ASCIIֵ���±꣬����Ӧ�ľ��Ǹ��ַ�������ı���ֵ��
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
              * ����
              */
              encode: function(src) {
                  //��һ����������ű������ַ���Ч�ʱ����ַ�����Ӹߺܶࡣ
                  var str = new Array();
                  var ch1, ch2, ch3;
                  var pos = 0;
                  //ÿ�����ַ����б��롣
                  while (pos + 3 <= src.length) {
                      ch1 = src.charCodeAt(pos++);
                      ch2 = src.charCodeAt(pos++);
                      ch3 = src.charCodeAt(pos++);
                      str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                      str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
                  }
                  //��ʣ�µ��ַ����б��롣
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
                  //��ϸ��������ַ�������һ���ַ�����
                  return str.join('');
              },
              /**
              * ���롣
              */
              decode: function(src) {
                  //��һ����������Ž������ַ���
                  var str = new Array();
                  var ch1, ch2, ch3, ch4;
                  var pos = 0;
                  //���˷Ƿ��ַ�����ȥ��'='��
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
                  //��ʣ�µ��ַ����н��롣
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
                  //��ϸ��������ַ�������һ���ַ�����
                  return str.join('');
              }
          };
      
    </script>

</asp:Content>