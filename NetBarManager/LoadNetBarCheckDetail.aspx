<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ������ϸ��Ϣ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
    TGSNetBarByID netbarInfo = (TGSNetBarByID)ViewData["Detail"]; %>
    <div id="divIframe" title="��ϸ��Ϣ">
        <div style="text-align: center; font-size: 13px; font-weight: bold; color: Orange;">
            <ul class="horizontal">
                <li>�Ǽ���:&nbsp;&nbsp;<%=netbarInfo.APPLICANT %></li>
                <li>�Ǽ����˺�:&nbsp;&nbsp;<%=netbarInfo.APPLACCOUNT %></li>
                <li>�����:&nbsp;&nbsp;<%=netbarInfo.EXAMINATOR %></li>
                <li>������˺�:&nbsp;&nbsp;<%=netbarInfo.EXAMACCOUNT %></li>
            </ul>
            <ul class="horizontal">
                <li>���ɱ��:&nbsp;&nbsp;<%=netbarInfo.NETBARID %></li>
                <li>�������´�:&nbsp;&nbsp;<%=netbarInfo.CITY %></li>
                <li>�Ǽ�����:&nbsp;&nbsp;<%=netbarInfo.APPLTIME.ToLongDateString() %></li>
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
                    <li>��ϵ��: &nbsp;<%=netbarInfo.LINKMAN %></li>
                    <li>��ϵ�绰: &nbsp;<%=netbarInfo.PHONE %></li>
                    <li>��������: &nbsp;<%=netbarInfo.MACNUM %></li>
                    <li>IP ����: &nbsp;<%=netbarInfo.NETWORK_KIND %></li>
                    <li>IP ��ַ: &nbsp;<%=netbarInfo.IPADDRESS %></li>
                    <%
                        string content = "";
                        if (netbarInfo.BASE_GROUP != null)
                        {
                            if (netbarInfo.BASE_GROUP == 0)
                            {
                                content = "����ƽ̨";
                            }
                            else
                            {
                                content = "����ƽ̨";
                            }
                        }
                         %>
                    <li>¼������: &nbsp;<%=content %></li>
                    <li>��ע:<br /><textarea id="remark" rows="15" cols="15"><%=netbarInfo.BASE_INTRO %></textarea></li>
                </ul>
            </div>
        </fieldset>
        <p style="text-align: center">
            <button id="returnBtn" class="fg-button ui-state-default ui-corner-left" type="button" onclick="javascript: history.go(-1);">
                ����</button>
                <%if (netbarInfo.IsShowBtn) { %>
            <button id="examPass" class="fg-button ui-state-default ui-corner-left" type="button" onclick="examNetbar(1)">
                ���ͨ��</button>
            <button id="examFail" class="fg-button ui-state-default ui-corner-left" type="button" onclick="examNetbar(0)">
                ��˲�ͨ��</button>
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
                alert("�����ɹ�");
                history.go(-1);
            }
            else if (result.isSuccessed == 0) {
                alert("������IP��ͻ���޷���� \n����ͻ������(����ID:" + result.NetBarId + " ������:" + result.NetBarName + ")");

                history.go(-1);
            }
            else {
                alert("����ʧ��");
                history.go(-1);
            }
        }
    </script>

</asp:Content>
