<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧查询
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div>
        <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
        <span id="power">
            <%=account.POPEDOMID %></span>
    </div>
    <div>
        <%Html.RenderPartial("ExamineConditionControl"); %></div>
        <br />
         <div id="tabs">
            <%Html.RenderPartial("DataGridControl"); %>
    </div>
    <center>  
         <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
         <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
    </center>
    
     <div id="loadallexcel" >
      <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
     <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()" id="excelbs">导出办事处数据</button>
     <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="excelone">导出个人数据</button>

    </div>
    <script type="text/javascript">
        $('#tabs').tabs();
    var mygrid;
    var power = 0;
    setTimeout('loadData()', 900);
    $(document).ready(function() {
        $('#zoneHide1').hide();
        $('#areaHide1').hide();
        $('#userAccount').hide();
        $('#uaccount').hide();
        $("#condition").hide();
        $("#power").hide();
        power = $("#power").html();
        //loadArea();

        if (power == 1 || power == 2 || power == 3 || power == 4) {
            $('#excelnow').hide();
            $('#excelbs').show();
            $('#excelone').show();
        }
        else if (power == 5) {
            $('#excelnow').show();
            $('#excelbs').hide();
            $('#excelone').show();
        }
        else if (power == 6) {
            $('#excelnow').show();
            $('#excelbs').hide();
            $('#excelone').hide();
        }
        else {
            $('#excelnow').hide();
            $('#excelbs').hide();
            $('#excelone').hide();
        }

        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'ClockInQueryMaster/',
            datatype: 'json',
            mtype: 'POST',
            //pager: jQuery('#pager'),
            rowNum: 80,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询结果：',
            recordtext: '条记录',
            loadtext: 'loading....',
            colNames: ['大区', '办事处', '打卡次数', '打卡网吧', '投票次数'],
            colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 50, align: 'center' },
                                        { name: 'AREANAME', index: 'AREANAME', width: 60, align: 'center' },
                                        { name: 'CINNETBAR', index: 'CINNETBAR', width: 60, align: 'center' },
                                        { name: 'VOTETIMES', index: 'VOTETIMES', width: 80, align: 'center' },
                                        { name: 'CINTIMES', index: 'CINTIMES', width: 60, align: 'center'}],
            onSelectRow: function(rowid) {
                var rowdata = mygrid.getRowData(rowid);
                if (rowdata.AREANAME != "合计") {
                    DisplayDetails(rowid);
                }
            }
        });
    });

    //显示详细信息
    function DisplayDetails(rowIndex) {

        var rowData = mygrid.getRowData(rowIndex);
        AreaName = rowData.AREANAME;

        $.ajax({
            url: "http://" + location.host + "/NetBarManager.aspx/ClockInDetailSlave",
            type: "POST",
            dataType: "json",
            data: { strMessage: AreaName },
            success: QueryDetail
        });
    }
    
    function QueryDetail() {
        var str = "http://" + location.host + "/NetBarManager.aspx/ClockInQuery";
        location.href(str);
    }
    
    function loadArea() {
          $.ajax({
              url: "LoadArea/" + $("#zone").val(),
              type: "POST",
              dataType: "json",
              success: areaSuccessed
          });
      }

      function areaSuccessed(result) {
          $("#area").empty();
          if (power != 3) {

              if (result.rows.length > 0) {
                  $.each(result.rows, function(i, item) {
                      $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                  });
              }
          }
          else {
              $("<option></option>").val("0").text("督察").appendTo($("#area"));
          }
      }
      
      function loadData() {
          var areaID = $("#area").val();
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var searchString = $("#uaccount").val();
          mygrid.appendPostData({ SearchString: searchString, Start: beginTime, End: endTime });
          mygrid.trigger('reloadGrid');
      }
        

      // 字符过滤
      jQuery.validator.addMethod("filterChar", function(value, element) {
          var flag = true;
          var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
          for (var i = 0; i < charArray.length; i++) {
              if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
          }
          return this.optional(element) || flag;
      }, "&nbsp;&nbsp;[含有非法字符]");

      $("#form1").validate({
          rules: { uaccount: { filterChar: true } }
      });


      ///////////////////////////////////load excel
      function loadexcel() {
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelclock/";
          location.replace(str);
      }
      function loadexcelall() {
         // var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          //tabsIndex = tabsIndex - 1;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var strP64ea = BASE64.encode(beginTime + "," + endTime);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelallclock/" + strP64ea;
          //str = "http://" + location.host + "/NetBarManager.aspx/showexcelallclock/"+beginTime+","+endTime;
          location.replace(str);
      }
      function loadexcelarea() {
          // var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          //tabsIndex = tabsIndex - 1;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var areaid = $("#area").val();

          var strP64ea = BASE64.encode(beginTime + "," + endTime + "," + areaid);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelarea/" + strP64ea;

          location.replace(str);
      }


      function loadexcelone() {

          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var areaid = $("#area").val();
          var type;
          var strP64ea = BASE64.encode(beginTime + "," + endTime + "," + areaid+","+type);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelone/" + strP64ea;

          location.replace(str);
      }


      function loadexcelducha() {
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
        
          var strP64ea = BASE64.encode(beginTime + "," + endTime );
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelducha/" + strP64ea;

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
