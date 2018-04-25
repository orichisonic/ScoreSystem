<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	工资查询</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
       
        <span id="ukey">
            <%=account.UKEY %></span>
          <span id="myareaid"><%=account.AREAID%></span>
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
          <span id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span id="endtime"><%=dteEnd.ToShortDateString()%></span>

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
               <button class="ui-state-default ui-corner-all" onclick="loaddata()" type="submit">查询</button>
            </li>
            </ul>
      </div>
    </fieldset>
</div>

<br />
    <div id="tabs">
        <%--<ul>
            <li><a id="tabcontent" href="#tabs1">工资查询</a></li>
        </ul>--%>
    <div id="tabs1" style="text-align: center">
            <%
                Html.RenderPartial("DataGridControl");
                 %>
    </div>
    
    <div style=" display:none;text-align:left; padding-left:20px"><span>总计:</span>
    <span>工资:</span><span id="wagenum"></span><span>   岗位工资:</span><span id="postwage"></span><span>   奖励或扣款:</span><span id="deductnum"></span><span>   考勤扣款:</span><span id="rpnum"></span><span></span>   奖金:<span id="bonus"></span></div>
    </div>
    <center>
        <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
        <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
    </center>
    <ul class="horizontal" style="text-align: left">                
        <li>
    <button id="loadexcelarea" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()">导出办事处数据</button>
            <button id="loadexcelone" style="margin-left:10px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()">导出个人数据</button>

            
        </li>
    </ul>
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
        power = $("#power").html();
        $('#begintime').hide();
        $('#endtime').hide();
        $('#ukey').hide();
        $('#myareaid').hide();

        $(document).ready(function() {

            //总部，督察，人事帐号登陆
            if (power == 1 || power == 2 || power == 3 || power == 4) {
                $('#loadexcelarea').show();
                $('#loadexcelone').show();
            }
            else if (power == 5 || power == 6) {
                $('#loadexcelarea').hide();
                $('#loadexcelone').show();
            }
            else {
                $('#loadexcelarea').hide();
                $('#loadexcelone').hide();
            }

            $("#areaId").hide();
            $("#power").hide();

            var powertemp = $("#power").html();
            setTimeout("loaddata()", 2000);

            $('#dayselect').bind('mousedown', function() {
                dayormonth = 0;
            });
            $('#monthselect').bind('mousedown', function() {
                dayormonth = 1;
            });


            // 权限设置
            power = $("#power").html();
            areaid = $("#areaId").html();
            $("#Select2").empty();
            $("#Select2").html('');
            $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='1'>大区名检索</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='2'>办事处名检索</option>").appendTo("#Select2")//添加下拉框的option

            //loadArea();
            var url = 'WageReviewMaster/';
            mygrid = $("#list").jqGrid({
                width: 830,
                height: 430,
                url: url,
                datatype: 'json',
                mtype: 'POST',
                //pager: '#pager',
                rowNum: 40,
                rowList: [20, 40, 60, 80],
                sortname: 'Id',
                sortorder: "desc",
                viewrecords: true,
                imgpath: '/scripts/themes/steel/images',
                caption: '查结结果：',
                recordtext: '条记录',
                loadtext: '加载数据请稍候....',
                colNames: ['大区', '办事处', '工资', '岗位工资', '奖励', '扣款', '考勤扣款', '封停'],
                colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 80, align: 'center' },
                       { name: 'AREANAME', index: 'AREANAME', width: 80, align: 'center' },
                       { name: 'WAGENUM', index: 'WAGENUM', width: 80, align: 'center', formatter: 'number' },
                       { name: 'POSTWAGE', index: 'POSTWAGE', width: 80, align: 'center', formatter: 'number' },
                       { name: 'REWARDNUM', index: 'REWARDNUM', width: 80, align: 'center', formatter: 'number' },
                       { name: 'PUNISHNUM', index: 'PUNISHNUM', width: 80, align: 'center', formatter: 'number' },
                       { name: 'DEDUCTNUM', index: 'DEDUCTNUM', width: 80, align: 'center', formatter: 'number' },
                       { name: 'BANNUM', index: 'BANNUM', width: 80, align: 'center', formatter: 'number' }
                        ],

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
                            //&& data.ZONENAME == "总计"
                        }
                        if (data.ENTERTIME == "0001-1-1") {
                            mygrid.setCell(i, "ENTERTIME", ' ', { color: 'red' });
                        }
                        if (data.DIMISSIONTIME == "0001-1-1") {
                            mygrid.setCell(i, "DIMISSIONTIME", ' ', { color: 'red' });
                        }
                    }
                },
                onSelectRow: function(rowid) {
                    var rowdata = mygrid.getRowData(rowid);
                    if (rowdata.AREANAME != "合计") {
                        DisplayDetails(rowid);
                    }
                },
                userDataOnFooter: true
            });
        });

        //显示详细信息
        function DisplayDetails(rowIndex) {
            //获取审批ID
            var rowData = mygrid.getRowData(rowIndex);
            var begintime = $("#beginTime").val();
            var endtime = $("#endTime").val();
            var AreaName = rowData.AREANAME;
            if ($('#begintimeys').val() == $('#endtimeys').val() && $('#begintimems').val() == $('#begintimems').val()) {
                begintime = $('#begintimeys').val() + "-" + ($('#begintimems').val() - 1) + "-" + "25";
                endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
            }
            else {
                begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
            }

            var MsgData = AreaName + "," + begintime + "," + endtime;
            $('#postwage').hide();

            $.ajax({
                url: "WageQuerySlave/",
                type: "POST",
                dataType: "json",
                data: { strMessage: MsgData },
                success: QueryDetail
            });
        }
        
        
        function QueryDetail() {
            var str = "http://" + location.host + "/Query.aspx/WageQuery";
            location.href(str);
        }
        
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
                  if ($('#begintimeys').val() == $('#endtimeys').val() && $('#begintimems').val() == $('#begintimems').val()) {
                      begintime = $('#begintimeys').val() + "-" + ($('#begintimems').val() - 1) + "-" + "25";
                      endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  }
                  else {
                      begintime = $('#begintimeys').val() + "-" + $('#begintimems').val() + "-" + "25";
                      endtime = $('#endtimeys').val() + "-" + $('#endtimems').val() + "-" + "24";
                  }
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
               if ($('#endtimeys').val() == year && $('#endtimems').val() > (month+1)) {
                  // alert($('#endtimems').val()+"  "+month);
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
              mygrid.appendPostData({ AreaID: areaid == 0 ? 1 : areaid, beginTime: begintime, endTime: endtime });
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
              var parm642 = BASE64.encode(begintime + "," + endtime);
              str = "http://" + location.host + "/Query.aspx/showexcelarea/" + parm642;
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

              var parm642 = BASE64.encode(begintime + "," + endtime);
              str = "http://" + location.host + "/Query.aspx/showexcelone/" + parm642;
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