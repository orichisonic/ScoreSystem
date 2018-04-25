<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    网吧详细信息
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGSNetBarByID netbarInfo = (TGSNetBarByID)ViewData["Detail"]; %>
    <div id="divIframe" title="详细信息">
        <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>网吧编号:&nbsp;&nbsp;<%=netbarInfo.NETBARID %></li>
                <li>所属办事处:&nbsp;&nbsp;<%=netbarInfo.CITY %></li>
            </ul>
            <ul class="horizontal">
                <li>登记人:&nbsp;&nbsp;<%=netbarInfo.APPLICANT %></li>
                <li>登记人账号:&nbsp;&nbsp;<%=netbarInfo.APPLACCOUNT %></li>
                <li>登记日期:&nbsp;&nbsp;<%=netbarInfo.APPLTIME.ToLongDateString() %></li>
            </ul>
            <ul class="horizontal">
                <li>审核人:&nbsp;&nbsp;<%=netbarInfo.EXAMINATOR %></li>
                <li>审核人账号:&nbsp;&nbsp;<%=netbarInfo.EXAMACCOUNT %></li>
                
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
            <ul class="horizontal">
            <%
                if (netbarInfo.STATUS == "已绑定")
              {
            %>
                <li>现绑定人:&nbsp;&nbsp;<%=netbarInfo.LOCKNAME%></li>
                <li>现绑定人帐号:&nbsp;&nbsp;<%=netbarInfo.LOCKACCOUNT%></li>
                  <% 
                    if (netbarInfo.LOCKTIME.ToLongDateString() != "0001年1月1日")
                    {
                %>
                <li>绑定日期:&nbsp;&nbsp;<%=netbarInfo.LOCKTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>绑定日期:&nbsp;&nbsp;</li>
                 <%} %>
            <%}
                else if (netbarInfo.STATUS == "已锁定")
              {
            %>
                <li>现锁定人:&nbsp;&nbsp;<%=netbarInfo.LOCKNAME%></li>
                <li>现锁定人帐号:&nbsp;&nbsp;<%=netbarInfo.LOCKACCOUNT%></li>
                   <% 
                    if (netbarInfo.LOCKTIME.ToLongDateString() != "0001年1月1日")
                    {
                %>
                <li>锁定日期:&nbsp;&nbsp;<%=netbarInfo.LOCKTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>锁定日期:&nbsp;&nbsp;</li>
                 <%} %>
            <%
              } 
            %>
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
                    <%--<li>网吧地址: &nbsp;<%=netbarInfo.ADDRESS %></li>--%>
                    <li>联系人: &nbsp;<%=netbarInfo.LINKMAN %></li>
                    <li>联系电话: &nbsp;<%=netbarInfo.PHONE %></li>
                    <li>电脑数量: &nbsp;<%=netbarInfo.MACNUM %></li>
                    <li>录入途径: &nbsp;<%=netbarInfo.BASE_FROM %></li>
                    <li>IP 类型: &nbsp;<%=netbarInfo.NETWORK_KIND%></li>
                    <li>IP 地址: &nbsp;<%=netbarInfo.IPADDRESS %></li>
                    <li>备注: &nbsp;<%=netbarInfo.BASE_INTRO %></li>
                </ul>
            </div>
        </fieldset>
        <br />
        <fieldset>
            <legend>备注</legend>
            <ul class="verticality">
               <li>宽带接入:
                    <%=netbarInfo.WIDEBAND %></li>
               <li>地段位置:
                    <%=netbarInfo.POSITION %></li>
               <li>CPU:
                    <%=netbarInfo.CPUFREQ%></li>
               <li>显卡:
                    <%=netbarInfo.DISCARD %></li>
               <li>硬盘:
                    <%=netbarInfo.HARDDISK %></li>
               <li>内存:
                    <%=netbarInfo.MEMORY %></li>
               <li>管理软件:
                    <%=netbarInfo.ADMINSOFT %></li>
            </ul>            
        </fieldset>
        
            <div id="tab2-upgrade">
                <fieldset>
                    <legend>网吧广告</legend>
                    <ul class="verticality" id="tab4-account">
                        <li>店头招牌大小:
                            <%=netbarInfo.FACIAADSIZE %></li>
                        <li>店头招牌数量:
                            <%=netbarInfo.FACIAADNUM %></li>
                        <li>室内位置大小:
                            <%=netbarInfo.INDOORADSIZE %></li>
                        <li>室内位置数量:
                            <%=netbarInfo.INDOORADNUM %></li>
                        <li>室外位置大小:
                            <%=netbarInfo.OUTDOORADSIZE %></li>
                        <li>室外位置数量:
                            <%=netbarInfo.OUTDOORADNUM%></li>
                        <li>其他招牌大小:
                            <%=netbarInfo.REMAINADSIZE%></li>
                        <li>其他招牌数量:
                            <%=netbarInfo.REMAINADNUM %></li> 
                    </ul>
                </fieldset>
               
            </div>
        <fieldset style="display:none">
            <legend>业绩查询</legend>
            <div style="text-align: center">
                <ul class="horizontal">
                    <li>开始日期
                        <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1" /></li>
                    <li>结束日期
                        <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2020-1-1" /></li>
                    <li>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">查询</button></li>
                </ul>
            </div>
        </fieldset>
        <p style="text-align: center">
            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">返回</button>
        </p>
    </div>
   <script>
       //事件绑定
       $(document).ready(function() {

       });
   </script>
</asp:Content>
