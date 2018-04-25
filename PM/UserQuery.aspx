<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    人员查询
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("ExamineConditionControl"); %>
    <br />

    <div style="color:Blue">查询用户人数总计:<span id="totalsum"></span></div>
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">所有</a></li>
            <li><a href="#tabs1"id="t2">申请入职</a></li>
            <li><a href="#tabs1"id="t3">在职</a></li>
            <li><a href="#tabs1"id="t5">执行</a></li>
            <li><a href="#tabs1"id="t6">见习</a></li>
            <li><a href="#tabs1"id="t4">离职</a></li>
        </ul>
        <div id="tabs1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        
    </div>
    <div id="detail">
    <%Html.RenderPartial("UserDetailInfo"); %>
    </div>
<div>
       <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <%
           string strZAid = (string)ViewData["ZoneAreaForUserQuery"];
           string Zid=string.Empty;
           string Aid=string.Empty;
           if (strZAid == null)
           {
               Zid=string.Empty;
               Aid = string.Empty;
           }
           else
           {
               Zid = strZAid.Split(',')[0];
               Aid = strZAid.Split(',')[1];
           }
       %>
       <span id="power"><%=account.POPEDOMID %></span>
       <span id="id"><%=account.USERID%></span>
       <span id="ZidFromMaster"><% =Zid%></span>
       <span id="AidFromMaster"><% =Aid%></span>
