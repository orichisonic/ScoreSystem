<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
���������ƹ�ҵ����ϸ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
    <div id="divIframe" title="ҵ����ϸ">
     <%
    
            TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            int selectIdx = 0;
            decimal sortkinds = 0;
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                selectIdx = condtion.selectIndex;
                sortkinds = condtion.ORDERKIND;
                gameidx = condtion.gameidx;
                strDefines = condtion.DEFINEID;
            }
            else
            {
                selectIdx = 0;
                strDefines = "0,";
            }
        %>
          <span id="ukey"><%=condtion.UKEY%></span>
        <span id="selectID"><%=selectIdx%></span>
          <span id="begintime"><%=condtion.START.ToShortDateString()%></span>
          <span id="endtime"><%=condtion.END.ToShortDateString()%></span>
          <span id="sortkinds"><%=sortkinds %></span>
          <span id="gameidx"><%=gameidx%></span>
          <span id="definesstr"><%=strDefines%></span>
 <fieldset>
  <legend>**���������ƹ�ҵ����ϸ***</legend>          
   <div id="tab2-userinfo" style="float: left;">
    <ul class="verticality">
     <li>����ѯʱ��: <span id="querytime"></span>
     </li><br/> 
    </ul>
    <ul class="verticality">
    <li>���:<select  style="width:226px;" name="GAME" id="GAME">

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
                <button class="ui-state-default ui-corner-all" type="button" onclick="loadData()">��ѯ</button>
                </li><br/> 
    </ul>              
   </div>
  </fieldset> <br />
  <div id="tabs">
   <ul>
    <li><a href="#tabs-1">��ҵ������</a></li>
    <li><a href="#tabs-1">��ֱ���ƹ�����</a></li>
    <li><a href="#tabs-1">������ƹ�����</a></li>
    <li><a href="#tabs-1">�������ƹ�����</a></li>     
    </ul>
    <div id="tabs-1" style="text-align: center">
 
     <table cellpadding="0" cellspacing="0" border="0" 
     
            style="vertical-align:top; width:101%; border:2px solid #000000; border-collapse: collapse; margin-top:8px">
      <tr style="background-color:#FFFFFF; font-weight:bold">       
       <td colspan="5" 
       style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle; color: #000000; font-size: 14px; text-align: center;font-size:small;">
       ��Ա��Ϣ</td>
       <td colspan="6" 
       style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   text-align: center;font-size:small;">
       ֱ���ƹ�</td>
       <td colspan="2" 
       style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   text-align: center;font-size:small;">
       ����ƹ�</td> 
       <td colspan="6" 
       style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   text-align: center;font-size:small;">
       �����ƹ�</td>
       <td rowspan="2" 
       style="border: 1px solid #000000;width: 54px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ҵ��</td>
       <td rowspan="2"  
       style="border: 1px solid #000000;width: 30px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ����</td>
       <td rowspan="2"  
       style="border: 1px solid #000000;width: 36px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ����</td>
       <td rowspan="2" 
       style="border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ���´�����</td>
       <td rowspan="2" 
       style="border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ��������</td>
       <td rowspan="2" 
       style="border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ������</td>
              <td rowspan="2" 
       style="border: 1px solid #000000;width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  text-align: center;font-size:small;">
       ������</td>
       </tr>
       <tr style="background-color:#FFFFFF; font-weight:bold">
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
       ����</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px;  text-align: center;font-size:small;">
       ���´�</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ְ��</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ����</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       �ʺ�</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
       ��ȡ��</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  text-align: center;font-size:small;">
       �����û���</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ���ѽ��</td> 
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  text-align: center;font-size:small;">
       ����ת����</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ��Ч�û���</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
       ��Чת����</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  text-align: center;font-size:small;">
       �����û���</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ���ѽ��</td>             
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
       ��ȡ��</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  text-align: center;font-size:small;">
       �����û���</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ���ѽ��</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
       ����ת����</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  text-align: center;font-size:small;">
       ��Ч�û���</td>
       <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; text-align: center;font-size:small;">
       ��Чת����</td>
      </tr>
       <%   
           int i=0;
           List<TGProject.Models.WModels.TGSOUTACHIVESPREADER> SpreaderList = (List<TGProject.Models.WModels.TGSOUTACHIVESPREADER>)ViewData["Detail"];
            if (SpreaderList!=null && SpreaderList.Count > 0)
            {

                foreach (TGProject.Models.WModels.TGSOUTACHIVESPREADER rows in SpreaderList)
                {
                    i = i + 1;

                    if (SpreaderList.Count - i != 0)
                    {
                      
      %>
    <tr>
    
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZONENAME%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.AREANAME%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.POPEDOMNAME %></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <a  href="<%=rows.UKEY%>"><%=rows.USERNAME%></a></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.UACCOUNT%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJGETNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJAVAILNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJAVAILCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.IDCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.IDCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTGETNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTAVAILNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTAVAILCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.OUTACHVALUE%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.RATIO%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.BONUS%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.BSORDER%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZONEORDER%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ALLORDER%></td>
            <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ACTIVENUM%></td>
      <td visible="false" style="width:0px; height:0px; visibility:hidden; border:0px 0px 0px 0px" id="Td1">
      !<%=rows.UKEY%>*</td>
      </tr>
      
        <%}else{
              int prepage = 1;
              int nextpage = rows.total;
              if (rows.page > 1)
                  prepage = rows.page - 1;
             
              else prepage = 1;
              if (rows.page < rows.total)
                  nextpage = rows.total+1;
               
                      %>
        <tr>
         
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZONENAME%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.AREANAME%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.POPEDOMNAME %></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <a  href="<%=rows.UKEY%>"><%=rows.USERNAME%></a></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.UACCOUNT%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJGETNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJCONSCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJAVAILNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZJAVAILCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.IDCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.IDCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTGETNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSSUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTCONSCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTAVAILNUM%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.QTAVAILCONV%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.OUTACHVALUE%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.RATIO%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.BONUS%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.BSORDER%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ZONEORDER%></td>
      <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ALLORDER%></td>
            <td  style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  text-align: center;font-size:small;">
      <%=rows.ACTIVENUM%></td>
       <td visible="false" style="width:0px; height:0px; visibility:hidden; border:0px 0px 0px 0px; display:none" id="test2">
      !<%=rows.UKEY%>*</td>
      </tr>
               <tr>
                    <td colspan="25" style="height: 20px">
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=1%>)">
                            ��ҳ</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=prepage%>)">
                            ��һҳ</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=nextpage%>)">
                            ��һҳ</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=rows.total%>)">
                            ĩҳ</button>
                        ��ǰ<%=rows.page%>ҳ����<%=rows.total%>ҳ
                    </td>
                </tr>
                <% }
                            } %>
                                           
     </table>                 
      <%} %>   
     <table width="100%">
     </table>
     <center style="margin-top:6px">
     <p style="font-weight: bold">�����Ա�����鿴������ϸ </p>
     <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">
                       ����</button></center>
                           </div>    
    
   </div>
  </div>
        <%
        if (SpreaderList == null)
        {
            Response.Write("<script>alert('��������')</script>");
            Response.Write("<script>$('#begintime').attr('value', '2009-9-1')</script>");
            Response.Write("<script>$('#endtime').attr('value', '2010-12-1')</script>");
            Response.Write("<script>$('#querytime').html($('#begintime').html()+ '��' + $('#endtime').html()); </script>");

        }
        
    %>
 <script type="text/javascript">
      $('#tabs').tabs();
     
      var power = 0;
     
      var selectindex = 0;

      
      var UKEYGLOBAL;
      var begintime;
      var endtime;
     
      
      $('.selector').tabs({ selected: 0 });
      if (($('#sortkinds').html() == 1)) {
          $('#tabs').tabs('option', 'selected', 0);
      }
      else if (($('#sortkinds').html() == 2)) {

          $('#tabs').tabs('option', 'selected', 1);
      }
      else if (($('#sortkinds').html() == 3)) {

          $('#tabs').tabs('option', 'selected', 2);
      }
      else if (($('#sortkinds').html() == 4)) {


      $('#tabs').tabs('option', 'selected', 3);

  }
  $("#sortkinds").hide();


  var gameidx = $("#gameidx").html();
  $("#gameidx").hide();
  $("#definesstr").hide();
  
  
  $(document).ready(function() {

  $("#GAME").attr("value", gameidx);
  
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





      UKEYGLOBAL = $("#ukey").html();

      $("#power").hide();
      $("#ukey").hide();

      begintime = $("#begintime").html();
      endtime = $("#endtime").html();



      var idx = $("#selectID").html();
      $("#selectID").hide();

      $("#class").attr("value", idx);
      $("#querytime").html(begintime + "��" + endtime);
      $("#selectID").hide();
      $("#begintime").hide();
      $("#endtime").hide();


      $("#power").hide();
      $("#ukey").hide();

//      $("#class").change(function() { loadData($("#class").val()) });
      $('#tabs').bind('tabsselect', function(event, ui) { loadData2(ui.index) });

      $("td > a").bind('click', function() {
          var begintime = $("#begintime").html();
          var endtime = $("#endtime").html();
          var href = $(this).attr('href');
          var username = $(this).text();
          var content = $($(this).parents().parents()).html();
          var pos, str, para, parastr;
          var str = window.location.href;
//          var selectindex = $("#class").val();
          //var pos = str.indexOf("/S");
          //var parastr = str.substring(0, pos + 1);
          //var content2 = $($(this).parents().parents()).html();
          //var pos2 = str.indexOf("!");
          // var pos3 = str.indexOf("*");
          //var parastr2 = str.substring(pos2, pos3);
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
      var parm641 = BASE64.encode(href + ";" + actionString + ";" + begintime + ";" + endtime + ";" + game1);
          href = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceDetailInfo/" + parm641;
          // alert(href);
          $(this).attr('href', href);
          if (content.search('�ƹ�Ա') > 0) {

              //location.reload(href);
          }
          //          else if (content.search('�ƹ�����') > 0) {
          //              href = parastr + "/ScoreQuery.aspx\\NetbarManagerPerformance";
          //              $(this).attr('href', href);
          //              alert(href);
          //          }


      });

  });

 function loadData(index) {

     if (index == undefined) {
         index = 1;
     } 
      begintime = $("#begintime").html();
      endtime = $("#endtime").html();

      var game1 = $("#GAME").val();
      actionString = "";
      for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
          var chkName = "mst" + k;
          if ($("#" + chkName).attr("checked") == true) {
              actionString = actionString + $("#" + chkName).val() + ",";
          }
      }
      var tabsselect=$("#tabs").tabs().tabs("option", "selected")+1;
      if (actionString == undefined || actionString == "undefined" || actionString == "") {
          alert("��ѡ��Ҫ��ѯ�Ļ��");
          return;
      }
      var pram = UKEYGLOBAL + ";" + actionString + ";" + begintime + ";" + endtime + ";" + index + ";" + tabsselect + ";" + game1;
      var parm642 = BASE64.encode(pram);
      str = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceDetailInfo2/" + parm642;

      location.reload(str);
  
  
  
  }

  function loadData2(index) {
      begintime = $("#begintime").html();
      endtime = $("#endtime").html();
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
      var tabsselect = index + 1;

      var pram = UKEYGLOBAL + ";" + actionString + ";" + begintime + ";" + endtime + ";" + 1 + ";" + tabsselect+";"+game1;
      var parm643 = BASE64.encode(pram);
      str = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceDetailInfo2/" + parm643;

      location.reload(str);



  }


  function ReturnPrevious() {

      history.go(-1);

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

