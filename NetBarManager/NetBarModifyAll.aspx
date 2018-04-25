<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    全部信息修改</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        更改日期:<%=DateTime.Now.ToLongDateString() %></p>
        <%
             TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
             string strNetBarID = (string)ViewData["NBid"];
             if ((string)ViewData["NBid"] == null)
             {
                 strNetBarID = string.Empty;
             }
            %>
            <span id="power"><%=account.POPEDOMID %></span>
            <span id="areaid"><%=account.AREAID %></span>
            <span id="nbid"><%=strNetBarID%></span>
            <span id="UACCOUNT"><%=account.UACCOUNT %></span>
            <span id="USERNAME"><%=account.USERNAME%></span>
    <fieldset>
        <legend>搜索网吧</legend>
        <div style="text-align:center">
            网吧编号:&nbsp;&nbsp;&nbsp;
            <input type="text" id="netbarID" disabled="disabled" />&nbsp;&nbsp;&nbsp;
            <button class="ui-state-default ui-corner-all" type="submit" onclick="searchLoad()" id="btnSearch" visible="false" disabled="disabled">
                搜索</button></div>
    </fieldset>
    <br />
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
                            <input type="text" id="province" name="province" style="width: 60px" />省&nbsp;&nbsp;
                            <input type="text" id="city" name="city" style="width: 60px" />市&nbsp;&nbsp;
                            <input type="text" id="county" name="county" style="width: 60px" />县/区 </li>
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
                <li>联系人<br />
                    <input type="text" id="linkMan" name="linkMan" /></li>
                <li>联系电话<br />
                    <input type="text" id="phone" name="phone" /></li>
               
                <li>修改原因: <br />
                    <%=Html.TextArea("remark", "N/A") %></li>
                <li>网吧备注: <br />
                    <%=Html.TextArea("intro", "N/A") %></li>
            </ul>
        </div>
    </fieldset>
    <br />
    <fieldset>
        <legend>IP 类型</legend>
        <ul>
            <li style="display: inline; list-style-type: none; line-height: 22px;">固定IP<input type="radio" name="ipType" value="1" id="type1" style="width: 60px" checked="checked" /></li>
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
       <div id="tab2-userinfo">
     <fieldset>
            <legend>硬件信息</legend>
            <ul >
               <%--<li>宽带接入<br />
                        <input type="text" id="WIDEBAND" name="WIDEBAND" /></li>
               <li>管理软件<br />
                        <input type="text" id="ADMINSOFT" name="ADMINSOFT" /></li>
               <li>地段位置<br />
                        <input type="text" id="POSITION" name="POSITION" /></li>
               <li>CPU<br />
                        <input type="text" id="CPUFREQ" name="CPUFREQ" /></li>
               <li>显卡<br />
                        <input type="text" id="DISCARD" name="DISCARD" /></li>
               <li>硬盘<br />
                        <input type="text" id="HARDDISK" name="HARDDISK" /></li>
               <li>内存<br />
                        <input type="text" id="MEMORY" name="MEMORY" /></li>--%>
                        
               <li>电脑数量<br />
                    <input type="text" id="macNum" name="macNum" /></li>
               <li>宽带接入<br />
                       <select id="WIDEBAND" name="WIDEBAND" style="width: 195px" >
                           <option value="0">电信</option>
                           <option value="1">网通</option>
                           <option value="2">双线(电信+网通)</option>
                           <option value="3">其它(铁通、有线通等)</option>
                       </select>
               </li> 
               <li>地段位置<br />
                        <select id="POSITION" name="POSITION" style="width: 195px" >
                            <option value="0">市区</option>
                            <option value="1">高校区</option>
                            <option value="2">郊区</option>
                            <option value="3">其他</option>

                        </select>
               </li>
               <li>CPU<br />
                        <select id="CPUFREQ" name="CPUFREQ" style="width: 195px" >
                     <%--       <option value="0">主频3.0G及以上双核</option>
                            <option value="1">主频2.4G-3.0G单核或双核</option>
                            <option value="2">主频2.4G以下单核</option>--%>
                            <option value="0">2GHz以下（低功耗）</option>
                            <option value="1">2GHz-2.6GHz（家用/办公）</option>
                            <option value="2">2.6GHz-3GHz（游戏/娱乐）</option>
                            <option value="3">3GHz以上（极致性能）</option>
                        </select>
               </li>
               <li>显卡<br />
                        <select id="DISCARD" name="DISCARD" style="width: 195px" >
                          <%--  <option value="0">1G以上</option>
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
               <li>硬盘<br />
                        <select id="HARDDISK" name="HARDDISK" style="width: 195px" >
                    <%--        <option value="0">100G以上</option>
                            <option value="1">50G-100G</option>
                            <option value="2">50G以下</option>
                            <option value="3">无盘网吧系统</option>--%>
                            <option value="0">有盘网吧系统</option>
                            <option value="1">无盘网吧系统</option>
                        </select>
               </li>
               <li>内存<br />
                        <select id="MEMORY" name="MEMORY" style="width: 195px" >
                           <%-- <option value="0">2G以上</option>
                            <option value="1">1G-2G</option>
                            <option value="2">1G以下</option>--%>
                            <option value="0">2G以上</option>
                            <option value="1">2G</option>
                            <option value="3">1G</option>
                            <option value="2">1G以下</option>
                        </select>
               </li>
               <li>管理软件<br />
                        <select id="ADMINSOFT" name="ADMINSOFT" style="width: 195px" >
                            <option value="0">易游</option>
                            <option value="1">迅闪</option>
                            <option value="2">锐起</option>
                            <option value="3">强者</option>
                            <option value="4">网维大师</option>
                            <option value="5">网众</option>
                            <option value="6">信佑</option>
                            <option value="7">其他</option>
                        </select>
               </li>
               <li>网吧广告<input type="radio" name="tab2-pass" checked="checked" value="1" />是<input type="radio" name="tab2-pass"
                        id="tab2-pass" value="2" />否</li>
                        
                   
            </ul>
        </fieldset>
         </div>
            <div id="tab2-upgrade">
                <fieldset>
                    <legend>网吧广告</legend>
                    <ul class="verticality" id="tab4-account">
                        <li style="color:Red;">单位:厘米</li>
                        <li>店头招牌大小<br />
                            <%--<input type="text" id="FACIAADSIZE" name="FACIAADSIZE" style="width: 128px" />--%>
                            1.高<input type="text" id="Fx1" name="FACIAADSIZEx1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy1" name="FACIAADSIZEy1" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            2.高<input type="text" id="Fx2" name="FACIAADSIZEx2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy2" name="FACIAADSIZEy2" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
                            3.高<input type="text" id="Fx3" name="FACIAADSIZEx3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Fy3" name="FACIAADSIZEy3" style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />

                        </li>
                        
                        <li>店头招牌数量<br />
                            <input type="text" id="FACIAADNUM" name="FACIAADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                                       
                        <li>室内位置大小<br />
                           <%-- <input type="text" id="INDOORADSIZE" name="INDOORADSIZE" />--%>
                            1.高<input type="text" id="Ix1" name="INDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy1" name="INDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Ix2" name="INDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy2" name="INDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Ix3" name="INDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Iy3" name="INDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>室内位置数量<br />
                            <input type="text" id="INDOORADNUM" name="INDOORADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>户外位置大小<br />
                            <%--<input type="text" id="OUTDOORADSIZE" name="OUTDOORADSIZE" />--%>
                            1.高<input type="text" id="Ox1" name="OUTDOORADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy1" name="OUTDOORADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Ox2" name="OUTDOORADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy2" name="OUTDOORADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Ox3" name="OUTDOORADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Oy3" name="OUTDOORADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>户外位置数量<br />
                            <input type="text" id="OUTDOORADNUM" name="OUTDOORADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                        <li>其他招牌大小<br />
                           <%-- <input type="text" id="REMAINADSIZE" name="REMAINADSIZE" />--%>
                            1.高<input type="text" id="Rx1" name="REMAINADSIZEEx1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry1" name="REMAINADSIZEEy1"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            2.高<input type="text" id="Rx2" name="REMAINADSIZEEx2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry2" name="REMAINADSIZEEy2"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                            3.高<input type="text" id="Rx3" name="REMAINADSIZEEx3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>*宽<input type="text" id="Ry3" name="REMAINADSIZEEy3"  style="width: 65px" onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        <li>其他招牌数量<br />
                            <input type="text" id="REMAINADNUM" name="REMAINADNUM"   onkeyup ="value=value.replace(/[^\d\-]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
                        </li>
                        
                    </ul>
                </fieldset>
               
           
            </div>
    <p style="text-align: center">
        <button id="submitBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="submitInfo()">
            提交</button></p>
    </form>
    
    <div id="netbarStatus">
    <fieldset>
        <legend>网吧状态更改</legend>
        <ul class="verticality">
            <li>网吧状态:&nbsp;<span id="status"></span></li>
            <li>现锁定人:&nbsp;<span id="lockaccount"></span></li>
            <li>锁定时间:&nbsp;<span id="lockTime"><%=DateTime.Now.ToLongDateString() %></span></li>
            <li>解除锁定, 改为绑定&nbsp;<input type="radio" name="newStatus" value="2" id="NewStatus1" style="width: 60px"/></li>
            <li>解除锁定, 改为登记&nbsp;<input type="radio" name="newStatus" value="1" id="NewStatus2" style="width: 60px" /></li>
            <li>更改原因<br /> <%=Html.TextArea("reason")%></li>
        </ul>
    </fieldset>
    <p style="text-align: center"> <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="updateStatus()">更新网吧状态</button></p>
    </div>
    <script language="javascript" type="text/javascript">
        var ipAddrType;
        var oriID;
        $("#power").hide();
        $("#areaid").hide();
        $("#nbid").hide();
        var UACCOUNT = $("#UACCOUNT").html();
        var USERNAME = $("#USERNAME").html();
        $("#UACCOUNT").hide();
        $("#USERNAME").hide();
        function searchLoad() {
            oriID = $("#netbarID").val();
            var intExp = /^[1-9]\d*$/;
            var strUrl;
            var areaid = $("#areaid").html();
            var power = $("#power").html();
            if (power == 5 || power == "5") {
                var pm641 = BASE64.encode(oriID + "," + areaid);
                strUrl = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID2/" + pm641;
            }
            else {
                var pm64 =  BASE64.encode(oriID);
                strUrl = "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID/" + pm64
            }
            if (oriID.match(intExp) == null) {
                alert("网吧编号必须是正整数!");
                return false;
            } else {
                $.ajax({
                url: strUrl,
                    dataType: 'json',
                    type: 'POST',
                    success: netbarSuccessed
                });
            }
        }

        function netbarSuccessed(result) {
            if (result.isSuccessed != 0) {
                $("#WIDEBAND").val(result.wideband);
                $("#ADMINSOFT").val(result.adminsoft);
                $("#POSITION").val(result.position);

                var cpuVal = 0;
                var dispVal = 0;
                var hdVal = 0;
                var memVal = 0;

                //CPU
                switch (result.cpufreq) {
                    case '2GHz以下（低功耗）':
                        cpuVal = 0;
                        break;
                    case '2GHz-2.6GHz（家用/办公）':
                        cpuVal = 1;
                        break;
                    case '2.6GHz-3GHz（游戏/娱乐）':
                        cpuVal = 2;
                        break;
                    case '3GHz以上（极致性能）':
                        cpuVal = 3;
                        break;
                }

                //DisplayCard
                switch (result.discard) {
                    case 'N卡X系及同级A卡':
                        dispVal = 0;
                        break;
                    case 'N卡9系及同级A卡':
                        dispVal = 1;
                        break;
                    case 'N卡8系及同级A卡':
                        dispVal = 2;
                        break;
                    case 'N卡7系及同级A卡':
                        dispVal = 3;
                        break;
                    case '其他低端':
                        dispVal = 4;
                        break;
                }

                //HD
                switch (result.harddisk) {
                    case '有盘网吧系统':
                        hdVal = 0;
                        break;
                    case '无盘网吧系统':
                        hdVal = 1;
                        break;
                }

                //memory
                switch (result.memory) {
                    case '2G以上':
                        memVal = 0;
                        break;
                    case '2G':
                        memVal = 1;
                        break;
                    case '1G':
                        memVal = 2;
                        break;
                    case '1G以下':
                        memVal = 3;
                        break;
                }

                $("#CPUFREQ").val(cpuVal);
                $("#DISCARD").val(dispVal);
                $("#HARDDISK").val(hdVal);
                $("#MEMORY").val(memVal);
//                $("#CPUFREQ").val(result.cpufreq);
//                $("#DISCARD").val(result.discard);
//                $("#HARDDISK").val(result.harddisk);
//                $("#MEMORY").val(result.memory);
                
                       
                $("#barName").val(result.barname);
                $("#province").val(result.province);
                $("#city").val(result.city);
                $("#county").val(result.county);
                $("#linkMan").val(result.linkman);
//                $("#netbarAddr").val(result.address);
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
                
                $("#phone").val(result.phone);
                $("#macNum").val(result.macnum);
                $("#status").html(result.status);
                $("#lockname").html(result.lockname);

                $("#ip input").val("");
                $("#wobbleIP input").val("");

                if (result.iptype == '固定IP') {
                    $("input[name*='ipType']")[0].checked = true;
                    $("#wobbleIP").hide();
                    $("#ip").show();
                }
                else if (result.iptype == 'IP段') {
                    $("input[name*='ipType']")[1].checked = true;
                    $("#wobbleIP").show();
                    $("#ip").hide();
                }
                else if (result.iptype == 'ADSL') {
                    $("input[name*='ipType']")[2].checked = true;
                    $("#wobbleIP").hide();
                    $("#ip").hide();
                }

                if (result.ipaddress.length > 0) {
                    var ipArray = result.ipaddress.split(',');
                    if (result.iptype == '固定IP') {
                        $.each(ipArray, function(i, item) {
                            $("#ip input")[i].value = item;
                        });
                    } else if (result.iptype == 'IP段') {
                    ipArray = result.ipaddress.split('-');
                        $("#wobbleIP input")[0].value = ipArray[0];
                        //$("#wobbleIP input")[1].value = ipArray[ipArray.length - 2];
                        $("#wobbleIP input")[1].value = ipArray[ipArray.length - 1];
                    }
                }
                $("#intro").val(result.baseintro); 

                $('#form1').show();
                $('#netbarStatus').show();
            }
            else {

                $("#barName").val("");
                $("#province").val("");
                $("#city").val("");
                $("#county").val("");
                $("#linkMan").val("");
                $("#netbarAddr").val("");
                $("#netbarAddr1").val("");
                $("#netbarAddr2").val("");
                $("#phone").val("");
                $("#macNum").val("");
                $("#status").html("");
                $("#lockname").html("");

                $("#ip input").val("");
                $("#wobbleIP input").val("");
                $('#form1').hide();
                $('#netbarStatus').hide();
                $('#form1').hide();
                alert("该网吧编号不存在或您无权修改该网吧信息!");
            }
        }
            
        //事件绑定
        $(document).ready(function() {
            $("#wobbleIP").hide();
            $('#form1').hide();
            $('#netbarStatus').hide();
            $("#type1").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").show(400); });
            $("#type2").bind("click", function() { $("#wobbleIP").show(400); $("#ip").hide(400); });
            $("#type3").bind("click", function() { $("#wobbleIP").hide(400); $("#ip").hide(400); });
            if ($('#nbid').html() != "") {
                $("#netbarID").val($('#nbid').html());
                searchLoad();
            }

            $('#btnSearch').hide();

            //显示与隐藏网吧广告
            $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

                $("#tab2-upgrade").show(400);
            });


            $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

                $("#tab2-upgrade").hide(400);
            });

        });

        //获取网吧IP
        function getNetBarIP() {
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

            if (ipAddrType == 1) {
                ipStr = ipStr1 + ipStr2 + ipStr3 + ipStr4 + ipStr5;
            }
            else if (ipAddrType == 2) {
                ipStr = beginIP + endIP;
            }
            else if (ipAddrType == 3) {
                ipStr = "";
            }

            return ipStr;
        }

        //提交信息
        function submitInfo() {
           
            if ($("#form1").valid()) {
                // 防止 用户未加载网吧的情况下提交网吧信息
                if (oriID != $("#netbarID").val()) {
                    alert("未加载网吧信息!");
                    return false;
                }
                    
                var ipStr = getNetBarIP();
                if (ipAddrType == 1) {  //验证IP唯一性
                    var ipArray = ipStr.split(',');
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
                        var beginIPArray = $("#wobbleIP1").val().split(".");
                        var endIPArray = $("#wobbleIP2").val().split(".");
                        if (!(beginIPArray[0] == endIPArray[0] && beginIPArray[1] == endIPArray[1] && beginIPArray[2] == endIPArray[2] && parseInt(beginIPArray[3]) < parseInt(endIPArray[3]))) {
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
                var address = $("#netbarAddr").val() + "%" + $("#netbarAddr1").val() + "%" + $("#netbarAddr2").val();
                var phone = $("#phone").val();
                var macNum = $("#macNum").val();
                var ipType = ipAddrType;
                var NetBarIP = ipStr;
                var remark = $("#remark").val();
                var intro = $("#intro").val(); 

                url = "http://" + location.host + "/NetBarManager.aspx/NetBarEditFull";
                $.ajax({
                url: url,
                    type: "POST",
                    dataType: "json",
                    data: {   NetBarID: oriID,
                                BarName: barName,
                                Province: province,
                                City: city,
                                County: county,
                                LinkMan: linkMan,
                                Address: address,
                                Phone: phone,
                                MacNum: macNum,
                                IPType: ipType,
                                NetBarIP: NetBarIP,
                                Remark: remark,
                                BaseIntro:intro },
                    success: submitSuccessed
                });
            }
        }

        function submitSuccessed(result) {
            if (result.isSuccessed == 0) {
                alert("网吧IP冲突:修改失败! \n所冲突的网吧(网吧ID:" + result.NetBarId + " 网吧名:" + result.NetBarName+")");
            } else if (result.isSuccessed == 1) {
//            alert("修改成功!");
            if ($("#form1").valid()) {
               
                var NETBARID = result.NetBarId;
                var WIDEBAND = $("#WIDEBAND").val();
                var ADMINSOFT = $("#ADMINSOFT").val();
                var POSITION = $("#POSITION").val();
                
//                var CPUFREQ = $("#CPUFREQ").val();
//                var DISCARD = $("#DISCARD").val();
//                var HARDDISK = $("#HARDDISK").val();
//                var MEMORY = $("#MEMORY").val();

                var CPUFREQ = $("#CPUFREQ")[0][$("#CPUFREQ").val()].text;
                var DISCARD = $("#DISCARD")[0][$("#DISCARD").val()].text;
                var HARDDISK = $("#HARDDISK")[0][$("#HARDDISK").val()].text;
                var MEMORY = $("#MEMORY")[0][$("#MEMORY").val()].text;
                
                //var FACIAADSIZE = $("#FACIAADSIZE").val();
                var FACIAADSIZE = $("#Fx1").val() + "*" + $("#Fy1").val() + "," + $("#Fx2").val() + "*" + $("#Fy2").val() + "," + $("#Fx3").val() + "*" + $("#Fy3").val(); //店头广告尺寸
                var FACIAADNUM = $("#FACIAADNUM").val();

                //var INDOORADSIZE = $("#INDOORADSIZE").val();
                var INDOORADSIZE = $("#Ix1").val() + "*" + $("#Iy1").val() + "," + $("#Ix2").val() + "*" + $("#Iy2").val() + "," + $("#Ix3").val() + "*" + $("#Iy3").val(); //室内广告尺寸
                var INDOORADNUM = $("#INDOORADNUM").val();

                //var OUTDOORADSIZE = $("#OUTDOORADSIZE").val();
                var OUTDOORADSIZE = $("#Ox1").val() + "*" + $("#Oy1").val() + "," + $("#Ox2").val() + "*" + $("#Oy2").val() + "," + $("#Ox3").val() + "*" + $("#Oy3").val(); //室外广告尺寸
                var OUTDOORADNUM = $("#OUTDOORADNUM").val();

                //var REMAINADSIZE = $("#REMAINADSIZE").val();
                var REMAINADSIZE = $("#Rx1").val() + "*" + $("#Ry1").val() + "," + $("#Rx2").val() + "*" + $("#Ry2").val() + "," + $("#Rx3").val() + "*" + $("#Ry3").val(); //其他广告尺寸
                var REMAINADNUM = $("#REMAINADNUM").val();
                var NAME = USERNAME;
                var ACCOUNT = UACCOUNT;
                url = "http://" + location.host + "/NetBarManager.aspx/NBRemarkUpdate";
                $.ajax({
                url: url,
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
                
                
                
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 2) {
                alert("该网吧不存在!");
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            }
            else if (result.isSuccessed == 5) {
                alert("修改失败!");
            }
        }
        
        
        
        function NBRemarkUpdateSuccessed(result) {
          
            if (result.isSuccess == 0) {
                alert("该网吧不存在！");

            }
            else if (result.isSuccess == 1) {

            alert("修改成功！");
                history.go(-1);
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
        // 字符过滤
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
                 remark: { required: true, filterChar: true },
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
                 DISCARD: { dISCARD: true },
                 HARDDISK: { hARDDISK: true },
                 MEMORY: { mEMORY: true },
                 ADMINSOFT: { aDMINSOFT: true }
             },
            messages:
            {
                barName: { required: "&nbsp;&nbsp;[网吧名称不能为空]" },
                province: { required: "&nbsp;&nbsp;[省份不能为空]" },
                city: { required: "&nbsp;&nbsp;[城市不能为空]" },
                county: { required: "&nbsp;&nbsp;[区/县不能为空]" },
                netbarAddr: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                netbarAddr1: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                netbarAddr2: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                linkMan: { required: "&nbsp;&nbsp;[联系人不能为空]" },
                phone: { required: "&nbsp;&nbsp;[联系电话不能为空]", number: "&nbsp;&nbsp;[联系电话必须是数字]" },
                macNum: { required: "&nbsp;&nbsp;[机器数量不能为空]", number: "&nbsp;&nbsp;[机器数量必须是数字]" },
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

        function updateStatus() {
            var reasonValue = $("#reason").val();
            if (reasonValue == "") {
                alert("更改原因不能为空!");
                return false;
            } else {
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < reasonValue.length; i++) {
                    if (reasonValue.indexOf(charArray[i]) != -1) {
                       /// alert("更改原因含有非法字符!");
                       /// return false;
                    }
                }
            }

            var statusValue = $("input[name*='newStatus']")[0].checked ? 2 : 1;
            url = "http://" + location.host + "/NetBarManager.aspx/NetBarUnlock";
            $.ajax({
                url: url,
                dataType: 'json',
                type: 'POST',
                data: { NetBarID: oriID, NewStatus: statusValue, Reason: reasonValue },
                success: statusSuccessed
            });
        }

        function statusSuccessed(result) {
            if (result.isSuccessed == 1) {
                alert("修改成功!");
                history.go(-1);
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 2) {
                alert("该网吧不存在!");
                $("#form1").hide();
                $('#netbarStatus').hide();
                $("input[type*='text']").val("");
            } else if (result.isSuccessed == 3) {
                alert("该网吧未被绑定或锁定!");
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
