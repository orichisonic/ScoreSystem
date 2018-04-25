<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������ϸ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%TGSNetBarByID netbarInfo = (TGSNetBarByID)ViewData["Detail"]; %>
    <div id="divIframe" title="��ϸ��Ϣ">
        <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>���ɱ��:&nbsp;&nbsp;<%=netbarInfo.NETBARID %></li>
                <li>�������´�:&nbsp;&nbsp;<%=netbarInfo.CITY %></li>
            </ul>
            <ul class="horizontal">
                <li>�Ǽ���:&nbsp;&nbsp;<%=netbarInfo.APPLICANT %></li>
                <li>�Ǽ����˺�:&nbsp;&nbsp;<%=netbarInfo.APPLACCOUNT %></li>
                <li>�Ǽ�����:&nbsp;&nbsp;<%=netbarInfo.APPLTIME.ToLongDateString() %></li>
            </ul>
            <ul class="horizontal">
                <li>�����:&nbsp;&nbsp;<%=netbarInfo.EXAMINATOR %></li>
                <li>������˺�:&nbsp;&nbsp;<%=netbarInfo.EXAMACCOUNT %></li>
                
                 <% 
                    if (netbarInfo.EXAMTIME.ToLongDateString() != "0001��1��1��")
                    {
                %>
                <li>�������:&nbsp;&nbsp;<%=netbarInfo.EXAMTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>�������:&nbsp;&nbsp;</li>
                 <%} %>
            </ul>
            <ul class="horizontal">
            <%
                if (netbarInfo.STATUS == "�Ѱ�")
              {
            %>
                <li>�ְ���:&nbsp;&nbsp;<%=netbarInfo.LOCKNAME%></li>
                <li>�ְ����ʺ�:&nbsp;&nbsp;<%=netbarInfo.LOCKACCOUNT%></li>
                  <% 
                    if (netbarInfo.LOCKTIME.ToLongDateString() != "0001��1��1��")
                    {
                %>
                <li>������:&nbsp;&nbsp;<%=netbarInfo.LOCKTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>������:&nbsp;&nbsp;</li>
                 <%} %>
            <%}
                else if (netbarInfo.STATUS == "������")
              {
            %>
                <li>��������:&nbsp;&nbsp;<%=netbarInfo.LOCKNAME%></li>
                <li>���������ʺ�:&nbsp;&nbsp;<%=netbarInfo.LOCKACCOUNT%></li>
                   <% 
                    if (netbarInfo.LOCKTIME.ToLongDateString() != "0001��1��1��")
                    {
                %>
                <li>��������:&nbsp;&nbsp;<%=netbarInfo.LOCKTIME.ToLongDateString()%></li>
                <%
                    }
                    else
                    {
                 %>
                 <li>��������:&nbsp;&nbsp;</li>
                 <%} %>
            <%
              } 
            %>
            </ul>
        </div>
        <fieldset>
            <legend>������ϸ��Ϣ</legend>
            <div>
                <ul class="verticality">
                    <li>��������: &nbsp;<%= netbarInfo.BARNAME %></li>
                    <li>�������ڵ�: &nbsp;<%= netbarInfo.PROVINCE %>(ʡ)&nbsp;&nbsp;<%=netbarInfo.CITY %>(��)&nbsp;&nbsp;<%=netbarInfo.COUNTY %>(��/��) </li>
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
                    <li>���ɵ�ַ: &nbsp;</li>
                    <li> &nbsp; &nbsp;1)���ƺţ�<%= str1%></li>
                    <li> &nbsp; &nbsp;2)�����<%= str2%></li>
                    <li> &nbsp; &nbsp;3)��ͨվ��<%= str3%></li>
                    <%--<li>���ɵ�ַ: &nbsp;<%=netbarInfo.ADDRESS %></li>--%>
                    <li>��ϵ��: &nbsp;<%=netbarInfo.LINKMAN %></li>
                    <li>��ϵ�绰: &nbsp;<%=netbarInfo.PHONE %></li>
                    <li>��������: &nbsp;<%=netbarInfo.MACNUM %></li>
                    <li>¼��;��: &nbsp;<%=netbarInfo.BASE_FROM %></li>
                    <li>IP ����: &nbsp;<%=netbarInfo.NETWORK_KIND%></li>
                    <li>IP ��ַ: &nbsp;<%=netbarInfo.IPADDRESS %></li>
                    <li>��ע: &nbsp;<%=netbarInfo.BASE_INTRO %></li>
                </ul>
            </div>
        </fieldset>
        <br />
        <fieldset>
            <legend>��ע</legend>
            <ul class="verticality">
               <li>�������:
                    <%=netbarInfo.WIDEBAND %></li>
               <li>�ض�λ��:
                    <%=netbarInfo.POSITION %></li>
               <li>CPU:
                    <%=netbarInfo.CPUFREQ%></li>
               <li>�Կ�:
                    <%=netbarInfo.DISCARD %></li>
               <li>Ӳ��:
                    <%=netbarInfo.HARDDISK %></li>
               <li>�ڴ�:
                    <%=netbarInfo.MEMORY %></li>
               <li>�������:
                    <%=netbarInfo.ADMINSOFT %></li>
            </ul>            
        </fieldset>
        
            <div id="tab2-upgrade">
                <fieldset>
                    <legend>���ɹ��</legend>
                    <ul class="verticality" id="tab4-account">
                        <li>��ͷ���ƴ�С:
                            <%=netbarInfo.FACIAADSIZE %></li>
                        <li>��ͷ��������:
                            <%=netbarInfo.FACIAADNUM %></li>
                        <li>����λ�ô�С:
                            <%=netbarInfo.INDOORADSIZE %></li>
                        <li>����λ������:
                            <%=netbarInfo.INDOORADNUM %></li>
                        <li>����λ�ô�С:
                            <%=netbarInfo.OUTDOORADSIZE %></li>
                        <li>����λ������:
                            <%=netbarInfo.OUTDOORADNUM%></li>
                        <li>�������ƴ�С:
                            <%=netbarInfo.REMAINADSIZE%></li>
                        <li>������������:
                            <%=netbarInfo.REMAINADNUM %></li> 
                    </ul>
                </fieldset>
               
            </div>
        <fieldset style="display:none">
            <legend>ҵ����ѯ</legend>
            <div style="text-align: center">
                <ul class="horizontal">
                    <li>��ʼ����
                        <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1" /></li>
                    <li>��������
                        <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2020-1-1" /></li>
                    <li>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">��ѯ</button></li>
                </ul>
            </div>
        </fieldset>
        <p style="text-align: center">
            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">����</button>
        </p>
    </div>
   <script>
       //�¼���
       $(document).ready(function() {

       });
   </script>
</asp:Content>
