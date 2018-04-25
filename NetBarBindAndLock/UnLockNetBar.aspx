<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧解绑解锁
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <%Html.RenderPartial("ExamineComboConditionControl"); %></div>
        <br />
  <div style="color:Blue">查询总计:<span id="totalsum"></span></div>
    <div id="tabs">
        <ul>
            
            <li><a href="#tabs3">绑定</a></li>
            <li><a href="#tabs4">锁定</a></li>
          
        </ul>
    
       <div id="tabs3">
       <table id="list3" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager3" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs4">
       <table id="list4" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager4" class="scroll" style="text-align: center;"></div>
      </div>
     
           
    </div>
    
     
    <script type="text/javascript">
    $('#tabs').tabs();
    var mygrid;
    var mygrid2;
    var mygrid3;
    var mygrid4;
    var mygrid5;
    var mygrid6;
    
    var tabsIndex;
    var power;
    $(document).ready(function() {
        ///////////////////
        $("#Select2").bind('click', function() {
            if ($("#Select2").val() == 0) {
                $("#uaccount").val('');
            }
        });
        /*
        $("#Select2").empty();
        $("#Select2").html('');
        $("#Select2").empty();
        $("#Select2").html('');
        $("<option value='1'>网吧名称</option>").appendTo("#Select2")//添加下拉框的option
        */
        //////////////////////
        var power = $('#userpopdem').html();
    
        if (power <= 4) {
            //$('#excelall').show();
        }
        //////////////////////
        $("#zone").change(function() { loadArea() });
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
        $('#userAccount').show();
        $("#condition").hide();
        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        //        if($("#"))
        //所有通过审核的网吧信息


        mygrid3 = $("#list3").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager3'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '绑定人', '绑定人账号', '绑定日期', '类型','录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 160, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 160, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 160, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 160, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 160, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 160, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 160, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list3").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },
            onSelectRow: function(rowid) {
                DisplayDetails3(rowid);
            }
        });

        mygrid4 = $("#list4").jqGrid({
            width: 800,
            height: 450,
            url: 'NetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager4'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['序号', '网吧名称', '省份', '办事处', '区/县', '锁定人', '锁定人账号', '锁定日期', '类型', '录入途径'],

            colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 160, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 160, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 160, align: 'center' },
                                        { name: 'bindname', index: 'BINDNAME', width: 160, align: 'center' },
                                        { name: 'bindaccount', index: 'BINDACCOUNT', width: 160, align: 'center' },
                                        { name: 'handletime', index: 'HANDLETIME', width: 160, align: 'center' },
                                        { name: 'atype', index: 'ATYPE', width: 160, align: 'center' },
                                        { name: 'BASEFROM', index: 'BASEFROM', width: 160, align: 'center'}],
            loadComplete: function() {
                var sumrecords = $("#list4").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
                //                else {
                //                    $('#totalsum').text(0);
                //                }
            },

            onSelectRow: function(rowid) {
                DisplayDetails4(rowid);
            }
        });

        loadDelay();
    });

    function loadDelay() {
        setTimeout("loadData(0)", 1000)
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

      function loadData(index) {
       

         
          if (index == "undefined" || index == undefined) {

              tabsIndex = $("#tabs").tabs().tabs("option", "selected");
              index = $("#tabs").tabs().tabs("option", "selected");
          } else {
              tabsIndex = index;
          }


          var areaID = $("#area").val();
          var beginTime = $("#beginTime").val();
          var endTime = $("#endTime").val();
          var account = $("#uaccount").val();
          var searchtype = $("#Select2").val();
          var NetBarID = $("#uaccount").val();
          //alert(searchtype);
          //alert(account);
          if (account == "") {
              searchtype = 0;
          }
          //alert(tabsIndex);
     
          if (index == 0) {

          mygrid3.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list3").getGridParam("records") != null)
          $("#totalsum").text($("#list3").getGridParam("records"));
           else 
              $("#totalsum").text(0)
          mygrid3.trigger('reloadGrid');


          }
          else if (index == 1) {

          mygrid4.appendPostData({ TypeID: tabsIndex, AreaID: areaID == 0 ? 1 : areaID, UAccount: account, BeginTime: beginTime, EndTime: endTime, SearchType: searchtype });
          if ($("#list4").getGridParam("records") != null)
              $("#totalsum").text($("#list4").getGridParam("records"));
          else
              $("#totalsum").text(0)
          mygrid4.trigger('reloadGrid');
       
          
          }
         
      ///////////////////////////
      return;
      ////////////////////////
          if (tabsIndex == 0 || tabsIndex == 1) {
              //清空下拉框
              $("#Select2").empty();
              $("#Select2").html('');
              $("<option value='1'>网吧名称</option>").appendTo("#Select2")//添加下拉框的option
          }
          else {
              //清空下拉框
              $("#Select2").empty();
              $("#Select2").html('');
              $("<option value='0'>用户帐号</option>").appendTo("#Select2")//添加下拉框的option
              $("<option value='1'>网吧名称</option>").appendTo("#Select2")//添加下拉框的option 
          }
      }
        
        //显示详细信息
      
      function DisplayDetails3(rowIndex) {
          //获取ID
          var rowData = mygrid3.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadUnBindNetBarDetail/" + prm64;
        
      }

      function DisplayDetails4(rowIndex) {
          //获取ID
          var rowData = mygrid4.getRowData(rowIndex);
          var netBarID = rowData.netbarid;
          var prm64 = BASE64.encode(netBarID);
          
          if (netBarID != null)
              location.href = "LoadUnLockNetBarDetail/" + prm64;
   
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
          str = "http://" + location.host + "/NetBarManager.aspx/showexcel/"+tabsIndex;
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
