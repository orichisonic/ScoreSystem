<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	�ͻ��˰�װ/����ͳ��(�ƹ�Ա)
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
     <p style="font-weight: bold">�����Ŀֱ�Ӳ�ѯ������ϸ</p>
</center>
<div>
       <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <%
           string strZAid = (string)ViewData["ZAID"];
           string ZID ="" ;
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


      $(document).ready(function() {

          $('#aid').hide();
          $('#zid').hide();
          $("#Select2").empty();
          $("#Select2").html('');
          $("#Select2").hide();
          //////////////////

          setTimeout('firstload()', 2000);
          $("#condition").hide();
          $('#detail').hide();

          $("#zone").change(function() { loadArea() });
          // Ȩ������

          $("#power").hide();

          var szoneid = $('#zid').html();
          if (szoneid != "") {

              //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
              if (power == 1 || power == 2 || power == 3 || power == 4 || power == 5 || power == 8) {

                  $('#zone').val(szoneid);

              }
          }
          loadArea();

          ///////////////////////////////////////
          mygrid = $("#list").jqGrid({
              width: 800,
              height: 450,
              url: 'http://' + location.host + '/ScoreOffice.aspx/ClienAp_TGY_Query',
              //url: 'http://' + location.host + '/ScoreOffice.aspx/ClienAp_Query',
              datatype: 'json',
              mtype: 'POST',
              pager: jQuery('#pager'),
              rowNum: 20,
              rowList: [20, 40, 60, 80],
              sortname: 'Id',
              sortorder: "desc",
              viewrecords: true,
              imgpath: '/scripts/themes/steel/images',
              caption: '��ѯ�����',
              recordtext: '����¼',
              loadtext: '�����������Ժ�...',
              footerrow: true,
              userDataOnFooter: true,
              colNames: ['���´�', '�ƹ�Ա', 'A�����ɰ�װ/�������� ', 'B�����ɰ�װ/�������� ', '�ϼ�', ''],

              colModel: [{ name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center', sortable: false },
                        { name: 'USERNAME', index: 'USERNAME', width: 160, align: 'center', sortable: false },
                        { name: 'ANUMS', index: 'ANUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                        { name: 'BNUMS', index: 'BNUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                        { name: 'TOTALNUMS', index: 'TOTALNUMS', width: 160, sortable: false, align: "center", formatter: 'number' },
                        { name: 'UACCOUNT', index: 'UACCOUNT', width: 160, sortable: false, align: "center" ,hidden:true}
                        ],

              onSelectRow: function(rowid) {
                  var rowdata = mygrid.getRowData(rowid);
                  if (rowdata.AREANAME != "�ϼ�") {

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
          //��ѯʱ��
          var begintime = $("#beginTime").val()
          var endtime = $("#endTime").val()

          mygrid.appendPostData({ AreaID: areaID, UAccount: '', Start: begintime, End: endtime });
          mygrid.trigger('reloadGrid');
      }


      function loadArea() {
          //����ȫ��URL�Ա㷵���ܹ��ҵ�controls
          url = "http://" + location.host + "/ScoreOffice.aspx/LoadArea/";
          $.ajax(
             {
                 url: url + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
      }

      function loadSuccessed (result) {
          $("#area").empty();
          if (result.rows.length > 0) {
              $.each(result.rows, function(i, item) {
                  $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
              });

              //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
              var sareaid = $('#aid').html();
              if (sareaid != "") {
                  if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
                      $('#area').val(sareaid);
                  }
              }
          }
      }

      //��ʾ��ϸ��Ϣ
      function DisplayDetails(rowIndex) {
          //��ȡ����ID
          var areaID = $("#area").val();
          var zoneID = $("#zone").val();
          var rowData = mygrid.getRowData(rowIndex);
          var vAccount = rowData.UACCOUNT;
          if (vAccount == "") {
              return;
          }

          $.ajax({
              url: "http://" + location.host + "/ScoreOffice.aspx/ClienAp_TGY_Bar_Query_Param",
              type: "POST",
              dataType: "json",
              data: { strMessage: areaID + ',' + vAccount },
              success: DetailSuccessed
          });
      }

      function DetailSuccessed(result) {
          str = "http://" + location.host + "/ScoreOffice.aspx/ClienAp_TGY_Bar_Query/";
          location.href(str);
      }
  </script>
</asp:Content>
