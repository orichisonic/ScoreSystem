<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	客户端安装/更新统计(总览)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("ExamineConditionControl"); %>
<br />
    <div id="tabs">
        <div id="tabs1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        
    </div>
    <center>  
     <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
</center>
<div>
       <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <span id="power"><%=account.POPEDOMID %></span>
</div>
  <script type="text/javascript">
      $('#tabs').tabs();

      var userID = 0;
      var ID = 0;
      var tabsIndex = 0;
      var power = 0;
      power = $("#power").html();
      var userPopdem = 0;
      if (power != 8) {
          loadArea();
      }


      $(document).ready(function() {

          //if (power == 2) {
              $('#zoneHide1').hide();
              $('#areaHide1').hide();
          //}
          $("#Select2").empty();
          $("#Select2").html('');
          $("#Select2").hide();
          //////////////////

          setTimeout('firstload()', 2000);
          $("#condition").hide();
          $('#detail').hide();

          $("#zone").change(function() { loadArea() });
          // 权限设置

          $("#power").hide();
          loadArea();

          ///////////////////////////////////////
          mygrid = $("#list").jqGrid({
              width: 800,
              height: 450,
              url: 'http://' + location.host + '/ScoreOffice.aspx/ClienAp_Query',
              datatype: 'json',
              mtype: 'POST',
              //pager: jQuery('#pager'),
              rowNum: 100,
              rowList: [20, 40, 60, 80],
              sortname: 'Id',
              sortorder: "desc",
              viewrecords: true,
              imgpath: '/scripts/themes/steel/images',
              caption: '查询结果：',
              recordtext: '条记录',
              loadtext: '加载数据请稍候...',
              footerrow: true,
              userDataOnFooter: true,
              colNames: ['大区', '办事处', '录入网吧', 'A类网吧安装/更新数量', 'B类网吧安装/更新数量', '合计',''],

              colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 160, align: 'center', sortable: false },
                                        { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center', sortable: false },
                                        { name: 'ALLNUMS', index: 'ALLNUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'ANUMS', index: 'ANUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'BNUMS', index: 'BNUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'TOTALNUMS', index: 'TOTALNUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'AreaID', index: 'AreaID', width: 160, sortable: false, align: "center", formatter: 'number', hidden:true  },
                                        ],

              onSelectRow: function(rowid) {
                    var rowdata = mygrid.getRowData(rowid);
                    if (rowdata.AREANAME != "合计") {
                        DisplayDetails(rowid);
                    }
              }
          });
      });

      function QueryDetail() {
          var str = "http://" + location.host + "/PM.aspx/ClienAp_Query";
          location.href(str);
      }

      function firstload() {
          loadData();
      }

      function loadData() {

          var areaID = $("#area").val();
          var zoneID = $("#Zone").val();
          //查询时间
          var begintime = $("#beginTime").val()
          var endtime = $("#endTime").val()

          mygrid.appendPostData({ AreaID: areaID,ZoneID: zoneID,Start: begintime, End: endtime });
          mygrid.trigger('reloadGrid');
      }


      function loadArea() {
          //定义全局URL以便返回能够找到controls
          url = "http://" + location.host + "/ScoreOffice.aspx/LoadArea/";
          $.ajax(
             {
                 url: url + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
      }

      function loadSuccessed(result) {
          $("#area").empty();
          if (result.rows.length > 0) {
              if (power == 8 || power == 3) {
                  $("<option></option>").val("0").text("督察").appendTo($("#area"));
              }
              else {

                  $.each(result.rows, function(i, item) {
                      $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                  });
              }


          }
      }

      //显示详细信息
      function DisplayDetails(rowIndex) {
          //获取审批ID
          var rowData = mygrid.getRowData(rowIndex);
          var vAreaID = rowData.AreaID;
          if (vAreaID == "") {
              return;
          }

          $.ajax({
          url: "http://" + location.host + "/ScoreOffice.aspx/ClienAp_TGY_Query_Param", 
              type: "POST",
              dataType: "json",
              data: { strMessage: vAreaID },
              success: DetailSuccessed
          });
      }

      function DetailSuccessed(result) {
          str = "http://" + location.host + "/ScoreOffice.aspx/ClienAp_TGY_Query/";
          location.href(str);
      }

  </script>
</asp:Content>
