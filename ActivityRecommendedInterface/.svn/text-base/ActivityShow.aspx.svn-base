<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	网吧活动显示</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
     <ul style="text-align:left">
       <li>大区<select name="zone" id="zone">
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
                </select>办事处 
                     
           <select id="area">
               <option value="">默认</option>
           </select>
                </li>
        
         <%--  <select id="area"><option value="">默认</option></select> 查询时间:--%>
                    
        开始日期
                     
           <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/></li>
           <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">
                           查询
                       </button>
         </li>
               
                </ul>
       
       </div>
        <br />
       <div style="color:Blue">查询总计:<span id="totalsum"></span></div>
  <div id="tabs">
        <ul>
            <li><a href="#tabs1">查询结果</a></li>
            
        </ul>
        <div id="tabs1">
       <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager" class="scroll" style="text-align: center;"></div>
      </div>
     
           
    </div>
    
    <script type="text/javascript">

     $('#tabs').tabs();
     $("#power").hide();
     $("#ukey").hide();
     $("#myareaid").hide();
     $("#saved").hide();
     
    var mygrid;
    var tabsIndex;
    var power;
    var idstring;
    var selectedRows = "";

  
    
    $(document).ready(function() {


    loadArea();

    $("#zone").change(function() { loadArea() });
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        var lastsel3;

        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'http://' + location.host + '/ActivityRecommendedInterface.aspx/ActivityShow/',
            // editurl: 'http://' + location.host + '/ActivityRecommendedInterface.aspx/NetBarQuery2/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',
            loadtext: 'loading....',
            colNames: ['省份', '城市', '区/县', '日期', '时段', '网吧名称', '网吧地址', '游戏产品'],

            colModel: [{ name: 'prov', index: 'PROV', width: 80, align: 'center' },
                       { name: 'city', index: 'CITY', width: 80, align: 'center' },
                       { name: 'country', index: 'COUNTRY', width: 80, align: 'center' },
                       { name: 'actdate', index: 'ACTDATE', width: 200, align: 'center' },
                       { name: 'period', index: 'PERIOD', width: 240, align: 'center' },
                       { name: 'barname', index: 'BARNAME', width: 100, align: 'center' },
                        { name: 'address', index: 'ADDRESS', width: 100, align: 'center' },
                         { name: 'gamename', index: 'GAMENAME', width: 100, align: 'center' },
                       
                       ],

            loadComplete: function() {
                var sumrecords = $("#list").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
            
            }
       });

    });

    function loadData(index) {

        if (index == "undefined" || index == undefined) {

            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            index = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }


        var areaID = $("#area").val();

        var beginTime = $("#beginTime").val();
         
        mygrid.clearGridData();
        mygrid.appendPostData({AreaID: areaID == 0 ? 16 : areaID,  BeginTime: beginTime });


        if ($("#list").getGridParam("records") != null)
            $("#totalsum").text($("#list").getGridParam("records"));
        else
            $("#totalsum").text(0);
        mygrid.trigger('reloadGrid');
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

     </script>
</asp:Content>
