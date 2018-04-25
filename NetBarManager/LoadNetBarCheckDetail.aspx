<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
    TGSNetBarByID netbarInfo = (TGSNetBarByID)ViewData["Detail"]; %>
    <div id="divIframe" title="详细信息">
        <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>登记人:&nbsp;&nbsp;<%=netbarInfo.APPLICANT %></li>
                <li>登记人账号:&nbsp;&nbsp;<%=netbarInfo.APPLACCOUNT %></li>
                <li>审核人:&nbsp;&nbsp;<%=netbarInfo.EXAMINATOR %></li>
                <li>审核人账号:&nbsp;&nbsp;<%=netbarInfo.EXAMACCOUNT %></li>
            </ul>
            <ul class="horizontal">
                <li>网吧编号:&nbsp;&nbsp;<%=netbarInfo.NETBARID %></li>
                <li>所属办事处:&nbsp;&nbsp;<%=netbarInfo.CITY %></li>
                <li>登记日期:&nbsp;&nbsp;<%=netbarInfo.APPLTIME.ToLongDateString() %></li>
                <% 
                    if (netbarInfo.EXAMTIME.ToLongDateString() != "0001年1月1日")
                    {
                %>
                <li>审核日期:&nbsp;&nbsp;<%=netbarInfo.EXAMTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>审核日期:&nbsp;&nbsp;</li>
                 <%} %>
            </ul>
        </div>
        <fieldset>
            <legend>网吧详细信息</legend>
            <div>
                <ul class="verticality">
             
                    <li>网吧名称: &nbsp;<%= netbarInfo.BARNAME %></li>
                    <li>网吧所在地: &nbsp;<%= netbarInfo.PROVINCE %>(省)&nbsp;&nbsp;<%=netbarInfo.CITY %>(市)&nbsp;&nbsp;<%=netbarInfo.COUNTY %>(县/区) </li>
                    <%
                        string[] stradddr = netbarInfo.ADDRESS.Split('%');
                        string str1="";
                        string str2="";
                        string str3="";
                        if (stradddr.Length >= 1)
                        {
                            str1 = stradddr[0];
                        }
                        if (stradddr.Length >= 2)
                        {
                            str2 = stradddr[1];
                        }
                        if (stradddr.Length >= 3)
                        {
                            str3 = stradddr[2];
                        }
                        
                    %>
                    <li>网吧地址: &nbsp;</li>
                    <li> &nbsp; &nbsp;1)门牌号：<%= str1%></li>
                    <li> &nbsp; &nbsp;2)参照物：<%= str2%></li>
                    <li> &nbsp; &nbsp;3)交通站：<%= str3%></li>
                    <li>联系人: &nbsp;<%=netbarInfo.LINKMAN %></li>
                    <li>联系电话: &nbsp;<%=netbarInfo.PHONE %></li>
                    <li>电脑数量: &nbsp;<%=netbarInfo.MACNUM %></li>
                    <li>IP 类型: &nbsp;<%=netbarInfo.NETWORK_KIND %></li>
                    <li>IP 地址: &nbsp;<%=netbarInfo.IPADDRESS %></li>
                    <%
                        string content = "";
                        if (netbarInfo.BASE_GROUP != null)
                        {
                            if (netbarInfo.BASE_GROUP == 0)
                            {
                                content = "网吧平台";
                            }
                            else
                            {
                                content = "渠道平台";
                            }
                        }
                         %>
                    <li>录入类型: &nbsp;<%=content %></li>
                    <li>备注:<br /><textarea id="remark" rows="15" cols="15"><%=netbarInfo.BASE_INTRO %></textarea></li>
                </ul>
            </div>
        </fieldset>
        <p style="text-align: center">
            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">
                返回</button>
                <%if (netbarInfo.IsShowBtn) { %>
            <button id="examPass" class="fg-button ui-state-default ui-corner-left" type="button" onclick="examNetbar(1)">
                审核通过</button>
            <button id="examFail" class="fg-button ui-state-default ui-corner-left" type="button" onclick="examNetbar(0)">
                审核不通过</button>
                <%} %>
        </p>
    </div>

    <script type="text/javascript">
        function examNetbar(result) {
            $.ajax({
                url: "../ExamNetBar/",
                type: "POST",
                data: { NetBarID: "<%=netbarInfo.NETBARID %>", ExamResult: result, Remark: $("#remark").val() },
                dataType: "json",
                success: examSuccessed
            });
        }

        function examSuccessed(result) {
            if (result.isSuccessed==1) {
                alert("审批成功");
                history.go(-1);
            }
            else if (result.isSuccessed == 0) {
                alert("该网吧IP冲突，无法审核 \n所冲突的网吧(网吧ID:" + result.NetBarId + " 网吧名:" + result.NetBarName + ")");

                history.go(-1);
            }
            else {
                alert("审批失败");
                history.go(-1);
            }
        }
    </script>

</asp:Content>
