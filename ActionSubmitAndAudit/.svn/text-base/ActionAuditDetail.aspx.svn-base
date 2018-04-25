<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动审核
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="ukey">
            <%=account.UKEY %></span>
             <%
    
                 TGProject.Models.TgsActSingleQueryCondition condtion = (TGProject.Models.TgsActSingleQueryCondition)ViewData["condition"];

                 decimal actsid = 0;
            if (condtion != null)
            {
                actsid = condtion.ACTSID;
            }
          
        %>

        <span id="actsid"><%=actsid%></span>

 <div id="ChargeCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
         <ul class="vertical" style="text-align: left">
         <li></li>
         <li style="vertical-align:bottom; text-align: left; color:Blue">
             活动提交人：<span id="execarea" style="color:Red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;活动提交日期：<span id="subtime"  style="color:Red"></span> </li>
             <li></li>
            <li style="vertical-align:bottom; text-align: left;color:Blue">
             活动游戏：<span id="GAMENAME"  style="color:Red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span>&nbsp;&nbsp;活动类型：<span id="TYPENAME"  style="color:Red"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动单号：<span id="ASNUMBER"  style="color:Red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;活动场次：<span id="FIELDNUM"  style="color:Red"></span></li>
                <li></li>   
            </ul>
            <ul class="horizontal" style="text-align: left">
             
             
            </ul>
        </div>
    </fieldset>
</div>
<div id="tabs">
        <ul>
            <li><a href="#tabs1">查询结果</a></li>
        </ul>
    <div id="tabs1" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
    </div>
    <div style="text-align: right">
    <a href="javascript:selectAll()">全部选择</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:unselectAll()">全部取消选择</a>
    </div>
    <center>
      <ul>
            <li>点击网吧名称查看网吧具体信息</li>
             <li>
                    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="submitAudit()">
                        审核通过
                    </button></li>
     </ul>
    </center>
    
    </div>
    
     <script type="text/javascript">
  
      $('#tabs').tabs();
    var mygrid;
    var tabsIndex;
    var idstring;
    var selectedRows = "";
    var actdidRows = "";
    var StatusRows = "";
    var actsid = $("#actsid").html();
    var ukey=$("#ukey").html();
    $("#ukey").hide();
    $("#actsid").hide();
    $(document).ready(function() {
        ///////////////////



        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });

        //        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");


        //所有通过审核的网吧信息
        var lastsel3;
        var url = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAuditDetailShow2";
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: url,
            datatype: 'json',
            mtype: 'POST',
            //            pager: jQuery('#pager'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '查询条件：',
            recordtext: '条记录',
            loadtext: 'loading....',
            colNames: ['网吧名称', '活动日期', '活动开始时间', '活动结束时间', '包机数量', '活动费用', '选择通过', '网吧ID'],

            colModel: [{ name: 'barname', index: 'BARNAME', width: 170, align: 'center' },
                                        { name: 'subtime', index: 'SUBTIME', width: 160, align: 'center' },
                                        { name: 'starttime', index: 'STARTTIME', width: 160, align: 'center' },
                                        { name: 'endtime', index: 'ENDTIME', width: 160, align: 'center' },
                                        { name: 'cnum', index: 'CNUM', width: 160, align: 'center' },
                                        { name: 'actcost', index: 'ACTCOST', width: 160, align: 'center' },
                                        { name: 'importbool', index: 'IMPORTBOOL', width: 160, align: 'center', editable: true, edittype: "checkbox", editoptions: { value: "True:False"} },
                                        { name: 'actdid', index: 'ACTDID', width: 0, align: 'center', hidden: "true" },
                                        ],

            loadComplete: function() {
                var sumrecords = $("#list").getGridParam("records");

                if (sumrecords != null) {
                    $('#totalsum').text(sumrecords);
                }


                for (icount = $("#list")[0].rows.length - 1; icount >= 1; icount--) {
                    jQuery('#list').editRow(icount);
                    //记录所有行号
                    if (icount == $("#list")[0].rows.length - 1) {
                        idstring = icount;
                    }
                    else {
                        idstring = idstring + "," + icount;
                    }

                    //把已沟选的行，打上沟
                    var rowNetbarid = mygrid.getRowData(icount).actdid;
                    if (selectedRows.indexOf(";" + rowNetbarid + ";") >= 0) {
                        $('#' + icount + "_importbool").attr('checked', 'true');
                    }
                }

            },
            onSelectRow: function(id) {

                if (id && id !== lastsel3) {
                    $("#list").restoreRow(idstring);
                    jQuery('#list').editRow(id);
                    lastsel3 = lastsel3 + "," + id;
                }
                if ($('#' + id + "_importbool").attr('checked') == true) {
                    selectedRows = selectedRows + ";" + mygrid.getRowData(id).actdid + ";" + ",";

                }
                else {
                    if (selectedRows.indexOf(";" + mygrid.getRowData(id).actdid + ";") >= 0) {
                        selectedRows = selectedRows.replace(";" + mygrid.getRowData(id).actdid + ";" + ",", "");
                    }
                }
                //记忆勾选的actdid，用逗号分割，放在变量actdidRows中，记忆勾选的StatusRows，用逗号分割，放在变量StatusRows中

                actdidRows = "";
                StatusRows = "";
                for (icount = $("#list")[0].rows.length - 1; icount >= 1; icount--) {
                    if ($('#' + icount + "_importbool").attr('checked') == true) {

                        actdidRows = actdidRows + mygrid.getRowData(icount).actdid + ",";
                        StatusRows = StatusRows + "1,";

                    } else {

                        actdidRows = actdidRows + mygrid.getRowData(icount).actdid + ",";
                        StatusRows = StatusRows + "2,";

                    }


                }

            }
            //            onCellSelect: function(rowid) {
            //                jQuery('#list').restoreRow(lastsel3);
            //                jQuery('#list').editRow(rowid, true, pickdates);
            //                lastsel3 = rowid;
            //            }

        });

        $.ajax({
            url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAuditDetailShow/",
            type: "POST",
            data: {
                ACTSID: actsid,
                Status: 0
            },
            dataType: "json",
            success: ActionAuditDetailShowSuccess
        });

        function ActionAuditDetailShowSuccess(result) {

            if (result.rows.length > 0) {
                $.each(result, function(i, items) {
                    $.each(items, function(j, item) {

                        $("#execarea").html(item.cell[0]);
                        $("#subtime").html(item.cell[1]);
                        $("#GAMENAME").html(item.cell[2]);
                        $("#TYPENAME").html(item.cell[3]);
                        $("#ASNUMBER").html(item.cell[4]);
                        $("#FIELDNUM").html(item.cell[5]);
                    });
                });
            }
        }
       
        loadDelay(actsid);
    });


    function loadDelay(index) {
        
       setTimeout("loadData("+index+")", 3000);
     }
     function loadData(index) {
        
         var actsid;
   
        if (index == "undefined" || index == undefined) {
            actsid = 0;
           
        } else {
        actsid = index;
        }

        mygrid.appendPostData({ ACTSID: actsid });
        mygrid.trigger('reloadGrid');
   }

