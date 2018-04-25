<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
�ƹ�Ա
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%
        TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
        <span id="ukey">
            <%=account.UKEY %></span>
             <%
    
                  TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            int selectIdx = 0;
            DateTime dteBegin;
            DateTime dteEnd;
            string strByMonth = "";
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                dteBegin = condtion.START;
                dteEnd = condtion.END;
                strByMonth = condtion.bymonth;
                gameidx = condtion.gameidx;
                strDefines = condtion.DEFINEID;
            }
            else
            {
                selectIdx = 0;
                dteBegin = Convert.ToDateTime("2009-9-1");
                dteEnd = Convert.ToDateTime("2010-12-1");
                strDefines = "0,";
            }
        %>
        <span id="selectID"><%=selectIdx%></span>
          <span id="begint"><%=dteBegin.ToShortDateString()%></span>
        <span id="endt"><%=dteEnd.ToShortDateString()%></span>
          <span id="bymonth"><%=strByMonth%></span>
              <span id="gameidx"><%=gameidx%></span>
       <span id="definesstr"><%=strDefines%></span>
    <fieldset>
        <legend>��ѯ����</legend>
        <div id="frm1">
            <ul class="verticality" id="by_day_id">
                <li>
                    <input name="rd1" type="radio" value="1" checked="checked" />
                    �����ڲ�ѯ������Ϊ24Сʱˢ�£���ʼ����
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)"  value="2010-1-1" />
                    ��������
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>" />
                </li>
            </ul>
            <ul class="verticality">
                <li>
                    <input  name="rd1" type="radio" value="0" />���·ݲ�ѯ��ÿ��25����ɲ�ѯ�������ݣ�
                    <select style="width:95px;margin-left:5px; vertical-align:bottom" name="beginTime2" id="beginTime2">
                        <%
                            System.DateTime t = System.DateTime.Now;
                            var tempMonth = 0;
                            var YearMonth = "";
                            if (t.Day >= 25)
                            {
                                tempMonth = t.Month + 1;

                            }
                            else
                            {

                                tempMonth = t.Month;
                            }
                            for (int z = 1; z < tempMonth; z++)
                            {

                                YearMonth = t.Year.ToString() + "-" + z.ToString();
                        %>
                        <option value="<%=YearMonth%>">
                            <%=YearMonth%></option>
                        <%} %>>
                    </select>
                     
                    <br />
                </li>
            </ul>
            <ul class="verticality">
                <li>���:<%--<select name="class" id="class" style="width:226px">
                    <option value="0">������Ϸ</option>
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                        {
                    %>
                    <option value="<%=define.DEFINEID%>">
                        <%=define.GAMENAME%></option>
                    <%
                        }
                    %>
                </select>--%>
                 <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">������Ϸ</option>
                        
                   <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                          { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
                  <span id="test" style="color:#000000"><select  style="width:150px;" name="Gclass" id="Gclass" onchange="return class_onclick()">
                    <%
                        List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                        foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                          {
                    %>
                    <option  value="<%=define.DEFINEID%>">
                        <%=define.DTITLE%></option>
                    <%
                        }
                     %>
                </select></span>
               <button style="margin-left:65px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadTGPerformance()">��ѯ</button>
                </li>
            </ul>
        </div>
    </fieldset>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">��ѯ�����</a></li>
            <%--    <li>
                    <a href="#tabs-1">
                     SD�Ҵ�</a></li>--%>
        </ul>
        <div id="tabs-1" style="vertical-align: top; text-align: left">
            <table style="vertical-align: top; width: 102%; border:2px solid #000000; border-collapse: collapse;" id="table1" cellpadding="0" cellspacing="0" border="0">
                <tr style="background-color:#FFFFFF; font-weight:bold">
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;" colspan="5">
                        ��Ա��Ϣ
                    </td>
                    <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ֱ���ƹ�
                    </td>
                    <td colspan="2" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����ƹ�
                    </td>
                    <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        �����ƹ�
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 35px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ҵ��
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 36px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ���´�����
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��������
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ������
                    </td>
                                        <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ������
                    </td>
                </tr>
                <tr style="background-color:#FFFFFF; font-weight:bold">
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ���´�
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ְ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        �ʺ�
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��ȡ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        �����û���
                    </td>
                    <td id="first" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ���ѽ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����ת����
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��Ч�û���
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��Чת����
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        �����û���
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ���ѽ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��ȡ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        �����û���
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ���ѽ��
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ����ת����
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��Ч�û���
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        ��Чת����
                    </td>
                </tr>
                <%   
                    //int i = 0;
                    List<TGProject.Models.WModels.TGSOUTACHIVESPREADER> SpreaderList = (List<TGProject.Models.WModels.TGSOUTACHIVESPREADER>)ViewData["SPREADER"];
                    if (SpreaderList!=null && SpreaderList.Count > 0)
                    {
                %>
                <%
                    foreach (TGProject.Models.WModels.TGSOUTACHIVESPREADER rows in SpreaderList)
                    {
                        //i = i + 1;
                        //if (SpreaderList.Count - i == 1)
                        //{
                %>
                <tr>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZONENAME%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                       <%=rows.AREANAME%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.POPEDOMNAME%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.USERNAME%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.UACCOUNT%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJGETNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJCONSNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJCONSSUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJCONSCONV%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJAVAILNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZJAVAILCONV%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.IDCONSNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.IDCONSSUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTGETNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTCONSNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTCONSSUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTCONSCONV%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTAVAILNUM%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.QTAVAILCONV%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.OUTACHVALUE%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.RATIO%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.BONUS%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.BSORDER%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ZONEORDER%>
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ALLORDER%>
                    </td>
                                        <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        <%=rows.ACTIVENUM%>
                    </td>
                      <td visible="false"  style="width:0px; height:0px; visibility:hidden; border:0px 0px 0px 0px; margin:0px 0px 0px 0px; padding:0px 0px 0px 0px; display:none" id="test2">
                    <%=rows.UKEY%></td>
                </tr>
              <%--  <%}else{%>--%>
               <%-- <tr>
                    <td colspan="25" style="height: 20px">
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            ��ҳ</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            ��һҳ</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            ��һҳ</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            ĩҳ</button>
                        ��ǰ<%=int.Parse(rows.page)-1%>ҳ����<%=rows.records%>ҳ
                    </td>
                </tr>--%>
                <%  //}
                            } %>
            </table>
            <%} %>
            <table width="100%">
            </table>
            <center style="margin-top:10px">
                <button class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">�鿴��ϸ</button>
                <button style="margin-left:15px" class="ui-state-default ui-corner-all" type="button" onclick="ReturnPrevious()">����</button>
            </center>
        </div>
    </div>
    <%
        if (SpreaderList == null)
        {
            Response.Write("<script>alert('��������')</script>"); 
        }
        
    %>

    <script type="text/javascript">
        $('#tabs').tabs();
        var selectindex = 0;

        $("#selectID").hide();

        var gameidx = $("#gameidx").html();
       
        $("#gameidx").hide();
        $("#definesstr").hide();
        var UKEYGLOBAL="";
        var begintime;
        var endtime;
        var power;
  
        $(document).ready(function() {
            $("#GAME").attr("value", gameidx);
            defineIndex = $("#span1").attr("value");
            //$("#Gclass").hide();

            $("#Gclass").empty();

            if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
                $("<option></option>").val(0).text("���л").appendTo($("#Gclass"));
            }
            else {

                loadDefine($("#GAME").val());
            }
            //$("#Gclass").multiSelect({ selectAll: false, noneSelected: '��ѡ��', oneOrMoreSelected: '% ����ѱ�ѡ��' });
            $("#GAME").bind('change', function() {
                loadDefine($("#GAME").val());
                if ($("#GAME").val() == 0) {
                    // $("#Gclass").hide();
                }
                else {
                    // $("#Gclass").show();
                }
            });


            ///////////////////////////////////////////////////////////////////////////


            power = $("#power").html();
            $("#power").hide();


            var idx = $("#selectID").html();
            //            $("#class").attr("value", idx);

            var sTime = $("#begint").html();
            var eTime = $("#endt").html();
            $("#begint").hide();
            $("#endt").hide();
            $("#bymonth").hide();
            $("#beginTime").attr("value", sTime);
            $("#endTime").attr("value", eTime);

            var strTmp = new Array();
            strTmp = location.href.split("/");

            var strFrom64 = BASE64.decode(strTmp[strTmp.length - 1]);

            var href = location.href.replace(strTmp[strTmp.length - 1], strFrom64);
            var a = href.split(";")[0];
            var b = a.split("/")[5];
          
            if (power != 7 || power != 8) {

                UKEYGLOBAL = b;


            } 

             if(power=="7")
             {
                UKEYGLOBAL = $("#ukey").html();
            
            }
            $("#ukey").hide();
            
            var sbymonth = $("#bymonth").html()
            if (sbymonth != "") {
                $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
                $("#beginTime2").val(sbymonth);
            }
        });

        function loadTGPerformance() {
        
            var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;

            
            if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
                if (!datedemo.test($("#beginTime").val())) {
                    alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                    return;
                }

                if (!datedemo.test($("#endTime").val())) {
                    alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                    return;
                }
                begintime = $("#beginTime").val();
                endtime = $("#endTime").val();
                 var game1 = $("#GAME").val();
                    actionString = "";
                    for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                        var chkName = "mst" + k;
                        if ($("#" + chkName).attr("checked") == true) {
                            actionString = actionString + $("#" + chkName).val() + ",";
                        }
                    }
                    if (actionString == undefined || actionString == "undefined" || actionString == "") {
                        alert("��ѡ��Ҫ��ѯ�Ļ��");
                        return;
                    }
                    var pram = UKEYGLOBAL + ";" + actionString + ";" + begintime + ";" + endtime + ";" + "" + ";" + game1;
                parm64 = BASE64.encode(pram);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo/" + parm64;
                location.replace(str);

            } else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
                var timeindex = $("#beginTime2").val().split('-');
                var timespan = 0;
                var tmyear;
                if (timeindex[1] == 1) {
                    timespan = 12;
                    tmyear = timeindex[0] - 1;
                } else {
                timespan = timeindex[1] - 1;
                tmyear = timeindex[0];
                }

                begintime = tmyear + "-" + timespan + "-" + "25";
                endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                var game1 = $("#GAME").val();
                actionString = "";
                for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                    var chkName = "mst" + k;
                    if ($("#" + chkName).attr("checked") == true) {
                        actionString = actionString + $("#" + chkName).val() + ",";
                    }
                }
                if (actionString == undefined || actionString == "undefined" || actionString == "") {
                    alert("��ѡ��Ҫ��ѯ�Ļ��");
                    return;
                }
                var pram = UKEYGLOBAL + ";" + actionString + ";" + begintime + ";" + endtime + ";" + $("#beginTime2").val() + ";" + game1;
                parm64 = BASE64.encode(pram);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo/" + parm64;
                location.replace(str);
            }
        }

        function ReturnPrevious() {

            history.go(-1);




        }

        function QueryDetail() {
            if ($("#test2").text() == "") {
                return;
            }
            var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;
           

            if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
                if (!datedemo.test($("#beginTime").val())) {
                    alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                    return;
                }

                if (!datedemo.test($("#endTime").val())) {
                    alert("�����ڲ�ѯ��ʼʱ�䲻��ȷ��");
                    return;
                }
                begintime = $("#beginTime").val();
                endtime = $("#endTime").val();
                var game1 = $("#GAME").val();
                actionString = "";
                for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                    var chkName = "mst" + k;
                    if ($("#" + chkName).attr("checked") == true) {
                        actionString = actionString + $("#" + chkName).val() + ",";
                    }
                }
                if (actionString == undefined || actionString == "undefined" || actionString == "") {
                    alert("��ѡ��Ҫ��ѯ�Ļ��");
                    return;
                }
                var pram = $("#test2").text() + ";" + actionString + ";" + begintime + ";" + endtime+";"+game1;
                parm64 = BASE64.encode(pram);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceDetailInfo/" + parm64;
                location.reload(str);

            } else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
                var timeindex = $("#beginTime2").val().split('-');
                var timespan = 0;
                if (timeindex[1] == 1) {
                    timespan = 12;
                } else {
                    timespan = timeindex[1] - 1;
                }
                
                begintime = timeindex[0] + "-" + timespan + "-" + "25";
                endtime = timeindex[0] + "-" + timeindex[1] + "-" + "24";

                var game1 = $("#GAME").val();
                actionString = "";
                for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                    var chkName = "mst" + k;
                    if ($("#" + chkName).attr("checked") == true) {
                        actionString = actionString + $("#" + chkName).val() + ",";
                    }
                }
                if (actionString == undefined || actionString == "undefined" || actionString == "") {
                    alert("��ѡ��Ҫ��ѯ�Ļ��");
                    return;
                }
                
                
                var pram = $("#test2").text() + ";" + actionString + ";" + begintime + ";" + endtime + ";" + game1;
                parm64 = BASE64.encode(pram);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceDetailInfo/" + parm64;
                location.reload(str);
            }

        }

        var BASE64 = {
            /**
            * �˱���Ϊ�����key��ÿ���ַ����±����Ӧ����������ı��롣
            */
            enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
            /**
            * �˱���Ϊ�����key����һ�����飬BASE64���ַ���ASCIIֵ���±꣬����Ӧ�ľ��Ǹ��ַ�������ı���ֵ��
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
            * ����
            */
            encode: function(src) {
                //��һ����������ű������ַ���Ч�ʱ����ַ�����Ӹߺܶࡣ
                var str = new Array();
                var ch1, ch2, ch3;
                var pos = 0;
                //ÿ�����ַ����б��롣
                while (pos + 3 <= src.length) {
                    ch1 = src.charCodeAt(pos++);
                    ch2 = src.charCodeAt(pos++);
                    ch3 = src.charCodeAt(pos++);
                    str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                    str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
                }
                //��ʣ�µ��ַ����б��롣
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
                //��ϸ��������ַ�������һ���ַ�����
                return str.join('');
            },
            /**
            * ���롣
            */
            decode: function(src) {
                //��һ����������Ž������ַ���
                var str = new Array();
                var ch1, ch2, ch3, ch4;
                var pos = 0;
                //���˷Ƿ��ַ�����ȥ��'='��
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
                //��ʣ�µ��ַ����н��롣
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
                //��ϸ��������ַ�������һ���ַ�����
                return str.join('');
            }
        };




        function loadDefine() {
            //����ȫ��URL�Ա㷵���ܹ��ҵ�controls
            //url = "http://" + location.host + "/ScoreOfficeController.aspx/loadDefine/";

            //     options = "<option value=''></option>";

            //     $("#Gclass").html(options);
            //     $("#Gclass").multiSelect({
            //         selectAll: false,
            //         noneSelected: 'Check some boxes!',
            //         oneOrMoreSelected: '%����Ϸ��ѱ�ѡ��'
            //     });

            $("#Gclass").empty();
            $('#test').html('');
            $('#test').html('<span id="test"  style="color:#000000"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()" multiple="multiple"></select></span>');
            $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
        }

        function loadSuccessed(result) {
            $("#Gclass").empty();
            var definestr = $("#definesstr").html();

            var definesArray = definestr.split(',');

            if (result.rows.length > 0) {
                $.each(result.rows, function(i, item) {

                    var hasFlg = 0;
                    var routelong = definesArray.length;
                    for (idef = 0; idef < routelong; idef++) {
                        if (definesArray[idef] == item.cell[0]) {

                            hasFlg = 1;
                            break;
                        }
                        else {
                            hasFlg = 0
                        }
                    }
                    if (hasFlg == 1) {
                        $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                    }
                    else {
                        $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                    }
                });
            }
            else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
            $("<option selected='selected'></option>").val(0).text("���л").appendTo($("#Gclass"));
            $("#Gclass").multiSelect({ selectAll: false, selectAllText: "ȫѡ", noneSelected: '��ѡ��', oneOrMoreSelected: '���л�ѱ�ѡ��' });
            }
            $("#Gclass").multiSelect({ selectAll: true, selectAllText: "ȫѡ", noneSelected: '��ѡ��', oneOrMoreSelected: '% ����ѱ�ѡ��' });


        }
    </script>

</asp:Content>
