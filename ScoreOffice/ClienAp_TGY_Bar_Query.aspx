<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	客户端安装/更新统计(网吧)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%Html.RenderPartial("ExamineComboConditionControl"); %>
<br />
    <div id="tabs">
        <div id="tabs1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        
    </div>
    <center>  
  
</center>
<div>
        <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
        <%
            string strZAid =(string)ViewData["ZAID"];
            string ZID = "";
           
            string AID ="";
            if (strZAid != null)
            {
                ZID = strZAid.Split(',')[0];
                AID = strZAid.Split(',')[1];
            }
        %>
        
       <span id="power"><%=account.POPEDOMID %></span>
       
       <span id="aid"><%=AID%></span>
       <span id="zid"><%=ZID%></span>
      <%--  <div id="loadallexcel" >
        <button style="margin-top:10px;" id="excelone" class="ui-state-default ui-corner-all" type="submit" onclick="loadexcelone()">导出数据</button>  
    </div>--%>
</div>
  <script type="text/javascript">
      $('#tabs').tabs();
      var mygrid;
      var userID = 0;
      var ID = 0;
      var tabsIndex = 0;
      var power = 0;
      power = $("#power").html();
      var userPopdem = 0;



      function loadexcelone() {
          var areaID = $("#area").val();

          var vBarName = "";
          var vBarCode = 0;
          var vApplyName = "";
          var vApplyAccount = "";


          var sType = $('#Select2').val();
          if (sType == 1) {

              vBarName = $('#uaccount').val();
          }
          else if (sType == 2) {
              if (isNaN($('#uaccount').val())) {
                  alert('网吧编号必须为数字！')
                  return;
              }
              vBarCode = $('#uaccount').val();
          }
          else if (sType == 3) {
            vApplyName = $('#uaccount').val();
          }
          else if (sType == 4) {
            vApplyAccount = $('#uaccount').val();
          }

          //查询时间
          var begintime = $("#beginTime").val()
          var endtime = $("#endTime").val();


          url = "http://" + location.host + "/ScoreOfficeQuery.aspx/CreateExcel_APBar/";
          $.ajax(
             {
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
             
             
          var strP64ea = BASE64.encode(actionString + ";" + beginTime + ";" + endTime);
          //str = "http://" + location.host + "/ScoreOfficeQuery.aspx/CreateExcel_APBar/" + strP64ea;
         // location.replace(str);

      
      }

      $(document).ready(function() {
          $('#aid').hide();
          $('#zid').hide();
          $('#userAccount').show();
          $("#Select2").empty();
          $("#Select2").html('');
          $("#Select2")
          $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
          $("<option value='1'>按网吧名称搜索</option>").appendTo("#Select2")//添加下拉框的option
          $("<option value='2'>按网吧编号搜索</option>").appendTo("#Select2")//添加下拉框的option
          $("<option value='3'>按推广员姓名搜索</option>").appendTo("#Select2")//添加下拉框的option
          $("<option value='4'>按推广员帐号搜索</option>").appendTo("#Select2")//添加下拉框的option

          //////////////////

          setTimeout('firstload()', 2000);
          $("#condition").hide();
          $('#detail').hide();

          $("#zone").change(function() { loadArea() });


          var szoneid = $('#zid').html();
          if (szoneid != "") {

              //根据UserQueryMaster传过来的AreaID,显示相对应的数据
              if (power == 1 || power == 2 || power == 3 || power == 4 || power == 5 || power == 8 || power == 7) {

                  $('#zone').val(szoneid);

              }
          }
          $("#power").hide();
          loadArea();

          ///////////////////////////////////////
          mygrid = $("#list").jqGrid({
              width: 800,
              height: 450,
              url: 'http://' + location.host + '/ScoreOffice.aspx/ClienAp_TGY_Bar_Query',
              datatype: 'json',
              mtype: 'POST',
              pager: jQuery('#pager'),
              rowNum: 20,
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
              //网吧编号	网吧名称	城市	区/县	登记人	登记人账号	已安装/更新	类型	安装/更新日期
              colNames: ['网吧编号', '网吧名称', '城市', '区/县', '绑/锁定人', '绑/锁定人账号', '已安装/更新', '类型', '安装/更新日期'],

              colModel: [{ name: 'NETBAR_ID', index: 'NETBAR_ID', width: 160, align: 'center', sortable: false },
                        { name: 'BASE_NAME', index: 'BASE_NAME', width: 160, align: 'center', sortable: false },
                        { name: 'BASE_CITY', index: 'BASE_CITY', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'BASE_PROV', index: 'BASE_PROV', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'APPLYNAME', index: 'APPLYNAME', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'APPLYACCOUNT', index: 'APPLYACCOUNT', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'NETBAR_TYPE', index: 'NETBAR_TYPE', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'ABTYPE', index: 'ABTYPE', width: 160, sortable: false, align: "center", sortable: false },
                        { name: 'AP_DATE', index: 'AP_DATE', width: 160, sortable: false, align: "center", sortable: false }
                        ]
          });
      });        
     
      function firstload() {
          loadData();
      }

      function loadData() {
          var areaID = $("#area").val();
          
          var vBarName = "";
          var vBarCode = 0;
          var vApplyName = "";
          var vApplyAccount = "";


          var sType = $('#Select2').val();
          if (sType == 1) {
                
                vBarName = $('#uaccount').val()
          }
          else if (sType == 2) {
          if (isNaN($('#uaccount').val())) {
              alert('网吧编号必须为数字！')
              return;
          } 
                vBarCode = $('#uaccount').val()
          }
          else if (sType == 3) {
                vApplyName = $('#uaccount').val()
          }
          else if (sType == 4) {
                vApplyAccount = $('#uaccount').val()
          }
          
          //查询时间
          var begintime = $("#beginTime").val()
          var endtime = $("#endTime").val()

          mygrid.appendPostData({ AreaID: areaID,
                                  BarCode: vBarCode,
                                  BarName: vBarName,
                                  ApplyAccount: vApplyAccount,
                                  ApplyName:vApplyName,
                                  Start: begintime, 
                                  End: endtime,
                                  UAccount:'' });
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
              $.each(result.rows, function(i, item) {
                  $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
              });

              //根据UserQueryMaster传过来的AreaID,显示相对应的数据
              var sareaid = $('#aid').html();
              if (sareaid != "") {
                  if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
                      $('#area').val(sareaid);
                  }
              }
          }
      }

  </script>
</asp:Content>