//     $("#ed1").click(function() {
//         $("#rowed1").editRow("13");
//         this.disabled = 'true';
//         $("#sved1,#cned1").attr("disabled", false);
//     });

//     function pickdates(id) {
//         jQuery("#" + id + "_sdate", "#list").timeEntry();
//     }

     function selectAll() {

         actdidRows = "";
         StatusRows = "";
         for (icount = $("#list")[0].rows.length - 1; icount >= 1; icount--) {
             
                 actdidRows = actdidRows + mygrid.getRowData(icount).actdid + ",";
                 StatusRows = StatusRows + "1,";
                 $('#' + icount + "_importbool").attr('checked', 'true');


         }
     }
     function unselectAll() {
         actdidRows = "";
         StatusRows = "";
         for (icount = $("#list")[0].rows.length - 1; icount >= 1; icount--) {

             actdidRows = actdidRows + mygrid.getRowData(icount).actdid + ",";
             StatusRows = StatusRows + "2,";
             $('#' + icount + "_importbool").attr('checked', '');
         }
      }

     function submitAudit() {
         if (actdidRows == "" || StatusRows == "") {
             alert("确认审核都不通过吗！");
            
         
         
         }
         $.ajax({
             url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/submitAudit/",
             type: "POST",
             data: {
                 ActSID:actsid,
                 ActDID: actdidRows,
                 UKEY:ukey,
                 STATUS:StatusRows
             },
             dataType: "json",
             success: submitAuditSuccess
         });


     }


     function submitAuditSuccess(result) {
     
       if (result.isSuccess == 0) {
                alert("活动数量和状态数量不相等");
        }
        else if (result.isSuccess == 1) {
                alert("审核成功！");
       
        }
        else if (result.isSuccess ==2) {
            alert("状态数据不符合要求！");
        }
        else if (result.isSuccess ==5) {
            alert("审核失败！");
        }
        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAuditMaster";
        location.reload(str);
     }
     
     </script>
</asp:Content>