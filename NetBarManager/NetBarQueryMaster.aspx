<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧查询
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <%Html.RenderPartial("ExamineComboConditionControl"); %></div>
        <br />
    <div id="tabs">
            <table id="list1" class="scroll" cellpadding="0" cellspacing="0"></table>
            <div id="pager1" class="scroll" style="text-align: center;"></div>           
    </div>
    
    <center>  
         <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
         <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
    </center>
    <div id="loadallexcel"  align="left">
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelnetbararea()" id="excelarea">导出办事处数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelnetbarone()" id="excelone">导出个人数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadnetbarInfo()" id="excelnetbar">导出网吧数据</button>
   </div>
    <script type="text/javascript">
    $('#tabs').tabs();
    var mygrid;

    var tabsIndex;
    var power;
    //////////////////////
    var power = $('#userpopdem').html();
    //////////////////////
    $(document).ready(function() {
        $('#zoneHide1').hide();
        $('#areaHide1').hide();
        ///////////////////
        $("#zone").attr("value", 2);
        $("#Select2").bind('click', function() {
            if ($("#Select2").val() == 0) {
                $("#uaccount").val('');
            }
        });

        if (power == 1 || power == 2 || power == 3 || power == 4) {
            $('#excelarea').show();
            $('#excelnow').hide();
            $('#excelone').show();
            $('#excelnetbar').show();
        }
        else if (power == 5 || power == 6) {
            $('#excelarea').hide();
            $('#excelnow').show();
            $('#excelone').show();
            $('#excelnetbar').show();
        }
        else {
            $('#excelarea').hide();
            $('#excelnow').hide();
            $('#excelone').hide();
            $('#excelnetbar').hide();
        }

        $("#zone").change(function() {

            if ($("#zone").val() == -1) {

                $("#excelall").hide();
                $("#areaHide1").hide();
            }
            else {
                $("#excelall").show();
                $("#areaHide1").show();
                //loadArea();
            }
        });
        $('#userAccount').show();
        $("#condition").hide();
        //loadArea();

        $("#Select2").empty();
        $("#Select2").html('');
        if (power == 5 || power == 6) {
            $("#userAccount").hide();
        }
        else {
            $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='1'>按大区名检索</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='2'>按办事处名检索</option>").appendTo("#Select2")//添加下拉框的option
        }
        //所有通过审核的网吧信息
        mygrid = $("#list1").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQueryMaster/',
            datatype: 'json',
            mtype: 'POST',
            //pager: jQuery('#pager1'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询结果：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['大区', '办事处', '录入网吧', '游离网吧', '绑定网吧', '锁定网吧', 'A级网吧', 'B级网吧'],

            colModel: [{ name: 'ZONENAME', index: 'ZONENAME', width: 80, align: 'center' },
                    { name: 'AREANAME', index: 'AREANAME', width: 100, align: 'center' },
                    { name: 'APPLYNUM', index: 'APPLYNUM', width: 100, align: 'center', formatter: 'number' },
                    { name: 'FREENUM', index: 'FREENUM', width: 100, align: 'center', formatter: 'number' },
                    { name: 'BINDNUM', index: 'BINDNUM', width: 100, align: 'center', formatter: 'number' },
                    { name: 'LOCKNUM', index: 'LOCKNUM', width: 100, align: 'center', formatter: 'number' },
                    { name: 'AGRADENUM', index: 'AGRADENUM', width: 120, align: 'center', formatter: 'number' },
                    { name: 'BGRADENUM', index: 'BGRADENUM', width: 100, align: 'center', formatter: 'number' }
                    ],
            loadComplete: function() {
                //                var sumrecords = $("#list1").getGridParam("records");
                //                if (sumrecords != null) {
                //                    $('#totalsum').text(sumrecords);
                //                }
            },
            onSelectRow: function(rowid) {
                var rowdata = mygrid.getRowData(rowid);
                if (rowdata.AREANAME != "合计") {
                    DisplayDetails(rowid);
                }
            }
        });
        loadDelay();
    });

    function QueryDetail() {
        var str =""

            str = "http://" + location.host + "/NetBarManager.aspx/NetBarQuery";
        location.href(str);
    }
    function loadDelay() {
        setTimeout("loadData()", 1000)
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
          if (result.rows.length > 0) {
              $.each(result.rows, function(i, item) {
                  $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
              });
          }
      }

      function loadData() {
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var searchstring = $("#uaccount").val();
          var searchtype = $("#Select2").val();

          if (searchstring == "") {
              searchtype = 0;
          }
          mygrid.appendPostData({ SearchString: searchstring, dtStart: beginTime, dtEnd: endTime, SearchType: searchtype });

//          if ($("#list1").getGridParam("records")!=null)
//              $("#totalsum").text($("#list1").getGridParam("records"));
//          else 
//          $("#totalsum").text(0)
          mygrid.trigger('reloadGrid'); 
      }

      //显示详细信息
      function DisplayDetails(rowIndex) {
          //获取审批ID
          var rowData = mygrid.getRowData(rowIndex);
          AreaName = rowData.AREANAME;
              $.ajax({
                  url: "http://" + location.host + "/NetBarManager.aspx/NetBarQuerySlave",
                  type: "POST",
                  dataType: "json",
                  data: { strMessage: AreaName },
                  success: QueryDetail
              });
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
          tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex + 1;
          var prm64 = "evc"+tabsIndex+"yUJ";
          var prm641 = BASE64.encode(prm64);
//          alert(prm641);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelnetbarquery/" + prm641;
          location.replace(str);
      }
      function loadexcelall() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex ;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 = tabsIndex + "," + beginTime + "," + endTime;
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelall/" +prm641 ;
          //location.relace(str);
          location = str;
      }

      function loadnetbarInfo() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 = $("#area").val();
          //var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelnetbar/" + beginTime;
          //location.relace(str);
          location = str;

      }
      function loadexcelnetbararea() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 =  beginTime + "," + endTime;

          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelareanetbar/" + prm641;
          //location.relace(str);
          location = str;

      }

      function loadexcelnetbarone() {
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          tabsIndex = tabsIndex;
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var prm64 =  beginTime + "," + endTime;
          var prm641 = BASE64.encode(prm64);
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelonenetbar/" + prm641;
          //location.relace(str);
          location = str;

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
