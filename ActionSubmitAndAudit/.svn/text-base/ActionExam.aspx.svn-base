<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动评估
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
            <ul class="horizontal">

                <li style="color:Blue">开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1" /></li>
                <li style="color:Blue">结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2020-1-1"  /></li>
                <li id="userAccount">
                    <select name="SearchType" id="Select2">
                    <option value="0">按网吧名称搜索</option>
                    <option value="1">按活动游戏搜索</option>
                    <option value="2">按活动单号搜索</option>
                    <option value="3">按活动执行方搜索</option>
                    </select>
                    <input type="text" name="uaccount" id="uaccount" style="width: 90px"/></li>
                <li>
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">查询</button></li>
            </ul>
        </div>
    </fieldset>
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">查询结果</a></li>
        </ul>
        <div id="tabs1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        
    </div>

        <br />
     <center>
        <p style="font-weight: bold">点击网吧名称查看网吧具体信息</p>
        <p style="font-weight: bold">点击条目查看评估详细</p>

     </center>
                  <div id="loadallexcel" ><button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出数据</button></div>
<script>
    $('#tabs').tabs();
    $(document).ready(function() {
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'ActionChange/',
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
            editurl: "ActionChange/",
            colNames: ['活动游戏', '活动类型', '活动单号','执行方','网吧名称', '活动日期', '包机数量', '活动费用', '活动评分'],

            colModel: [{ name: 'id', index: 'ID', width: 160, align: 'center' },
                                        { name: 'username', index: 'USERNAME', width: 160, align: 'center', sortable: false },
                                        { name: 'zonename', index: 'ZONENAME', width: 160, align: 'center' },
                                        { name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                                        { name: 'bzname', index: 'BZNAME', width: 160, align: 'center' },
                                        { name: 'placename', index: 'PLACENAME', width: 160, align: 'center' },
                                        { name: 'wagenum', index: 'WAGENUM', width: 160, align: 'center' },
                                        { name: 'postwage', index: 'POSTWAGE', width: 160, align: 'center' },
                                        { name: 'score', index: 'score', width: 160, align: 'center' }
                                        ],
                onCellSelect:function(rowid, iCol, cellcontent){

                }
//            loadComplete: function() {
//            var ids = jQuery("#list").getDataIDs();
//                for (var i = 0; i < ids.length; i++) {
//                    var cl = ids[i];
//                    be = "<input style='height:22px;width:20px;' type='button' value='删除' ></ids>";
//                    jQuery("#list").setRowData(ids[i], { act: be  })
//                }
//            },


//            onSelectRow: function(rowid) {
//              
//            }
        });
    });

</script>
</asp:Content>
