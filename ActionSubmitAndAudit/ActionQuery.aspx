<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���ѯ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            string strZAid = (string)ViewData["ZoneAreaForActQuery"];
            string Zid = string.Empty;
            string Aid = string.Empty;
            if (strZAid == null)
            {
                Zid = string.Empty;
                Aid = string.Empty;
            }
            else
            {
                Zid = strZAid.Split(',')[0];
                Aid = strZAid.Split(',')[1];
            }
        %>
        <span id="power"><%=account.POPEDOMID%></span>
        <span id="ZidFromMaster"><% =Zid%></span>
        <span id="AidFromMaster"><% =Aid%></span>
    <fieldset>
        <legend>��ѯ����</legend>
        <div id="frm1">
            <ul class="horizontal" id="by_day_id">
            <% if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3)
                { %>
                <li>����<select name="zone" id="zone">
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
                </select></li><%} %>
                
                 <% if (account.POPEDOMID == 2 || account.POPEDOMID == 8 || account.POPEDOMID == 3||account.POPEDOMID == 4)
                { %>
                <li>���´�
                    <select id="area">
                       
                        <option value="<%=account.AREAID %>">Ĭ��</option>
                     
                    </select><%} %>
                </li> 
                <li style="color:Blue">
                    ��ʼ����
                    <input type="text" name="beginTime" id="begintime" style="width: 90px" onfocus="setday(this)"  value="2009-9-1" /></li>
                    <li style="color:Blue">
                    ��������
                    <input type="text" name="endTime" id="endtime" style="width: 90px" onfocus="setday(this)" value="2010-12-1" /></li>
                    <li><span>��������</span><select name="searchtype" id="searchtype" style="width: 90px">
                    <option value="0">����ȫ��</option>
                    <option value="1">��������</option>
                    <option value="2">���Ϸ</option>
                    <option value="3">�����</option>
                    <option value="4">�ִ�з�</option>
                    </select>
                    <input type="text" name="searchcontent" id="searchcontent" style="width: 90px"/>
                       <button class="ui-state-default ui-corner-all" type="submit" style=" margin-left:10px" onclick="loaddata()">
                           ��ѯ
                       </button>
                </li>
            </ul>
        </div>
    </fieldset>
    
             
                

        
     <div id="tabs">
        <ul>
            <li><a href="#tabs1">ȷ�ϻ</a></li>
            <li><a href="#tabs1">����</a></li>
            <li><a href="#tabs1">��ִ�л</a></li>
        </ul>
        <div id="tabs1">
       <table id="list" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager" class="scroll" style="text-align: center;"></div>
      </div>
      <div id="tabs2">
       <table id="list2" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager2" class="scroll" style="text-align: center;"></div>
      </div>
       <div id="tabs3">
       <table id="list3" class="scroll" cellpadding="0" cellspacing="0"></table>
       <div id="pager3" class="scroll" style="text-align: center;"></div>
      </div>
    <div style="text-align:left" id="btnHide">
      <button id="excelbutton" style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcel()">
      ��������
      </button>
     <button id="Button1" style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelChangedAction()">
      ��������
      </button>
       <button id="Button2" style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelCommitAction()">
      ������ȷ�ϻ
      </button>
      <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelAreaActStatistics()" id="excelAreaActStatistics">
      �������´��ͳ��
      </button>
      </div> 
    </div>

     <script type="text/javascript">
         //////////////////
         function initialize() {
               // $('#area').val('16');
             loaddata(0);
         }

         ///////////////////////
      $('#tabs').tabs();
    var mygrid;
    var mytabindex = 0;//������ת���ɱ��
    var tabsIndex;
    var powernew;
    //��麯��
    function checkAllowChange(id) {
        var today = new Date();
        var day = today.getDate();
        var month = today.getMonth() + 1;
        var year = today.getYear();
        var date = year + "-" + month + "-" + day;
        var rowData = mygrid.getRowData(id);
       // alert("");
        var result = compareDate(rowData.STARTTIME, date, "-");
        if (result <= 2) {
            return false;
        }
        else {
            return true;
        }
    }
    function compareDate(first, second, sign) {
        fArray = first.split(sign);
        sArray = second.split(sign);
        var fDate = new Date(fArray[0], fArray[1], fArray[2]);
        var sDate = new Date(sArray[0], sArray[1], sArray[2]);

        var t = fDate.getTime() - sDate.getTime();
        var days = t / (1000 * 60 * 60 * 24);
       
        return days;
    }


    /////////////////
    $(document).ready(function() {
        ///////////////////
        $('#power').hide();
        $('#ZidFromMaster').hide();
        $('#AidFromMaster').hide();

        powernew = $('#power').html()
        $("#searchtype").bind('change', function() {
            if ($("#searchtype").val() == 0) {
                $("#searchcontent").val('');
            }
        });

        var power = $('#userpopdem').html();
        if (power <= 4) {
            $('#excelall').show();
        }
        //////////////////////
        $("#zone").change(function() { loadArea() });
        //////////////////
        var szoneid = $('#ZidFromMaster').html();

        if (szoneid != "") {
            //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
            if (powernew == 1 || powernew == 2 || powernew == 3 || powernew == 4 || powernew == 8) {
                $('#zone').val(szoneid);
            }
        }
        else {
        }
        //////////////////
        $('#tabs').bind('tabsselect', function(event, ui) { loaddata(ui.index) });
        $('#userAccount').show();
        $("#condition").hide();
        //        loadArea();
        tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        if ($("#area").text().indexOf("Ĭ��") > -1) {
            loadArea();
        }
        if (powernew == 8) {
            $('#btnHide').hide();
        }
        setTimeout('initialize()', 800);
        //����ͨ����˵�������Ϣ
        mygrid = $("#list").jqGrid({
            width: 800,
            height: 450,
            url: 'ActionQuery/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 20,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '��ѯ������',
            recordtext: '����¼',

            loadtext: 'loading....',
            colNames: ['���Ϸ', '�����', '�����', 'ִ�з�', '��������', '�����', '��������', '�����', '', '', ''],

            colModel: [{ name: 'GAMENAME', index: 'GAMENAME', width: 160, align: 'center' },
                       { name: 'TYPENAME', index: 'TYPENAME', width: 160, align: 'center' },
                       { name: 'ASNUMBER', index: 'ASNUMBER', width: 160, align: 'center' },
                       { name: 'AREANAME', index: 'AREANAME', width: 160, align: 'center' },
                       { name: 'BARNAME', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'STARTTIME', index: 'STARTTIME', width: 160, align: 'center', sorttype: "date" },
                       { name: 'CNUM', index: 'CNUM', width: 160, align: 'center' },
                       { name: 'ACTCOST', index: 'ACTCOST', width: 160, align: 'center' },
                       { name: 'ACTSID', index: 'ACTSID', width: 0, align: 'center', hidden: true },
                       { name: 'ACTDID', index: 'ACTDID', width: 0, align: 'center', hidden: true },
                       { name: 'ACTID', index: 'ACTID', width: 0, align: 'center', hidden: true }
                       ],
            loadComplete: function() {
                //                alert('');
                //                var rowData = mygrid.getRowData(0);
                //                var GAMENAME = rowData.GAMENAME;
                //                alert(GAMENAME);
                //                if (GAMENAME == null) {
                //                    alert('');
                //                    // $('#excelbutton').attr('enable', true);
                //                    $('#excelbutton').hide();
                //                }

                // if (sumrecords != null) {
                // $('#totalsum').text(sumrecords);
                //  }

            },
            onSelectRow: function(rowid) {
                //DisplayDetails(rowid);
                if (mytabindex == 0) {
                    if (powernew == 5) {
                        if (checkAllowChange(rowid) == false) {
                            alert("�ڻ��ʼǰ��2���ڣ�����ݲ���������");
                            return;
                        }
                    }
                    var rowData = mygrid.getRowData(rowid);
                    var ACTSID = rowData.ACTSID;
                    var ACTDID = rowData.ACTDID;
                    var ACTID = rowData.ACTID;

                    if (powernew == 2) {
                        var prm = rowData.ACTSID + "," + rowData.ACTID;
                        var prm64 = BASE64.encode(prm);
                        location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActChangingByAsNumber/" + prm64;
                    }
                    if (powernew == 5) {
                        var prm = rowData.ACTSID + "," + rowData.ACTDID;
                        var prm64 = BASE64.encode(prm);
                        location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChangeDetail/" + prm64;
                    }
                    // location.replace(str);
                }
                else if (mytabindex == 2) {
                    var rowData = mygrid.getRowData(rowid);
                    //                    var prm2 = rowData.BARNAME + "," + rowData.GAMENAME + "," + rowData.ASNUMBER;
                    //                    var prm64 = BASE64.encode(prm2);
                    //                    location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAssessmentFromSearch/" + prm64;
                    $.ajax({
                        url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAssessmentFromSearch/",
                        type: 'POST',
                        data: { v_BarName: rowData.BARNAME.substring(rowData.BARNAME.indexOf('">') + 2, rowData.BARNAME.indexOf('</')), v_GameName: rowData.GAMENAME, v_ASNumber: rowData.ASNUMBER },
                        dataType: 'json'
                    });
                    var a = "";

                    location.href = "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionAssessment";
                }

            }
        });
    });
    function loaddata(index) {
        // alert(index);
        mytabindex = index;
        var tabsIndex;
        if (index == "undefined" || index == undefined) {

            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
            index = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }
       
        var beginTime = $("#begintime").val();
        var endTime = $("#endtime").val();
        var content = $("#searchcontent").val();
        var searchtype = $("#searchtype").val();  
        if (content == "") {
            searchtype = 0;
        }
        var areaid = $("#area").val();
      var   power = $('#userpopdem').html();
        if (power < 5) {
            //alert(areaid);
            mygrid.appendPostData({ TypeID: tabsIndex, v_Start: beginTime, v_End: endTime, SearchType: searchtype, SearchContent: content, v_AreaID: areaid });
           
        }
        else {
            mygrid.appendPostData({ TypeID: tabsIndex, v_Start: beginTime, v_End: endTime, SearchType: searchtype, SearchContent: content });
        }
            mygrid.trigger('reloadGrid');
    }
    ///////////////////////////////////load excel
    function loadexcel() {
//        tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        //        tabsIndex = tabsIndex + 1;
        //alert('');
        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcel/";
        location.replace(str);
    }
