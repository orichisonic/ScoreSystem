<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	工资查询
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
        <legend>查询条件</legend>
        <div style="text-align: center">
         <ul class="verticality" style="text-align: left">
         <li style="vertical-align:bottom; text-align: left;">
             <input name="rd1" id="monthselect" type="radio" value="0"/>
              <input  type="text" id="Text1" name="Text1" style="display:none;width: 90px; vertical-align:bottom; margin-left:1px" onfocus="setday(this)" value="2009-9-1"/>
              <input  type="text" id="Text2" name="Text2" style="display:none;width: 90px; vertical-align:bottom" onfocus="setday(this)" value="2010-12-1"/>
                按月查看： 
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
             按阶段查看：开始日期:
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
            </select>年
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
            </select>月
             结束日期: 
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
            </select>年
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
            </select>月
           
            </li>
            </ul>
            <ul class="horizontal" style="text-align: left">
            <div id="zoneHide">
            
             <%  if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3 || account.POPEDOMID == 1)
                 { %>
                <li>大区<select name="zone" id="zone">
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
                      <option value="-5">总部</option>
                      <%} %>
                </select></li>
                  <%} %>

                  
                   <%  if (account.POPEDOMID == 4 || account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3 || account.POPEDOMID == 1)
                 { %>
                <li>办事处
                    <select id="area">
                       
                       <% if (account.POPEDOMID != 3)
                          {%>
                        <%--<option value="<%=account.AREAID %>">默认</option>--%>
                        <%} %>
                   <% if (account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 1 || account.POPEDOMID == 8)
                      {
                      %>
                      <option value="-5">督查</option>
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
                <option value=-1>选择查询种类</option>
                   <option value=2>督查员工资查询</option>

                 </select>
                <%  }
                    else
                    {
                %>
                   <select style=" width:200px" id="queryid">
                   <option value=-1>选择查询种类</option>
                   <option value=0>查询所选办事处</option>
                   <option value=2>督查员工资查询</option>
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
                 <option value=-1>选择查询种类</option>
                 <option value=0>查询所选办事处</option>
                  <option value=1>按大区查询</option>
     <%--               <option value=3>导出所查工资表</option>--%>
                   <%--   <option value=4>查询所有办事处工资</option>--%>
                 </select>
                 <%} %>
                <%
                    if (account.POPEDOMID == 5)
                    { 
                %>
                    <select style=" width:200px" id="queryid">
                    <option value=-1>选择查询种类</option>
                    <option  value=0>查询所选办事处</option>
                 </select>
                <%
                    } 
                %>
                <%
                    if (account.POPEDOMID == 6 || account.POPEDOMID == 7 || account.POPEDOMID == 8)
                    { 
                %>
                    <select style=" width:200px" id="queryid">
                    <option value=-1>选择查询种类</option>
                    <option  value=99>查询自身工资</option>
                 </select>
                <%
                    } 
                %>
                 
                 </li>
                 
       <%-- <li style="display:none">
                <button style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loaddata()">查询所选办事处</button>
                <button id="zonequery" style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loaddatazone()">按大区查询</button>
             <button style="margin-left:25px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()">导出工资表</button> 
             <button id="loadallexcel" style=" display:none;margin-left:25px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelall()">导出所有办事处工资表</button>
             <button id="duchayuan" style="display:none;margin-left:32px; vertical-align:bottom; margin-top:5px" class="ui-state-default ui-corner-all" type="button" onclick="loaddataducha()">督查员工资查询</button> 
       </li>--%>
            </ul>
           
          
      </div>
    </fieldset>
</div>

<br />
    <div id="tabs">
        <ul>
            <li><a id="tabcontent" href="#tabs1">工资查询</a></li>
        </ul>
    <div id="tabs1" style="text-align: center">
            <%
                Html.RenderPartial("DataGridControl");
                 %>
    </div>
    <ul class="horizontal" style="text-align: left">                
        <li>

            <button id="excelnow" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="daochuexcel()">导出本页数据</button>
                 <button id="excelarea" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()">导出办事处数据</button>
                 <button id="excelone" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()">导出个人数据</button>
        </li>
    </ul>
   
    <div style=" display:none;text-align:left; padding-left:20px"><span>总计:</span><span>工资:</span><span id="wagenum"></span><span>   岗位工资:</span><span id="postwage"></span><span>   奖励或扣款:</span><span id="deductnum"></span><span>   考勤扣款:</span><span id="rpnum"></span><span></span>   奖金:<span id="bonus"></span></div>
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
        // 权限设置
        power = $("#power").html();
        //总部，督察，人事帐号登陆
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
            $('#tabcontent').html('当前操作：导出工资表');
        }
        if (selectvalue == 0) {
            loadexcel();
            $('#tabcontent').html('当前操作：导出工资表');
           
        }
        else if (selectvalue == 1) {
        loadexcel();
        $('#tabcontent').html('当前操作：导出工资表');

        }
        else if (selectvalue == 2) {
        loadexcel();
        $('#tabcontent').html('当前操作：导出工资表');

    }
    else if (selectvalue == 4) {
    loadexcelall();
    $('#tabcontent').html('当前操作：查询所有办事处工资表');

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

            //根据UserQueryMaster传过来的AreaID,显示相对应的数据
            if (power == 1 || power == 2 || power == 3 || power == 4) {

                $('#zone').attr('value', szoneid);
            }
        }
        setTimeout("loaddata()", 2000);
        $('#queryid').bind('change', function() {
            if ($('#queryid').val() == 0) {
                if ($('#area').val() == -5) {
                    loaddataducha();
                    $('#tabcontent').html('当前操作：查询所选办事处');
                    selectvalue = 0;
                    $('#queryid').val('-1');
                    return;
                }
                loaddata();
                $('#tabcontent').html('当前操作：查询所选办事处');
                selectvalue = 0;
            }
            else if ($('#queryid').val() == 1) {
                if ($('#area').val() == -5) {
                    selectvalue = 4;
                    loaddata();
                    $('#tabcontent').html('当前操作：查询所有信息');
                    $('#queryid').val('-1');
                    return;
                }
                loaddatazone();
                $('#tabcontent').html('当前操作：按大区查询');
                selectvalue = 1;

            }
            else if ($('#queryid').val() == 2) {
                loaddataducha();
                $('#tabcontent').html('当前操作：督查员工资查询');
                selectvalue = 2;

            }
            else if ($('#queryid').val() == 3) {
                loadexcel();
                $('#tabcontent').html('当前操作：导出工资表');

            }
            else if ($('#queryid').val() == 4) {
                selectvalue = 4;
                //loadexcelall();
                loaddata();
                $('#tabcontent').html('当前操作：查询所有办事处工资表');

            }
            else if ($('#queryid').val() == 99) {
                loaddata();
                $('#tabcontent').html('当前操作：自身工资查询');
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
            caption: '查询结果：',
            recordtext: '条记录',
            loadtext: '加载数据请稍候....',

            //colNames: ['大区', '办事处', '姓名', '职位', '编制名称', '在职状态', '入职时间', '离职时间', '工资', '岗位工资', '奖励', '扣款', '考勤扣款', '奖金', '小计'],
            colNames: ['姓名', '职位', '编制名称', '在职状态', '入职时间', '离职时间', '工资', '岗位工资', '奖励', '扣款', '考勤扣款', '封停'],
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
                var n = mygrid.getGridParam('rowNum');     //取得现在表格中显示的数据条数
                for (i = 1; i <= n + 1; i++) {
                    var data = mygrid.getRowData(i);
                    if (data.ENTERTIME == "0001-1-1" && data.ZONENAME == "总计") {
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
                // $("#list").html("总计:" +  " Total: " +  "&nbsp;&nbsp;&nbsp;");
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
                $("<option></option>").val('-5').text('督查').appendTo($("#area"));
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
          //根据UserQueryMaster传过来的AreaID,显示相对应的数据
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
                  alert("按日期查询开始时间不正确！");
                  return;
              }

              if (!datedemo.test($("#endTime").val())) {
                  alert("按日期查询开始时间不正确！");
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

           if ($("#area").text().indexOf("默认")>-1) {
               alert("请选择办事处");
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
                   alert("开始时间大于结束时间！");

               }
               var datatime = new Date();
               var day = datatime.getDate();
               var year = datatime.getFullYear();
               var month = datatime.getMonth();
               if ($('#endtimeys').val() > year) {
                   alert("结束时间大于当前时间,工资计算结束时间不能大于本月24号");
                   return;
               }
               if ($('#endtimeys').val() == year && $('#endtimems').val() > (month+1)) {

                   alert("结束时间大于当前时间，工资计算结束时间不能大于本月24号");
                   return;
               }
               if (day <= 24) {
                   if ($('#endtimeys').val() == year && $('#endtimems').val()==(month+1)) {
                       alert("结束时间大于当前时间，工资计算结束时间不能大于本月24号");
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

              if ($("#area").text().indexOf("默认") > -1) {
                  alert("请选择办事处");
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
                      alert("开始时间大于结束时间！");
                      //  return;
                  }
                  var datatime = new Date();
                  var day = datatime.getDate();
                  var year = datatime.getFullYear();
                  var month = datatime.getMonth();
                  if ($('#endtimeys').val() > year) {
                      alert("结束时间大于当前时间,工资计算结束时间不能大于本月24号");
                      return;
                  }
                  if ($('#endtimeys').val() == year && $('#endtimems').val() > (month + 1)) {
                      // alert($('#endtimems').val()+"  "+month);
                      alert("结束时间大于当前时间，工资计算结束时间不能大于本月24号");
                      return;
                  }
                  if (day <= 24) {
                      if ($('#endtimeys').val() == year && $('#endtimems').val() == (month + 1)) {
                          alert("结束时间大于当前时间，工资计算结束时间不能大于本月24号");
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
                      alert("开始时间大于结束时间！");
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
                          alert("开始时间大于结束时间！");
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
                      alert("开始时间大于结束时间！");
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
                      alert("开始时间大于结束时间！");
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