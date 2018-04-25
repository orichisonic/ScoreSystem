<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
大区
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
      <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.WModels.TgsOutachiveCondition condtion = (TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            int selectIdx = 0;
            DateTime dteBegin;
            DateTime dteEnd;
            decimal sortkinds = 0;
            decimal btnIndex = 0;
            string strByMonth = "";
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                dteBegin = condtion.START;
                dteEnd = condtion.END;
                sortkinds = condtion.ORDERKIND;
                btnIndex = condtion.defineIndex;
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
        <span id="areaid"><%=account.AREAID%></span>
       
        <span id="begint"><%=dteBegin.ToShortDateString()%></span>
        <span id="endt"><%=dteEnd.ToShortDateString()%></span>

        <span id="selectID"><%=selectIdx%></span>
          <span id="sortkinds"><%=sortkinds %></span>
           <span id="bymonth"><%=strByMonth%></span>
          <input style="display:none"  id="span1"  value="<%=btnIndex %>"/>
            <span id="gameidx"><%=gameidx%></span>
       <span id="definesstr"><%=strDefines%></span>
 <%--<asp:ScriptManager ID="ScriptManager1" runat="server"
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    </ContentTemplate>
    <Triggers></Triggers>
    </asp:UpdatePanel>--%>
    
    <fieldset>
        <legend visible="false">查询条件</legend>
        <div id="frm1" style="text-align: left">
            <ul class="verticality"  id="by_day_id">
             <li style=" vertical-align:bottom"><input style="vertical-align:bottom" name="rd1" type="radio" value="1" checked="checked"/>按日期查询（数据为24小时刷新）开始日期    <input style="vertical-align:bottom" type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2010-1-1"/>
             结束日期 <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="<%= DateTime.Now.ToShortDateString() %>"/></li>
           </ul>
            <ul class="verticality">
                <li>
                    <input name="rd1" type="radio" value="0" />按月份查询（每月25日起可查询当月数据）
                    <select style="width:95px;margin-left:0px; vertical-align:bottom" name="beginTime2" id="beginTime2">
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
            
            <li style=" vertical-align:bottom">类别:
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
            
            
            <%--<select style="width:226px" name="class" id="Gclass">
                  <option  value="0">所有游戏</option>
                  
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
                 <button style="margin-left:60px; vertical-align:bottom;" class="ui-state-default ui-corner-all" type="button" onclick="LoadData()">
                    查询</button>
            </li>
            
            <li style="margin:0px 0px 0px 0px">
            <div id="zongyeji" 
                    style=" float:left;text-align:center; vertical-align:middle;background-color:#B7E2E3; width:90px;height:15px; font-weight: bold; color: #000000; cursor:pointer">总业绩</div>
            <div id="xianxiatuiguang" style=" float:left;text-align:center; vertical-align:middle;background-color:#B7E2E3; width:90px;height:15px; font-weight: bold; color: #000000;margin-left:10px;cursor:pointer">线下推广</div>
            <div id="xianshangtuiguang" style=" float:left;text-align:center; vertical-align:middle;background-color:#B7E2E3; width:90px;height:15px; margin-left:10px; font-weight: bold; color: #000000;cursor:pointer">线上推广</div>
            <div id="qitatuiguang" style=" float:left;text-align:center; vertical-align:middle;background-color:#B7E2E3; width:90px;height:15px; margin-left:10px; font-weight: bold; color: #000000;cursor:pointer">其它推广</div>
            <div id="jiangjinmingxi" 
                    style=" float:left;text-align:center; vertical-align:middle;background-color:#B7E2E3; width:90px;height:15px; margin-left:10px; font-weight: bold; color: #000000;cursor:pointer">奖金明细</div>
            </li>
            
            </ul>
           </div>
             </fieldset>
     <div id="Div1">
   <ul>
    <li><a href="#tabs">按人均业绩排列</a></li>
    <li><a href="#tabs">按推广成本排列</a></li>
    <li><a href="#tabs">按业绩排列</a></li>
    <li><a href="#tabs">按奖金排列</a></li>     
    </ul>
    <div id="tabs"  style="text-align: center">
           <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
            <tr style="background-color:#FFFFFF; font-weight:bold" >
                
               <td colspan="3" 
                style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle; color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                人员信息</td>
               <td colspan="4" 
                style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                直接推广</td>
               <td colspan="2" 
                style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                间接推广</td>
                <td colspan="3" 
                style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                线上推广</td>
               <td colspan="4" 
                style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                其他推广</td>
                <td rowspan="2" 
                   style="border: 1px solid #000000;width: 54px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                业绩</td>
                <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 30px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                比例</td>
                <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 36px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                奖金</td>
               <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                人均业绩</td>
                <td rowspan="2" 
                style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                推广成本</td>
                <td rowspan="2" 
                style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                业绩排名</td>
                                <td rowspan="2" 
                style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                激活数</td>
            </tr>
            <tr style="background-color:#FFFFFF; font-weight:bold">
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                大区</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                办事处</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                经理</td>
                
                 <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                领取数</td>
                  <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                有效用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费金额</td>
                
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费金额</td>
                             <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                领取数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费金额</td>
                            
                             <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                领取数</td>
                       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                有效用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费用户数</td>
                <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                消费金额</td>
            </tr>
                <%
                    //int i=0;
                    List<TGProject.Models.WModels.TGSOUTACHIVEAREA> AreaList = (List<TGProject.Models.WModels.TGSOUTACHIVEAREA>)ViewData["AREA"];

                    if (AreaList != null && AreaList.Count > 0)
                    {
                        //i = i + 1;
                        foreach (TGProject.Models.WModels.TGSOUTACHIVEAREA rows in AreaList)
                        {
                            //if(AreaList.Count-i==1)
                            //{
                %>
                    <tr>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.USERNAME%>
                        </td>
                        
                        <%--直接推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSSUM%>
                        </td>
                        
                        <%--间接推广--%>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%>
                        </td>

                        <%--线上推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSSUM%>
                        </td>
                        
                        <%--其他推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTGETNUM%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.OUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.RATIO%></td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.PEROUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.TGCOST%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ALLORDER%>
                                                    <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>

                          </tr>                          
                       <%
                    }
                         }
                        //else
                        //{
                       %>
                           <%-- <tr>
                                <td colspan="25" style="height: 20px">
                                <button  class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">首页</button>
                                <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">上一页</button>
                                <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">下一页</button>       
                                <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">末页</button>
                                当前<%%>页／共<%%>页</td>
                            </tr>--%>
                       
                      
                  
                </table> 
    </div>
    </div>
    
     <div id="Div2">
   <ul>
    <li><a href="#tabs2">按人均业绩排列</a></li>
    <li><a href="#tabs2">按推广成本排列</a></li>
    <li><a href="#tabs2">按业绩排列</a></li>
    <li><a href="#tabs2">按奖金排列</a></li>     
    </ul>
    <div id="tabs2" style="text-align: center">

          <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
            <tr style="background-color:#FFFFFF; font-weight:bold" >
            <td colspan="4" style="border: 1px solid #000000;height: 21px; text-align:right; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align:center;font-size:small;">
            办事处信息</td>
            <td colspan="6"style="border: 1px solid #000000;height: 21px; text-align:right;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align:center;font-size:small;">
            直接推广</td>
            <td colspan="2" style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            间接推广</td>
           
            <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 48px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            线下推广业绩</td>
            <td rowspan="2" 
                    style="padding-left:6px;border: 1px solid #000000;width: 26px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: right; font-size:small;">
            比例</td>
            <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 39px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            奖金</td>
            <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            业绩排名</td>
                        <td rowspan="2" style="padding-left:6px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            激活数</td>
            </tr>
            <tr style="background-color:#FFFFFF; font-weight:bold" >
            <td style="border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: right; font-size:small;">
            大区</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            经理</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 62px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            执行人员数量</td>
            
             <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            领取数</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
             <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费转换率</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效用户数</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效转换率</td>
            
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="padding-left:6px;border: 1px solid #000000;height: 33px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:51px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
            </tr>
                <%
                    int i2 = 0;
                    if (AreaList != null && AreaList.Count > 0)
                    {
                        i2 = i2 + 1;
                        foreach (TGProject.Models.WModels.TGSOUTACHIVEAREA rows in AreaList)
                        {
                            //if (AreaList.Count - i2 == 1)
                            //{
                %>
                    <tr>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.USERNAME%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.EXECCOUNT%>
                        </td>
                        
                        <%
                    //消费转换率
                    decimal dXF = 0;
                    //有效转换率
                    decimal dYX = 0;
                    if (rows.ZJGETNUM > 0)
                    {
                        dXF = (rows.ZJCONSNUM / rows.ZJGETNUM) * 100;
                        dYX = (rows.ZJAVAILNUM / rows.ZJGETNUM) * 100;
                    }
                    else
                    {
                        dXF = 0;
                        dYX = 0;
                    }
                        %>
                        <%--直接推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSCONV*100 + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJAVAILCONV*100 + "%"%>
                        </td>
                        
                        
                        <%--间接推广--%>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%>
                        </td>
                      
                        
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXOUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXRATIO%></td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.TGBONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXALLORDER%>
                        </td>
                                                <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                          </tr>
            <%-- <%
                    }
                            else
                            {
               %>
                        <tr>
                            <td colspan="25" style="height: 20px">
                            <button  class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">首页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">上一页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">下一页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">末页</button>
                            当前<%%>页／共<%%>页</td>
                        </tr>--%>
                    <%//}
                    //}
                }
                    }%>
            </table>
    </div>
    </div>
    
    <div id="Div3">
   <ul>
    <li><a href="#tabs3">按人均业绩排列</a></li>
    <li><a href="#tabs3">按推广成本排列</a></li>
    <li><a href="#tabs3">按业绩排列</a></li>
    <li><a href="#tabs3">按奖金排列</a></li>     
    </ul>
    <div id="tabs3"  style="text-align: center">
        <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
        <tr style="background-color:#FFFFFF; font-weight:bold" >
            <td colspan="4" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处信息</td>
            <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            线上推广</td>
            <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            比例</td>
            <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            奖金</td>
            <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            业绩排名</td>
                        <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            激活数</td>
        </tr>
        <tr style="background-color:#FFFFFF; font-weight:bold">
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 27px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            大区</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 20px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 23px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            经理</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            执行人员数量</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            领取数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费转换率</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效用户数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效转换率</td>
        </tr>
                
            <%
                    //int i3 = 0;
                    if (AreaList != null && AreaList.Count > 0)
                    {
                        //i3 = i3 + 1;
                        foreach (TGProject.Models.WModels.TGSOUTACHIVEAREA rows in AreaList)
                        {

                            //if (AreaList.Count - i3 == 1)
                            //{
            %>
                        <tr>
                        <td  style="padding-left:16px;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.USERNAME%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.EXECCOUNT%>
                        </td>
                        
                         <%
                    //消费转换率
                    decimal dXTXF = 0;
                    //有效转换率
                    decimal dXTYX = 0;
                    if (rows.XTGETNUM > 0)
                    {
                        dXTXF = (rows.XTCONSNUM / rows.XTGETNUM) * 100;
                        dXTYX = (rows.XTAVAILNUM / rows.XTGETNUM) * 100;
                    }
                    else
                    {
                        dXTXF = 0;
                        dXTYX = 0;
                    }
                        %>
                        
                        <%--线上推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTCONSCONV*100 + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTAVAILCONV*100 + "%"%>
                        </td>

                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTRATIO%></td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTBONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XTALLORDER%>
                                                    <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                    </tr>
            
           <%-- <%
                    }
                            else
                            {
                   %>
                        <tr>
                            <td colspan="25" style="height: 20px">
                            <button  class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">首页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">上一页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">下一页</button>       
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">末页</button>
                            当前<%%>页／共<%%>页</td>
                        </tr>--%>
                    <%//}
                        }
                    }%>
            </table>
    </div>
    </div>
    
    <div id="Div4">
   <ul>
    <li><a href="#tabs4">按人均业绩排列</a></li>
    <li><a href="#tabs4">按推广成本排列</a></li>
    <li><a href="#tabs4">按业绩排列</a></li>
    <li><a href="#tabs4">按奖金排列</a></li>     
    </ul>
    <div id="tabs4" style="text-align: center">
        <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
        <tr style="background-color:#FFFFFF; font-weight:bold" >
            <td colspan="4" style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处信息</td>
            <td colspan="6" style="border: 1px solid #000000;height: 21px; text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            其他推广</td>
            <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            比例</td>
            <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            业绩排名</td>
                        <td rowspan="2" style="padding-left:16px;border: 1px solid #000000;width: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            激活数</td>
        </tr>
        <tr style="background-color:#FFFFFF; font-weight:bold" >
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 31px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            大区</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            经理</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 42px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            执行人员数量</td>
             <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            领取数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
             <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费转换率</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效用户数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效转换率</td>
        </tr>
            <%
                    //int i4 = 0;
                    if (AreaList != null && AreaList.Count > 0)
                    {
                        //i4 = i4 + 1;
                        foreach (TGProject.Models.WModels.TGSOUTACHIVEAREA rows in AreaList)
                        {
                            //if (AreaList.Count - i4 == 1)
                            //{
            %>
                    <tr>
                        <td  style="padding-left:16px;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.USERNAME%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.EXECCOUNT%>
                        </td>
                        
                        
                        <%
                    //消费转换率
                    decimal dQTXF = 0;
                    //有效转换率
                    decimal dQTYX = 0;
                    if (rows.QTGETNUM > 0)
                    {
                        dQTXF = (rows.QTCONSSUM / rows.QTGETNUM) * 100;
                        dQTYX = (rows.QTAVAILNUM / rows.QTGETNUM) * 100;
                    }
                    else
                    {
                        dQTXF = 0;
                        dQTYX = 0;
                    }
                        %>
                        <%--其他推广--%>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTCONSCONV*100 + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTAVAILCONV*100 + "%"%>
                        </td>

                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTRATIO%></td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.QTALLORDER%>
                                                    <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>

                    </tr> 
           <%-- <%
                    }
                            else
                            {
            %>
                        <tr>
                            <td colspan="25" style="height: 20px">
                            <button  class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">首页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">上一页</button>
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">下一页</button>       
                            <button class="ui-state-default ui-corner-all" type="submit" onclick="LoadOfficeLst()">末页</button>
                            当前<%%>页／共<%%>页</td>
                        </tr>--%>
            <%          
                 //   }
                        }
                    }
            %>
            </table>

    </div>
    </div>
    
    <div id="Div5">
   <ul>
    <li><a href="#tabs5">按人均业绩排列</a></li>
    <li><a href="#tabs5">按推广成本排列</a></li>
    <li><a href="#tabs5">按业绩排列</a></li>
    <li><a href="#tabs5">按奖金排列</a></li>     
    </ul>
    <div id="tabs5" style="text-align: center">

              <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse;">
        <tr style="background-color:#FFFFFF; font-weight:bold"  >
           <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 31px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            大区</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            职位</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 32px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            姓名</td>
             <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 32px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            帐号</td>
             <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            领取数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效数量</td>
             <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效转换率</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:30px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费转换率</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
            <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            奖金</td>
                        <td style="padding-left:16px;border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 30px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            激活数</td>

        </tr>
                 <%
                     List<TGProject.Models.WModels.TGSOUTACHIVEAREADETAIL> AreaDTL = (List<TGProject.Models.WModels.TGSOUTACHIVEAREADETAIL>)ViewData["AREADTL"];
                if (AreaDTL != null && AreaDTL.Count > 0)
                {
                    decimal dTotal = 0;
                    decimal youxiaoratio = 0;
                    decimal xiaofeiratio = 0;
                    //foreach (TGProject.Models.WModels.TGSOUTACHIVEAREADETAIL rows in AreaDTL)
                    //{
                    //    dTotal = dTotal + rows.BONUS;
                    //}
                    
                    foreach (TGProject.Models.WModels.TGSOUTACHIVEAREADETAIL rows in AreaDTL)
                    {
                        dTotal = dTotal + rows.BONUS;
                        youxiaoratio = 0;
                        xiaofeiratio = 0;
                        if ((rows.ZJGETNUM + rows.XTGETNUM + rows.QTGETNUM) > 0)
                        {
                            xiaofeiratio = decimal.Round(100 * (rows.ZJCONSNUM + rows.IDCONSNUM + rows.XTCONSNUM + rows.QTCONSNUM) / (rows.ZJGETNUM + rows.XTGETNUM + rows.QTGETNUM), 2);
                        }
                        if ((rows.ZJGETNUM + rows.XTGETNUM + rows.QTGETNUM) > 0)
                        {
                            youxiaoratio = decimal.Round(100 * (rows.ZJAVAILNUM + rows.QTAVAILNUM) / (rows.ZJGETNUM + rows.XTGETNUM + rows.QTGETNUM), 2);
                        }
            %>
                    <tr>
                        <td  style="padding-left:16px;border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                         <a href="<%=rows.AREAID%>,<%=rows.UKEY%>"><%=rows.AREANAME%></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.POPEDOMNAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.USERNAME%>
                        </td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.UACCOUNT%>
                        </td>
                        
                        
                            <%
                            //消费转换率
                            decimal dQTXF=0;
                            //有效转换率
                            decimal dQTYX=0;
                            if (rows.ZJGETNUM > 0)
                            {
                                dQTXF = (rows.ZJCONSSUM / rows.ZJGETNUM) * 100;
                                dQTYX = (rows.ZJAVAILNUM / rows.ZJGETNUM) * 100;
                            }
                            else
                            {
                                dQTXF = 0;
                                dQTYX = 0;
                            }
                            
                            
                        %>
<%--                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJAVAILNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AVAILCONV*100 + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.CONSCONV*100 + "%" %>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%= rows.ZJCONSSUM%>
                        </td>--%>
                        
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM + rows.XTGETNUM + rows.QTGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM + rows.IDCONSNUM + rows.XTCONSNUM + rows.QTCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJAVAILNUM + rows.QTAVAILNUM%>
                        </td>
<%--                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AVAILCONV + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.CONSCONV  + "%"%>
                        </td>--%>
                           <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=youxiaoratio + "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=xiaofeiratio+ "%"%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%= rows.ZJCONSSUM + rows.IDCONSSUM + rows.XTCONSSUM + rows.QTCONSSUM%>
                        </td>

                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%></td>
                                                    <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%></td>

                            
                    </tr> 
            <%

                    }
            %>
                    <tr>
                         <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;" colspan="1">
                           合计</td>
                        <td  style="border: 1px ridge #000000; height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;" colspan="12">
                           <%=dTotal+"元"%></td>
                       </tr> 
            <%  
                }
            %>
            </table>             
    </div>
</div>

<%
    if (AreaList != null && AreaList.Count > 0)
    {%>
<center>  

     <button  style="margin-top:10px; display:none" id="view_more_result" class="ui-state-default ui-corner-all" type="submit" onclick="QueryDetail()">查看详细</button>
</center>

     <%
        
    }%>
        
    <%
   
        if (AreaList == null)
        {
            Response.Write("<script>alert('参数错误！')</script>"); 
        }
        
    %>
 <script type="text/javascript">
    
     var selectindex=0;
     var power = 0;
     var GCombobox = 0;
     var defineIndex = "0";
   
//     var defineIndex = $("#span1").val();
     $('#Div1').tabs();
     $('#Div2').tabs();
     $('#Div3').tabs();
     $('#Div4').tabs();
     $('#Div5').tabs();
     //     var idx = $("#selectID").html();
     var idx = $("#span1").val();
     var gameidx = $("#gameidx").html();
     $("#selectID").hide();
     $("#gameidx").hide();
     $("#definesstr").hide();
     if (idx == 0) {
         $('#Div1').show();
         $('#Div2').hide();
         $('#Div3').hide();
         $('#Div4').hide();
         $('#Div5').hide();
     }
     else if (idx == 991) {
         //     $('#tabs2').tabs('option', 'selected', 0);
         $('#Div1').hide();
         $('#Div2').show();
         $('#Div3').hide();
         $('#Div4').hide();
         $('#Div5').hide();

     }
     else if (idx == 992) {

     $('#Div1').hide();
     $('#Div2').hide();
     $('#Div3').show();
     $('#Div4').hide();
     $('#Div5').hide();
     
     
      }

     else if (idx == 993) {

         $('#Div1').hide();
         $('#Div2').hide();
         $('#Div3').hide();
         $('#Div4').show();
         $('#Div5').hide();


     }
     else if (idx == 994) {

         $('#Div1').hide();
         $('#Div2').hide();
         $('#Div3').hide();
         $('#Div4').hide();
         $('#Div5').show();


     }
     else {

         $('#Div1').show();
         $('#Div2').hide();
         $('#Div3').hide();
         $('#Div4').hide();
         $('#Div5').hide();


     }
   
     $('.selector').tabs({ selected: 0 });
     if (($('#sortkinds').html() == 1)) {
         if (idx == 0)
             $('#Div1').tabs('option', 'selected', 0);
         else if (idx == 991)
             $('#Div2').tabs('option', 'selected', 0);
         else if (idx == 992)
             $('#Div3').tabs('option', 'selected', 0);
         else if (idx == 993)
             $('#Div4').tabs('option', 'selected', 0);
         else if (idx == 994)
             $('#Div5').tabs('option', 'selected', 0);
         else
             $('#Div1').tabs('option', 'selected', 0);
     }
     else if (($('#sortkinds').html() == 2)) {
      
         if (idx == 0) {
             
             $("#Div1").tabs('option', 'selected', 1);
         }
         else if (idx == 991)
             $('#Div2').tabs('option', 'selected', 1);
         else if (idx == 992)
             $('#Div3').tabs('option', 'selected', 1);
         else if (idx == 993)
             $('#Div4').tabs('option', 'selected', 1);
         else if (idx == 994)
             $('#Div5').tabs('option', 'selected', 1);
         else
             $('#Div1').tabs('option', 'selected', 1);
     }
     else if (($('#sortkinds').html() == 3)) {

         if (idx == 0)
             $('#Div1').tabs('option', 'selected', 2);
         else if (idx == 991)
             $('#Div2').tabs('option', 'selected', 2);
         else if (idx == 992)
             $('#Div3').tabs('option', 'selected', 2);
         else if (idx == 993)
             $('#Div4').tabs('option', 'selected', 2);
         else if (idx == 994)
             $('#Div5').tabs('option', 'selected', 2);
         else
             $('#Div1').tabs('option', 'selected', 2);
     }
     else if (($('#sortkinds').html() == 4)) {

         if (idx == 0)
             $('#Div1').tabs('option', 'selected', 3);
         else if (idx == 991)
             $('#Div2').tabs('option', 'selected', 3);
         else if (idx == 992)
             $('#Div3').tabs('option', 'selected', 3);
         else if (idx == 993)
             $('#Div4').tabs('option', 'selected', 3);
         else if (idx == 994)
             $('#Div5').tabs('option', 'selected', 3);
         else
             $('#Div1').tabs('option', 'selected', 3);

     }


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
   
     
     ////////////////////////////////////////////////////////
         $('#xianxiatuiguang').corner('7px');
         $('#xianshangtuiguang').corner('7px');
         $('#qitatuiguang').corner('7px');
         $('#jiangjinmingxi').corner('7px');
         $('#zongyeji').corner('7px');
         $('#zongyeji').bind('mousedown', function() {
             $('#zongyeji').css('background-color', '#D792E3');
             $('#xianxiatuiguang').css('background-color', '#B7E2E3');
             $('#xianshangtuiguang').css('background-color', '#B7E2E3');
             $('#qitatuiguang').css('background-color', '#B7E2E3');
             $('#jiangjinmingxi').css('background-color', '#B7E2E3');
             GCombobox = 0;
             defineIndex = "0";
             class_onclick();


         });
         $('#xianxiatuiguang').bind('mousedown', function() {
             $('#xianxiatuiguang').css('background-color', '#D792E3');
             $('#zongyeji').css('background-color', '#B7E2E3');
             $('#xianshangtuiguang').css('background-color', '#B7E2E3');
             $('#qitatuiguang').css('background-color', '#B7E2E3');
             $('#jiangjinmingxi').css('background-color', '#B7E2E3');
             GCombobox = 991;
             defineIndex = "991";
             class_onclick();

         });
         $('#xianshangtuiguang').bind('mousedown', function() {
             $('#xianshangtuiguang').css('background-color', '#D792E3');
             $('#zongyeji').css('background-color', '#B7E2E3');
             $('#xianxiatuiguang').css('background-color', '#B7E2E3');
             $('#qitatuiguang').css('background-color', '#B7E2E3');
             $('#jiangjinmingxi').css('background-color', '#B7E2E3');
             GCombobox = 992;
             defineIndex = "992";
             class_onclick();

         });
         $('#qitatuiguang').bind('mousedown', function() {

             $('#qitatuiguang').css('background-color', '#D792E3');
             $('#zongyeji').css('background-color', '#B7E2E3');
             $('#xianxiatuiguang').css('background-color', '#B7E2E3');
             $('#xianshangtuiguang').css('background-color', '#B7E2E3');
             $('#jiangjinmingxi').css('background-color', '#B7E2E3');
             GCombobox = 993;
             defineIndex = "993";
             class_onclick();

         });
         $('#jiangjinmingxi').bind('mousedown', function() {

             $('#jiangjinmingxi').css('background-color', '#D792E3');
             $('#zongyeji').css('background-color', '#B7E2E3');
             $('#xianxiatuiguang').css('background-color', '#B7E2E3');
             $('#xianshangtuiguang').css('background-color', '#B7E2E3');
             $('#qitatuiguang').css('background-color', '#B7E2E3');
             GCombobox = 994;
             defineIndex = "994";
             class_onclick();

         });
         //////////
         //////////
         //////////
         $('#Gclass')[0].selectedIndex = 0;
         
         var contentselect;
         var strTmp = new Array();
         strTmp = location.href.split("/");
         var strFrom64 = BASE64.decode(strTmp[strTmp.length - 1]);
         var href = location.href.replace(strTmp[strTmp.length-1], strFrom64);

         var lasthref = href.substring(href.length - 12, href.length);


         //alert(lasthref);
         if (href.indexOf("/0,") > 0) {
             $('#Gclass')[0].selectedIndex = 0;
         }
         else if (href.indexOf("/1,") > 0) {
             $('#Gclass')[0].selectedIndex = 1;
         }
         else if (href.indexOf("/2,") > 0) {
             $('#Gclass')[0].selectedIndex = 2;
         }
         else if (href.indexOf("/3,") > 0) {
             $('#Gclass')[0].selectedIndex = 3;
         }
         else if (href.indexOf("/4,") > 0) {
             $('#Gclass')[0].selectedIndex = 4;
         }
         else if (href.indexOf("/5,") > 0) {
             $('#Gclass')[0].selectedIndex = 5;
         }
         else if (href.indexOf("/6,") > 0) {
             $('#Gclass')[0].selectedIndex = 6;
         }
         else if (href.indexOf("/7,") > 0) {
             $('#Gclass')[0].selectedIndex = 7;
         }
         else if (href.indexOf("/8,") > 0) {
             $('#Gclass')[0].selectedIndex = 8;
         }
         else if (href.indexOf("/9,") > 0) {
             $('#Gclass')[0].selectedIndex = 9;
         }
         else if (href.indexOf("/10,") > 0) {
             $('#Gclass')[0].selectedIndex = 10;
         }

         ////////////////////
         var lastindex = href.lastIndexOf("o/");
         var templastindex = href.substring(lastindex + 2, lastindex + 4);
         var douhaoindex = templastindex.indexOf(",");
         var selectedvalue = templastindex.substring(0, douhaoindex);
         $('#Gclass')[0].selectedIndex = selectedvalue;
         // alert(selectedvalue);
         ////////////////////

//         if (lasthref.indexOf("0;") > 0) {
//             $('#zongyeji').css('background-color', '#D792E3');
//             GCombobox = 0;
//             defineIndex = 0;
//         }
         //         else 
          if (lasthref.indexOf("991;") >= 0) {
             $('#xianxiatuiguang').css('background-color', '#D792E3');
             GCombobox = 991;
             defineIndex = 991;
         }
         else if (lasthref.indexOf("992;") >= 0) {
             $('#xianshangtuiguang').css('background-color', '#D792E3');
             GCombobox = 992;
             defineIndex = 992;
         }
         else if (lasthref.indexOf("993;") >= 0) {
             $('#qitatuiguang').css('background-color', '#D792E3');
             GCombobox = 993;
             defineIndex = 993;
         }
         else if (lasthref.indexOf("994;") >= 0) {
             $('#jiangjinmingxi').css('background-color', '#D792E3');
             GCombobox = 994;
             defineIndex = 994;
         }
         else {
             $('#zongyeji').css('background-color', '#D792E3');
         }
         //alert(GCombobox);

         //////////


         ///////////////////////////////
         $("td > a").bind('click', function() {
             var begintime = $("#beginTime").val();
             var endtime = $("#endTime").val();
             var href = $(this).attr('href');
             var hrefindex = href.split(",");
             var href1 = hrefindex[0];
             var href2 = hrefindex[1];
             // var username = $(this).text();
             // var content = $($(this).parents().parents()).html();
             var pos, str, para, parastr;
             //var str = window.location.href;
             //var pos = str.indexOf("/S");
             // var parastr = str.substring(0, pos + 1);
             //var content2 = $($(this).parents().parents()).html();
             //var pos2 = str.indexOf("!");
             // var pos3 = str.indexOf("*");
             //  var parastr2 = str.substring(pos2, pos3);
             var parm641= BASE64.encode("0;," + begintime + "," + endtime + ",0," + "1," + href1 + ",," + href2 + "," + GCombobox+","+"0");
             href = "http://" + location.host + "/ScoreOffice.aspx/OfficeLstInfo/" + parm641;
             //parastr
             //alert(href);
             $(this).attr('href', href);
         });
         ////////////////////////////
         var sTime = $("#begint").html();
         var eTime = $("#endt").html();

         $("#beginTime").attr("value", sTime);
         $("#endTime").attr("value", eTime);
         $("#areaid").hide();
         $("#selectID").hide();
         $("#begint").hide();
         $("#endt").hide();
         $("#by_day_id").show(10);
         $("#sortkinds").hide();
         $("#bymonth").hide();

         $("#Gclass").bind('click', function() {
             var content;
             content = $("#Gclass option:selected").text();
             if (content == "奖金明细") {
                 $("#by_day_id").hide(1000);
                 $('#view_more_result').hide();
                 $("#frm1 input[type *= 'radio']").get(1).checked = true;
             }
             else {
                 $("#by_day_id").show(1000);
                 //  $('#view_more_result').show();


             }

         });
         var sbymonth = $("#bymonth").html();

         if (sbymonth != "") {
             $("#frm1 input[type *= 'radio'][value=0]").attr("checked", 'checked');
             $("#beginTime2").val(sbymonth);
         }
         $('#Div1').bind('tabsselect', function(event, ui) { LoadOfficeLst(ui.index) });
         $('#Div2').bind('tabsselect', function(event, ui) { LoadOfficeLst(ui.index) });
         $('#Div3').bind('tabsselect', function(event, ui) { LoadOfficeLst(ui.index) });
         $('#Div4').bind('tabsselect', function(event, ui) { LoadOfficeLst(ui.index) });
         $('#Div5').bind('tabsselect', function(event, ui) { LoadOfficeLst(ui.index) });
//         $("#Gclass").change(function() {

//             //             if ($("#Gclass").val() != 991 && $("#Gclass").val() != 992 && $("#Gclass").val() != 993 && $("#Gclass").val() != 994)
//             //                 LoadData();

//             //             if (GCombobox != 991 && GCombobox != 992 && GCombobox != 993 && GCombobox != 994)
//             LoadData();


         //         });
         
     
     });


     function class_onclick() {
         var content;
         //         content = $("#Gclass option:selected").text();

         content = GCombobox;
         //         selectindex = $("#Gclass").val();
         selectindex = GCombobox;
         if (defineIndex == 0) {
           
             $("#Div1").show(10);
             $("#Div2").hide(10);
             $("#Div3").hide(10);
             $("#Div4").hide(10);
             $("#Div5").hide(10);
           
         }
         else if (defineIndex == "991") {
                 
             $("#Div1").hide(10);
             $("#Div2").show(10);
             $("#Div3").hide(10);
             $("#Div4").hide(10);
             $("#Div5").hide(10);

         }
         else if (defineIndex == "992") {
           
             $("#Div1").hide(10);
             $("#Div2").hide(10);
             $("#Div3").show(10);
             $("#Div4").hide(10);
             $("#Div5").hide(10);

          
         }
         else if (defineIndex == "993") {
           
             $("#Div1").hide(10);
             $("#Div2").hide(10);
             $("#Div3").hide(10);
             $("#Div4").show(10);
             $("#Div5").hide(10);
          
         }
         else if (defineIndex == "994") {
       
         $("#Div1").hide(10);
         $("#Div2").hide(10);
         $("#Div3").hide(10);
         $("#Div4").hide(10);
         $("#Div5").show(10);

          
         }
         else {
 
             $("#Div1").show(10);
             $("#Div2").hide(10);
             $("#Div3").hide(10);
             $("#Div4").hide(10);
             $("#Div5").hide(10);
         }
     }
        
           
           
           var define = 0;
           var areaID = 0;
           //给切换选项卡执行
           function LoadOfficeLst(index) {
            var define;
            var beginTime;
            var endTime;
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

                //                define = $("#Gclass option:selected").val();
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
//                define = GCombobox;
                beginTime = $("#beginTime").val();
                endTime = $("#endTime").val();
                var tabindex = 0;
                tabindex = index + 1;
                var parm642 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ';' + tabindex + ";" + defineIndex + ";" + "" + ";" + game1);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadRegionPerformanceInfo/" + parm642;
                location.replace(str);
                class_onclick();
                /////////
              
                
                /////////
            }
            else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {


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

                //                define = $("#Gclass option:selected").val();
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
//                define = GCombobox;
                beginTime = timeindex[0] + "-" + timespan + "-" + "25";
                endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                var tabindex = 0;
                tabindex = index + 1;
                var bymonth = $("#beginTime2").val();
                var parm643 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";" + tabindex + ";" + defineIndex + ";" + bymonth + ";" + game1);
                str = "http://" + location.host + "/ScoreQuery.aspx/LoadRegionPerformanceInfo/" + parm643;
                location.replace(str);
                class_onclick();
            }

            }
            
            
            //给查询按钮查询
            function LoadData() {
               
                var define;
                var beginTime;
                var endTime;
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

                    //                    define = $("#Gclass option:selected").val();
                    var game1 = $("#GAME").val();
                    actionString = "";
                    for (k =0; k <= $('#mdiv').find('INPUT').length; k++) {
                        var chkName = "mst" + k;
                        if ($("#" + chkName).attr("checked") == true) {
                            actionString = actionString + $("#" + chkName).val() + ",";
                        }
                    }
                    if (actionString == undefined || actionString == "undefined" || actionString == "") {
                        alert("请选择要查询的活动！");
                        return;
                    }
//                    define = GCombobox;
                    beginTime = $("#beginTime").val();
                    endTime = $("#endTime").val();
                    var tabindex = 0;
                    if (idx == 0) {

                        tabsIndex = $("#Div1").tabs().tabs("option", "selected");
                    }
                    else if (idx == 991) {

                        tabsIndex = $("#Div2").tabs().tabs("option", "selected");
                    }
                    else if (idx == 992) {

                        tabsIndex = $("#Div3").tabs().tabs("option", "selected");
                    }
                    else if (idx == 993) {

                        tabsIndex = $("#Div4").tabs().tabs("option", "selected");
                    }
                    else if (idx == 994) {

                        tabsIndex = $("#Div5").tabs().tabs("option", "selected");
                    }
                    else {

                        tabsIndex = $("#Div1").tabs().tabs("option", "selected");
                    }
                    tabindex = tabsIndex + 1;

                    var parm644 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ';' + tabindex + ";" + defineIndex + ";" + "" + ";" + game1);
                    str = "http://" + location.host + "/ScoreQuery.aspx/LoadRegionPerformanceInfo/" + parm644;

                    location.replace(str);
                    class_onclick();
                }
                else if ($("#frm1 input[type *= 'radio'][checked]").val() == 0) {


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

                    //                                   define = $("#Gclass option:selected").val();
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
//                    define = GCombobox;
                    beginTime = timebegin + "-" + timespan + "-" + "25";
                    endTime = timeindex[0] + "-" + timeindex[1] + "-" + "24";
                    var tabindex = 0;
                    if (idx == 0) {

                        tabsIndex = $("#Div1").tabs().tabs("option", "selected");
                    }
                    else if (idx == 991) {

                        tabsIndex = $("#Div2").tabs().tabs("option", "selected");
                    }
                    else if (idx == 992) {

                        tabsIndex = $("#Div3").tabs().tabs("option", "selected");
                    }
                    else if (idx == 993) {

                        tabsIndex = $("#Div4").tabs().tabs("option", "selected");
                    }
                    else if (idx == 994) {

                        tabsIndex = $("#Div5").tabs().tabs("option", "selected");
                    }
                    else {

                        tabsIndex = $("#Div1").tabs().tabs("option", "selected");
                    }
                    tabindex = tabsIndex + 1;
                    var bymonth = $("#beginTime2").val();
                    var parm645 = BASE64.encode(actionString + ";" + beginTime + ";" + endTime + ";" + tabindex + ";" + defineIndex + ";" + bymonth + ";" + game1);
                    str = "http://" + location.host + "/ScoreQuery.aspx/LoadRegionPerformanceInfo/" + parm645;

                    location.replace(str);
                    class_onclick();
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
                $('#test').html('<span id="test"  style="color:#000000"><select    style="  width:226px;" name="class" id="Gclass" onchange="return;return class_onclick()"   multiple="multiple"></select></span>');
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