//    function loadexcelall() {
//        var tabsIndex = $("#tabs").tabs().tabs("option", "selected");
//        tabsIndex = tabsIndex;
//        var beginTime = $("#beginTime").val();
//        var endTime = $("#endTime").val();
//        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcelall/";
//        //location.relace(str);
//        location = str;
    //    }

    function loadexcelChangedAction() {
  
        var beginTime = $("#begintime").val();
        var endTime = $("#endtime").val();
        var prm64 = $("#area").val() + "," + beginTime + "," + endTime;
    
        var prm641 = BASE64.encode(prm64);
        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcelChangedAction/" + prm641;
        location.replace(str);


    }

    function loadexcelCommitAction() {

     
        var beginTime = $("#begintime").val();
        var endTime = $("#endtime").val();
        var prm64 = $("#area").val()+","+beginTime + "," + endTime;
        var prm641 = BASE64.encode(prm64);

        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcelCommitAction/" + prm641;
        location.replace(str);
    }

    function loadexcelAreaActStatistics() {
       
        var beginTime = $("#begintime").val();
        var endTime = $("#endtime").val();
        var prm64 = $("#area").val() + "," + beginTime + "," + endTime;
        var prm641 = BASE64.encode(prm64);
        
        str = "http://" + location.host + "/ActionSubmitAndAudit.aspx/showexcelAreaActStatistics/" + prm641;
        //location.relace(str);
        location = str;

    }
    function loadArea() {
        $.ajax(
             {
                 url: "LoadArea/" + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
    }

    function loadSuccessed(result) {

        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });


            //����UserQueryMaster��������AreaID,��ʾ���Ӧ������
            var sareaid = $('#AidFromMaster').html();
            if (sareaid != "") {
                if (powernew == 1 || powernew == 2 || powernew == 3 || powernew == 4) {
                    $('#area').attr('value', sareaid);
                    $('#AidFromMaster').html("");
                }
            }
        }
    }
    ///////////////////////////////////
    var BASE64 = {
        /**
        * �˱���Ϊ�����key��ÿ���ַ����±����Ӧ����������ı��롣
        */
        enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
        /**
        * �˱���Ϊ�����key����һ�����飬BASE64���ַ���ASCIIֵ���±꣬����Ӧ�ľ��Ǹ��ַ�������ı���ֵ��
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
        * ����
        */
        encode: function(src) {
            //��һ����������ű������ַ���Ч�ʱ����ַ�����Ӹߺܶࡣ
            var str = new Array();
            var ch1, ch2, ch3;
            var pos = 0;
            //ÿ�����ַ����б��롣
            while (pos + 3 <= src.length) {
                ch1 = src.charCodeAt(pos++);
                ch2 = src.charCodeAt(pos++);
                ch3 = src.charCodeAt(pos++);
                str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
            }
            //��ʣ�µ��ַ����б��롣
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
            //��ϸ��������ַ�������һ���ַ�����
            return str.join('');
        },
        /**
        * ���롣
        */
        decode: function(src) {
            //��һ����������Ž������ַ���
            var str = new Array();
            var ch1, ch2, ch3, ch4;
            var pos = 0;
            //���˷Ƿ��ַ�����ȥ��'='��
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
            //��ʣ�µ��ַ����н��롣
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
            //��ϸ��������ַ�������һ���ַ�����
            return str.join('');
        }
    };
  </script>
</asp:Content>