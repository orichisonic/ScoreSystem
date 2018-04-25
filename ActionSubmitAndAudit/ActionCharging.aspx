<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	���
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset>
        <legend>��ѯ����</legend>
        <div style="text-align:left">
            <ul class="horizontal">
                <li style=" vertical-align:bottom">
                    <select name="class" id="GAME" >
                        <option  value="0">������Ϸ</option>
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GamesList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Games"];
                        foreach (TGProject.Models.TGSGAMESHOW gameinfo in GamesList)
                        {    
                    %>
                        <option  value="<%=gameinfo.GAMECODE%>">
                        <%=gameinfo.GAMENAME%></option>
                    <%
                        }
                     %>
                    </select>
                </li>
                <li style=" vertical-align:bottom">
                    <select name="class" id="gtype">
                        <option  value="0">��������</option>
                    <%
                       List<TGProject.Models.TGSACTTYPEQUERY> Typelist = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["Typelist"];
                       foreach (TGProject.Models.TGSACTTYPEQUERY Typeinfo in Typelist)
                        {    
                    %>
                        <option  value="<%=Typeinfo.TYPEID%>">
                        <%=Typeinfo.TYPENAME%></option>
                    <%
                        }
                    %>
                    </select>
                </li>
                <li style=" vertical-align:bottom">
                    <select name="class" id="netbar">
                        <option  value="0">��������</option>
                    <%
                        List<TGProject.Models.WModels.TGSNETBARBYTYPE> Netbarlist = (List<TGProject.Models.WModels.TGSNETBARBYTYPE>)ViewData["Netbarlist"];
                        foreach (TGProject.Models.WModels.TGSNETBARBYTYPE Netbarinfo in Netbarlist)
                        {    
                    %>
                        <option  value="<%=Netbarinfo.NETBARID%>">
                        <%=Netbarinfo.BARNAME%></option>
                    <%
                        }
                    %>
                    </select>
                </li>
                <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">��ѯ</button>
            </ul>
        </div>
    </fieldset>
<div id="tabs1">
        <%Html.RenderPartial("DataGridControl"); %>
</div>
<script>

    $(document).ready(function() {
        mygrid = $("#list").jqGrid({
            width: 828,
            height: 450,
            url: 'ActionCharging/',
            datatype: 'json',
            mtype: 'POST',
            pager: jQuery('#pager'),
            rowNum: 40,
            rowList: [20, 40, 60, 80],
            sortname: 'Id',
            sortorder: "desc",
            viewrecords: true,
            imgpath: '/scripts/themes/steel/images',
            caption: '��ѯ�����',
            recordtext: '����¼',
            loadtext: '�����������Ժ�....',
            editurl: "ActionChange/",
            colNames: ['���Ϸ', '�����', '�����', '��������','���ɵ�ַ', '�����', '���ʼʱ��', '�����ʱ��', '��������','�ID'],
            //colNames: ['���Ϸ', '�����', '�����', '��������'],
            colModel: [{ name: 'gamename', index: 'GAMENAME', width: 160, align: 'center', sortable: false },
                                        { name: 'typename', index: 'TYPENAME', width: 100, align: 'center', sortable: false },
                                        { name: 'asnumber', index: 'ASNUMBER', width: 160, align: 'center', sortable: false },
                                        { name: 'barname', index: 'BARNAME', width: 200, align: 'center', sortable: false },
                                        { name: 'address', index: 'ADDRESS', width: 160, align: 'center', sortable: false },
                                        { name: 'actdate', index: 'ACTDATE', width: 160, align: 'center', sortable: false },
                                        { name: 'starttime', index: 'STARTTIME', width: 160, align: 'center', sortable: false },
                                        { name: 'endtime', index: 'ENDTIME', width: 160, align: 'center', sortable: false },
                                        { name: 'cnum', index: 'CNUM', width: 100, align: 'center', sortable: false },
                                        { name: 'actdid', index: 'ACTDID', width: 0, align: 'center', sortable: false, hidden: true }
                                        ],
            onSelectRow: function(rowid) {
                ActionChargingDetail(rowid);
            }
        });
    });
    function ActionChargingDetail(rowIndex) {
        //��ȡID
        var rowData = mygrid.getRowData(rowIndex);
        var strBarname = rowData.barname.substring(rowData.barname.indexOf('>') + 1, rowData.barname.indexOf('</'));
        //var queryString=rowData.gamename+","+rowData.typename+","+rowData.asnumber+","+rowData.actdate+","+rowData.starttime+","+rowData.endtime+","+rowData.barname.substring(rowData.barname.indexOf('>')+1,rowData.barname.indexOf('</'))+","+rowData.address+","+rowData.actdid;

//        if (prm64 != null)
//            location.href = "ActionChargingDetail/" + prm64;

        $.ajax(
             {
                 url: "ActionChargingDetail/",
                 type: "POST",
                 dataType: "json",
                 data: { GAMENAME: rowData.gamename, TYPENAME: rowData.typename, ASNUMBER: rowData.asnumber, strActdate: rowData.actdate, strBegintime: rowData.starttime, strEndtime: rowData.endtime, BARNAME: strBarname, ADDRESS: rowData.address, ACTDID: rowData.actdid, CNUM: rowData.cnum },
                 success: loadSuccessed
             });
    }

    function loadSuccessed(result) {

        if (result.isSuccessed == 1) {
            location.href = "ActionChargingDetail/" ;
        }
                  
    }

    function loadData() {
        var gameCode = $("#GAME").val();
        var typeID = $("#gtype").val();
        var netBarID = $("#netbar").val();


        mygrid.appendPostData({ GameCode: gameCode, TypeID: typeID, NetBarID: netBarID });
        mygrid.trigger('reloadGrid');
    }
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
