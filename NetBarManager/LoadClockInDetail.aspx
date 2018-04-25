<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧打卡详细查询
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.CLOCKINCondition condtion = (TGProject.Models.CLOCKINCondition)ViewData["condition"];
            string strZAid = (string)Session["ZoneAreaForClockQuery"];
            string Zid = string.Empty;
            string Aid = string.Empty;
            if (strZAid == null)
            {
                Zid = string.Empty;
                Aid = string.Empty;
            }
            else
            {
                Zid = strZAid.Split(',')[0];
                Aid = strZAid.Split(',')[1];
            }
    %>
        <span id="uaccount"><%=condtion.UAccount%></span>
        <span id="ZidFromMaster"><% =Zid%></span>
        <span id="AidFromMaster"><% =Aid%></span>
    <ul class="verticality">
    <li>所查询时间:
                <span id="startt"><%=condtion.BeginTime.ToShortDateString()%></span>至<span id="endt"><%=condtion.EndTime.ToShortDateString()%></span>
    </li>
    </ul>
        <br />
         <div id="tabs">
        <ul>
            <li><a href="#tabs1">查询结果</a></li>
        </ul>
        
        <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
    </div>
     <p style="text-align: center">
            <%--<button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">返回</button>--%>
            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="goback();">返回</button>
        </p>
    <div id="loadallexcel" >
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
    </div>
    <script type="text/javascript">
        $('#tabs').tabs();
        var url = "http://" + location.host + "/NetBarManager.aspx/LoadClockInDetail2/";
        //var url = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo2/";
    var mygrid;

    $(document).ready(function() {
        $("#condition").hide();
        $("#uaccount").hide();
        
        $("#ZidFromMaster").hide();
        $("#AidFromMaster").hide();
        
        $('#tabs').bind('tabsselect', function(event, ui) { loadData() });
        var t = setTimeout('firstload()', 1000);
        var beginTime = $("#startt").val();
        var endTime = $("#endt").val();
        var account = $("#uaccount").val();

        mygrid = $("#list").jqGrid({
            UAccount: account,
            BeginTime: beginTime,
            EndTime: endTime,
            width: 800,
            height: 450,
            url: url,
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 21,
            rowList: [20, 40, 60, 80],
            sortname: 'Ids',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询结果：',
            recordtext: '条记录',
            loadtext: 'loading....',
            
            colNames: ['帐号', '用户名', '类型', '省份', '办事处', '区/县', '打卡时间', '打卡网吧','网吧id'],

            colModel: [{ name: 'uaccount', index: 'UACCOUNT', width: 50, align: 'center' },
                                        { name: 'username', index: 'USERNAME', width: 60, align: 'center' },
                                        { name: 'ctype', index: 'CTYPE', width: 60, align: 'center' },
                                        { name: 'province', index: 'PROVINCE', width: 50, align: 'center' },
                                        { name: 'city', index: 'CITY', width: 50, align: 'center' },
                                        { name: 'county', index: 'COUNTY', width: 50, align: 'center' },
                                        { name: 'clockintime', index: 'CLOCKINTIME', width: 80, align: 'center' },
                                        { name: 'barname', index: 'BARNAME', width: 50, align: 'center' },
                                        { name: 'netbarid', index: 'NETBARID', width: 0, align: 'center', hidden: "true" }
                                        ],
            onSelectRow: function(rowid) {
                DisplayDetails(rowid);
            }
                                    });
    });

    function goback() {

        //获取审批ID
        var zaid = $('#ZidFromMaster').html() + "," + $('#AidFromMaster').html()

        $.ajax({
            url: "http://" + location.host + "/NetBarManager.aspx/ClockInDetailSlave",
            type: "POST",
            dataType: "json",
            data: { strMessage: zaid },
            success: QueryDetail
        });
    }

    function QueryDetail() {
        var str = "http://" + location.host + "/NetBarManager.aspx/ClockInQuery";
        location.href(str);
    }
    //显示详细信息
    function DisplayDetails(rowIndex) {
        //获取ID
        var rowData = mygrid.getRowData(rowIndex);
        var netBarID = rowData.netbarid;
        var prm64 = BASE64.encode(netBarID);

        if (netBarID != null)
            location.href = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarDetail/" + prm64;

    }
    
    function firstload() {

        loadData();
      
    }


      
      function loadData() {
          var beginTime = $("#startt").val();
          var endTime = $("#endt").val();
          var account = $("#uaccount").val();

          mygrid.appendPostData({UAccount: account, BeginTime: beginTime, EndTime: endTime,Areaid:0,Type:0});
          //mygrid.appendPostData({ TypeID: 1, ORDERKIND: 2, DEFINEID: 3, TYPE: 4, UKEY: 5, START: beginTime, END: endTime });
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




      function loadexcel() {
          str = "http://" + location.host + "/NetBarManager.aspx/showexcelclockdetail/";
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
