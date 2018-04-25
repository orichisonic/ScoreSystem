<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
业绩明细</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divIframe" title="业绩明细">
  <div id="ChargeCondition">
   <fieldset>
        <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.TGSOutAchiveAreaCondition condtion = (TGProject.Models.TGSOutAchiveAreaCondition)ViewData["condition"];
            string gameidx = "0";
            string strByMonth = "";
            string strDefines = "0,"; 
            DateTime dteBegin;
            DateTime dteEnd;
            int iAreaID = 0;
            int iZoneID = 0;
            if (condtion != null)
            {
                dteBegin = condtion.BeginTime;
                dteEnd = condtion.EndTime;
                strByMonth = condtion.bymonth;
                gameidx = condtion.gameidx;
                strDefines = condtion.DefineID;
                iAreaID = condtion.AreaID;
                iZoneID = condtion.ZoneID;
            }
            else
            {
                dteBegin = Convert.ToDateTime("2009-9-1");
                dteEnd = Convert.ToDateTime("2010-12-1");
                strDefines = "0,";
            }
        %>
        <span id="power"><%=account.POPEDOMID %></span>
        <span id="beginDate"><%=dteBegin.ToShortDateString() %></span>
        <span id="endDate"><%=dteEnd.ToShortDateString()%></span>
        <span id="bymonthFlg"><%=condtion.bymonth %></span>
        <span id="gameIdx"><%=gameidx%></span>
        <span id="defineStr"><%=condtion.DefineID%></span>
        <span id="iAid""><%=iAreaID %></span>
        <span id="iZid"><%=iZoneID%></span>
    <legend></legend>
     <div id="frm1" style="text-align: left">
      <ul class="verticality" >
            <ul class="horizontal">
            <li id="zoneHide1">大区
                <select name="zone" id="zone">
                <%
                if (account.POPEDOMID == 1 || account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 8 || account.POPEDOMID ==99)
                {
                    List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                    foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                    {
                %>
                <option value="<%=zone.AREAID%>">
                    <%= zone.AREANAME%>
                    </option>
                <%  
                    }
                }
                else 
                { 
                %>
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                <%
                } 
                %>
                </select>
            </li>
            <li id="areaHide1">办事处
                <select id="area">
                    <%if (account.POPEDOMID == 5 || account.POPEDOMID == 6 || account.POPEDOMID == 7)
                      { %>
                    <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                    <%}%>
                </select>
            </li>
        </ul>
            <ul class="verticality"  id="by_day_id">
             <li style=" vertical-align:bottom"><input style="vertical-align:bottom" name="rd1" type="radio" value="1" checked="check  ed"/>按日期查询（数据为24小时刷新）
             开始日期    
             <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2010-01-01"/>
             结束日期 
             <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>"/>
             </li>
           </ul>
            <ul class="verticality">
                <li>
                    <input name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
                    <select style="width:95px;margin-left:1px; vertical-align:bottom" name="beginTime2" id="beginTime2">
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
                        <%  } %>
                    </select>
                    <br />
                </li>
            </ul>
            <li style=" vertical-align:bottom">类别:
                <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">所有游戏</option>
                        
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GamesList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Games"];
                        foreach (TGProject.Models.TGSGAMESHOW gameinfo in GamesList)
                        {
                    %>
                    <option  value="<%=gameinfo.GAMECODE%>">
                        <%=gameinfo.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
              <span id="test" style="color:Black;"><select  style="width:226px;" name="Gclass" id="Gclass"  multiple="multiple">                       
                <%
                    List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                    foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                      {
                %>
                <option  value="<%=define.DEFINEID%>">
                    <%=define.DTITLE%>
                <%
                    }
                 %>
            </select></span>
                                
                <button style="margin-left:57px;" class="ui-state-default ui-corner-all"  id="btnSearch"  >查询</button>
                                                                                                                                                <br />
            </li>
      </ul>
     </div>
    </fieldset>
   </div>
<div id="tabs"> 
    <div id="tabs-1" style="text-align: center"> 
    <table  id ="table1" cellpadding="0" cellspacing="0" border="0" style="vertical-align:top; width:101%; border:2px solid #000000; margin-left: 0px; border-collapse: collapse;">
        <tr style="background-color:#FFFFFF; font-weight:bold">     
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            姓名</td>
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            职位</td>
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            帐号</td>
            <td rowspan="2" 
                style="border: 1px ridge #000000; width: 65px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; text-align: center;font-size:small;">
            入职日期</td>
            <td rowspan="2" 
                style="border: 1px ridge #000000; width: 64px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; text-align: center;font-size:small;">
            离职日期</td>
            <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            直接推广</td>
            <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            间接推广</td>
            <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            线上推广</td>
            <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            其他推广</td>
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            总业绩</td>
            <td rowspan="2" style="border: 1px solid #000000;width: 49px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            网吧业绩</td>
        </tr>         
        <tr style="background-color:#FFFFFF; font-weight:bold">
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            金额</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            金额</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费</td> 
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            金额</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            金额</td>
        </tr>
            <%
                int i = 0;
                List<TGProject.Models.TGSEXPORTOUTACHIVE> AreaDetail = (List<TGProject.Models.TGSEXPORTOUTACHIVE>)ViewData["AREADETAIL"];
                if (AreaDetail != null && AreaDetail.Count > 0)
                { 
            %>
            <%      
                     foreach (TGProject.Models.TGSEXPORTOUTACHIVE rows in AreaDetail)
                     {
                        i = i + 1;

                        if (AreaDetail.Count - i != 0)
                        {
            %>
        <tr>
            <%--办事处--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.AREANAME%></td>
            
            <%--姓名--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           <%-- <%=rows.USERNAME%>--%>
             <a href="<%=rows.USERNAME%>,<%=rows.AREAID%>"><%=rows.USERNAME%></a>
            
            </td>
            
            <%--职位--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.PLACENAME%></td>
            
            <%--帐号--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.UACCOUNT%></td>
            
            <%--入职日期--%>
            <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 65px;  text-align: center;font-size:small;">
            <%=rows.ENTERTIME.ToShortDateString()%></td>
            
            <%--离职日期--%>
            <%if (rows.DIMISSIONTIME.ToShortDateString() != "0001-1-1")
              {
            %>
                <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 64px;  text-align: center;font-size:small;">
                <%=rows.DIMISSIONTIME.ToShortDateString()%></td>
            <%
                }
              else
              {
                  %>
                <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                未离职</td>
                  <%
              }
            %>
            
            <%--直接推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.ZJCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.ZJCONSSUM%></td>
            
            <%--间接推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.IDCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.IDCONSSUM%></td>
            
            <%--线上推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.XTCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.XTCONSSUM%></td>
            
            <%--其他推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.QTCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.QTCONSSUM%></td>
            
            <%--总业绩--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.OUTACHIEVEALL%></td>
            
            
            <%--网吧业绩--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <button style="margin-left:10px;" class="ui-state-default ui-corner-all" onclick="loadNBAchive(<%='\''+rows.UACCOUNT+'\''%>)">查看</button></td>
        </tr> 
            <%}else{
              int prepage = 1;
              int nextpage = rows.total;
              if (rows.page > 1)
                  prepage = rows.page - 1;
              else prepage = 1;
              if (rows.page <rows.total)
                  nextpage = rows.page + 1;
                      %>
        <tr>
            <%--办事处--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.AREANAME%></td>
            
            <%--姓名--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%--<%=rows.USERNAME%>--%>
            <a href="<%=rows.USERNAME%>,<%=rows.AREAID%>"><%=rows.USERNAME%></a>
            </td>
            
            <%--职位--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.PLACENAME%></td>
            
            <%--帐号--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.UACCOUNT%></td>
            
            <%--入职日期--%>
            <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 65px;  text-align: center;font-size:small;">
            <%=rows.ENTERTIME.ToShortDateString()%></td>
            
            <%--离职日期--%>
            <%if (rows.DIMISSIONTIME.ToShortDateString() != "0001-1-1")
              {
            %>
                <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 64px;  text-align: center;font-size:small;">
                <%=rows.DIMISSIONTIME.ToShortDateString()%></td>
            <%
                }
              else
              {
                  %>
                <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                未离职</td>

                  <%
              }
            %>
            
            <%--直接推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.ZJCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.ZJCONSSUM%></td>
            
            <%--间接推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.IDCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.IDCONSSUM%></td>
            
            <%--线上推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.XTCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.XTCONSSUM%></td>
            
            <%--其他推广--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.QTCONSNUM%></td>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.QTCONSSUM%></td>
            
            <%--总业绩--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            <%=rows.OUTACHIEVEALL %></td>
            
             <%--网吧业绩--%>
            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                <button style="margin-left:10px;" class="ui-state-default ui-corner-all" onclick="loadNBAchive(<%='\''+rows.UACCOUNT+'\''%>)"   >查看</button>
            </td>
            
        </tr> 
        
        <tr>
                    <td colspan="25" style="height: 20px">
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=1%>)">
                            首页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=prepage%>)">
                            上一页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=nextpage%>)">
                            下一页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=rows.total%>)">
                            末页</button>
                        当前<%=rows.page%>页／共<%=rows.total%>页
                    </td>
        </tr>
                <% }
                            } %>
                                           
     </table>                 
      <%} %>   
      </div>
      <table width="100%"></table>
       <center>
       <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">返回</button>
       </center>

    </div>
        <div id="loadallexcel" >
       <button style="margin-left:20px; vertical-align:bottom; display:none" class="ui-state-default ui-corner-all" type="button" onclick="loadexceldetailnow()" id="excelnow">导出本页数据</button>
       <button style="margin-left:20px; vertical-align:bottom; display:none" class="ui-state-default ui-corner-all" type="button" onclick="loadexcelone()" id="excelone">导出个人数据</button>
       </div>
 </div>
     <%
         if (AreaDetail == null)
        {
            Response.Write("<script>alert('参数错误！')</script>"); 
        }
        
    %>
 <script type="text/javascript">
     
     var power = $("#power").html();

     $(iAid).ready(function() {
     $('#power').hide();
     $('#beginDate').hide();
     $('#endDate').hide();
     $('#bymonthFlg').hide();
     $('#gameIdx').hide();
     $('#defineStr').hide();
     $('#iAid').hide();
     $('#iZid').hide();
     
     //画面条件初始化
     $('#tabs').tabs();
     //导出按钮权限控制
     if (power == 1 || power == 2 || power == 3 || power == 4 || power == 8) {
         $('#excelone').hide();
         $('#excelnow').show();
     }
     else if (power == 5 || power == 6) {
         $('#excelone').show();
         $('#excelnow').hide();
     }
     else {
         $('#excelone').hide();
         $('#excelnow').hide();
     }
         //如果是办事处帐号隐藏大区选项
        if (power == 5 || power == 6 || power == 7) {
             $('#zoneHide1').hide();
         }
         else {
             $('#zoneHide1').show();
         }
         //所选择的游戏
         var gameidx = $("#gameIdx").html();
         $("#GAME").attr("value", gameidx)
         
         //所选择的活动
         if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
             $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
         else {
             loadDefine($("#GAME").val());
         }

         //查找时间
         var sTime = $("#beginDate").html();
         var eTime = $("#endDate").html();
         $("#beginTime").attr("value", sTime);
         $("#endTime").attr("value", eTime);

         var sbymonth = $("#bymonthFlg").html()
         if (sbymonth != "") {
             $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
             $("#beginTime2").val(sbymonth);
         }
         
         //绑定游戏下拉框事件
         $("#GAME").bind('change', function() {
             loadDefine($("#GAME").val());
             if ($("#GAME").val() == 0) {
             }
             else {
             }
         });
         
         //绑定搜索按钮事件
         $("#btnSearch").bind('click', function() {
             loadData(1);
         });

         //绑定大区下拉框事件
         $("#zone").change(function() { loadArea() });

         //根据Control传过来的ZoneID,显示相对应的数据
         var szoneid = $('#iZid').html();
         if (szoneid != "") {
             $('#zone').attr('value', szoneid);
         }
         
         if (power == 1 || power == 2 || power == 3 || power == 4) {
             loadArea();
         }
         //////////exce
         if ($('#powernew').html() == 2) {
             $('#excelnow').show();
         }
         /////////excel

         //////////////////////////点击用户名连接跳转页面
         $("td > a").bind('click', function() {
             var begintime = $("#beginTime").val();
             var endtime = $("#endTime").val();
             //活动ID串
             var actionStrings = "";
             for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                 var chkName = "mst" + k;
                 if ($("#" + chkName).attr("checked") == true) {
                     actionStrings = actionStrings + $("#" + chkName).val() + ",";
                 }
             }
             if (actionStrings == undefined || actionStrings == "undefined" || actionStrings == "") {
                 alert("请选择要查询的活动！");
                 return;
             }

             //所选择游戏
             var gameidx = $("#GAME").val();


             var href = $(this).attr('href');
             var hrefindex = href.split(",");
             //用户名
             var href1 = hrefindex[0];
             //办事处ID
             var href2 = hrefindex[1];
             //活动ID串+开始时间+结束时间+游戏code+办事处ID+用户名
             var parm641 = actionStrings + ";" + begintime + ";" + endtime + ";"  + gameidx + ";" + href2 + ";" + href1;
             var json_data = { strMessage: parm641 };

             $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceDetailInfo/",
                 type: "POST",
                 dataType: "json",
                 data: json_data
             });

             var str = "http://" + location.host + "/ScoreQuery.aspx/TGPerformanceDetailInfo/";
             $(this).attr('href', str);

         });

     })


     function loadNBAchive(uaccount) {
         var json_data;
         var begintime;
         var endtime;
         //活动ID串
         var actionString = "";
         for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ",";
             }
         }
         if (actionString == undefined || actionString == "undefined" || actionString == "") {
             alert("请选择要查询的活动！");
             return;
         }

         //办事处ID
         var strAid = $('#area').val();
         //大区ID
         var strZid = $('#zone').val();
         //所选择游戏
         var gameidx = $("#GAME").val();

         if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
             var begintime = $("#beginTime").val();
             var endtime = $("#endTime").val();
             json_data = { TabIdx: 0, BeginTime: begintime, EndTime: endtime, byMonth: "", DefineIDs: actionString, ZoneID: strZid, AreaID: strAid, SearchType: 0, SearchString: "", GameIdx: gameidx, UAccount: uaccount }
         }
         else {
             //查找时间
             var timeindex = $("#beginTime2").val().split('-');
             var timebegin;
             var timespan = 0;
             if (timeindex[1] == 1) {
                 timespan = 12;
                 timebegin = timeindex[0] - 1;
             } else {
                 timespan = timeindex[1] - 1;
                 timebegin = timeindex[0] - 1;
             }
             beginTime = timeindex[0] + "-" + timespan + "-" + "25";
             endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
             var bymonth = $("#beginTime2").val();
             json_data = { TabIdx: 0, BeginTime: begintime, EndTime: endtime, byMonth: bymonth, DefineIDs: actionString, ZoneID: strZid, AreaID: strAid, SearchType: 0, SearchString: "", GameIdx: gameidx, UAccount: uaccount }
         }

         $.ajax(
             {
                 url: "http://" + location.host + "/ScoreQuery.aspx/NetBarAchiveQueryPerson/",
                 type: "POST",
                 dataType: "json",
                 data: json_data
             });

             var url = "http://" + location.host + "/ScoreQuery.aspx/NetBarOutAchivePerson";
         //var url = "http://" + location.host + "/ScoreQuery.aspx/NetBarOutAchive/";
         location.href = url;
     }
