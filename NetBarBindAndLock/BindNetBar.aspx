<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧绑定
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
     TGProject.Models.NetBarQueryCondition condtion = (TGProject.Models.NetBarQueryCondition)ViewData["condition"];
 
            int areaid;
            int zoneid;
            if (condtion != null)
            {
                areaid = condtion.areaid;
                zoneid = condtion.zoneid;
            }
            else
            {
                areaid = 2;
                zoneid = 16;
            }

        %>
            <span id="areaid"><%=areaid%></span>
       <span id="zoneid"><%=zoneid%></span>
 <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">绑定日期:<%=DateTime.Now.ToLongDateString() %></p>
<fieldset>
    <legend>人员信息</legend>
    <div style="text-align:center">
        <ul class="horizontal">
        <%
           // TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;
         %>
                <li>
                    <span style="display:none" id="userpopdem"><%=account.POPEDOMID%></span>
                </li>
                <li id="zoneHide1">大区
                    <select name="zone" id="zone">
                    <%if (account.POPEDOMID == 1 || account.POPEDOMID == 2)
                      {
                          List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <% } } else { %>
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                    <%} %>
                </select></li>
                <li id="areaHide1">办事处
                    <select id="area">
                        <%if (account.POPEDOMID == 5)
                          { %>
                        <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                        <%}
                          else if (account.POPEDOMID == 8)
                          {
                              %>
                              <option value="0">督察</option>
                              <%
                          }
                           %>
                        
                    </select>
                </li>
            <li>推广人员姓名
                <select name="user" id="user">
                            <%List<AccountResult> usersList = (List<AccountResult>)ViewData["Users"];
                              foreach (AccountResult user in usersList){%>
                            <option value="<%=user.UKEY%>"><%=user.USERNAME %></option>
                            <%}%>
                </select>
            </li>
            <li>
               账号: <span id="account"></span>
            </li>
            <li>
                已绑定网吧数量: <span id="count"></span>
            </li>
        </ul>
    </div>
    </fieldset>
    <span style="display:none" id="powern"><%=account.POPEDOMID%></span>
     <span style="display:none" id="powerarea"><%=account.AREAID%></span>
       <span style="display:none" id="powerareaname"><%=account.AREANAME%></span>
    <br />
    <fieldset>
        <legend>网吧绑定</legend> 
            <div style="text-align:center">
            <table style="text-align:center; width:80%;">
                <tr>
                    <td>网吧名称</td>
                    <td>城市</td>
                    <td>区/县</td>
                    <td>网吧编号</td>
                    <td>绑定</td>
                </tr>
                 <%List<TGSNetBarQuery> netbarList = (List<TGSNetBarQuery>)ViewData["NetBars"];
                   foreach (TGSNetBarQuery netbar in netbarList){%>
                <tr>
                    <td><%=netbar.BARNAME %></td>
                    <td><%=netbar.CITY %></td>
                    <td><%=netbar.COUNTY %></td>
                    <td><%=netbar.NETBARID %></td>
                    <td><input type="checkbox" id="<%=netbar.NETBARID %>" /></td>
                </tr>
               <%} %>
               <tr>
                    <td colspan="10" style="text-align:left">备注<br /><input type="text" id="remark" style="width:98%; height:35px;"/></td>
               </tr>
            </table>
            </div>
    </fieldset>

 <p style="text-align: center"><button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">绑定</button></p>

