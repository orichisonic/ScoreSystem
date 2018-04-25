<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	网吧评定
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
            <span id="power"><%=account.POPEDOMID %></span>
 
            <div id="frm1" style="overflow:auto; width:100%; height:100%;">
               <h2>网吧评定</h2>
                  <label id="lblzone">大区</label>
                    <select name="zone" id="zone">
                   
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
             
                </select>&nbsp;&nbsp;&nbsp; 办事处
                     
                    <select id="area">

                      <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>

                    </select>

                    <select name="SearchType" id="Select2">
                        <option value="0">搜索全部</option>
                        <option value="1">推广员帐号</option>
                        <option value="2">网吧ID</option>
                        <option value="3">网吧名称</option>
                    </select>
                    <input type="text" name="TuiGuang" id="TuiGuang" style="width: 90px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadNetBarReview()">
                        查询
                      </button>
                
                     <%   
                        List<TGProject.Models.WModels.TGSNETBARBYSTATUS> barList = (List<TGProject.Models.WModels.TGSNETBARBYSTATUS>)ViewData["NetBar"];
                           if (barList.Count >0)
                           {
                               %><br />
&nbsp;<table cellpadding="0" cellspacing="0" border="0" style="vertical-align:top; width:100%; border:1px; border-color:Black;">
            <tr style="background-color: #FF9C08">
            <td rowspan="2" 
            style="width: 186px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
            网吧名称</td>
            <td rowspan="2" 
            style="width: 97px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
            城市</td>
            <td rowspan="2" 
            style="width: 97px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
            区/县</td>
            <td rowspan="2" 
            style="width: 117px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold;border-style: dotted;border-width: 1px;text-align: center;">
            网吧编号</td>
            <td rowspan="2" 
            style="width: 151px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold;border-style: dotted;border-width: 1px;text-align: center;">
            网吧状态</td>
            <td colspan="3" 
            style="height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
            等级评定</td>
            </tr>
            <tr style="background-color: #FF9C08">
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; width: 79px; border-style: dotted;border-width: 1px;text-align: center;">
            A</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold;width: 79px; border-style: dotted;border-width: 1px;text-align: center;">
            B</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
            待定</td>
            </tr>
                               <%
                                   //var barnamevar="";
                                int i = 0;
                               
                               foreach (TGProject.Models.WModels.TGSNETBARBYSTATUS rows in barList)
                               {
                                   //barnamevar = rows.BARNAME + barnamevar+",";
                                   %>
                                   
                                   <tr id="<%=i+"R"%>">
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <%=rows.BARNAME%></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <%=rows.CITY %></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <%=rows.COUNTY%></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <%=rows.NETBARID %></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <% if (rows.STATUS == 0)
                                              {%><%="申请"%><% }
                                              else if (rows.STATUS == 1){%><%="游离"%><%
                                              }
                                              else if (rows.STATUS == 2){%><%="绑定"%><%
                                              }
                                              else if (rows.STATUS == 3){%><%="锁定"%><%
                                              }
                                              else if (rows.STATUS == 5){%><%="锁定"%><%
                                              }
                                              else{%><%=""%><%
                                              }%>
                                       </td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center; width: 79px;">
                                           <% if (rows.GRADE == 1)
                                      {%><input type="radio" id="A" name="<%=rows.NETBARID%>" checked="checked"/> <% }
                                      else {%><input type="radio" id="A" name="<%=rows.NETBARID%>"/><%
                                      }%></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center; width: 79px;">
                                           <% if (rows.GRADE == 2)
                                      {%><input type="radio" id="B" name="<%=rows.NETBARID%>" checked="checked"/> <% }
                                      else {%><input type="radio" id="B" name="<%=rows.NETBARID%>"/><%
                                      }%></td>
                                       <td style="border-style: dotted;border-width: 1px;text-align: center;">
                                           <% if (rows.GRADE == 0)
                                      {%><input type="radio" id="D" name="<%=rows.NETBARID%>" checked="checked"/> <% }
                                      else {%><input type="radio" id="D" name="<%=rows.NETBARID%>"/><%
                                      }%></td>
                                   </tr>
                            
                             <%
                                 i++;
                               }%>
                                   <tr>
                 <%--            <td colspan="8" style="text-align:center; vertical-align:middle;color: Orange; font-size: 14px; font-weight: bold;"><%=Html.TextArea("remark", "N/A") %></td>--%>
                        <%
                            int pageTotal = 0;
                            int pageNow = 0;
                            
                            pageTotal = i / 15;
                            if (i % 15 > 0)
                            {
                                pageTotal = pageTotal + 1;
                            }
                            if (pageTotal > 0)
                            {
                                pageNow = 1;
                            }
                            
                        %>
                        <td colspan="8" style="text-align:center; vertical-align:middle; font-size: 14px; font-weight: bold; border-style: dotted;border-width: 1px;text-align: center;">
                            <button class="ui-state-default ui-corner-all" type="button" onclick="doPage(1)">
                            首页</button>
                            <button class="ui-state-default ui-corner-all" type="button" onclick="doPage(-1)">
                            上一页</button>
                            <button class="ui-state-default ui-corner-all" type="button" onclick="doPage(-2)">
                            下一页</button>
                            <button class="ui-state-default ui-corner-all" type="button" onclick="doPage(pageTotal)">
                            末页</button>
                            第<label id="pNow"><%=pageNow%></label>页／共<label id="pageTotal"><%=pageTotal%></label>页 <label id="rAll"><%=i%></label>条记录<br />
                                &nbsp;<input type="button" id="submit2" value="确认提交" onclick="dopost()" />
                        </td>
                       </tr>
                      </table>
                    <%
                           }%>
                           
                           <%
                           else
                           {
                               Response.Write("<script language=javascript>alert('很抱歉，您还没有可评选的网吧！')</script>"); 
                               
                               
                           }%>
                        
               
                        
                 </div>
           
                  
             

    <script type="text/javascript">
        //////////////////
        $('#zone').val('2');
        function initialize() {
            // $('#zone').val('2');
            $('#area').val('16');
            // alert($('#area').val());
        }
        setTimeout('initialize()', 500);
        ///////////////////////
        var str1 = 0;
        var power = 0;
        $(document).ready(function() {
            doPage(1);
            $('#lblzone').hide();
            $('#zone').hide();
            // 权限设置
            power = $("#power").html();

            if (power == 5) {
                $("#frm1").show();

            }
            else {
                $("#frm1").hide();

            }


            $("#power").hide();

        });


    function doPage(index) {
        var pNo = $('#pNow').html();
        var pTotal = $('#pageTotal').html();
        var rowAll = $('#rAll').html();
        var routeNum;
        var offset;
        offset = 15 * (Number(pNo) - 1);
        if (Number(rowAll) >= 15) {
            routeNum = 15;
        }
        else {
            routeNum = rowAll;
        }

        if (index == -1 || index == "-1"){
            
            if (Number(pNo) == 1) {
                $('#pNow').html(1);
            }
            else {
                for (j = 1 + Number(offset); j <= routeNum + Number(offset); j++) {
                    var tdID = j + "R";
                    $("#" + tdID).hide();
                }

                pNo = Number(pNo) - 1;
                offset = 15 * (Number(pNo) - 1);
                
                for (j = 1 + Number(offset); j <= routeNum + Number(offset); j++) {
                    var tdID = j + "R";
                    $("#" + tdID).show();
                }
                $('#pNow').html(Number(pNo));
            }
                
        }
        else if (index == -2 || index == "-2") {
            if (Number(pNo) == Number(pTotal)) {
                $('#pNow').html(Number(pTotal));
            }
            else {

              
                for (j = 1+Number(offset); j <= routeNum+Number(offset); j++) {
                    var tdID = j + "R";

                    $("#" + tdID).hide();
                }

                pNo = Number(pNo) + 1;
                offset = 15 * (Number(pNo) - 1);

                for (j = 1 + Number(offset); j <= routeNum + Number(offset); j++) {
                    var tdID = j + "R";
                    $("#" + tdID).show();
                }
                $('#pNow').html(Number(pNo));
            }
        }
        else if (index == 1 || index == "1") {

            for (j = 1; j <=Number(rowAll); j++) {
                var tdID = j + "R";
                $("#" + tdID).hide();
            }
            pNo =1;
            offset = 15 * (Number(pNo) - 1);
            for (j = 1 + Number(offset); j <= routeNum + Number(offset); j++) {
                var tdID = j + "R";
                $("#" + tdID).show();
            }
            $('#pNow').html(1);
        }
        else {
        
            for (j = 1; j <= Number(rowAll); j++) {
                var tdID = j + "R";
                $("#" + tdID).hide();
            }
            pNo = pTotal;
            offset = 15 * (Number(pNo) - 1);
            for (j = 1 + Number(offset); j <= routeNum + Number(offset); j++) {
                var tdID = j + "R";
                $("#" + tdID).show();
            }
            $('#pNow').html(pNo);
        }
            
            
        
    }
        
    function loadNetBarReview() {
        //if ($("#TuiGuang").val() != "") {
        var searchType = $("#Select2").val();
        if (searchType == 1) {
            var demo = /^[\u0391-\uFFE5\w]+$/;
            if (!demo.test($("#TuiGuang").val())) {
                alert("推广人员只能包括中文字、英文字母、数字和下划线!");
                return;
            }
        }
        var pm64 = BASE64.encode($("#TuiGuang").val() + ";" + searchType);
        str = "http://" + location.host + "/NetBarReviewAndQuery.aspx/NetBarReviewInfo/" + pm64;
       
        location.replace(str);
            
        //}
        //else {
            //alert("请输入锁定网吧的推广员帐号！");
        
        //}
    }

    function dopost() {

       
        var barna="";
        var barnb="";
        
        var remark = $("#remark").val();
        var eles = $("#frm1 input[type *= 'radio']");
        $.each(eles, function(index, item) {

            if (item.checked == true) {

                if (item.id == "A") {
                    barna += item.name + ",";
                    barnb += "1,";
                }
                if (item.id == "B") {
                    barna += item.name + ",";
                    barnb += "2,";
                }
                if (item.id == "D") {
                    barna += item.name + ",";
                    barnb += "0,";
                }
            }
        });

        
        $("#submit2").attr('disabled', 'false'); //不可用
         url="http://" + location.host + "/NetBarReviewAndQuery.aspx/PingjiP/";
       
            $.ajax(
                 {
                     url: url,
                     type: "POST",
                     dataType: "json",
                     data: {
                         parama: barna,
                         paramb: barnb,
                         Remark: remark
                     },
                     success: mesgSuccessed
                 });

        
             }

             function mesgSuccessed(result) {
                 if (result.isSuccessed) {
                     alert("提交成功！");

                     $("#submit2").attr('disabled', false); //可用
                 }
                 else {
                     alert("提交失败！");
                     $("#submit2").attr('disabled', false); //可用
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
