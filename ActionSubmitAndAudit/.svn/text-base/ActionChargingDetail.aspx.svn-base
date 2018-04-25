<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动打卡
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
    TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
    TGProject.Models.TGS_ActDetail_Today modelsinfo = (TGProject.Models.TGS_ActDetail_Today)ViewData["info"];
%>
<span id="strActDid"><%=modelsinfo.ACTDID%></span>
<span id="strAccount"><%=account.UACCOUNT %></span>
<span style="color:Blue; font-weight:bolder">你的当前ip为:</span><span style="color:Red; font-weight:bolder" id="ip"><%=ViewData["ClientIp"].ToString()%></span><span style="color:Blue; font-weight:bolder">，请核对是否与所选择网吧实际ip一致。</span>

<div id="divIframe" title="详细信息">
        <fieldset>
            <legend>网吧详细信息</legend>
            <div>
                <ul class="verticality">
                    <li style="color:Blue">活动游戏:<%=modelsinfo.GAMENAME%>&nbsp;活动类型:<%=modelsinfo.TYPENAME%>&nbsp;&nbsp;活动单号:<%=modelsinfo.ASNUMBER%></li>
                    <li style="color:Blue">活动日期: &nbsp;<%= modelsinfo.strActdate%></li>
                    <li style="color:Blue">开始时间: &nbsp;<%=modelsinfo.strBegintime%></li>
                    <li style="color:Blue">结束时间: &nbsp;<%=modelsinfo.strEndtime%></li>
                    <li style="color:Blue">活动网吧: &nbsp;<%=modelsinfo.BARNAME%>&nbsp;&nbsp;网吧地址:<%=modelsinfo.ADDRESS%></li>
                    <li style="color:Blue">包机数量: &nbsp;<%=modelsinfo.CNUM%></li>
                </ul>
            </div>
        </fieldset>
        <br />
         <div style="text-align: center">
        如活动期间遇网吧断网/停电游戏服务器宕机等特殊情况，请在网络恢复后再次进行“活动开始”打卡
    </div>
    <center>
        <button class="ui-state-default ui-corner-all" id="btnStartSubmit">活动开始</button>
        <button class="ui-state-default ui-corner-all" id="btnEndSubmit">活动结束</button>   
        <button class="ui-state-default ui-corner-all" onclick=" history.go(-1);">取消返回</button>
    </center>
    </div>
    <script>
        //事件绑定
        $(document).ready(function() {

            $("#strActDid").hide();
            $("#strAccount").hide();
            $("#btnStartSubmit").bind('click', function() {
                StartSubmit();
            });
            $("#btnEndSubmit").bind('click', function() {
                EndSubmit();
            });
        });

        //活动开始打卡
        function StartSubmit() {
            var strActdid = $("#strActDid").html();
            var strAccount = $("#strAccount").html();
            var strIp = $("#ip").html();

            $.ajax({
                url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChargingDetailStart/",
                type: "POST",
                dataType: "json",
                data: { ActDID: strActdid, Account: strAccount, IP: strIp },
                success: StartSuccessed
            });
        }

        //结束开始打卡
        function EndSubmit() {
            var strActdid = $("#strActDid").html();
            var strAccount = $("#strAccount").html();
            var strIp = $("#ip").html();

            $.ajax({
                url: "http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChargingDetailEnd/",
                type: "POST",
                dataType: "json",
                data: { ActDID: strActdid, Account: strAccount, IP: strIp },
                success: EndSubmitSuccessed
            });
        }
        
        function StartSuccessed(result) {

            if (result.isSuccessed == 0) {
                alert("打卡IP和网吧IP不符！");
            }
            else if (result.isSuccessed == 1) {
                alert("活动开始打卡成功！");
                location.href("http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChargingDetail/");   
            }
            else if (result.isSuccessed == 2) {
                alert("没有该活动数据！");
            }
            else if (result.isSuccessed == 3) {
                alert("该活动当天已经进行了开始打卡！");
            }
            else if (result.isSuccessed == 4) {
                alert("该活动当天已经进行了结束打卡！");
            }
        }

        function EndSubmitSuccessed(result) {

            if (result.isSuccessed == 0) {
                alert("打卡IP和网吧IP不符！");
            }
            else if (result.isSuccessed == 1) {
                alert("活动结束打卡成功！");
                location.href("http://" + location.host + "/ActionSubmitAndAudit.aspx/ActionChargingDetail/");   
            }
            else if (result.isSuccessed == 2) {
                alert("没有该活动数据！");
            }
            else if (result.isSuccessed == 3) {
            alert("该活动当天已经进行了结束打卡！");
            }
            else if (result.isSuccessed == 4) {
                alert("该网吧活动当天没有开始打卡！");
            }
        }
    </script>
</asp:Content>
