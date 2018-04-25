<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    人员查询
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Html.RenderPartial("ExamineConditionControl"); %>
    <br />

<%--    <div style="color:Blue">查询用户人数总计:<span id="totalsum"></span></div>--%>
    <div id="tabs">
        <%--<ul>
            <li><a href="#tabs1">查询结果</a></li>
         
        </ul>--%>
        <div id="tabs1">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        
    </div>
    <div id="detail">
    <%Html.RenderPartial("UserDetailInfo"); %>
    </div>
    <center>  
     <p style="font-weight: bold">点击办事处名称直接查询该办事处详细</p>
     <button style="margin-top:10px" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
</center>
<div>
       <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
       <span id="power"><%=account.POPEDOMID %></span>
       <span id="id"><%=account.USERID%></span>
</div>
    <div id="loadallexcel" >
    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelarea()" id="excelnow">导出办事处数据</button>
        <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="execelperson">导出个人数据</button>
        
    </div>
    <script type="text/javascript">
        $('#tabs').tabs();
       
        var userID = 0;
        var ID = 0;
        var tabsIndex = 0;
        var power = 0;
        power = $("#power").html();
        var userPopdem = 0;
        if (power != 8) {
            loadArea();
        }


        $(document).ready(function() {

            if (power == 0 || power == 1 || power == 2 || power == 3 || power == 4) {
                $('#execelperson').show();
                $('#excelnow').show();
            }
            if (power == 8) {
                $('#execelperson').hide();
                $('#excelnow').hide();
            }
            else {
                $('#execelperson').show();
                $('#excelnow').hide();
            }
            $('#zoneHide1').hide();
            $('#areaHide1').hide();
            //////////////////
            $("#Select2").empty();
            $("#Select2").html('');
            // alert("t");
            $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='1'>大区名检索</option>").appendTo("#Select2")//添加下拉框的option
            $("<option value='2'>办事处名检索</option>").appendTo("#Select2")//添加下拉框的option
            //////////////////
            setTimeout('firstload()', 1000);
            $("#condition").hide();
            $('#detail').hide();
            $("#zone").change(function() { loadArea() });
            $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });
            //loadArea();
            // 权限设置

            if (power == 7 || power == 8 || power == 6 || power == 9) {
                $("#tabs").tabs('remove', 1);
                $("#tabs").tabs('remove', 2);
                $("#tabs").tabs('remove', 3);

            }
            if (power == 3) {
                $("#zoneHide1").hide();
                $("#areaHide1").hide();
            }
            ID = $("#id").html();
            $("#power").hide();
            $("#id").hide();
            if (power == 4)
                loadArea();
            ////////////////////////////////////////
            if (power != 7) {
                $('#userAccountnew').show();
            }
            $("#Select2").bind('click', function() {
                if ($("#Select2").val() == 0) {
                    $("#uaccountnew").val('');
                }
            });

            ///////////////////////////////////////
            mygrid = $("#list").jqGrid({
                width: 800,
                height: 450,
                url: 'UserQueryMaster/',
                datatype: 'json',
                mtype: 'POST',
                //pager: jQuery('#pager'),
                rowNum: 100,
                rowList: [20, 40, 60, 80],
                sortname: 'Id',
                sortorder: "desc",
                viewrecords: true,
                imgpath: '/scripts/themes/steel/images',
                caption: '查询结果：',
                recordtext: '条记录',
                loadtext: '加载数据请稍候...',
                footerrow: true,
                userDataOnFooter: true,
                colNames: ['大区', '办事处', '执行', '见习', '离职', '封停'],

                colModel: [{ name: 'zonename', index: 'zonename', width: 160, align: 'center', sortable: false },
                                        { name: 'areaname', index: 'areanam', width: 160, align: 'center', sortable: false },
                                        { name: 'exec', index: 'exec', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'nov', index: 'nov', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'dim', index: 'dim', width: 160, sortable: false, align: "center", formatter: 'number' },
                                        { name: 'ban', index: 'ban', width: 160, sortable: false, align: "center", formatter: 'number' }

                                        ],
                loadComplete: function() {
                    var sumrecords = $("#list").getGridParam("records");
                    // alert($("#tabs").tabs().tabs('value'));
                    if (power == 2 || power == 3 || power == 4) {
                        sumrecords = sumrecords - 1;
                    }
                    if (sumrecords != null) {
                        $('#totalsum').text(sumrecords);
                    }
                    else {
                        $('#totalsum').text(0);
                    }
                },

                onSelectRow: function(rowid) {
                    var rowdata = mygrid.getRowData(rowid);
                    if (rowdata.areaname != "合计") {

                        DisplayDetails(rowid);
                    }
                }
            });
        });

        function QueryDetail() {
            var str = "http://" + location.host + "/PM.aspx/UserQuery";
            location.href(str);
        }

        function firstload() {
            //alert("1");
            loadData(0);
        }
        // --v_Type：用户类型：-1、所有用户；0、申请入职用户；1、在职用户；2、离职用户
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
            //查询时间
            var begintime = $("#beginTime").val()
            var endtime = $("#endTime").val()
            mygrid.appendPostData({ TypeID: tabsIndex - 1, AreaID: areaID == 0 ? 1 : areaID, searchtype: searchtype, searchstring: searchstring, dtStart: begintime, dtEnd: endtime });
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
                if (power == 8||power ==3) {
                    $("<option></option>").val("0").text("督察").appendTo($("#area"));
                }
                else {
                   
                    $.each(result.rows, function(i, item) {
                        $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
                    });
                }
               

            }
        }

        //显示详细信息
        function DisplayDetails(rowIndex) {
            //获取审批ID
            var rowData = mygrid.getRowData(rowIndex);
            AreaName = rowData.areaname;
            $('#postwage').hide();

            $.ajax({
                url: "UserQuerySlave/",
                type: "POST",
                dataType: "json",
                data: { strMessage: AreaName },
                success: userDetailSuccessed
            });
        }

        function userDetailSuccessed(result) {
            str = "http://" + location.host + "/PM.aspx/UserQuery/";
            location.href(str);
        }

        function editSuccessed(result) {
            if (result.isSuccess) {
                alert("编辑成功!");
            }
        }
        ///////////////////////////////////load excel
        function loadexcel() {
            str = "http://" + location.host + "/PM.aspx/showexcelUserQueryMaster/";
            location.replace(str);
        }


        function loadexcelone() {
            var parm642 = BASE64.encode($("#beginTime").val() + "," + $("#endTime").val());
            str = "http://" + location.host + "/PM.aspx/showexceloneMaster/" + parm642;
            location.replace(str);

        }


        function loadexcelarea() {
            var parm642 = BASE64.encode($("#beginTime").val() + "," + $("#endTime").val());
            str = "http://" + location.host + "/PM.aspx/showexcelareaMaster/" + parm642;
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
