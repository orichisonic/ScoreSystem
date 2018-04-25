<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广员推广业绩明细
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
    
        TGProject.Models.WModels.TgsOutachiveCondition condtion = (TGProject.Models.WModels.TgsOutachiveCondition)Session["conditionX"];
            int selectIdx = 0;
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                gameidx = condtion.gameidx;
                strDefines = condtion.DEFINEID;
            }
            else
            {
                selectIdx = 0;
            }
        %>
            <span id="ukey"><%=condtion.UKEY%></span>
            <span id="selectID"><%=selectIdx%></span>
            <span id="begintime"><%=condtion.START.ToShortDateString()%></span>
            <span id="endtime"><%=condtion.END.ToShortDateString()%></span>
            <span id="gameidx"><%=gameidx%></span>
       <span id="definesstr"><%=strDefines%></span>
    <fieldset>
  <div id="tab2-userinfo">
   <ul class="verticality">
    <li>所查询时间: 
     <span id="querytime"></span>
    </li><br /> 
   </ul>
        <%--    <ul class="verticality">
                <li>类别:<select name="GAME" id="GAME">
                    <option value="0">所有游戏</option>
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                          { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
                 <span id="test" style="color:#000000"><select  style="width:150px;" name="Gclass" id="Gclass" onchange="return class_onclick()">
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                          {
                    %>
                    <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%></option>
                    <%
                        }
                     %>
                </select></span>
               <button class="ui-state-default ui-corner-all" type="button" onclick="loadDataselectlist(0)">查询</button>
                </li>
            </ul>--%>
  </div>
 </fieldset><br />
 <div id="tabs">
  <ul>
   <li><a  href="#tabs-1">按消费时间排列</a></li>
   <li><a  href="#tabs-1">按消费金额排列</a></li>
   <li><a  href="#tabs-1">按消费游戏排列</a></li>
   <li><a  href="#tabs-1">按消费类型排列</a></li>
  </ul>
  <div id="tabs-1">
      <%Html.RenderPartial("DataGridControl"); %>
      </div>
<center>

<button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">
                       返回</button></center>
</div>
 <script type="text/javascript">
  $('#tabs').tabs();
  var power = 0;
  //var mygrid;
  var selectindex = 0;
  var gameidx = $("#gameidx").html();
var mygrid;
  $("#gameidx").hide();
  $("#definesstr").hide();
  function firstload() {
      loadData(0);
  }

  var UKEYGLOBAL = $("#ukey").html();
  $(document).ready(function() {
      

      $("#power").hide();
      $("#ukey").hide();

      var idx = $("#selectID").html();
      var begintime = $("#begintime").html();
      var endtime = $("#endtime").html();



      $("#querytime").html(begintime + "至" + endtime);
      $("#selectID").hide();
      $("#begintime").hide();
      $("#endtime").hide();


      $("#power").hide();
      $("#ukey").hide();

      $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

      var url = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo2/";
      mygrid = $("#list").jqGrid({
          width: 800,
          height: 450,
          //         url: 'LoadTGPerformanceInfo2/',
          url: url,
          datatype: 'json',
          mtype: 'POST',
          pager: jQuery('#pager'),
          rowNum: 40,
          rowList: [20, 40, 60, 80],
          sortname: 'Id',
          sortorder: "desc",
          viewrecords: true,
          imgpath: '/scripts/themes/steel/images',
          caption: '查询条件：',
          recordtext: '条记录',
          loadtext: '加载数据请稍候....',
          colNames: ['大区', '办事处', '职务', '姓名', '消费用户', '消费时间', '消费金额', '消费游戏', '消费类型'],
          colModel: [{ name: 'zonename', index: 'ZONENAME', width: 160, align: 'center' },
                        { name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                        { name: 'popedomname', index: 'POPEDOMNAME', width: 160, align: 'center' },
                        { name: 'username', index: 'USERNAME', width: 160, align: 'center' },
                        { name: 'paccount', index: 'PACCOUNT', width: 160, align: 'center' },
                        { name: 'detailtime', index: 'DETAILTIME', width: 160, align: 'center' },
                        { name: 'dvalue', index: 'DVALUE', width: 160, align: 'center' },
                        { name: 'gamename', index: 'GAMENAME', width: 160, align: 'center' },
                        { name: 'btypename', index: 'BTYPENAME', width: 160, align: 'center'}]
                    });
                    setTimeout('loadData(0)', 2000);
  });
  function loadData(index) {

      if (index == undefined) {
          tabsIndex = $("#tabs").tabs().tabs("option", "selected");
          
      } else
      {
          tabsIndex = index;
      }


 
      var begintime = $("#begintime").html();
      var endtime = $("#endtime").html();
      var type = 1;
      var tabsIndex = parseInt(index);
      
      
      var game1 = $("#gameidx").html();

      var actionStrings = $("#definesstr").html();



      //alert(actionStrings + " " + UKEYGLOBAL);
      mygrid.appendPostData({ TypeID: tabsIndex, ORDERKIND: tabsIndex + 1, DEFINEID: actionStrings, TYPE: type, UKEY: UKEYGLOBAL, START: begintime, END: endtime });
      mygrid.trigger('reloadGrid');
      //alert(tabsIndex);
  }
 
  function ReturnPrevious() {
  
      history.go(-1);
  
  }

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



  function loadDefine() {

     
      $("#Gclass").empty();
      $('#test').html('');
      $('#test').html('<span id="test"  style="color:#000000"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()" multiple="multiple"></select></span>');
      $.ajax(
             {
                
                 url: "http://" + location.host + "/ScoreQuery.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
  }

  function loadSuccessed(result) {
      $("#Gclass").empty();
      var definestr = $("#definesstr").html();

      var definesArray = definestr.split(',');

      if (result.rows.length > 0) {
          $.each(result.rows, function(i, item) {

              var hasFlg = 0;
              var routelong = definesArray.length;
              for (idef = 0; idef < routelong; idef++) {
                  if (definesArray[idef] == item.cell[0]) {

                      hasFlg = 1;
                      break;
                  }
                  else {
                      hasFlg = 0
                  }
              }
              if (hasFlg == 1) {
                  $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
              }
              else {
                  $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
              }
          });
      }
      else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
      $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
      $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
      }
      $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });


  }
  
 </script>

</asp:Content>
