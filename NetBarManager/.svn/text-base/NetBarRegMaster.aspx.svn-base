<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧登记
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%Account account = null; if (Session["Account"] != null) { account = (Account)Session["Account"];%>
    <span id="UACCOUNT"><%=account.UACCOUNT %></span>
    <span id="USERNAME"><%=account.USERNAME%></span>
    <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
        <ul class="horizontal">
            <li>所处办事处&nbsp;&nbsp;<span><%=account.AREANAME%></span></li>
            <li>登记人&nbsp;&nbsp;<span><%=account.USERNAME%></span></li>
            <li>账号&nbsp;&nbsp;<span><%=account.UACCOUNT%></span></li>
            <li>登记时间&nbsp;&nbsp;<span><%=DateTime.Now.ToLongDateString().ToString()%></span></li>
        </ul>
    </div>
    <%} %>
    <form id="form1">
        <fieldset>
            <legend>详细信息</legend>
            <div>
                <ul class="verticality">
                    <li>网吧名称<br />
                        <input type="text" id="barName" name="barName" /></li>
                    <li>网吧所在地
                        <ul>
                            <li style="display: inline; list-style-type: none; padding-left: 0px;">
                                <input type="text" id="province" name="province" style="width: 60px" />(省)&nbsp;&nbsp;
                                <input type="text" id="city" name="city" style="width: 60px" />(市)&nbsp;&nbsp;
                                <input type="text" id="county" name="county" style="width: 60px" />(县/区) </li>
                        </ul>
                    </li>
                    <li>网吧地址<br />
                        1)门牌号：
                        <input type="text" id="netbarAddr" name="netbarAddr" />
                        （详细门牌号，无需再写省市区信息。示例： 新华路1889号二楼。）&nbsp;
                        <br />
                        2)参照物： 
                        <input type="text" id="netbarAddr1" name="netbarAddr1" /> 
                        （附近路口或标志性建筑。示例：新华路建国路口，复兴大厦右100米）<br />
                        3)交通站： 
                        <input type="text" id="netbarAddr2" name="netbarAddr2" />
                        （交通线路及站点。示例：公交60路人民广场站，地铁1号线15号口）</li>
                    <li>联系人人<br />
                        <input type="text" id="linkMan" name="linkMan" /></li>
                    <li>联系电话<br />
                        <input type="text" id="phone" name="phone"  onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/></li>
                    <li>备注<br />
                        <%=Html.TextArea("remark", "N/A") %></li>
                </ul>
            </div>
          
        </fieldset>
          <div id="tab2-userinfo">
        <br />
        <fieldset>
            <legend>IP 类型</legend>
            <ul >
                <li style="display: inline; list-style-type: none; line-height: 22px;">固定IP<input type="radio" name="ipType" value="1" id="type1" style="width: 60px" checked="checked"/></li>
                <li style="display: inline; list-style-type: none; line-height: 22px;">IP段<input type="radio" name="ipType" value="2" id="type2" style="width: 60px" /></li>
                <li style="display: inline; list-style-type: none; line-height: 22px;">流动IP<input type="radio" name="ipType" value="3" id="type3" style="width: 60px" /></li>
                <li>
                    <div id="ip">
                        <table>
                            <tr>
                                <td>
                                    <input type="text" id="ip1" name="ip1" style="width: 100px" />
                                </td>
                                <td>
                                    <input type="text" id="ip2" name="ip2" style="width: 100px" />
                                </td>
                                <td>
                                    <input type="text" id="ip3" name="ip3" style="width: 100px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="ip4" name="ip4" style="width: 100px" />
                                </td>
                                <td>
                                    <input type="text" id="ip5" name="ip5" style="width: 100px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="wobbleIP">
                        <table>
                            <tr>
                                <td>
                                    开始IP<input type="text" id="wobbleIP1" name="wobbleIP1" style="width: 100px" />
                                </td>
                                <td>
                                    结束IP<input type="text" id="wobbleIP2" name="wobbleIP2" style="width: 100px" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </li>
            </ul>
        </fieldset>
        
          <fieldset>
            <legend>硬件信息</legend>

            <ul  class="verticality">
                <li>
                电脑数量<br />
                <input type="text" id="macNum" name="macNum"  
                        onkeyup ="value=value.replace(/[^\d]/g,'') " 
                        onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                        style="width: 128px"/>
                </li>
                <li>
                宽带接入<br />
                        <select id="WIDEBAND" name="WIDEBAND" style="width: 128px" >
                            <option value="0">电信</option>
                            <option value="1">网通</option>
                            <option value="2">双线(电信+网通)</option>
                            <option value="3">其它(铁通、有线通等)</option>
                        </select>&nbsp;&nbsp;
                </li>
                <li>
                管理软件<br />
                        <select id="ADMINSOFT" name="ADMINSOFT" style="width: 128px" >
                            <option value="0">易游</option>
                            <option value="1">迅闪</option>
                            <option value="2">锐起</option>
                            <option value="3">强者</option>
                            <option value="4">网维大师</option>
                            <option value="5">网众</option>
                            <option value="6">信佑</option>
                            <option value="7">其他</option>
                        </select>&nbsp;&nbsp;
                </li>
                <li>
                地段位置<br />
                        <select id="POSITION" name="POSITION" style="width: 128px" >
                            <option value="0">市区</option>
                            <option value="1">高校区</option>
                            <option value="2">郊区</option>
                            <option value="3">其他</option>

                        </select>
               </li>
               <li>
                CPU<br />
                        <select id="CPUFREQ" name="CPUFREQ" style="width: 128px" >
                           <%-- <option value="0">主频3.0G及以上双核</option>
                            <option value="1">主频2.4G-3.0G单核或双核</option>
                            <option value="2">主频2.4G以下单核</option>--%>
                            <option value="0">2GHz以下（低功耗）</option>
                            <option value="1">2GHz-2.6GHz（家用/办公）</option>
                            <option value="2">2.6GHz-3GHz（游戏/娱乐）</option>
                            <option value="3">3GHz以上（极致性能）</option>
                        </select>
                </li>  
                <li>      
                显卡<br />
                        <select id="DISCARD" name="DISCARD" style="width: 128px" >
                            <%--<option value="0">1G以上</option>
                            <option value="1">512兆 -1G</option>
                            <option value="2">512兆以下</option>
                            <option value="3">其他集成显卡</option>--%>
                            <option value="0">N卡X系及同级A卡</option>
                            <option value="1">N卡9系及同级A卡</option>
                            <option value="2">N卡8系及同级A卡</option>
                            <option value="3">N卡7系及同级A卡</option>
                            <option value="4">其他低端</option>
                        </select>
                </li>  
                <li> 
                硬盘<br />
                        <select id="HARDDISK" name="HARDDISK" style="width: 128px" >
     <%--                       <option value="0">100G以上</option>
                            <option value="1">50G-100G</option>
                            <option value="2">50G以下</option>
                            <option value="3">无盘网吧系统</option>--%>
                            <option value="0">有盘网吧系统</option>
                            <option value="1">无盘网吧系统</option>
                        </select>
                </li>
                <li> 
                内存<br />
                        <select id="MEMORY" name="MEMORY" style="width: 128px" >
                           <%-- <option value="0">2G以上</option>
                            <option value="1">1G-2G</option>
                            <option value="2">1G以下</option>--%>
                            <option value="0">2G以上</option>
                            <option value="1">2G</option>
                            <option value="2">1G</option>
                            <option value="3">1G以下</option>
                        </select>
                </li>

               
               <li>
                    网吧广告
                    <input type="radio" name="tab2-pass" checked="checked" value="1" />有<input type="radio" name="tab2-pass"id="tab2-pass" value="2" />无
               </li>
                        
                   
            </ul>
        </fieldset>
        </div>
                 <div id="tab2-upgrade">
                <fieldset>
                    <legend>网吧广告</legend>
                    <ul class="verticality" id="tab4-account">
                        <li style="color:Red;">单位：厘米。</li>
                        <li>店头招牌大小<br />
                       <%-- <input type="text" id="FACIAADSIZE" name="FACIAADSIZE" />--%>
                            1.高<input type="text" id="Fx1" name="FACIAADSIZEx1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy1" name="FACIAADSIZEy1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            2.高<input type="text" id="Fx2" name="FACIAADSIZEx2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy2" name="FACIAADSIZEy2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            3.高<input type="text" id="Fx3" name="FACIAADSIZEx3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy3" name="FACIAADSIZEy3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                        </li>
                        <li>店头招牌数量
                        <input type="text" id="FACIAADNUM" name="FACIAADNUM"   
                                onkeyup ="value=value.replace(/[^\d\-]/g,'') " 
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                                style="width: 85px"/></li>
                        <li>室内位置大小<br />
                        <%--<input type="text" id="INDOORADSIZE" name="INDOORADSIZE" />--%>
                            1.高<input type="text" id="Ix1" name="INDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy1" name="INDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Ix2" name="INDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy2" name="INDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Ix3" name="INDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy3" name="INDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        <li>室内位置数量
                        <input type="text" id="INDOORADNUM" name="INDOORADNUM"   
                                onkeyup ="value=value.replace(/[^\d\-]/g,'') " 
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                                style="width: 85px"/></li>
                        <li>户外位置大小<br />
                        <%--<input type="text" id="OUTDOORADSIZE" name="OUTDOORADSIZE" />--%>
                            1.高<input type="text" id="Ox1" name="OUTDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy1" name="OUTDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Ox2" name="OUTDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy2" name="OUTDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Ox3" name="OUTDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy3" name="OUTDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        <li>户外位置数量
                        <input type="text" id="OUTDOORADNUM" name="OUTDOORADNUM"   
                                onkeyup ="value=value.replace(/[^\d\-]/g,'') " 
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                                style="width: 85px"/>
                        </li>
                        <li>其他招牌大小<br />
                        <%--<input type="text" id="REMAINADSIZE" name="REMAINADSIZE" />--%>
                            1.高<input type="text" id="Rx1" name="REMAINADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry1" name="REMAINADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Rx2" name="REMAINADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry2" name="REMAINADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Rx3" name="REMAINADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry3" name="REMAINADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        <li>其他招牌数量
                        <input type="text" id="REMAINADNUM" name="REMAINADNUM"   
                                onkeyup ="value=value.replace(/[^\d\-]/g,'') " 
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                                style="width: 85px"/></li>
                        
                    </ul>
                </fieldset>
               
            </div>
    </form>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
        提交</button>
    </p>
    <div id="divIframe" title="信息提交中........." style="text-align: center; height: 90px; width: 370px">
        <span id="displayInfo">
            <img src="/Content/images/ajax-loader.gif" /><br />
        </span>
        <span id="msg"></span>
        <p id="closeDailog" style="text-align: center">
            <button class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: $('#divIframe').dialog('close')">
            关闭</button>
        </p>
    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;
        var UACCOUNT = $("#UACCOUNT").html();
        var USERNAME = $("#USERNAME").html();
        $("#UACCOUNT").hide();
        $("#USERNAME").hide();
        function loadNetbarInfo() {
            var id = $("#netbarID").val();
            var intExp = /^[1-9]\d*$/;
            var pm64 = BASE64.encode(id);
            
            if (id.match(intExp) == null) {
                alert("网吧编号必须是正整数!");
                return false;
            } else {
            $.ajax({
                    url: 'LoadNetBarByID/' + pm64,
                    dataType: 'json',
                    type: 'POST',
                    success: netbarSuccessed
                });
            }
        }

        function netbarSuccessed(result) {

            $("#barName").val(result.barname);
            var straddr = result.address.split('%');
            if (straddr.length >= 1) {
                $("#netbarAddr").val(straddr[0]);
            }
            if (straddr.length >= 2) {
                $("#netbarAddr1").val(straddr[1]);
            }
            if (straddr.length >= 3) {
                $("#netbarAddr2").val(straddr[2]);
            }
           // $("#netbarAddr").val(result.address);
            $("#linkMan").val(result.linkman);
            $("#phone").val(result.phone);
            $("#macNum").val(result.macnum);

            $('#form1').show();
        }
        
        
        
        //事件绑定
        $(document).ready(function() {
            $("#wobbleIP").hide();
            $("#type1").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").show(400); });
            $("#type2").bind("click", function() { $("#wobbleIP").show(400); $("#ip").hide(400); });
            $("#type3").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").hide(400); });


            $("#WIDEBAND").attr("value",-1);    //宽带接入
            $("#POSITION").attr("value",-1);    //地段
            $("#CPUFREQ").attr("value",-1);      //CPU
            $("#DISCARD").attr("value",-1);      //显卡
            $("#HARDDISK").attr("value",-1);    //硬盘
            $("#MEMORY").attr("value",-1);        //内存
            $("#ADMINSOFT").attr("value",-1);  //管理软件



        });


        //显示与隐藏网吧广告
        $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

            $("#tab2-upgrade").show(400);
        });


        $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

            $("#tab2-upgrade").hide(400);
        });
        //获取网吧IP
        function getNetBarIP(){
             var ipStr = "";
             
             ipAddrType = $("input[name*='ipType']")[0].checked ? 1 :
                                $("input[name*='ipType']")[1].checked ? 2 :
                                $("input[name*='ipType']")[2].checked ? 3 : 0;
                                
             var ipStr1 = $("#ip1").val().length > 0 ? $("#ip1").val() + "," : "";
             var ipStr2 = $("#ip2").val().length > 0 ? $("#ip2").val() + "," : "";
             var ipStr3 = $("#ip3").val().length > 0 ? $("#ip3").val() + "," : "";
             var ipStr4 = $("#ip4").val().length > 0 ? $("#ip4").val() + "," : "";
             var ipStr5 = $("#ip5").val().length > 0 ? $("#ip5").val() + "," : "";

             var beginIP = $("#wobbleIP1").val().length > 0 ? $("#wobbleIP1").val() + "," : "";
             var endIP = $("#wobbleIP2").val().length > 0 ? $("#wobbleIP2").val() + "," : "";
                
             if (ipAddrType == 1){
                ipStr = ipStr1 + ipStr2 + ipStr3 + ipStr4 + ipStr5;
             }
             else if (ipAddrType == 2){
                ipStr = beginIP + endIP;
             }
             else if (ipAddrType == 3)
             {
                ipStr = "";
             }
             
             return ipStr;
        }
    
        //提交信息
        function submitInfo() {
           
            
            if ($("#form1").valid()) {
                var ipStr = getNetBarIP();
                if (ipAddrType == 1) {  //验证IP唯一性

                    var ipArray = ipStr.split(',');
                    if (ipArray.length <= 0 || ipStr.length == 0||ipStr.indexOf('.')<=0) {
                        alert('固定IP不能为空');
                        return;
                    
                    }
                    if (ipArray.length > 1) {
                        for (var i = 0; i < ipArray.length - 1; i++) {
                            var ip = ipArray[i] + ",";
                            var tempStr = ipStr;
                            var len = 0;
                            for (var j = 0; j < ipArray.length; j++) {
                                tempStr = tempStr.replace(ip, "");
                                len = tempStr.length;
                            }
                            if (len != ipStr.length - ip.length) {
                                alert("IP重复");
                                return false;
                            }
                        }
                    }
                } else if (ipAddrType == 2) { // IP区间验证
                    if ($("#wobbleIP1").val().length < 1 || $("#wobbleIP2").val().length < 1) {
                        alert("必须输入IP段");
                        return false;
                    }
                    else {
                        //&& beginIPArray[3] < endIPArray[3]
                        var beginIPArray = $("#wobbleIP1").val().split(".");
                        var endIPArray = $("#wobbleIP2").val().split(".");
                        if (!(beginIPArray[0] == endIPArray[0] && beginIPArray[1] == endIPArray[1] && beginIPArray[2] == endIPArray[2] &&beginIPArray[3]!=endIPArray[3])) {
                            alert("IP段输入不正确!");
                            return false;
                        }
                       
                    }
                }
                
                var barName = $("#barName").val();
                var province = $("#province").val();
                var city = $("#city").val();
                var county = $("#county").val();
                var linkMan = $("#linkMan").val();
                var address = $("#netbarAddr").val() +"%"+$("#netbarAddr1").val()+"%"+$("#netbarAddr2").val();
                var phone = $("#phone").val();
                var macNum = $("#macNum").val();
                var ipType = ipAddrType;
                var NetBarIP = ipStr;
                var remark = $("#remark").val();
//                alert("yy");
//                return;
                //                alert("after");

                $.ajax({
                    url: "NetBarReg/",
                    type: "POST",
                    dataType: "json",
                    data: { BarName: barName, Province: province, City: city, County: county, LinkMan: linkMan, Address: address, Phone: phone, MacNum: macNum, IPType: ipType, NetBarIP: NetBarIP, Remark: remark },
                    success: submitSuccessed
                });
            }
        }

        function submitSuccessed(result) {

            if (result.isSuccessed == 1) {
//                alert("添加成功!");

                if ($("#form1").valid()) {
                    //网吧ID
                    var NETBARID = result.netbarID;
                   
                    //网吧配置
                    var WIDEBAND = $("#WIDEBAND").val();    //宽带接入
                    var POSITION = $("#POSITION").val();    //地段
                    
//                    var CPUFREQ = $("#CPUFREQ").val();      //CPU
//                    var DISCARD = $("#DISCARD").val();      //显卡
//                    var HARDDISK = $("#HARDDISK").val();    //硬盘
//                    var MEMORY = $("#MEMORY").val();        //内存

                    var CPUFREQ = $("#CPUFREQ")[0][$("#CPUFREQ").val()].text;
                    var DISCARD = $("#DISCARD")[0][$("#DISCARD").val()].text;
                    var HARDDISK = $("#HARDDISK")[0][$("#HARDDISK").val()].text;
                    var MEMORY = $("#MEMORY")[0][$("#MEMORY").val()].text;
                    
                    var ADMINSOFT = $("#ADMINSOFT").val();  //管理软件
                    //网吧广告                   
                    //var FACIAADSIZE = $("#FACIAADSIZE").val();
                    var FACIAADSIZE = $("#Fx1").val() + "*" + $("#Fy1").val() + "," + $("#Fx2").val() + "*" + $("#Fy2").val() + "," + $("#Fx3").val() + "*" + $("#Fy3").val(); //店头广告尺寸
                    var FACIAADNUM = $("#FACIAADNUM").val(); //店头广告数量
                    //var INDOORADSIZE = $("#INDOORADSIZE").val();
                    var INDOORADSIZE = $("#Ix1").val() + "*" + $("#Iy1").val() + "," + $("#Ix2").val() + "*" + $("#Iy2").val() + "," + $("#Ix3").val() + "*" + $("#Iy3").val(); //室内广告尺寸
                    var INDOORADNUM = $("#INDOORADNUM").val();
                    //var OUTDOORADSIZE = $("#OUTDOORADSIZE").val();
                    var OUTDOORADSIZE = $("#Ox1").val() + "*" + $("#Oy1").val() + "," + $("#Ox2").val() + "*" + $("#Oy2").val() + "," + $("#Ox3").val() + "*" + $("#Oy3").val();//室外广告尺寸
                    var OUTDOORADNUM = $("#OUTDOORADNUM").val();
                    //var REMAINADSIZE = $("#REMAINADSIZE").val();
                    var REMAINADSIZE = $("#Rx1").val() + "*" + $("#Ry1").val() + "," + $("#Rx2").val() + "*" + $("#Ry2").val() + "," + $("#Rx3").val() + "*" + $("#Ry3").val(); //其他广告尺寸
                    var REMAINADNUM = $("#REMAINADNUM").val();
                    var NAME = USERNAME;
                    var ACCOUNT = UACCOUNT;
                   
                    $.ajax({
                        url: "NBRemarkUpdate/",
                        type: "POST",
                        dataType: "json",
                        data: { NETBARID: NETBARID,
                                WIDEBAND: WIDEBAND,
                                ADMINSOFT: ADMINSOFT,
                                POSITION: POSITION,
                                CPUFREQ: CPUFREQ,
                                DISCARD: DISCARD,
                                HARDDISK: HARDDISK,
                                MEMORY: MEMORY,
                                FACIAADSIZE: FACIAADSIZE,
                                FACIAADNUM: FACIAADNUM,
                                INDOORADSIZE: INDOORADSIZE,
                                INDOORADNUM: INDOORADNUM,
                                OUTDOORADSIZE: OUTDOORADSIZE,
                                OUTDOORADNUM: OUTDOORADNUM,
                                REMAINADSIZE: REMAINADSIZE,
                                REMAINADNUM: REMAINADNUM,
                                NAME: NAME,
                                ACCOUNT: ACCOUNT
                            },
                        success: NBRemarkUpdateSuccessed
                    });
                    
                    
                    
                    
                    
                }
                
                $("input[type*='text']").val("");
                $('#remark').val("");
            }
            else if (result.isSuccessed == 0) {

                if (result.rows.length > 0) {
                    $.each(result.rows, function(i, item) {
                    alert("IP冲突!(与" + item.cell[0] + "的网吧ID是" + item.cell[1] + " 网吧名称是" + item.cell[2] + "的网吧IP冲突) ,类型:" + item.cell[3]);

                    });
                }
                return;
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
            else if (result.isSuccessed == 5) {
                alert("添加失败!");
            } else if (result.isSuccessed == 22) {
                alert("该网吧已存在!");
            }
        }

        function NBRemarkUpdateSuccessed(result) {
          
            if (result.isSuccess == 0) {
                alert("该网吧不存在！");

            }
            else if (result.isSuccess == 1) {

            alert("添加成功！");
            
            }
            else if (result.isSuccess == 2) {
                alert("没有数据!");
            }
            else if (result.isSuccess == 3) {
                alert("太多行!");
            }
            else if (result.isSuccess == 4) {
                alert("索引冲突!");
            }
            else if (result.isSuccess == 5) {
                alert("添加失败!");
            } 
        
        
        
        
        
        
        }
         
            // 字符过滤 peng
            jQuery.validator.addMethod("filterChar", function(value, element) {
                var flag = true;
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < charArray.length; i++) {
                    if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
                }
                return this.optional(element) || flag;
            }, "&nbsp;&nbsp;[含有非法字符]");

            // IP格式验证
            jQuery.validator.addMethod("ipFormat", function(value, element) {
                //alert(value);
                // value = value.trim();
                if (value.length == 0) return true;
                return this.optional(element) || /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/.test(value);
            }, "&nbsp;&nbsp;[请正确输入您的IP!]");
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            jQuery.validator.addMethod("wideBand", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择宽带接入方式]");

            jQuery.validator.addMethod("pOsition", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择地段]");

            jQuery.validator.addMethod("cPUFREQ", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择CPU类型]");

            jQuery.validator.addMethod("dISCARD", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择显卡类型");

            jQuery.validator.addMethod("hARDDISK", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择硬盘类型]");

            jQuery.validator.addMethod("mEMORY", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择内存类型]");

            jQuery.validator.addMethod("aDMINSOFT", function(value, element) {
                var flag = true;
                if (element.length > 0) {
                    for (i = 0; i < element.length; i++) {
                        if (element[i].selected == true) {
                            flag = true;
                            break;
                        }
                        else {
                            flag = false;
                        }
                    }
                }
                return flag;
            }, "&nbsp;&nbsp;[请选择管理]");
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            $("#form1").validate({
             rules:
             {
                 barName: { required: true, filterChar: true },
                 province: { required: true, filterChar: true },
                 city: { required: true, filterChar: true },
                 county: { required: true, filterChar: true },
                 netbarAddr: { required: true, filterChar: true },
                 netbarAddr1: { required: true, filterChar: true },
                 netbarAddr2: { required: true, filterChar: true },
                 linkMan: { required: true, filterChar: true },
                 phone: { required: true, number: true, filterChar: true },
                 macNum: { required: true, number: true, filterChar: true },
                 remark: { required: true,  filterChar: true },
                 ip1: { ipFormat: true },
                 ip2: { ipFormat: true },
                 ip3: { ipFormat: true },
                 ip4: { ipFormat: true },
                 ip5: { ipFormat: true },
                 wobbleIP1: { ipFormat: true },
                 wobbleIP2: { ipFormat: true },

                 WIDEBAND: { wideBand: true },
                 POSITION: { pOsition: true },
                 CPUFREQ: { cPUFREQ: true },
                 DISCARD: { dISCARD: true},
                 HARDDISK: { hARDDISK: true },
                 MEMORY: { mEMORY: true },
                 ADMINSOFT: { aDMINSOFT: true }
                   
             },
            messages:
            {
                 barName: { required: "&nbsp;&nbsp;[网吧名称不能为空]"},
                 province: { required: "&nbsp;&nbsp;[省份不能为空]" },
                 city: { required: "&nbsp;&nbsp;[城市不能为空]"},
                 county: { required: "&nbsp;&nbsp;[区/县不能为空]"},
                 netbarAddr: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                 netbarAddr1: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                 netbarAddr2: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                 linkMan: { required: "&nbsp;&nbsp;[联系人不能为空]" },
                 phone: { required: "&nbsp;&nbsp;[联系电话不能为空]", number: "&nbsp;&nbsp;[联系电话必须是数字]"},
                 macNum: { required: "&nbsp;&nbsp;[机器数量不能为空]", number: "&nbsp;&nbsp;[机器数量必须是数字]"},
                 remark: { required: "&nbsp;&nbsp;[备注不能为空]" },
                 ip1: { required: "&nbsp;&nbsp;[ip1不能为空]" },
                 ip2: { required: "&nbsp;&nbsp;[ip2不能为空]" },
                 ip3: { required: "&nbsp;&nbsp;[ip3不能为空]" },
                 ip4: { required: "&nbsp;&nbsp;[ip4不能为空]" },
                 ip5: { required: "&nbsp;&nbsp;[ip5不能为空]" },
                 wobbleIP1: { required: "&nbsp;&nbsp;[IP格式不正确]" },
                 wobbleIP2: { required: "&nbsp;&nbsp;[IP格式不正确]" },
                 WIDEBAND: { required: "&nbsp;&nbsp;[宽带接入不能为空]" },
                 ADMINSOFT: { required: "&nbsp;&nbsp;[管理软件不能为空]" },
                 POSITION: { required: "&nbsp;&nbsp;[位置不能为空]" },
                 CPUFREQ: { required: "&nbsp;&nbsp;[CPU不能为空]" },
                 DISCARD: { required: "&nbsp;&nbsp;[显卡不能为空]" },
                 HARDDISK: { required: "&nbsp;&nbsp;[硬盘不能为空]" },
                 MEMORY: { required: "&nbsp;&nbsp;[内存不能为空]" }
            }
        });



        $(function() {
            $("#divIframe").dialog({
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
        function Text13_onclick() {

        }

    </script>

</asp:Content>