<script language="javascript" type="text/javascript">
    var idStr = "";
    var areaid = $("#areaid").html();
    var zoneid = $("#zoneid").html();
    $("#areaid").hide();
    $("#zoneid").hide();
    // $("#zone").val('1');
   
    $("#zone").attr("value", zoneid);
    function initialize() {
        // $('#zone').val('2');
        //$('#area').val('16');
        if ($('#powern').html() == 2) {
            $("#area").attr("value", areaid);
        }
        if ($('#powern').html() == 5) {
            $("#area").attr("value", $('#powerarea').html());
            $('#zone').hide();
            $('#zoneHide1').hide();
        }
        loadUserInfo();
        // alert($('#area').val());
    }
    setTimeout('initialize()', 700);
   // $("#zone").val('3');
    setTimeout('initialize()', 2000);
    //setTimeout('initialize2()', 4000);

    $(document).ready(function() {
        //loadArea();
        $("#zone").attr("value", zoneid);
        loadArea();
        // $("#zone").attr("value", 2);

        // alert(1);
        $("#zone").change(function() {
            //alert("change");
            loadArea();
        });






        $("#area").change(function() {


            loadUser();
            // if ($('#powern').html() == 2) {
            loadnetbar();
            // }
        });
        $("#user").change(function() { loadUserInfo(); });
        str = "http://" + location.host + "/NetBarBindAndLock.aspx/BindNetBar/" + "trdf";
        var strlocation = location.href;
        //alert(strlocation);
        if (strlocation.indexOf("trdf") < 0 && strlocation.indexOf('BindNetBar') > 0) {
            location.reload(str);
        }




    });


    function loadUserInfo() {
    url = "http://" + location.host + "/NetBarBindAndLock.aspx/LoadUserInfo/";
        $.ajax({
            url: url + $("#user").val(),
            type: "POST",
            dataType: "json",
            success: userSuccessed
        });
    }

    function userSuccessed(result) {
        $("#account").html(result.Account);
        $("#count").html(result.BindCount);
    }

    function submitInfo() {
        idStr = "";
        var netbars = $("input[type *= 'checkbox']")
        $.each(netbars, function(index, item) {
            if (item.checked == true) {
                idStr += item.id + ','
            }
        });
    
        if (idStr.length < 1) {
            alert("请选择绑定的网吧后提交!");
            return false;
        }

        var userAccount = $('#account').html();
        if (userAccount == '') {
            alert("请选择绑定的用户后提交!");
            return false;
        }
        
        var account = $("#account").html();
        var remark = $("#remark").val();
        var name = $('#user option:selected').text();
        url = "http://" + location.host + "/NetBarBindAndLock.aspx/BindNetBar/";
        $.ajax({
      
            url: url,
            type: "POST",
            dataType: "json",
            data: { NetBarID: idStr, Account: account, Name: name, Remark: remark },
            success: bindSuccessed
        });
    }

    function bindSuccessed(result) {
        if (result.isSuccessed == 1) {
            alert("绑定成功!");
        }
        else if (result.isSuccessed == 2) {
            alert("绑定失败, 绑定网吧不存在");
        } 
        else if (result.isSuccessed == 3) {
            alert("该网吧已经被绑定或锁定，解除之后才可已重新分配");
        }
        else if (result.isSuccessed == 4) {
            alert("没有数据");
        }
        else if (result.isSuccessed == 5) {
            alert("太多行");
        }
        else if (result.isSuccessed == 6) {
            alert("索引冲突");
        }
        else if (result.isSuccessed == 7) {
            alert("其他错误");
        }
        else if (result.isSuccessed == 8) {
            alert("该人员绑定网吧数量超过50家");
        }
        history.go(0);
    }


    function loadArea() {
        //alert(3);
         url = "http://" + location.host + "/NetBarBindAndLock.aspx/LoadArea/";
        $.ajax({
            url: url + $("#zone").val(),
            type: "POST",
            dataType: "json",
            success: areaSuccessed
        });
       // alert(3);
    }

    function areaSuccessed(result) {
        $("#area").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
            //alert(item.cell[1]);
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
            });
        }
        //        loadUser();
        

    }

    function loadUser() {
        //alert(4);
        //alert($("#area").val());
          url = "http://" + location.host + "/NetBarBindAndLock.aspx/loadUser/";
        $.ajax({
            url: url + $("#area").val(),
            type: "POST",
            dataType: "json",
            success: loadUserSuccessed
        });
    }

    function loadUserSuccessed(result) {
        $("#user").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
            $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#user"));
            });
        }
        loadUserInfo();
    }

    function loadnetbar() {

        parm64 = BASE64.encode($("#area").val() + "," + $("#zone").val());
        str = "http://" + location.host + "/NetBarBindAndLock.aspx/loadDetail/" + parm64;
        location.reload(str);
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
