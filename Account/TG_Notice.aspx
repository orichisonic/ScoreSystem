<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	推广公告
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div id="divIframe">
        <div style="font-size: 15px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>管理制度</li>
            </ul>
        </div>
        </div>
    <div id="tabs1">
        <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
        <div id="pager" class="scroll" style="text-align: center;"></div>
    </div>
    <br />
    

    
        <div id="div1">
        <div style="font-size: 15px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>项目公告</li>
            </ul>
        </div>
        </div>
    <div id="tabs2">
        <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
        <div id="pager2" class="scroll" style="text-align: center;" ></div>
    </div>
    
    
     
<script type="text/javascript">
    var mygrid;
    var mygrid2;
    $('#tabs1').tabs();
    $('#tabs2').tabs();
    $(document).ready(function() {
       
        //所有通过审核的网吧信息
        mygrid = $("#list").jqGrid({
            width: 880,
            height: 220,
            url: 'ActiveAuditNetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            //pager: jQuery('#pager'),
            rowNum: 10,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            //caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['公告类型', '主题'],

            colModel: [{ name: 'areaname', index: 'AREANAME', width: 200, align: 'left' },
                       { name: 'refertime', index: 'REFERTIME', width: 650, align: 'left'}],
            onSelectRow: function(rowid) {
                //DisplayDetails(rowid);
            }
        });
        mygrid2 = $("#list2").jqGrid({
            width: 880,
            height: 220,
            url: 'ActiveAuditNetBarQuery/',
            datatype: 'json',
            mtype: 'POST',
            //pager: jQuery('#pager2'),
            rowNum: 10,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            //caption: '查询条件：',
            recordtext: '条记录',

            loadtext: 'loading....',
            colNames: ['公告类型', '主题'],
            colModel: [{ name: 'areaname', index: 'AREANAME', width: 200, align: 'left' },
                       { name: 'refertime', index: 'REFERTIME', width: 650, align: 'left'}],
            onSelectRow: function(rowid) {

            }
        });

    });
    
</script>
</asp:Content>
