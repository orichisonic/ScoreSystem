 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���ɵȼ���ѯ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
            <span id="power"><%=account.POPEDOMID %></span>
              <span id="areaId"><%=
                                    account.AREAID %></span>
 <div id="ChargeCondition">
    <fieldset>
        <legend>��ѯ����</legend>
        <div style="text-align: center">
            <ul class="horizontal">
             <%  if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3)
                 { %>
                <li>����<select name="zone" id="zone">
                    <%
                          List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%
                        }
                      
                      %>
                </select></li>
                  <%} %>
                  
                   <%  if (account.POPEDOMID == 4 || account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3)
                 { %>
                <li>���´�
                    <select id="area">
                       
                        <option value="<%=account.AREAID %>">Ĭ��</option>
                     
                    </select>
                </li>
                <%} %>

                <li>��ʼ����
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/></li>
                <li>��������
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2010-12-1"/></li>
               
                         <li>
                    <select name="SearchType" id="Select2">
                     <option value="0">����ȫ��</option>
                    <option value="1">��������������</option>
                    <option value="2">�����ɱ������</option>
                    <%if (account.POPEDOMID != 7)
                      { %>
                    <option value="3">����������������</option>
                    <option value="4">���������ʺ�����</option>
                  <%} %>
                    </select>
                    <input type="text" name="TuiGuang" id="TuiGuang" style="width: 90px"/></li>
                <li>
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                        ��ѯ</button></li>
            </ul>
        </div>
    </fieldset>
</div>
<br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">A��</a></li>
            <li><a href="#tabs1">B��</a></li>
            <li><a href="#tabs1">������</a></li>
        </ul>
        
        <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
    </div>
    <script type="text/javascript">
        //////////////////
        $('#zone').val('2');
        function initialize() {
            // $('#zone').val('2');
            $('#area').val('16');
            // alert($('#area').val());
            
        }
        setTimeout('initialize()', 500);
        setTimeout('loadData()', 3000);
        ///////////////////////
    $('#tabs').tabs();
    var mygrid;
    var tabsIndex;
    var power = 0;
    var areaid = 0;
    $(document).ready(function() {
        $("#zone").change(function() { loadArea() });
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
        ////////////////////////////////
        $('#Select2').bind('click', function() {
            if ($('#Select2').val() == 0) {
                $("#TuiGuang").val('');
            }
        });
        /////////////////////////////////
        // Ȩ������
        power = $("#power").html();
        areaid = $("#areaId").html();
        if (power == 2 || power == 4 || power == 5 || power == 3 || power == 6 || power == 7 || power == 8) {
            $("#ChargeCondition").show();
            $("#tabs").show();
        }
        else {
            $("#ChargeCondition").hide();
            $("#tabs").hide();
        }
        $("#areaId").hide();

        $("#power").hide();
        if (power == 4)
            loadAreaDaQu();
        if ($("#area").text().indexOf("Ĭ��") > -1) {
            // alert("��ѡ����´�");
            loadArea();
            // return;
        }
        mygrid = $("#list").jqGrid({
            width: 830,
            height: 450,
            url: 'LoadNetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '��ѯ������',
            recordtext: '����¼',
            loadtext: '�����������Ժ�....',

            colNames: ['���', 'ʡ��', '����', '��/��', '��������','¼��;��', '��������' ],
            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                         { name: 'province', index: 'Province', width: 160, align: 'center' },
                         { name: 'city', index: 'City', width: 160, align: 'center' },
                         { name: 'county', index: 'County', width: 160, align: 'center' },
                         { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                         { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center' },
                         { name: 'handletime', index: 'HANDLETIME', width: 160, align: 'center'}],
             onSelectRow: function(rowid) {
                 DisplayDetails(rowid);
             }

        });
    });

    //��ʾ��ϸ��Ϣ
    function DisplayDetails(rowIndex) {
        //��ȡID
        var rowData = mygrid.getRowData(rowIndex);
        var netBarID = rowData.netbarid;
        var prm64 = BASE64.encode(netBarID);

        if (netBarID != null)
            location.href = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarDetail/" + prm64;

    }
      function loadArea() {
          $.ajax({
              url: "LoadArea/" + $("#zone").val(),
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
                  $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
              });
          }
      }


      function loadData(index) {
          var areaID;
          if (index == undefined) {
              tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          } else {
              tabsIndex = index;
          }
         
          if (tabsIndex == 2)
              tabsIndex = 0;
          else
              tabsIndex = tabsIndex + 1;
          if (power == 2 || power == 3 || power == 8|| power == 4) {
              areaID = $("#area").val();
              
          }
          if ( power == 5 || power == 6 || power == 7) {

              areaID = areaid;
          }
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var UAccount = $("#TuiGuang").val();
          if (UAccount != "") {
              var demo = /^[\u0391-\uFFE5\w]+$/;
              if (!demo.test(UAccount)) {

                  alert("�ƹ���Աֻ�ܰ��������֡�Ӣ����ĸ�����ֺ��»���!");
                  return;


              }
          }


          var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
          if (!datedemo.test(beginTime)) {

              alert("��ʼ���ڲ��ԣ�");
              return;


          }
          if (!datedemo.test(endTime)) {

              alert("�������ڲ��ԣ�");
              return;


          }
          //////////////////////////////
          if (UAccount != "" && $('#Select2').val() != 0) {
              UAccount += $('#Select2').val();
              UAccount += $('#Select2').val();
              UAccount += $('#Select2').val();
          }
          if ($('#Select2').val() == 0) {
              $("#TuiGuang").val('');
          }
          //alert(UAccount);
          ///////////////////////////////
          mygrid.appendPostData({ TypeID: tabsIndex, Grade: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: UAccount, beginTime: beginTime, endTime: endTime });
          mygrid.trigger('reloadGrid');
      }


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
