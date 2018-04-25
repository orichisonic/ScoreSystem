<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧基本信息修改

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            string strNetBarID = (string)ViewData["NBid"];
            if ((string)ViewData["NBid"] == null)
            {
                strNetBarID = string.Empty;
            }
        %>
<span id="areaid"><%=account.AREAID %></span>
<span id="nbid"><%=strNetBarID%></span>
<span id="USERNAME"><%=account.USERNAME%></span>
    <p style="text-align: center; color: Orange; font-size: 14px; font-weight: bold;">
        更改日期:<%=DateTime.Now.ToLongDateString() %></p>
    <fieldset>
        <legend>搜索网吧</legend>
        <div style="text-align:center">
           网吧编号:&nbsp;&nbsp;&nbsp;<input type="text" id="netbarID"  disabled="disabled"/>&nbsp;&nbsp;&nbsp;<button class="ui-state-default ui-corner-all" type="button" onclick="searchLoad()" id="btnSearch">搜索</button></div>
    </fieldset>
    <br />
    <form id="form1">
    <fieldset>
        <legend>基本信息</legend>
        <div>
            <ul class="verticality">
                <li>网吧名称<br />
                    <input type="text" id="barName" name="barName" /></li>
                <li>网吧地址<br />
                   <%-- <input type="text" id="netbarAddr" name="netbarAddr" /></li>--%>
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
                <li>更改原因<br />
                    <%=Html.TextArea("remark", "N/A") %></li>
              </ul>
        </div>
    </fieldset>
    <div id="tab2-userinfo">
    <fieldset>
            <legend>硬件信息</legend>
            <ul >                        
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
     <%--                       <option value="0">主频3.0G及以上双核</option>
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
                           <%-- <option value="0">1G以上</option>
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
                            <option value="0">有盘网吧系统</option>
                            <option value="1">无盘网吧系统</option>
                        </select>
               </li>
               <li>内存<br />
                        <select id="MEMORY" name="MEMORY" style="width: 195px" >
                            <option value="0">2G以上</option>
                            <option value="1">2G</option>
                            <option value="2">1G</option>
                            <option value="3">1G以下</option>
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
   

    <script type="text/javascript" language="javascript">
        var oriID;
        var areaid;
        var UACCOUNT = $("#UACCOUNT").html();
        var USERNAME = $("#USERNAME").html();
        $(document).ready(function() {
            $("#areaid").hide();
            $('#form1').hide();
            $('#nbid').hide();
            $('#btnSearch').hide();
            $('#USERNAME').hide();
            
            if ($('#nbid').html() != "") {
                
                $("#netbarID").val($('#nbid').html());
                searchLoad();
            }

            //显示与隐藏网吧广告
            $("#tab2-userinfo li:last-child > input:first").bind("click", function() {

                $("#tab2-upgrade").show(400);
            });


            $("#tab2-userinfo li:last-child > input:last").bind("click", function() {

                $("#tab2-upgrade").hide(400);
            });

        });

        function searchLoad() {
        
            oriID = $("#netbarID").val();
            areaid = $("#areaid").html();
            var intExp = /^[1-9]\d*$/;
            if (oriID.match(intExp) == null) {
                alert("网吧编号必须是正整数!");
                return false;
            } else {
            var pm641 = BASE64.encode(oriID + "," + areaid);
                $.ajax({
                url: "http://" + location.host + "/NetBarManager.aspx/LoadNetBarByID2/" + pm641,
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
                

                //店头广告大小
                //$("#FACIAADSIZE").val(result.faciaadsize);
                var FacSize = result.faciaadsize.split(',');
                for (idx = 0; idx < FacSize.length; idx++) {
                    var FSizeOne = FacSize[idx].split('*');
                    if (FSizeOne.length >= 1) {
                        $("#Fx" + (idx + 1)).val(FSizeOne[0]);
                    }
                    if (FSizeOne.length >= 2) {
                        $("#Fy" + (idx + 1)).val(FSizeOne[1]);
                    }
                }
                //店头广告数量
                $("#FACIAADNUM").val(result.faciaadnum);
                /////////////////////////////////////////////////////////////////
                //室内广告大小
                //$("#INDOORADSIZE").val(result.indooradsize);
                var InSize = result.indooradsize.split(',');
                for (idx1 = 0; idx1 < InSize.length; idx1++) {
                    var InSizeOne = InSize[idx1].split('*');
                    if (InSizeOne.length >= 1) {
                        $("#Ix" + (idx1 + 1)).val(InSizeOne[0]);
                    }
                    if (InSizeOne.length >= 2) {
                        $("#Iy" + (idx1 + 1)).val(InSizeOne[1]);
                    }
                }
                //室内广告数量
                $("#INDOORADNUM").val(result.indooradnum);
                ///////////////////////////////////////////////////////////////

                //室外广告大小
                //$("#OUTDOORADSIZE").val(result.outdooradsize);
                var OutSize = result.outdooradsize.split(',');
                for (idx2 = 0; idx2 < OutSize.length; idx2++) {
                    var OutSizeOne = OutSize[idx2].split('*');
                    if (OutSizeOne.length >= 1) {
                        $("#Ox" + (idx2 + 1)).val(OutSizeOne[0]);
                    }
                    if (OutSizeOne.length >= 2) {
                        $("#Oy" + (idx2 + 1)).val(OutSizeOne[1]);
                    }
                }
                //室外广告数量
                $("#OUTDOORADNUM").val(result.outdooradnum);
                ///////////////////////////////////////////////////////////////

                //其他广告大小
                //$("#REMAINADSIZE").val(result.remainadsize);
                var RemainSize = result.remainadsize.split(',');
                for (idx3 = 0; idx3 < RemainSize.length; idx3++) {
                    var RemainSizeOne = RemainSize[idx3].split('*');
                    if (RemainSizeOne.length >= 1) {
                        $("#Rx" + (idx3 + 1)).val(RemainSizeOne[0]);
                    }
                    if (RemainSizeOne.length >= 2) {
                        $("#Ry" + (idx3 + 1)).val(RemainSizeOne[1]);
                    }
                }
                //其他广告数量
                $("#REMAINADNUM").val(result.remainadnum);
                
                
                $("#barName").val(result.barname);
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
                $("#linkMan").val(result.linkman);
                $("#phone").val(result.phone);
                $("#macNum").val(result.macnum);

                $('#form1').show();
            }
            else {
                $("#barName").val("");
                $("#netbarAddr").val("");
                $("#netbarAddr1").val("");
                $("#netbarAddr2").val("");
                $("#linkMan").val("");
                $("#phone").val("");
                $("#macNum").val("");

                $('#form1').hide();
                alert("该网吧编号不存在或您无权修改该网吧信息!");
                
            }
         }

            jQuery.validator.addMethod("filterChar", function(value, element) {
                var flag = true;
                var charArray = new Array('<', '>', '%', '&', '|', '(', ')');
                for (var i = 0; i < charArray.length; i++) {
                    if (value.indexOf(charArray[i]) != -1) { flag = false; break;}
                }
                return this.optional(element) || flag;
            }, "&nbsp;&nbsp;[含有非法字符]");
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
                     netbarAddr: { required: true, filterChar: true },
                     netbarAddr1: { required: true, filterChar: true },
                     netbarAddr2: { required: true, filterChar: true },
                     linkMan: { required: true, filterChar: true },
                     phone: { required: true, number: true, filterChar: true },
                     macNum: { required: true, number: true, filterChar: true },
                     remark: { required: true, filterChar: true },

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
                    netbarAddr: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                    netbarAddr1: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                    netbarAddr2: { required: "&nbsp;&nbsp;[网吧地址不能为空]" },
                    linkMan: { required: "&nbsp;&nbsp;[联系人不能为空]" },
                    phone: { required: "&nbsp;&nbsp;[联系电话不能为空]", number: "&nbsp;&nbsp;[联系电话必须是数字]" },
                    macNum: { required: "&nbsp;&nbsp;[机器数量不能为空]", number: "&nbsp;&nbsp;[机器数量必须是数字]" },
                    remark: { required: "&nbsp;&nbsp;[更改原因不能为空]" },

                    WIDEBAND: { required: "&nbsp;&nbsp;[宽带接入不能为空]" },
                    ADMINSOFT: { required: "&nbsp;&nbsp;[管理软件不能为空]" },
                    POSITION: { required: "&nbsp;&nbsp;[位置不能为空]" },
                    CPUFREQ: { required: "&nbsp;&nbsp;[CPU不能为空]" },
                    DISCARD: { required: "&nbsp;&nbsp;[显卡不能为空]" },
                    HARDDISK: { required: "&nbsp;&nbsp;[硬盘不能为空]" },
                    MEMORY: { required: "&nbsp;&nbsp;[内存不能为空]" }
                }
            });


            function submitInfo() {
                if ($("#form1").valid()) {
                
                    if (oriID != $("#netbarID").val()) {
                        alert("未加载网吧信息!");
                        return false;
                    }
                    
                   var barID = $("#netbarID").val();
                   var barName = $("#barName").val();
                   var address = $("#netbarAddr").val() + "%" + $("#netbarAddr1").val() + "%" + $("#netbarAddr2").val();
                   var linkMan = $("#linkMan").val();
                   var phone = $("#phone").val();
                   var macNum = $("#macNum").val();
                   var remark = $("#remark").val();

                    $.ajax({
                        url: "http://" + location.host + "/NetBarManager.aspx/NetBarEditBasic/",
                        type: "POST",
                        dataType: "json",
                        data: { NetBarID: barID, BarName: barName, LinkMan: linkMan, Address: address, Phone: phone, MacNum: macNum,  Remark: remark },
                        success: submitSuccessed
                    });
                }
            }

            function submitSuccessed(result) {
                if (result.isSuccessed) {
                    //alert("修改成功");
                 
                    if ($("#form1").valid()) {

                        var NETBARID = $("#netbarID").val(); ;
                        var WIDEBAND = $("#WIDEBAND").val();
                        var ADMINSOFT = $("#ADMINSOFT").val();
                        var POSITION = $("#POSITION").val();
                        
//                        var CPUFREQ = $("#CPUFREQ").val();
//                        var DISCARD = $("#DISCARD").val();
//                        var HARDDISK = $("#HARDDISK").val();
//                        var MEMORY = $("#MEMORY").val();

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
                  
                    //history.go(-1);
                }
                else {
                    alert("修改失败");
                }
            }

            function NBRemarkUpdateSuccessed(result) {

                if (result.isSuccess == 0) {
                    alert("该网吧不存在！");

                }
                else if (result.isSuccess == 1) {
                    $('#form1').hide();
                    $("input[type*='text']").val("");
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
