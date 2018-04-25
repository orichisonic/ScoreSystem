<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];

        %>
<%=account.AREANAME + "���´������ƹ�ҵ����ϸ"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   

<div id="divIframe" title="ҵ����ϸ">

    <div id="ChargeCondition">
    <fieldset>
     <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.TGSOutAchiveAreaCondition condtion = (TGProject.Models.TGSOutAchiveAreaCondition)ViewData["condition"];
            int selectIdx = 0;
            int areaID = 0;
            decimal sortkinds = 0;
            string strDate = string.Empty;
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                areaID = condtion.AreaID;
                selectIdx = condtion.selectIndex;
                sortkinds = condtion.ORDERKIND;
                gameidx = condtion.gameidx;
                strDefines = condtion.DefineID;
            }
            else
            {
                areaID = condtion.AreaID;
                selectIdx = 0;
                strDefines = "0,";
            }
        %>
        <span id="areaid"><%=areaID%></span>
        <span id="selectID"><%=selectIdx%></span>
        <span id="sortkinds"><%=sortkinds %></span>
        <span id="gameidx"><%=gameidx%></span>
        <span id="definesstr"><%=strDefines%></span>
     <legend><% =account.AREANAME + "���´������ƹ�ҵ����ϸ"%></legend>
        <div style="text-align: left">
             <ul class="verticality">
   <li style="color:Black;">����ѯʱ��:
        <span id="startt"><%=condtion.BeginTime.ToShortDateString()%></span>��<span id="endt"><%=condtion.EndTime.ToShortDateString()%></span>
    </li>
            <li style=" vertical-align:bottom">���:
             <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">������Ϸ</option>
                        
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
            <span id="test" style="color:Black;"><select name="class" id="Gclass"">
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
                 <button style="margin-left:57px;" class="ui-state-default ui-corner-all"  id="btnSearch"  >��ѯ</button>
                    <br />
            </li>

           </ul>

        </div>
    </fieldset>
    </div>
    <div id="tabs">
    
    <ul>
        <li><a href="#tabs-1">��ҵ������</a></li>
        <li><a href="#tabs-1">����Ա����</a></li>
        
    </ul>
    
     <div id="tabs-1" style="text-align: center">
     

        <table cellpadding="0" cellspacing="0" border="0" 
                
             style="vertical-align:top; width:101%;border:2px solid #000000; margin-left: 0px; border-collapse: collapse;">
         <tr style="background-color:#FFFFFF; font-weight:bold">
            
           <td colspan="5" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ��Ա��Ϣ</td>
           <td colspan="3" style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ֱ���ƹ�</td>
           <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ����ƹ�</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ������</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           �����ƹ�ҵ��</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ����</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ����</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ���´�����</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ��������</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           ������</td>
           </tr>
           
           
           <tr style="background-color:#FFFFFF; font-weight:bold">
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ����</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ���´�</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ְ��</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ����</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            �ʺ�</td>
            
             <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ��ȡ��</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            �����û���</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ���ѽ��</td>
            
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            �����û���</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            ���ѽ��</td>                    
            </tr>
        <%   
            int i = 0;
            List<TGProject.Models.TGSOutAchiveAreaDetail> AreaDetail = (List<TGProject.Models.TGSOutAchiveAreaDetail>)ViewData["AREADETAIL"];
            if (AreaDetail!=null && AreaDetail.Count > 0)
            {
                foreach (TGProject.Models.TGSOutAchiveAreaDetail rows in AreaDetail)
                {
                    i = i + 1;
                    if (AreaDetail.Count - i != 0)
                    {
        %>
                    <tr>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AREANAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.POPEDOMNAME%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                             <a href="<%=rows.POPEDOMID%>,<%=rows.UKEY%>"><%=rows.USERNAME %></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.UACCOUNT%>
                        </td>
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
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%></td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXOUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXRATIO%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXBSORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXZONEORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXALLORDER%>
                        </td>

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
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AREANAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.POPEDOMNAME  %>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.POPEDOMID%>,<%=rows.UKEY%>"><%=rows.USERNAME %></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.UACCOUNT%>
                        </td>
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
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXOUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXRATIO%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXBSORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXZONEORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXALLORDER%>
                        </td>

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
     <table width="100%"></table>
     <center style="margin-top:6px">
         <p style="font-weight: bold">�����Ա�����鿴������ϸ </p>
         <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">����</button>
     </center>
     
        </div>
    </div>
 </div>
      <%
          if (AreaDetail == null)
        {
            Response.Write("<script>alert('��������')</script>"); 
        }
        
    %>
 <script type="text/javascript">
     var idx = $("#selectID").html();
     var idx = $("#selectID").html();
     var actionstring;
     var gameidx = $("#gameidx").html();
     $('#tabs').tabs();
     $('#Gclass').tabs({ selected: 0 });

     
     $("#Gclass").attr("value", idx)
     if (($('#sortkinds').html() == 1)) {
         $('#tabs').tabs('option', 'selected', 0);
     }
     else {
         $('#tabs').tabs('option', 'selected', 1);
     }
     

      //////////////////////////////////
     $(document).ready(function() {
         $("#GAME").attr("value", gameidx)

         $("#Gclass").empty();

         if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
             $("<option></option>").val(0).text("���л").appendTo($("#Gclass"));
         }
         else {
             loadDefine($("#GAME").val());
         }
         $("#GAME").bind('change', function() {
             loadDefine($("#GAME").val());
             if ($("#GAME").val() == 0) {
             }
             else {
             }
         });

         $('#areaid').hide();
         $('#selectID').hide();
         $('#sortkinds').hide();
         $("#gameidx").hide();
         $("#definesstr").hide();
         
         $("#btnSearch").bind('click', function() {
             loadData(1);
         });
         //$("#Gclass").change(function() { loadData(1) });
         $('#tabs').bind('tabsselect', function(event, ui) { loadData2(ui.index) });

         //////////////////////////////////////
         $('td > a').bind('click', function() {
             var begintime = $("#startt").html();

             var endtime = $("#endt").html();

             var href = $(this).attr('href');
             var username = $(this).text();
             var hrefindex = href.split(",");
             var ukey = hrefindex[1];
             var popid = hrefindex[0];
             var content = $($(this).parents().parents()).html();

             if (popid == "7") {
                 var sP643 = BASE64.encode(ukey + ";" + "0,;" + begintime + ";" + endtime + ";" + ""+";" + 0);
                 href = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo/" + sP643;
                 //alert(href);
                 $(this).attr('href', href);
             }
             else if (popid == "6") {
             var sP644 = BASE64.encode(ukey + ";" + "0,;" + begintime + ";" + endtime + ";" +""+ ";" + 0);
                 href = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceInfo/" + sP644;
                 $(this).attr('href', href);
             }
         });
     });
      //////////////////////////////////

      function loadData(index) {
          actionString = "";
          for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
              var chkName = "mst" + k;
              if ($("#" + chkName).attr("checked") == true) {
                  actionString = actionString + $("#" + chkName).val() + ";";
              }
          }

          if (actionString == undefined || actionString == "undefined" || actionString == "") {
              alert("��ѡ��Ҫ��ѯ�Ļ��");
              return;
          }
          var game = $("#GAME").val();
          var selectindex = $("#Gclass").val();
          //var define = $("#Gclass option:selected").val()
          var beginTime = $("#startt").html();
          var endTime = $("#endt").html();
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");

          var tabsIndex = $("#tabs").tabs().tabs("option", "selected") + 1;
          parm = actionString + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + index+","+game ;
          var sP641 = BASE64.encode(parm);
          var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeOfflineDetailInfo2/" + sP641;
          location.replace(str);
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
              alert("��ѡ��Ҫ��ѯ�Ļ��");
              return;
          }
          var game1 = $("#GAME").val();
          var selectindex = $("#Gclass").val();
          //var define = $("#Gclass option:selected").val()
          var beginTime = $("#startt").html();
          var endTime = $("#endt").html();

          var tabsIndex = index + 1;
          parm = actionString + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + 1 + "," + game1;
          var sP642 = BASE64.encode(parm);
          var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeOfflineDetailInfo2/" + sP642;
          location.replace(str);
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
                      $("<option ></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                  }
              });
              $("#Gclass").multiSelect({ selectAll: true, selectAllText: "ȫѡ", noneSelected: '��ѡ��', oneOrMoreSelected: '% ����ѱ�ѡ��' });
          }
          else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
              $("<option selected='selected'></option>").val(0).text("���л").appendTo($("#Gclass"));
              $("#Gclass").multiSelect({ selectAll: false, selectAllText: "ȫѡ", noneSelected: '��ѡ��', oneOrMoreSelected: '���л�ѱ�ѡ��' });
          }
          else {
              $("#Gclass").multiSelect({ selectAll: false, selectAllText: "ȫѡ", noneSelected: 'û�и���Ϸ�', oneOrMoreSelected: '% ����ѱ�ѡ��' });
          }

      }
     
   
    </script>
</asp:Content>

