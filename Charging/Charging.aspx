<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	网吧打卡
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];%>
            <span id="power"><%=account.POPEDOMID %></span>
            <span style=" display:none" id="account"><%=account.UACCOUNT %></span>
   <span style="color:Blue; font-weight:bolder">你的当前ip为:</span><span style="color:Blue; font-weight:bolder" id="ip"><%=ViewData["ClientIp"].ToString()%></span><span style="color:Blue; font-weight:bolder">，请核对是否与所选择网吧实际ip一致。</span>
<%--   <span id="ip2"></span>--%>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">网吧打卡</a></li>
           
        </ul>
        <div id="tabs-1" style="text-align:left">
   
               <table style="" border="0"  cellpadding="0" cellspacing="0">
               <tr ><td style=" vertical-align:bottom" id="zone">所在大区:</td>
               <td style="width: 100px; text-align:left"><select name="zone2" id="zone2">
                    <%if (account.POPEDOMID == 8)
                      {
                          List<TGProject.Models.TGSZONESHOW> zoneList2 = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList2)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%
                        }
                      }
                      else
                      {
                    %>
                    <option value="<%=account.AREAID%>">默认</option>
                    <%} %>
                </select></td><td></td><td style=" text-align:right; vertical-align:bottom" id="city">所在城市:</td><td style="width: 101px">
                    <select id="area2">
                        <%if (account.POPEDOMID ==8)
                          { %>
                        <option value="<%=account.AREAID %>">默认</option>
                        <% }%>
                    </select></td><td style=" text-align:right; vertical-align:bottom">网吧名称:</td>
                <td  style="padding-left:28px;width:200px"><select name="netName" id="netName">
                               <%
                                if (account.POPEDOMID ==7)
                      {
                                List<TGProject.Models.WModels.TGSNETBARBYACCOUNT> netbarList = (List<TGProject.Models.WModels.TGSNETBARBYACCOUNT>)ViewData["NetBarByAccount"];
                              foreach (TGProject.Models.WModels.TGSNETBARBYACCOUNT netbar in netbarList)
                              {
                                  string values =netbar.NETBARID+","+netbar.BARNAME+","+account.UACCOUNT+","+account.POPEDOMID;
                                  
                                  %>
                            <option value="<%=values %>">
                                <%=netbar.BARNAME%></option>
                           <%}
                      }
                                else if (account.POPEDOMID == 6)
                                  {
                                      List<TGProject.Models.WModels.TGSNETBARBYSTATUS> netbarList = (List<TGProject.Models.WModels.TGSNETBARBYSTATUS>)ViewData["ZhuguanNetBarByStatus"];
                                foreach (TGProject.Models.WModels.TGSNETBARBYSTATUS netbar in netbarList)
                              {
                                  string values =netbar.NETBARID+","+netbar.BARNAME+","+account.UACCOUNT+","+account.POPEDOMID;
                                  
                                  %>
                            <option value="<%=values %>">
                                <%=netbar.BARNAME%></option>
                           <%}
                      }
                         else if (account.POPEDOMID == 8)
                                  {
                                      List<TGProject.Models.WModels.TGSNETBARBYSTATUS> netbarList = (List<TGProject.Models.WModels.TGSNETBARBYSTATUS>)ViewData["NetBarByAccount"];
                                foreach (TGProject.Models.WModels.TGSNETBARBYSTATUS netbar in netbarList)
                              {
                                  string values = netbar.NETBARID + "," + netbar.BARNAME +"," + account.UACCOUNT + "," + account.POPEDOMID;
                                  
                                  %>
                            <option value="<%=values %>">
                                <%=netbar.BARNAME%></option>
                           <%}
                      }
                      %>
                      
                       </select></td></tr>
                <tr><td style="">网吧编号:</td><td colspan="2" id="netNumber" style=" padding-left:28px;color: #FF0000"></td>
                    <td style="width: 100px; text-align:right ">网吧等级:</td><td colspan="2" id="netLevel" style=" margin-left:1px;padding-left:28px;color: #FF0000"></td></tr>
                <tr><td style="" >所在省市:</td> <td id="Region" style="padding-left:28px;vertical-align:middle;width: 100px; color: #FF0000"></td>
                 <td></td>
                    <td style="width: 100px; text-align:right; ">所在城市:</td><td id="City" style="padding-left:28px;width: 100px ; color: #FF0000;vertical-align:middle "></td> 
                    <td style="width: 100px; text-align:right">所在区县:</td><td  style=" padding-left:28px;vertical-align:middle" id="District" style="color: #FF0000"></td></tr> 
               <%-- <li>办事处 <span id="Office"></span></li> --%>
                <tr><td>详细地址:</td><td colspan="6" id="AddressDetail" style="padding-left:28px;color: #FF0000"></td></tr> 
              
                <tr><td style="">联系人员:</td><td  colspan="2" id="Contract" style="padding-left:28px;vertical-align:middle;color: #FF0000"></td>
                    <td  colspan="1" style="width: 100px; text-align:right ">联系电话:</td><td id="Tel" colspan="2" style="padding-left:28px;color: #FF0000"></td></tr>
               
                <tr><td style="vertical-align:top; ">IP信息:</td><td style="padding-left:28px;"  colspan="5"> <select name="IPType" id="IPType" disabled>
                            <option value="1">
                               固定IP</option>
                                <option value="2">
                               IP段</option>
                                <option value="3">
                               ADSL</option>
                        
                       </select><div id="IPtxt"></div>  </td>

                       <td colspan="0"  id="IPtxt1">
                        
                       </td></tr>
                 <tr><td >打卡时间:</td><td id="PunchCardTime" colspan="3" style="padding-left:28px;color: #FF0000"></td></tr>
                 <tr><td >打卡状态:</td><td id="PunchCardStatus" colspan="3" style="padding-left:28px;color: #FF0000"></td></tr>
                <tr><td colspan="6" align="center"> 
                <button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab1submitInfo()">
                    打卡</button>
            </td></tr>
            </table>
   
   </div>
   </div>
  <script type="text/javascript">
     $('#tabs').tabs();
      var userID = 0;
    var tabsIndex = 0;
    var power = 0;
    var ip = 0;
    var ip2 = 0;
    $(document).ready(function() {

//        xml = new ActiveXObject("Microsoft.XMLHTTP");
//        xml.open("GET", "http://www.ip138.com/", false);
//        xml.send();
//        kk = xml.ResponseText;
//        alert(kk);
//        i = kk.indexOf("官方数据查询");
//        document.write("风云查询你的IP是:");
//        document.write(kk.substring(i + 10, i + 30));


        $("#zone2").change(function() { loadArea2() });
        $("#area2").change(function() { loadNetbar() });
        //        $('#tabs').bind('tabsselect', function(event, ui) { loadData(ui.index) });


        // 权限设置
        power = $("#power").html();
        ip = $("#ip").html();
        if (power == 7 || power == 8 || power == 6) {
            $("#tabs-1").show();
            $("#tabs").show();
        }
        else {
            $("#tabs-1").hide();
            $("#tabs").hide();
        }

        if (power == 8) {

            $("#zone").show();
            $("#zone2").show();
            $("#city").show();
            $("#area2").show();
        }

        else {
            //peng
            //$("#zone").hide();
            $("#zone2").hide();
            //$("#city").hide();
            $("#area2").hide();

        }

        $("#power").hide();
        //        $("#ip").hide();

        $("#netName").change(loadnetbarinfo);
        loadnetbarinfo();
    });