//     
//     function sssA(result) {
//         $("#area").empty();
//         if (result.rows.length > 0) {
//             $.each(result.rows, function(i, item) {
//                 $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
//             });

//             //根据Control传过来的AreaID,显示相对应的数据
//             var sareaid = $('#iAid').html();
//             if (sareaid != "") {
//                 $('#area').attr('value', sareaid);
//                 $('#iAid').html("");
//             }
//         }
//     }
//     
     function loadArea() {
         //定义全局URL以便返回能够找到controls
         url = "http://" + location.host + "/ScoreOffice.aspx/LoadArea/";
         $.ajax(
             {
                 url: url + $("#zone").val(),
                 type: "POST",
                 dataType: "json",
                 success: sss
             });
     }
     function sss(result) {
         $("#area").empty();
         if (result.rows.length > 0) {
             $.each(result.rows, function(i, item) {
                 $("<option></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#area"));
             });

             //根据Control传过来的AreaID,显示相对应的数据
             var sareaid = $('#iAid').html();
             if (sareaid != "") {
                 $('#area').attr('value', sareaid);
                 $('#iAid').html("");
             }
         }
     }
     function loadData(index) {
         var define;
         var beginTime;
         var endTime;
         var datedemo = /((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/;

         if ($("#frm1 input[type *= 'radio'][checked]").val() == 1) {
             //按时间区间查找
             if (!datedemo.test($("#beginTime").val())) {
                 alert("按日期查询开始时间不正确！");
                 return;
             }
             if (!datedemo.test($("#endTime").val())) {
                 alert("按日期查询开始时间不正确！");
                 return;
             }

             //所选择游戏
             var gameidx = $("#GAME").val();

             //活动ID串
             actionString = "";
             for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                 var chkName = "mst" + k;
                 if ($("#" + chkName).attr("checked") == true) {
                     actionString = actionString + $("#" + chkName).val() + ",";
                 }
             }
             if (actionString == undefined || actionString == "undefined" || actionString == "") {
                 alert("请选择要查询的活动！");
                 return;
             }

             //查找时间
             beginTime = $("#beginTime").val();
             endTime = $("#endTime").val();

             //办事处id
             var aid = $('#area').val();

             //活动ID串+开始时间+结束时间+按月查找区分+游戏code+办事处ID+页号
             var parm644 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";" + "" + ";" + gameidx + ";" + aid + ";" + index);
             str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + parm644;
             location.replace(str);
         }
         else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {
             //按月查找

             //查找时间
             var timeindex = $("#beginTime2").val().split('-');
             var timebegin;
             var timespan = 0;
             if (timeindex[1] == 1) {
                 timespan = 12;
                 timebegin = timeindex[0] - 1;
             } else {
                 timespan = timeindex[1] - 1;
                 timebegin = timeindex[0] - 1;
             }

             //所选择游戏
             var gameidx = $("#GAME").val();

             //活动ID串
             actionString = "";
             for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
                 var chkName = "mst" + k;
                 if ($("#" + chkName).attr("checked") == true) {
                     actionString = actionString + $("#" + chkName).val() + ",";
                 }
             }
             if (actionString == undefined || actionString == "undefined" || actionString == "") {

                 alert("请选择要查询的活动！");
                 return;
             }
             
             beginTime = timeindex[0] + "-" + timespan + "-" + "25";
             endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
             var bymonth = $("#beginTime2").val();

             //办事处id
             var aid1 = $('#area').val();
             
             //活动ID串+开始时间+结束时间+按月查找区分+游戏code+办事处ID
             var parm645 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";" + bymonth + ";" + gameidx + ";" + aid1 + ";" + index);
             str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + parm645;
             location.replace(str);
         }
     }


     function loadData2(index) {
         actionString = "";
         for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ";";
             }
         }
         
         if (actionString == undefined || actionString == "undefined" || actionString == "") {
             alert("请选择要查询的活动！");
             return;
         }
           
         var selectindex = $("#Gclass").val();
         //var define = $("#Gclass option:selected").val()
         var beginTime = $("#startt").html();
         var endTime = $("#endt").html();
         var tabsIndex = index + 1;
         var game1 = $("#GAME").val();
         
         parm = actionString + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + 1 + "," + game1;
         var sP642 = BASE64.encode(parm);
         var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeDetailInfo2/" + sP642;
         location.replace(str);
     }
     
     function ReturnPrevious() {
         history.go(-1);
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
     function loadDefine() {
         //定义全局URL以便返回能够找到controls
         //url = "http://" + location.host + "/ScoreOfficeController.aspx/loadDefine/";
         $('#test').html('<span id="test" style="color:Black;"><select    style="  width:226px;" name="Gclass" id="Gclass" onchange="return;return class_onclick()"   multiple="multiple"></select></span>');
         $.ajax(
             {
                 url: "http://" + location.host + "/ScoreOffice.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
     }

     function loadSuccessed(result) {
         $("#Gclass").empty();
         var definestr = $("#defineStr").html();
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
                     $("<option ></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                 }
             });
             $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
         }
         else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
             $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
             $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
         }
         else {
             $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '没有该游戏活动', oneOrMoreSelected: '% 个活动已被选择' });
         }

     }
     ////////excel
     function loadexcel() {
         str = "http://" + location.host + "/ScoreOffice.aspx/showexcel/";
         location.replace(str);
     }
     function loadexceldetailnow() {
         str = "http://" + location.host + "/ScoreOffice.aspx/showexceldetailnow/";
         location.replace(str);
     
     
     }

     function loadexcelone() {
         actionString = "";
         for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
             var chkName = "mst" + k;
             if ($("#" + chkName).attr("checked") == true) {
                 actionString = actionString + $("#" + chkName).val() + ",";
             }
         }
         if (actionString == undefined || actionString == "undefined" || actionString == "") {
             alert("请选择要查询的活动！");
             return;
         }
         var beginTime = $("#beginTime").val();
         var endTime = $("#endTime").val();
         var strP64ea = BASE64.encode(actionString + ";" + beginTime + ";" + endTime);
         str = "http://" + location.host + "/ScoreQuery.aspx/showexcelone/" + strP64ea;
         location.replace(str);

     }
    </script>
</asp:Content>

