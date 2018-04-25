<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    入职审批
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("ExamineControl"); %>

    <script type="text/javascript">
        var applyID = 1;
        $(document).ready(function() {
        loadArea();

            mygrid = $("#list").jqGrid({
                width: 800,
                height: 450,
                url: 'Enter',
                datatype: 'json',
                mtype: 'POST',
                pager: jQuery('#pager'),
                rowNum: 20,
                rowList: [20, 40, 60, 80],
                sortname: 'Id',
                sortorder: "desc",
                viewrecords: true,
                imgpath: '/scripts/themes/steel/images',
                caption: '点击记录查看详细信息',
                recordtext: '条记录',
                loadtext: '加载数据请稍候....',
                colNames: ['序号', '事项', '提交时间'],
                colModel: [{ name: 'Aeid', index: 'AEID', width: 160, align: 'center' },
                                { name: 'Aetitle', index: 'AETITLE', width: 160, align: 'center' },
                                { name: 'ApplyTime', index: 'APPLYTIME', width: 160, align: 'center'}],
                onSelectRow: function(rowid) {
                    DisplayDetails(rowid);
                }
            });
        });
    </script>

</asp:Content>