//   if (power == 4)
    // loadArea();

     //选择网吧姓名进行网吧ID传递获得网吧详细信息
    function loadnetbarinfo() {

        if ($("#netName").val() == null) {
        
        $("#Button1").attr("disabled",true);
         }
        else {

            var strArray = $("#netName").val().split(",");
            var netBarId = strArray[0];
            var netBarName = strArray[1];

            $.ajax({
            url: "LoadNetbarInfo/" + encodeURIComponent(netBarId),
                type: "POST",
                dataType: "json",
                success: loadNetbarinfoSuccessed
            });
        
        }
    
    }
    function loadNetbarinfoSuccessed(result) {
     
        $("#PunchCardTime").html("");
        $("#PunchCardStatus").html("");
        $("#AddressDetail").html(result.rows[0].cell[0]);
        $("#netNumber").html(result.rows[0].cell[17]);
        $("#netLevel").html(result.rows[0].cell[10]);
        $("#Region").html(result.rows[0].cell[19]);
        $("#City").html(result.rows[0].cell[5]);
        //$("#City").html(result.rows[0].cell[6]);
        $("#District").html(result.rows[0].cell[6]);
        $("#Tel").html(result.rows[0].cell[18]);
        $("#Contract").html(result.rows[0].cell[13]);
        
//        alert(strIP.length);
          var strIP;
          if (result.rows[0].cell[12] == "固定IP") {
         strIP= result.rows[0].cell[11].split(",");
     }
    else if (result.rows[0].cell[12] == "IP段") {
         strIP = result.rows[0].cell[11].split("-");
     }
     else {
         strIP = result.rows[0].cell[11].split(",");
     }
       
        $("#IPtxt input[type='text']").each(function(i) {
            $(this).remove();
        });
        for (var i = 0; i < strIP.length; i++) {
            if (strIP[i] != "")
                $("#IPtxt").append("<input readonly=readonly type=\"text\" value=" + strIP[i] + " id=\"text" + i + "\" /> ");
        }

//        alert(result.rows[0].cell[12]);
        if (result.rows[0].cell[12] == "固定IP") {
            $("#IPType").attr("value", 1);
        }
        else if (result.rows[0].cell[12] == "ADSL")
            $("#IPType").attr("value", 3);
        else if (result.rows[0].cell[12] == "IP段")
            $("#IPType").attr("value", 2);

    }

    function tab1submitInfo() {


        if ($("#netName").val() == null) {
            alert("你还没有选择网吧");  
           
        }
        else {
//            xml = new ActiveXObject("Microsoft.XMLHTTP");
//                  xml.open("GET", "http://www.ip138.com/", false);
//            xml.send();
//            kk = xml.ResponseText;
//            alert(kk);
//            i = kk.indexOf("官方数据查询");
//            document.write("风云查询你的IP是:")
//            document.write(kk.substring(i + 10, i + 30));   
            var strArray = $("#netName").val().split(",");
            var netBarId = strArray[0];
            var netBarName = strArray[1];
            var account = strArray[2];
            var popom = strArray[3];
           // alert(account);
            if (account == null) {
                account = $('#account').html();
            }
            if (popom == null) {
                popom = power;
            }
           // alert(account);
            var newip;
            
            var type;
            if (popom == 7)
                type = 1;
            else if (popom == 6)
                type = 2;
            else if (popom == 8)
                type = 3;

         $("#Button1").attr("disabled",true);
           // alert(strArray);
            $.ajax({
                url: "UpdataCardApply/",
                type: "POST",
                data: {
                    NETBARID: netBarId,
                    ACCOUNT: account,
                    NEWIP: ip,
                    TYPE: type

                },
                dataType: "json",
                success: UpdataCardApplySuccess
            });
        }
    
    }

    function UpdataCardApplySuccess(result) {

        d = new Date();
        var s = "";
        s = s + d.getYear() + "年";
        s += (d.getMonth() + 1) + "月";
        s += d.getDate() + "日  ";


        s += d.getHours() + "时"
        s += d.getMinutes() + "分"
        //        s+=d.getSeconds()


        if (result.isSuccess == 0) {
            $("#PunchCardTime").html(s);
            if (power == 7) {
                alert("打卡失败(推广员IP与数据库保存的IP不匹配!)");
                $("#PunchCardStatus").html("打卡失败(推广员IP与数据库保存的IP不匹配!)");
            }
            else if (power == 6 || power == 8) {
            alert("推广主管和督察主管打卡成功！");
            $("#PunchCardStatus").html("推广主管和督察主管打卡成功！");
                
            }
           
        }
        else if (result.isSuccess == 1) {
            $("#PunchCardTime").html(s);
            alert("打卡成功！");
            $("#PunchCardStatus").html("打卡成功！");

        }
        else if (result.isSuccess == 2) {
        alert("该网吧不存在！");
        $("#PunchCardStatus").html("该网吧不存在！");
        }
        else if (result.isSuccess == 3) {
        alert("当天打卡的网吧数量到达了35家！");
        $("#PunchCardStatus").html("当天打卡的网吧数量到达了35家！");
        }
        else if (result.isSuccess == 4) {
        alert("ADSL网吧打卡次数到达了2次！");
        $("#PunchCardStatus").html("ADSL网吧打卡次数到达了2次！");
        }
        else if (result.isSuccess == 5) {

            alert("当天没有给所有游戏进行过投票，不能打卡，请先进行游戏投票！");
            $("#PunchCardStatus").html("当天没有给所有游戏进行过投票，不能打卡，请先进行游戏投票！");
        }
        else {
            alert("打卡失败，请重试！");
            $("#PunchCardStatus").html("打卡失败，请重试！");
         }

         $("#Button1").attr("disabled", false);
       
    }
    function loadNetbar() {
        $("#netName").empty();
        var area2 = $("#area2").val();
        $.ajax(
             {
                 url: "LoadNetBarName/" + $("#area2").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadNetbarSuccessed
             });
    
    
    
    }

    function loadNetbarSuccessed(result) {

        $("#netName").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
            $("<option></option>").val(item.cell[1]).text(item.cell[0]).appendTo($("#netName"));
            });
        }
        loadnetbarinfo();
    }
    function loadArea2() {
   
        $.ajax(
             {
                 url: "LoadArea/" + $("#zone2").val(),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed2
             });
    }

    function loadSuccessed2(result) {

        $("#area2").empty();
        if (result.rows.length > 0) {
            $.each(result.rows, function(i, item) {
                $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area2"));
            });
        }
        loadNetbar();

       
    }


  </script> 
</asp:Content>
