<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% Html.RenderPartial("ExamineDetailInfo"); %>
<%Html.RenderPartial("ExamineConditionControl"); %>
<br />

<div id="tabs">
    <ul>
        <li><a href="#tabs1">未审批</a></li>
        <li><a href="#tabs1">大区审批</a></li>
        <li><a href="#tabs1">总部审批</a></li>
        <li><a href="#tabs1">通过</a></li>
        <li><a href="#tabs1">未通过</a></li>
    </ul>
    <div id="tabs1" style="text-align: center">
        <%Html.RenderPartial("DataGridControl"); %>
    </div>
</div>
<div>
       <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <span id="power"><%=account.POPEDOMID %></span>
</div>
<script language="javascript">
    var mygrid;
    var detailDialog;
    var min = 0;
    var max = 1;
    var aeid = 0;
    var tabsIndex = 0;
    var oriIndex = 0;
    var currRowID = 0;
    var power = 0;
    
    //init tabs
    $('#tabs').tabs();

    $(document).ready(function() {
        $("#newplacename").hide();
        power = $("#power").html();
        $("#power").hide();

        if (power == 4)
            loadArea();

        if (power == 1 || power == 2) {
            $("#condition").show();
        }
        else {
            $("#condition").hide();
        }
        // bind change event to select element
        $("#zone").change(function() { loadArea() });
        // bind event for tabs
        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });


        if (power != 2) {
           // alert("11");
            $("#condition").hide();
        }

        $("#radioAll").show();
        $("#radioArea").show();

        $("#radioAll").click(function() { $("#areaHide1").hide(); $("#zoneHide1").hide(); });
        $("#radioArea").click(function() { $("#areaHide1").show(); $("#zoneHide1").show(); });
    });

    //load city info
    function loadArea() {
        $.ajax({
            url: "LoadArea/" + $("#zone").val(),
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
    }

    //load city callback
    function areaSuccessed(result) {
        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });
        }
    }

    //------------------------------------------------------------------------------------------


    function loadData(index) {
        $("#desc").val(""); 
        //获取当前tabsIndex;
        if (index == undefined) {
            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }

        // 保存原始tabsIndex
        oriIndex = tabsIndex;

        // 处理tabsIndex
        // 未审批       ApplyID = 1, AreaID = 4, TypeID =  0, Min = 0, Max = 1
        // 大区审批     ApplyID = 1, AreaID = 4, TypeID =  0, Min = 0, Max = 1
        // 总部审批     ApplyID = 1, AreaID = 4, TypeID =  1, Min = 1, Max = 1
        // 通过         ApplyID = 1, AreaID = 4, TypeID =  2, Min = 1, Max = 1
        // 未通过       ApplyID = 1, AreaID = 4, TypeID =  0, Min = 0, Max = 0 

        if (tabsIndex == 3 || tabsIndex == 2) 
        { max = min = 1; }
        else if (tabsIndex == 4) 
        { max = min = 0; }
        else { max = 1; min = 0 };

        //tabsIndex = tabsIndex >= 4 ? 1 : tabsIndex;
        tabsIndex = tabsIndex == 0 ? 1 : tabsIndex;

        var areaID = $("#area").val();
        
        if ($("input[name*='allselect']")[0].checked) {
            areaID = 0;
        }
        
        var zoneID = $("#zone").val();
        var beginTime = $("#beginTime").val();
        var endTime = $("#endTime").val();

        mygrid.appendPostData({ ApplyID: applyID, TypeID: tabsIndex - 1, AreaID: areaID, ZoneID: zoneID, Min: min, Max: max, BeginTime: beginTime, EndTime: endTime });
        mygrid.trigger('reloadGrid');
    }

    //显示详细信息
    function DisplayDetails(rowIndex) {
        //获取审批ID

        var rowData = mygrid.getRowData(rowIndex);
        currRowID = rowIndex;
        aeid = rowData.Aeid

        $.ajax({
            url: "LoadAeDetail/" + aeid,
            type: "POST",
            dataType: "json",
            success: aeDetailSuccessed
        });
    }

    function aeDetailSuccessed(result) {
        $("#address").html(result.Address);
        $("#applicant").html(result.Applicant);
        $("#applydesc").html(result.Applydesc);
        $("#applyname").html(result.Applyname);
        $("#applytime").html(result.Applytime);
        $("#bankaccounts").html(result.Bankaccounts);
        $("#banktype").html(result.Banktype);
        $("#bzname").html(result.Bzname);
        $("#eduname").html(result.Eduname);
        $("#firstexaminator").html(result.Firstexaminator);
        $("#firstexamresult").html(result.Firstexamresult);
        $("#firstexamtime").html(result.Firstexamtime);
        $("#firstexamdesc").html(result.Firstexamdesc);
        $("#idcard").html(result.Idcard);
        $("#mobile").html(result.Mobile);
        $("#placename").html(result.Placename);
        
        if (result.NewPlacename!="")
        {
            $("#newplacename").show();
            $("#newplacename").html(result.NewPlacename);
        }
       
        $("#secondexamdesc").html(result.Secondexamdesc);
        $("#secondexaminator").html(result.Secondexaminator);
        $("#secondexamresult").html(result.Secondexamresult);
        $("#secondexamtime").html(result.Secondexamtime);
        $("#sex").html(result.Sex);
        $("#username").html(result.Username);
        $("#wagenum").html(result.Wagenum);
        $("#newwage").html(result.NewWagenum);
        $("#dimetime").html(result.DimTime);
        $("#areaname").html(result.Areaname);
        $('#poswage').html(result.poswage);
        
        $("#dailogBtn").hide();
        if (power == 2 && oriIndex == 2) {
            $("#dailogBtn").show();
        } else if (power == 3 && oriIndex == 1) {
            $("#dailogBtn").show();
        } else if (power == 4 && oriIndex == 1) {
            $("#dailogBtn").show();
        }

        $("#doc").html("<a href='/Upload/doc/" + result.DocFileName + "'>入职申请登记表下载</a>");
        $("#img").html("<a href='/Upload/Img/" + result.portraitfilename + "'>照片下载</a>");
        if (result.rarfilename != null) {
            $("#rar").html("<a href='/Upload/Rar/" + result.rarfilename + "'>入编资料下载</a>");
        }
        $("#divIframe").dialog("open");
    }

    //显示审批详细信息
    //初始化对话框
    $(function() {
        $("#divIframe").dialog({
            width: 720,
            height: 600,
            show: 'drop',
            bgiframe: false,
            autoOpen: false,
            draggable: true,
            resizable: true,
            modal: true,
            dialogClass: "removeCloseBtn",
            closeOnEscape: false
        });
    });

    function passFun() {
        if (oriIndex == 1) {
            $.ajax({
                url: "FirstExamine/",
                type: "POST",
                data: { AEID: aeid, Examinator: "admin", ExamDesc: $("#desc").val(), ExamResult: 1 },
                dataType: "json",
                success: examSuccessed
            });
        }
        else if (oriIndex == 2) {
            $.ajax({
                url: "SecondExamine/",
                type: "POST",
                data: { AEID: aeid, Examinator: "admin", ExamDesc: $("#desc").val(), ExamResult: 1 },
                dataType: "json",
                success: examSuccessed
            });
        }
    }

    function failFun() {
        if (oriIndex == 1) {
            $.ajax({
                url: "FirstExamine/",
                type: "POST",
                data: { AEID: aeid, Examinator: "amdin", ExamDesc: $("#desc").val(), ExamResult: 0 },
                dataType: "json",
                success: examSuccessed
            });
        }
        else if (oriIndex == 2) {
            $.ajax({
                url: "SecondExamine/",
                type: "POST",
                data: { AEID: aeid, Examinator: "amdin", ExamDesc: $("#desc").val(), ExamResult: 0 },
                dataType: "json",
                success: examSuccessed
            });
        }
    }

    function examSuccessed(result) {
        if (result.isSuccess) {
            mygrid.delRowData(currRowID);
            alert("审批完成!");
            $("#divIframe").dialog("close");
        }
        else {
            alert("审批失败!");
        }
    }
</script>

