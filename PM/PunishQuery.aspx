<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ���Ͳ�ѯ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("ExamineConditionControl"); %>
    <br />
    <div>
        <div id="tabs">
            <ul>
                <li><a href="#tabs1">����</a></li>
                <li><a href="#tabs1">�ͷ�</a></li>
            </ul>
            <div id="tabs1">
                <%Html.RenderPartial("DataGridControl"); %>
            </div>
        </div>
    </div>
          <script type="text/javascript">
           var tabsIndex;
           $('#tabs').tabs();
           $(document).ready(function() {

           $("#zone").change(function() { loadArea() });
               $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
               loadArea();
               mygrid = $("#list").jqGrid({
                   width: 800,
                   height: 450,
                   url: 'PunishQuery/',
                   datatype: 'json',
                   mtype: 'POST',
                   pager: jQuery('#pager'),
                   rowNum: 40,
                   rowList: [20, 40, 60, 80],
                   sortname: 'Id',
                   sortorder: "desc",
                   viewrecords: true,
                   imgpath: '/scripts/themes/steel/images',
                   caption: '��ѯ������',
                   recordtext: '����¼',
                   loadtext: '�����������Ժ�....',
                   colNames: ['���', '�û���', '��������', '���´�', 'ְλ', '���', '����'],

                   colModel: [{ name: 'userid', index: 'USERID', width: 160, align: 'center' },
                                        { name: 'username', index: 'USERNAME', width: 160, align: 'center' },
                                        { name: 'zonename', index: 'ZONENAME', width: 160, align: 'center' },
                                        { name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                                        { name: 'placename', index: 'PLACENAME', width: 160, align: 'center' },
                                        { name: 'rpnum', index: 'RPNUM', width: 160, align: 'center' },
                                        { name: 'deductnum', index: 'RPCOUNT', width: 160, align: 'center'}]
                                    });

           });

           function loadData(index) {
               if (index == undefined) {
                   tabsIndex = $("#tabs").tabs().tabs("option", "selected");
               } else {
                   tabsIndex = index;
               }

               var areaID = $("#area").val();
               var beginTime = $("#beginTime").val();
               var endTime = $("#endTime").val();

               mygrid.appendPostData({ TypeID: tabsIndex + 1, AreaID: areaID == 0 ? 1 : areaID, BeginTime: beginTime, EndTime: endTime });
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
