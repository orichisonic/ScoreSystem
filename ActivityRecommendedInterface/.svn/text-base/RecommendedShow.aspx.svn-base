<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	推荐网吧显示
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
       

       
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

        tabsIndex = $("#tabs").tabs().tabs("option", "selected");

        var lastsel3;

        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'http://' + location.host + '/ActivityRecommendedInterface.aspx/RecommendedShow/',
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
            colNames: ['省份', '城市', '区/县', '网吧名', '网吧地址', '游戏产品'],

            colModel: [{ name: 'prov', index: 'PROV', width: 80, align: 'center' },
                       { name: 'city', index: 'CITY', width: 80, align: 'center' },
                       { name: 'country', index: 'COUNTRY', width: 80, align: 'center' },
                       { name: 'barname', index: 'BARNAME', width: 200, align: 'center' },
                       { name: 'address', index: 'ADDRESS', width: 240, align: 'center' },
                       { name: 'premium', index: 'PREMIUM', width: 100, align: 'center'},
                       
                       ],

            loadComplete: function() {
                var sumrecords = $("#list").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }
            
            }
       });

    });


     </script>
</asp:Content>