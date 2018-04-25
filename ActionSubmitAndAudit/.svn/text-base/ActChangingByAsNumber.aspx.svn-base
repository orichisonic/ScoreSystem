<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动变更
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        TGProject.Models.TGSACTSINGLEQUERY rowData = (TGProject.Models.TGSACTSINGLEQUERY)ViewData["rowData"];
    %>
    <span id="Actid"><%=rowData.ACTID %></span>
    <span id="Areaid"><%=rowData.EXECAREA %></span>
    <span id="Gamecode"><%=rowData.GAMECODE %></span>
    <span id="Typeid"><%=rowData.TYPEID %></span>
    <div id="tabs5" style="text-align: center">

        <table cellpadding="0" cellspacing="0" border="0"style="vertical-align:top; width:100%; border:2px solid #000000; border-collapse: collapse;">
        <tr style="background-color:#FFFFFF; font-weight:bold"  >
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; text-align: center;font-size:small; height: 16px; width: 192px;">
            执行方</td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 196px; height: 16px;">
            活动游戏</td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 136px; height: 16px;">
            活动类型</td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 210px; height: 16px;">
            活动单号</td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; height: 16px; ">
            活动场次</td>
        </tr>
        <tr style="background-color:#FFFFFF; font-weight:bold"  >
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; text-align: center;font-size:small; width: 192px;">
                <select name="AreaName" id="AreaName" style="width: 195px;">
                 <% 
                 List<TGProject.Models.TGSAREASHOW> AreaNameList = (List<TGProject.Models.TGSAREASHOW>)ViewData["AreaName"];
                 foreach (TGProject.Models.TGSAREASHOW AreaName in AreaNameList)
                 {
                     %>
                    <option value="<%=AreaName.AREAID%>">
                    <%= AreaName.AREANAME%></option>
                 <% 
                 }
                     %>
                 </select>
            </td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 196px;">
                <select  style="width:226px;" name="GAME" id="GAME">

                   <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                        { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
            </td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 136px;" >
                <select name="ActiveType" style="width: 135px;"  disabled="disabled">
                <% 
                List<TGProject.Models.TGSACTTYPEQUERY> ActiveTypeList = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["ActiveType"];
                foreach (TGProject.Models.TGSACTTYPEQUERY ActiveType in ActiveTypeList)
                {
                %>
                    <option value="<%=ActiveType.TYPEID%>">
                    <%= ActiveType.TYPENAME%></option>
                    <% 
                }  %>
                </select>
            </td>
            <td style="border: 1px ridge #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small; width: 210px;">
                <span id="asnum" style=" color:Black;"><%=rowData.ASNUMBER %></span>
            </td>
            <td style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                <span id="fieldnum" style=" color:Black;"><%=rowData.FIELDNUM %></span>
            </td>
        </tr>
        
        </table>             
    </div>

    <center>
        <p style="font-weight: bold">&nbsp;</p>
           <button class="ui-state-default ui-corner-all" type="submit" onclick="ActionChangeDetailSubmit()">确认提交</button>
        <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">取消返回</button>
    </center>
    <script>
        $.timeEntry.setDefaults({show24Hours: true, separator: ':',
		ampmPrefix: '', ampmNames: ['AM', 'PM'],
		spinnerTexts: ['当前', '左移', '右移', '加一', '减一']});

		$(document).ready(function() {
		$('#Actid').hide();
		$('#Areaid').hide();
		$('#Gamecode').hide();
		$('#Typeid').hide();
		    var aid=$('#Areaid').html();
		    var gid=$('#Gamecode').html();
		    var tid = $('#Typeid').html();
		    $('#AreaName').attr('value',aid);
		    $('#GAME').attr('value', gid);
		    $('#ActiveType').attr('value', tid);
		    
		    $('#beginTime').timeEntry({ spinnerImage: '/Script/jqtentry/spinnerDefault.png' });
		    $('#endTime').timeEntry({ spinnerImage: '/Script/jqtentry/spinnerDefault.png' });

		});
		function ReturnPrevious() {

		    history.go(-1);

		}

		//提交修改信息
		function ActionChangeDetailSubmit() {

		    var json_data;
		    var ACTID = $('#Actid').html();
		    var EXECAREA = $('#AreaName').val();
		    var GAMECODE = $('#GAME').val();
		    var ASNUMBER = $('#asnum').html();
		    var FIELDNUM = $('#fieldnum').html();

		    json_data = { intACTID: ACTID, strGAMECODE: GAMECODE, strASNUMBER: ASNUMBER, intFIELDNUM: FIELDNUM, intEXECAREA: EXECAREA };
		    $.ajax({
		        url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChangeAsNumberSubmit/",
		        type: "POST",
		        dataType: "json",
		        data: json_data,
		        success: SubmitSuccessed
		    });
		}
		function SubmitSuccessed(result) {
		    if (result.isSuccessed == 1) {
		        alert("修改成功!");
		        location.href("http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChange");
		    }
		    else if (result.isSuccessed == 0) {
		        alert("修改失败!");
		    }
		    else if (result.isSuccessed == 2) {
		        alert("没有数据!");
		    }
		    else if (result.isSuccessed == 3) {
		        alert("太多行!");
		    }
		    else if (result.isSuccessed == 4) {
		        alert("索引冲突!");
		    }
		    else if (result.isSuccessed == 4) {
		        alert("添加失败!");
		    }
		}
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