</div>
    <div id="loadallexcel" ><button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()" id="excelnow">导出本页数据</button>
    <button  style=" display:none;margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="excelone">导出个人数据</button>
    <button  style=" display:none;margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()" id="excelarea">导出办事处数据</button>
    
    
    </div>
    <script type="text/javascript">
        $('#tabs').tabs();
       
        var userID = 0;
        var ID = 0;
        var tabsIndex = 0;
        var power = 0;
        power = $("#power").html();
        var userPopdem = 0;
       

        $("#ZidFromMaster").hide();
        $("#AidFromMaster").hide();
        $(document).ready(function() {
            //////////////////

            if (power == 1 || power == 2 || power == 3 || power == 4) {
                $('#excelone').show();
                $('#excelnow').show();
                $('#excelarea').show();
            }
            else if (power == 5 || power == 6) {
                $('#excelone').show();
                $('#excelnow').show();
                $('#excelarea').hide();
            }
            else {
                $('#excelone').hide();
                $('#excelnow').hide();
                $('#excelarea').hide();
            }

            var szoneid = $('#ZidFromMaster').html();
            if (szoneid != "") {

                //根据UserQueryMaster传过来的AreaID,显示相对应的数据
                if (power == 1 || power == 2 || power == 3 || power == 4) {

                    $('#zone').attr('value', szoneid);
                }
            }
            //            if (power != 8) {

            if (POPEDOMID == 3) {
                $("#zone").empty();
                $("<option></option>").val('-1').text('总部').appendTo($("#zone"));
                $("#area").empty();
                $("<option></option>").val('-1').text('督查').appendTo($("#area"));
            }
            else {
                loadArea();
            }
            //            }
            //////////////////
            setTimeout('firstload()', 1000);
            $("#condition").hide();
            $('#detail').hide();
            $("#zone").change(function() { loadArea() });
            $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
            //loadArea();
            // 权限设置
            if (power == 7 || power == 8 || power == 6 || power == 9) {
                $('#t3').hide();
                $('#t6').hide();
                $("#tabs").tabs('remove', 1);
                $("#tabs").tabs('remove', 2);
                $("#tabs").tabs('remove', 3);
                $("#tabs").tabs('remove', 4);
                $("#tabs").tabs('remove', 5);
                $("#tabs").tabs('remove', 6);

            }

            ID = $("#id").html();
            $("#power").hide();
            $("#id").hide();
            //            if (power == 4)
            //  loadArea();
            ////////////////////////////////////////
            if (power <= 4) {
                $('#excelall').show();
            }
            if (power <= 4) {
                $('#excelone').show();
                $("#excelarea").show();
            }
            if (power != 7) {
                $('#userAccountnew').show();
            }
            $("#Select2").bind('click', function() {
                if ($("#Select2").val() == 0) {
                    $("#uaccountnew").val('');
                }
            });
            ///////////////////////////////////////

            if (power == 3) {
                $('#zoneHide1').show();
                $('#areaHide1').show();
            }
            if (power == 8) {
                $('#zoneHide1').hide();
                $('#areaHide1').hide();
                $('#examCondition').hide();
                
            }

            mygrid = $("#list").jqGrid({
                width: 800,
                height: 450,
                url: 'UserQuery/',
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
                colNames: ['序号', '姓名', '大区', '办事处', '编制', '职位', '基本薪资', '岗位薪资', '时间', '状态'],

                colModel: [{ name: 'userid', index: 'USERID', width: 160, align: 'center' },
                                        { name: 'username', index: 'USERNAME', width: 160, align: 'center' },
                                        { name: 'zonename', index: 'ZONENAME', width: 160, align: 'center' },
                                        { name: 'areaname', index: 'AREANAME', width: 160, align: 'center' },
                                        { name: 'bzname', index: 'BZNAME', width: 160, align: 'center' },
                                        { name: 'placename', index: 'PLACENAME', width: 160, align: 'center' },
                                        { name: 'wagenum', index: 'WAGENUM', width: 150, align: 'center' },
                                        { name: 'postwage', index: 'POSTWAGE', width: 150, align: 'center' },
                                        { name: 'usertime', index: 'USERTIME', width: 180, align: 'center' },
                                        { name: 'status', index: 'STATUS', width: 160, align: 'center' }
                                        ],
                loadComplete: function() {
                    var sumrecords = $("#list").getGridParam("records");
                    // alert($("#tabs").tabs().tabs('value'));
                    if (sumrecords != null) {
                        $('#totalsum').text(sumrecords);
                    }
                    else {
                        $('#totalsum').text(0);
                    }
                },

                onSelectRow: function(rowid) {
                    var rowData = mygrid.getRowData(rowid);
                    //alert(rowData.postwage);
                    $('#poswage').html(rowData.postwage);
                    DisplayDetails(rowid);
                }
            });
        });


        function firstload() {
            loadData(0);
            
        }

        function loadData(index) {
            
            if (index == undefined) {
                tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            } else {
                tabsIndex = index;
            }
            var areaID = $("#area").val();
            ///////////////////////////////////
            var searchtype = $('#Select2').val();
            var searchstring = $("#uaccountnew").val();
            if ($('#Select2').val() == 0) {
                $("#uaccountnew").val('');
            }
            if ($("#uaccountnew").val() == "") {
                searchtype = 0;
            }
            //////////////////////////////////////
            // --v_Type：用户类型：-1、所有用户；0、申请入职用户；1、在职用户；2、离职用户
            var vType = 0;
            if (tabsIndex == 0) {
                //-1、所有用户
                vType = -1;
                mygrid.setLabel("usertime", "入职时间", "", "");
            }
            else if (tabsIndex == 1) {
                //0、申请入职用户
                vType = 0;
                mygrid.setLabel("usertime", "申请时间", "", "");
            }
            else if (tabsIndex == 2) {
                //1、在职用户
                vType = 1;
                mygrid.setLabel("usertime", "入职时间", "", "");
            }
            else if (tabsIndex == 5) {
                //2、离职用户
                vType = 2;
                mygrid.setLabel("usertime", "离职时间", "", "");
            }
            else {
                vType = 3;
            }
            mygrid.appendPostData({ TypeID: vType, AreaID: areaID == 0 ? 1 : areaID, searchtype: searchtype, searchstring: searchstring });
            mygrid.trigger('reloadGrid');
        }


        function loadArea() {
             //定义全局URL以便返回能够找到controls
            url = "http://" + location.host + "/PM.aspx/LoadArea/";
            $.ajax(
             {
                 url:url + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
        }

        function loadSuccessed(result) {
            $("#area").empty();
            if (result.rows.length > 0) {
                if ($("#zone")==-1) {
                    $("<option></option>").val("0").text("督察").appendTo($("#area"));
                }
                else {
                   
                    $.each(result.rows, function(i, item) {
                        $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                    });

                    //根据UserQueryMaster传过来的AreaID,显示相对应的数据
                    var sareaid = $('#AidFromMaster').html();
                    if (sareaid != "") {
                        if (power == 1 || power == 2 || power == 3 || power == 4) {
                            $('#area').attr('value', sareaid);
                            $('#AidFromMaster').html("");
                        }
                    }

                }
               

            }
        }

        //显示详细信息
        function DisplayDetails(rowIndex) {
            //获取审批ID
            var rowData = mygrid.getRowData(rowIndex);
            userID = rowData.userid;
            $('#postwage').hide();
            switch (rowData.placename) {
           
                case "超级用户":
                    userPopdem = 1;
                    break;
                case "总部帐号":
                    userPopdem = 2;
                    break;
                case "督察管理员":
                    userPopdem = 3;
                    break;
                case "大区经理":
                    userPopdem = 4;
                    break;
                case "办事处经理":
                    userPopdem = 5;
                  $('#postwage').show();  
                    break;
                case "推广主管":
                    userPopdem = 6;
                    break;
                case "网吧主管":
                    userPopdem = 6;
                    $('#postwage').show();
                    break;
                case "宣传主管":
                    userPopdem = 6;
                    break;
                case "助理":
                    userPopdem = 6;
                    break;
                case "推广专员":
                    userPopdem = 7;
                    break;
                case "高级推广专员":
                    userPopdem = 7;
                    break;
                case "宣传专员":
                    userPopdem = 7;
                    break;
                case "督察专员":
                    userPopdem = 8;
                    break;
                case "线推人员":
                    userPopdem = 9;
                    break;
            }
            

            $.ajax({
                url: "http://" + location.host + "/PM.aspx/LoadUserDetail/" + userID,
                type: "POST",
                dataType: "json",
                success: userDetailSuccessed
            });
        }

        function userDetailSuccessed(result) {
            $("#applytime").html(result.applytime);
            $("#areaID").html(result.areaID);
            $("#areaname").html(result.areaname);
            $("#bzname").html(result.bzname);
            $("#checkdeduct").html(result.checkdeduct);
            $("#dimissiontime").html(result.dimissiontime);
            $("#entertime").html(result.entertime);
            $("#placename").html(result.placename);
            $("#punishnum").html(result.punishnum);
            $("#rewardnum").html(result.rewardnum);
            $("#status").html(result.status);
            $("#sumwage").html(result.sumwage);
            $("#userid").html(result.userid);
            $("#username").html(result.username);
            $("#wagenum").html(result.wagenum);


            $("#img").html("<img src='/Upload/img/" + result.portraitfilename + "'/>");
            $("#docFile").html("<a href='/Upload/doc/" + result.docfilename + "'>入职申请登记表下载</a>");
            $("#imgFile").html("<a href='/Upload/Img/" + result.portraitfilename + "'>照片下载</a>");
            if (result.rarfilename != null) {
                $("#rarFile").html("<a href='/Upload/Rar/" + result.rarfilename + "'>入编资料下载</a>");
            }

            $("#divIframe").dialog("destroy")
            var editpop=0;

            if (power == "2") {
                editpop = 1;
            }
            else {
                editpop = 2;
            }



            if (editpop == 1) {
                var parm64 = BASE64.encode(userID);
                $(function() {
                    $("#divIframe").dialog({
                        width: 370,
                        height: 500,
                        show: 'drop',
                        bgiframe: false,
                        autoOpen: false,
                        draggable: true,
                        resizable: true,
                        modal: true,
                        dialogClass: "removeCloseBtn",
                        closeOnEscape: false,
                        buttons: {
                        "编辑": function() { location.href = "http://" + location.host + "/PM.aspx/UserModify/" + parm64; },
                            "关闭": function() { $("#divIframe").dialog("close") }
                        }
                    });

                });
            }
            else {
                $(function() {
                    $("#divIframe").dialog({
                        width: 370,
                        height: 500,
                        show: 'drop',
                        bgiframe: false,
                        autoOpen: false,
                        draggable: true,
                        resizable: true,
                        modal: true,
                        dialogClass: "removeCloseBtn",
                        closeOnEscape: false,
                        buttons: {
                            "关闭": function() { $("#divIframe").dialog("close") }
                        }
                    });

                });
            }
            $("#divIframe").dialog("open");
            $('#detail').show();
        }

        

        
        function editSuccessed(result) {
            if (result.isSuccess) {
                alert("编辑成功!");
            }
        }
        ///////////////////////////////////load excel
        function loadexcel() {
            str = "http://" + location.host + "/PM.aspx/showexcel/";
            location.replace(str);
        }
        function loadexcelall() {
            var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            tabsIndex = tabsIndex - 1;
            var parm642 = BASE64.encode("0,"+tabsIndex);
            str = "http://" + location.host + "/PM.aspx/showexcelall/" + parm642;
            location.replace(str);
        }

        function loadexcelone() {
            var parm642 = BASE64.encode($("#area").val()+","+$("#beginTime").val()+","+$("#endTime").val());
            str = "http://" + location.host + "/PM.aspx/showexcelone/"+parm642;
            location.replace(str);

        }


        function loadexcelarea() {
            var parm642 = BASE64.encode($("#area").val() + "," + $("#beginTime").val() + "," + $("#endTime").val());
            str = "http://" + location.host + "/PM.aspx/showexcelarea/" + parm642;
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
