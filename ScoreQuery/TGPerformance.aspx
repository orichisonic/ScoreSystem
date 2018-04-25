<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
推广员
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
        <legend>查询条件</legend>
        <div id="frm1">
            <ul class="verticality" id="by_day_id">
                <li>
                    <input name="rd1" type="radio" value="1" checked="checked" />
                    按日期查询（数据为24小时刷新）开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)"  value="2010-1-1" />
                    结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>" />
                </li>
            </ul>
            <ul class="verticality">
                <li>
                    <input  name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
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
                <li>类别:<%--<select name="class" id="class" style="width:226px">
                    <option value="0">所有游戏</option>
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

                    <option  value="0">所有游戏</option>
                        
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
               <button style="margin-left:65px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="loadTGPerformance()">查询</button>
                </li>
            </ul>
        </div>
    </fieldset>
    <br />
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">查询结果：</a></li>
            <%--    <li>
                    <a href="#tabs-1">
                     SD敢达</a></li>--%>
        </ul>
        <div id="tabs-1" style="vertical-align: top; text-align: left">
            <table style="vertical-align: top; width: 102%; border:2px solid #000000; border-collapse: collapse;" id="table1" cellpadding="0" cellspacing="0" border="0">
                <tr style="background-color:#FFFFFF; font-weight:bold">
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;" colspan="5">
                        人员信息
                    </td>
                    <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        直接推广
                    </td>
                    <td colspan="2" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        间接推广
                    </td>
                    <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        其他推广
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 35px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        业绩
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        比例
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 36px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        奖金
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        办事处排名
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        大区排名
                    </td>
                    <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        总排名
                    </td>
                                        <td rowspan="2" style="border: 1px solid #000000;width: 30px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        激活数
                    </td>
                </tr>
                <tr style="background-color:#FFFFFF; font-weight:bold">
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        大区
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        办事处
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        职务
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        姓名
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        帐号
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        领取数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费用户数
                    </td>
                    <td id="first" style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费金额
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费转换率
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        有效用户数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        有效转换率
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费用户数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费金额
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        领取数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费用户数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费金额
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        消费转换率
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        有效用户数
                    </td>
                    <td style="border: 1px solid #000000;height: 21px; text-align: center; vertical-align: middle; color: #000000; font-size: 14px; width: 40px; border-style: ridge; border-width: 1px; text-align: center; font-size: small;">
                        有效转换率
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
                            首页</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            上一页</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            下一页</button>
                        <button class="ui-state-default ui-corner-all" type="submit" onclick="loadTGPerformance()">
                            末页</button>
                        当前<%=int.Parse(rows.page)-1%>页／共<%=rows.records%>页
                    </td>
                </tr>--%>
                <%  //}
                            } %>
            </table>
            <%} %>
            <table width="100%">
            </table>
            <center style="margin-top:10px">
                <button class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
                <button style="margin-left:15px" class="ui-state-default ui-corner-all" type="button" onclick="ReturnPrevious()">返回</button>
            </center>
        </div>
    </div>
    <%
        if (SpreaderList == null)
        {
            Response.Write("<script>alert('参数错误！')</script>"); 
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
                $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
            }
            else {

                loadDefine($("#GAME").val());
            }
            //$("#Gclass").multiSelect({ selectAll: false, noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
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
                    alert("按日期查询开始时间不正确！");
                    return;
                }

                if (!datedemo.test($("#endTime").val())) {
                    alert("按日期查询开始时间不正确！");
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
                        alert("请选择要查询的活动！");
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
                    alert("请选择要查询的活动！");
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
                    alert("按日期查询开始时间不正确！");
                    return;
                }

                if (!datedemo.test($("#endTime").val())) {
                    alert("按日期查询开始时间不正确！");
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
                    alert("请选择要查询的活动！");
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
                    alert("请选择要查询的活动！");
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

            //     options = "<option value=''></option>";

            //     $("#Gclass").html(options);
            //     $("#Gclass").multiSelect({
            //         selectAll: false,
            //         noneSelected: 'Check some boxes!',
            //         oneOrMoreSelected: '%个游戏活动已被选择'
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
            $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
            $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
            }
            $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });


        }
    </script>

</asp:Content>
